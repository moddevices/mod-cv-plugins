#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "lv2/lv2plug.in/ns/lv2core/lv2.h"

#define PLUGIN_URI "http://moddevices.com/plugins/mod-devel/mod-cv-slew"

#ifndef DEBUG
#define DEBUG 0
#endif
#define debug_print(...) \
((void)((DEBUG) ? fprintf(stderr, __VA_ARGS__) : 0))

typedef enum {
    AUDIO_IN = 0,
    CV_OUT   = 1,
    P_RISE	 = 2,
    P_FALL   = 3,
    ENABLED  = 4
} PortIndex;

typedef struct {
    float* input;
    float* output;
    float* rise_time;
    float* fall_time;
    float* plugin_enabled;
    float  sample_rate;
    float  out;
} Convert;

static LV2_Handle
instantiate(const LV2_Descriptor*     descriptor,
            double                    rate,
            const char*               bundle_path,
            const LV2_Feature* const* features)
{
    Convert* self = (Convert*)malloc(sizeof(Convert));

    self->out = 0.0;
    self->sample_rate = rate;

    return (LV2_Handle)self;
}

static void
connect_port(LV2_Handle instance,
             uint32_t   port,
             void*      data)
{
    Convert* self = (Convert*)instance;

    switch ((PortIndex)port) {
        case AUDIO_IN:
            self->input = (float*)data;
            break;
        case CV_OUT:
            self->output = (float*)data;
            break;
        case P_RISE:
            self->rise_time = (float*)data;
            break;
        case P_FALL:
            self->fall_time = (float*)data;
            break;
        case ENABLED:
            self->plugin_enabled = (float*)data;
            break;
    }
}


static void
activate(LV2_Handle instance)
{
}


static float
slider(float in, float out, float rise_time, float fall_time, float sample_rate)
{
    if (in > out && rise_time != 0.0)
    {
        out += (in - out) / ((rise_time / 1000) * sample_rate);
    }
    else if (in < out && fall_time != 0.0)
    {
        out += (in - out) / ((fall_time / 1000) * sample_rate);
    }

    return out;
}


static void
run(LV2_Handle instance, uint32_t n_samples)
{
    Convert* self = (Convert*)instance;

    for ( uint32_t i = 0; i < n_samples; i++)
    {
        if (*self->plugin_enabled == 1.0) {
            self->out = slider(self->input[i], self->out, *self->rise_time, *self->fall_time, self->sample_rate);
            self->output[i] = self->out;
        } else {
            self->output[i] = self->input[i];

        }
    }
}


static void
deactivate(LV2_Handle instance)
{
}

static void
cleanup(LV2_Handle instance)
{
    free(instance);
}

static const void*
extension_data(const char* uri)
{
    return NULL;
}

static const LV2_Descriptor descriptor = {
    PLUGIN_URI,
    instantiate,
    connect_port,
    activate,
    run,
    deactivate,
    cleanup,
    extension_data
};

LV2_SYMBOL_EXPORT
const LV2_Descriptor*
lv2_descriptor(uint32_t index)
{
    switch (index) {
        case 0:  return &descriptor;
        default: return NULL;
    }
}
