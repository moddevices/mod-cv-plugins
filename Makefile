LV2_DESTDIR=$(DESTDIR)/usr/lib/lv2

all:
	$(MAKE) -C source/mod-audio-to-cv
	$(MAKE) -C source/mod-cv-transport
	$(MAKE) -C source/mod-cv-to-audio
	$(MAKE) -C source/mod-cv-abs
	$(MAKE) -C source/mod-cv-attenuverter
	$(MAKE) -C source/mod-cv-clock
	$(MAKE) -C source/mod-cv-control
	$(MAKE) -C source/mod-cv-gate
	$(MAKE) -C source/mod-cv-meter
	$(MAKE) -C source/mod-cv-parameter-modulation
	$(MAKE) -C source/mod-cv-random
	$(MAKE) -C source/mod-cv-range
	$(MAKE) -C source/mod-cv-round
	$(MAKE) -C source/mod-cv-slew
	$(MAKE) -C source/mod-cv-switch1
	$(MAKE) -C source/mod-cv-switch2
	$(MAKE) -C source/mod-cv-switch3
	$(MAKE) -C source/mod-cv-switch4
	$(MAKE) -C source/mod-midi-to-cv-mono
	$(MAKE) -C source/mod-midi-to-cv-poly
	$(MAKE) -C source/mod-logic-operators
	$(MAKE) -C source/mod-button-to-cv

install: all
	install -d $(LV2_DESTDIR)
	cp -r source/mod-audio-to-cv/mod-audio-to-cv.lv2                         $(LV2_DESTDIR)
	cp -r source/mod-cv-abs/mod-cv-abs.lv2                                   $(LV2_DESTDIR)
	cp -r source/mod-cv-attenuverter/mod-cv-attenuverter.lv2                 $(LV2_DESTDIR)
	cp -r source/mod-cv-clock/mod-cv-clock.lv2                               $(LV2_DESTDIR)
	cp -r source/mod-cv-control/mod-cv-control.lv2                           $(LV2_DESTDIR)
	cp -r source/mod-cv-gate/mod-cv-gate.lv2                                 $(LV2_DESTDIR)
	cp -r source/mod-cv-meter/mod-cv-meter.lv2                               $(LV2_DESTDIR)
	cp -r source/mod-cv-parameter-modulation/mod-cv-parameter-modulation.lv2 $(LV2_DESTDIR)
	cp -r source/mod-cv-random/mod-cv-random.lv2                             $(LV2_DESTDIR)
	cp -r source/mod-cv-range/mod-cv-range.lv2                               $(LV2_DESTDIR)
	cp -r source/mod-cv-round/mod-cv-round.lv2                               $(LV2_DESTDIR)
	cp -r source/mod-cv-slew/mod-cv-slew.lv2                                 $(LV2_DESTDIR)
	cp -r source/mod-cv-switch1/mod-cv-switch1.lv2                           $(LV2_DESTDIR)
	cp -r source/mod-cv-switch2/mod-cv-switch2.lv2                           $(LV2_DESTDIR)
	cp -r source/mod-cv-switch3/mod-cv-switch3.lv2                           $(LV2_DESTDIR)
	cp -r source/mod-cv-switch4/mod-cv-switch4.lv2                           $(LV2_DESTDIR)
	cp -r source/mod-cv-to-audio/mod-cv-to-audio.lv2                         $(LV2_DESTDIR)
	cp -r source/mod-cv-transport/mod-cv-transport.lv2                       $(LV2_DESTDIR)
	cp -r source/mod-logic-operators/bin/logic-operators.lv2                 $(LV2_DESTDIR)
	cp -r source/mod-midi-to-cv-mono/mod-midi-to-cv-mono.lv2                 $(LV2_DESTDIR)
	cp -r source/mod-midi-to-cv-poly/mod-midi-to-cv-poly.lv2                 $(LV2_DESTDIR)
	cp -r source/mod-button-to-cv/mod-button-to-cv.lv2                       $(LV2_DESTDIR)

clean:
	$(MAKE) clean -C source/mod-audio-to-cv
	$(MAKE) clean -C source/mod-cv-abs
	$(MAKE) clean -C source/mod-cv-attenuverter
	$(MAKE) clean -C source/mod-cv-clock
	$(MAKE) clean -C source/mod-cv-control
	$(MAKE) clean -C source/mod-cv-gate
	$(MAKE) clean -C source/mod-cv-meter
	$(MAKE) clean -C source/mod-cv-parameter-modulation
	$(MAKE) clean -C source/mod-cv-random
	$(MAKE) clean -C source/mod-cv-range
	$(MAKE) clean -C source/mod-cv-round
	$(MAKE) clean -C source/mod-cv-slew
	$(MAKE) clean -C source/mod-cv-switch1
	$(MAKE) clean -C source/mod-cv-switch2
	$(MAKE) clean -C source/mod-cv-switch3
	$(MAKE) clean -C source/mod-cv-switch4
	$(MAKE) clean -C source/mod-cv-to-audio
	$(MAKE) clean -C source/mod-cv-transport
	$(MAKE) clean -C source/mod-logic-operators
	$(MAKE) clean -C source/mod-midi-to-cv-mono
	$(MAKE) clean -C source/mod-midi-to-cv-poly
	$(MAKE) clean -C source/mod-button-to-cv
