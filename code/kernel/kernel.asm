
kernel//kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <__start>:
    8000:	e10f0000 	mrs	r0, CPSR
    8004:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    8008:	e59fd034 	ldr	sp, [pc, #52]	; 8044 <hang+0x8>
    800c:	e121f000 	msr	CPSR_c, r0
    8010:	e59fd030 	ldr	sp, [pc, #48]	; 8048 <hang+0xc>
    8014:	e59f0030 	ldr	r0, [pc, #48]	; 804c <hang+0x10>
    8018:	e59f1030 	ldr	r1, [pc, #48]	; 8050 <hang+0x14>
    801c:	e3a02000 	mov	r2, #0
    8020:	e3a03000 	mov	r3, #0
    8024:	e3a04000 	mov	r4, #0
    8028:	e3a05000 	mov	r5, #0

0000802c <bss_loop>:
    802c:	e8a0003c 	stmia	r0!, {r2, r3, r4, r5}
    8030:	e1500001 	cmp	r0, r1
    8034:	3afffffc 	bcc	802c <bss_loop>
    8038:	eb000118 	bl	84a0 <kernel_main>

0000803c <hang>:
    803c:	e320f003 	wfi
    8040:	eafffffd 	b	803c <hang>
    8044:	00131000 	andseq	r1, r3, r0
    8048:	00120000 	andseq	r0, r2, r0
    804c:	0000e000 	andeq	lr, r0, r0
    8050:	00010000 	andeq	r0, r1, r0

00008054 <led_init>:
    8054:	e92d4008 	push	{r3, lr}
    8058:	e3a0002f 	mov	r0, #47	; 0x2f
    805c:	e3a01001 	mov	r1, #1
    8060:	eb000013 	bl	80b4 <gpio_config>
    8064:	e3a00023 	mov	r0, #35	; 0x23
    8068:	e3a01001 	mov	r1, #1
    806c:	eb000010 	bl	80b4 <gpio_config>
    8070:	e8bd8008 	pop	{r3, pc}

00008074 <led_set_green>:
    8074:	e92d4008 	push	{r3, lr}
    8078:	e3a0002f 	mov	r0, #47	; 0x2f
    807c:	eb000021 	bl	8108 <gpio_set>
    8080:	e8bd8008 	pop	{r3, pc}

00008084 <led_clr_green>:
    8084:	e92d4008 	push	{r3, lr}
    8088:	e3a0002f 	mov	r0, #47	; 0x2f
    808c:	eb00002e 	bl	814c <gpio_clr>
    8090:	e8bd8008 	pop	{r3, pc}

00008094 <led_set_red>:
    8094:	e92d4008 	push	{r3, lr}
    8098:	e3a00023 	mov	r0, #35	; 0x23
    809c:	eb000019 	bl	8108 <gpio_set>
    80a0:	e8bd8008 	pop	{r3, pc}

000080a4 <led_clr_red>:
    80a4:	e92d4008 	push	{r3, lr}
    80a8:	e3a00023 	mov	r0, #35	; 0x23
    80ac:	eb000026 	bl	814c <gpio_clr>
    80b0:	e8bd8008 	pop	{r3, pc}

000080b4 <gpio_config>:
    80b4:	e3510007 	cmp	r1, #7
    80b8:	93500035 	cmpls	r0, #53	; 0x35
    80bc:	812fff1e 	bxhi	lr
    80c0:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    80c4:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    80c8:	e0832290 	umull	r2, r3, r0, r2
    80cc:	e1a0c1a3 	lsr	ip, r3, #3
    80d0:	e6ef307c 	uxtb	r3, ip
    80d4:	e1a03103 	lsl	r3, r3, #2
    80d8:	e283343f 	add	r3, r3, #1056964608	; 0x3f000000
    80dc:	e2833602 	add	r3, r3, #2097152	; 0x200000
    80e0:	e5932000 	ldr	r2, [r3]
    80e4:	e08cc10c 	add	ip, ip, ip, lsl #2
    80e8:	e040008c 	sub	r0, r0, ip, lsl #1
    80ec:	e6ef0070 	uxtb	r0, r0
    80f0:	e0800080 	add	r0, r0, r0, lsl #1
    80f4:	e3a0c007 	mov	ip, #7
    80f8:	e1c2201c 	bic	r2, r2, ip, lsl r0
    80fc:	e1820011 	orr	r0, r2, r1, lsl r0
    8100:	e5830000 	str	r0, [r3]
    8104:	e12fff1e 	bx	lr

00008108 <gpio_set>:
    8108:	e3500035 	cmp	r0, #53	; 0x35
    810c:	812fff1e 	bxhi	lr
    8110:	e350001f 	cmp	r0, #31
    8114:	9a000006 	bls	8134 <gpio_set+0x2c>
    8118:	e2400020 	sub	r0, r0, #32
    811c:	e3a03001 	mov	r3, #1
    8120:	e1a00013 	lsl	r0, r3, r0
    8124:	e3a03000 	mov	r3, #0
    8128:	e3433f20 	movt	r3, #16160	; 0x3f20
    812c:	e5830020 	str	r0, [r3, #32]
    8130:	e12fff1e 	bx	lr
    8134:	e3a03001 	mov	r3, #1
    8138:	e1a00013 	lsl	r0, r3, r0
    813c:	e3a03000 	mov	r3, #0
    8140:	e3433f20 	movt	r3, #16160	; 0x3f20
    8144:	e583001c 	str	r0, [r3, #28]
    8148:	e12fff1e 	bx	lr

0000814c <gpio_clr>:
    814c:	e3500035 	cmp	r0, #53	; 0x35
    8150:	812fff1e 	bxhi	lr
    8154:	e350001f 	cmp	r0, #31
    8158:	9a000006 	bls	8178 <gpio_clr+0x2c>
    815c:	e2400020 	sub	r0, r0, #32
    8160:	e3a03001 	mov	r3, #1
    8164:	e1a00013 	lsl	r0, r3, r0
    8168:	e3a03000 	mov	r3, #0
    816c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8170:	e583002c 	str	r0, [r3, #44]	; 0x2c
    8174:	e12fff1e 	bx	lr
    8178:	e3a03001 	mov	r3, #1
    817c:	e1a00013 	lsl	r0, r3, r0
    8180:	e3a03000 	mov	r3, #0
    8184:	e3433f20 	movt	r3, #16160	; 0x3f20
    8188:	e5830028 	str	r0, [r3, #40]	; 0x28
    818c:	e12fff1e 	bx	lr

00008190 <gpio_set_pull>:
    8190:	e3510002 	cmp	r1, #2
    8194:	93500035 	cmpls	r0, #53	; 0x35
    8198:	812fff1e 	bxhi	lr
    819c:	e92d4038 	push	{r3, r4, r5, lr}
    81a0:	e1a04000 	mov	r4, r0
    81a4:	e3a03000 	mov	r3, #0
    81a8:	e3433f20 	movt	r3, #16160	; 0x3f20
    81ac:	e5831094 	str	r1, [r3, #148]	; 0x94
    81b0:	e3a00096 	mov	r0, #150	; 0x96
    81b4:	eb0008c0 	bl	a4bc <delay_cycles>
    81b8:	e354001f 	cmp	r4, #31
    81bc:	9a00000a 	bls	81ec <gpio_set_pull+0x5c>
    81c0:	e2440020 	sub	r0, r4, #32
    81c4:	e3a04001 	mov	r4, #1
    81c8:	e1a00014 	lsl	r0, r4, r0
    81cc:	e3a05000 	mov	r5, #0
    81d0:	e3435f20 	movt	r5, #16160	; 0x3f20
    81d4:	e585009c 	str	r0, [r5, #156]	; 0x9c
    81d8:	e3a00096 	mov	r0, #150	; 0x96
    81dc:	eb0008b6 	bl	a4bc <delay_cycles>
    81e0:	e3a03000 	mov	r3, #0
    81e4:	e585309c 	str	r3, [r5, #156]	; 0x9c
    81e8:	e8bd8038 	pop	{r3, r4, r5, pc}
    81ec:	e3a00001 	mov	r0, #1
    81f0:	e1a00410 	lsl	r0, r0, r4
    81f4:	e3a05000 	mov	r5, #0
    81f8:	e3435f20 	movt	r5, #16160	; 0x3f20
    81fc:	e5850098 	str	r0, [r5, #152]	; 0x98
    8200:	e3a00096 	mov	r0, #150	; 0x96
    8204:	eb0008ac 	bl	a4bc <delay_cycles>
    8208:	e3a03000 	mov	r3, #0
    820c:	e5853098 	str	r3, [r5, #152]	; 0x98
    8210:	e8bd8038 	pop	{r3, r4, r5, pc}

00008214 <gpio_get_level>:
    8214:	e3500035 	cmp	r0, #53	; 0x35
    8218:	8a000008 	bhi	8240 <gpio_get_level+0x2c>
    821c:	e350001f 	cmp	r0, #31
    8220:	e3a03000 	mov	r3, #0
    8224:	e3433f20 	movt	r3, #16160	; 0x3f20
    8228:	85933038 	ldrhi	r3, [r3, #56]	; 0x38
    822c:	82400020 	subhi	r0, r0, #32
    8230:	95933034 	ldrls	r3, [r3, #52]	; 0x34
    8234:	e1a00033 	lsr	r0, r3, r0
    8238:	e2000001 	and	r0, r0, #1
    823c:	e12fff1e 	bx	lr
    8240:	e3a000ff 	mov	r0, #255	; 0xff
    8244:	e12fff1e 	bx	lr

00008248 <adc_init>:
    8248:	e92d4008 	push	{r3, lr}
    824c:	e30005dc 	movw	r0, #1500	; 0x5dc
    8250:	eb00002d 	bl	830c <i2c_master_init>
    8254:	e8bd8008 	pop	{r3, pc}

00008258 <adc_read>:
    8258:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    825c:	e24dd014 	sub	sp, sp, #20
    8260:	e3500000 	cmp	r0, #0
    8264:	1a00000a 	bne	8294 <adc_read+0x3c>
    8268:	e30c3000 	movw	r3, #49152	; 0xc000
    826c:	e3403000 	movt	r3, #0
    8270:	e1d320b0 	ldrh	r2, [r3]
    8274:	e5d33002 	ldrb	r3, [r3, #2]
    8278:	e1cd20b4 	strh	r2, [sp, #4]
    827c:	e5cd3006 	strb	r3, [sp, #6]
    8280:	e28d0004 	add	r0, sp, #4
    8284:	e3a01003 	mov	r1, #3
    8288:	e3a02049 	mov	r2, #73	; 0x49
    828c:	eb000033 	bl	8360 <i2c_master_write>
    8290:	ea00000c 	b	82c8 <adc_read+0x70>
    8294:	e3500001 	cmp	r0, #1
    8298:	130f0fff 	movwne	r0, #65535	; 0xffff
    829c:	1a000018 	bne	8304 <adc_read+0xac>
    82a0:	e30c3000 	movw	r3, #49152	; 0xc000
    82a4:	e3403000 	movt	r3, #0
    82a8:	e1f320b4 	ldrh	r2, [r3, #4]!
    82ac:	e5d33002 	ldrb	r3, [r3, #2]
    82b0:	e1cd20b4 	strh	r2, [sp, #4]
    82b4:	e5cd3006 	strb	r3, [sp, #6]
    82b8:	e28d0004 	add	r0, sp, #4
    82bc:	e3a01003 	mov	r1, #3
    82c0:	e3a02049 	mov	r2, #73	; 0x49
    82c4:	eb000025 	bl	8360 <i2c_master_write>
    82c8:	e28d0010 	add	r0, sp, #16
    82cc:	e3a03000 	mov	r3, #0
    82d0:	e5603004 	strb	r3, [r0, #-4]!
    82d4:	e3a01001 	mov	r1, #1
    82d8:	e3a02049 	mov	r2, #73	; 0x49
    82dc:	eb00001f 	bl	8360 <i2c_master_write>
    82e0:	e28d0008 	add	r0, sp, #8
    82e4:	e3a01002 	mov	r1, #2
    82e8:	e3a02049 	mov	r2, #73	; 0x49
    82ec:	eb000044 	bl	8404 <i2c_master_read>
    82f0:	e5dd0008 	ldrb	r0, [sp, #8]
    82f4:	e5dd3009 	ldrb	r3, [sp, #9]
    82f8:	e1a03223 	lsr	r3, r3, #4
    82fc:	e0830200 	add	r0, r3, r0, lsl #4
    8300:	eaffffff 	b	8304 <adc_read+0xac>
    8304:	e28dd014 	add	sp, sp, #20
    8308:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

0000830c <i2c_master_init>:
    830c:	e92d4008 	push	{r3, lr}
    8310:	e3a00002 	mov	r0, #2
    8314:	e3a01000 	mov	r1, #0
    8318:	ebffff9c 	bl	8190 <gpio_set_pull>
    831c:	e3a00003 	mov	r0, #3
    8320:	e3a01000 	mov	r1, #0
    8324:	ebffff99 	bl	8190 <gpio_set_pull>
    8328:	e3a00002 	mov	r0, #2
    832c:	e3a01004 	mov	r1, #4
    8330:	ebffff5f 	bl	80b4 <gpio_config>
    8334:	e3a00003 	mov	r0, #3
    8338:	e3a01004 	mov	r1, #4
    833c:	ebffff5c 	bl	80b4 <gpio_config>
    8340:	e3a03901 	mov	r3, #16384	; 0x4000
    8344:	e3433f80 	movt	r3, #16256	; 0x3f80
    8348:	e3a02902 	mov	r2, #32768	; 0x8000
    834c:	e5832000 	str	r2, [r3]
    8350:	e5932000 	ldr	r2, [r3]
    8354:	e3822030 	orr	r2, r2, #48	; 0x30
    8358:	e5832000 	str	r2, [r3]
    835c:	e8bd8008 	pop	{r3, pc}

00008360 <i2c_master_write>:
    8360:	e3510010 	cmp	r1, #16
    8364:	8a000022 	bhi	83f4 <i2c_master_write+0x94>
    8368:	e3120080 	tst	r2, #128	; 0x80
    836c:	1a000022 	bne	83fc <i2c_master_write+0x9c>
    8370:	e3a03901 	mov	r3, #16384	; 0x4000
    8374:	e3433f80 	movt	r3, #16256	; 0x3f80
    8378:	e5831008 	str	r1, [r3, #8]
    837c:	e583200c 	str	r2, [r3, #12]
    8380:	e5932000 	ldr	r2, [r3]
    8384:	e3822030 	orr	r2, r2, #48	; 0x30
    8388:	e5832000 	str	r2, [r3]
    838c:	e3510000 	cmp	r1, #0
    8390:	da000007 	ble	83b4 <i2c_master_write+0x54>
    8394:	e1a03000 	mov	r3, r0
    8398:	e0800001 	add	r0, r0, r1
    839c:	e3a01901 	mov	r1, #16384	; 0x4000
    83a0:	e3431f80 	movt	r1, #16256	; 0x3f80
    83a4:	e4d32001 	ldrb	r2, [r3], #1
    83a8:	e5812010 	str	r2, [r1, #16]
    83ac:	e1530000 	cmp	r3, r0
    83b0:	1afffffb 	bne	83a4 <i2c_master_write+0x44>
    83b4:	e3a03901 	mov	r3, #16384	; 0x4000
    83b8:	e3433f80 	movt	r3, #16256	; 0x3f80
    83bc:	e3082080 	movw	r2, #32896	; 0x8080
    83c0:	e5832000 	str	r2, [r3]
    83c4:	e3a02901 	mov	r2, #16384	; 0x4000
    83c8:	e3432f80 	movt	r2, #16256	; 0x3f80
    83cc:	e5923004 	ldr	r3, [r2, #4]
    83d0:	e3130002 	tst	r3, #2
    83d4:	0afffffc 	beq	83cc <i2c_master_write+0x6c>
    83d8:	e3a03901 	mov	r3, #16384	; 0x4000
    83dc:	e3433f80 	movt	r3, #16256	; 0x3f80
    83e0:	e5932004 	ldr	r2, [r3, #4]
    83e4:	e3822002 	orr	r2, r2, #2
    83e8:	e5832004 	str	r2, [r3, #4]
    83ec:	e3a00000 	mov	r0, #0
    83f0:	e12fff1e 	bx	lr
    83f4:	e3a000ff 	mov	r0, #255	; 0xff
    83f8:	e12fff1e 	bx	lr
    83fc:	e3a000ff 	mov	r0, #255	; 0xff
    8400:	e12fff1e 	bx	lr

00008404 <i2c_master_read>:
    8404:	e3510010 	cmp	r1, #16
    8408:	8a000020 	bhi	8490 <i2c_master_read+0x8c>
    840c:	e3120080 	tst	r2, #128	; 0x80
    8410:	1a000020 	bne	8498 <i2c_master_read+0x94>
    8414:	e3a03901 	mov	r3, #16384	; 0x4000
    8418:	e3433f80 	movt	r3, #16256	; 0x3f80
    841c:	e5831008 	str	r1, [r3, #8]
    8420:	e583200c 	str	r2, [r3, #12]
    8424:	e5932000 	ldr	r2, [r3]
    8428:	e3822030 	orr	r2, r2, #48	; 0x30
    842c:	e5832000 	str	r2, [r3]
    8430:	e3082081 	movw	r2, #32897	; 0x8081
    8434:	e5832000 	str	r2, [r3]
    8438:	e3a02901 	mov	r2, #16384	; 0x4000
    843c:	e3432f80 	movt	r2, #16256	; 0x3f80
    8440:	e5923004 	ldr	r3, [r2, #4]
    8444:	e3130002 	tst	r3, #2
    8448:	0afffffc 	beq	8440 <i2c_master_read+0x3c>
    844c:	e3510000 	cmp	r1, #0
    8450:	da000007 	ble	8474 <i2c_master_read+0x70>
    8454:	e1a03000 	mov	r3, r0
    8458:	e0800001 	add	r0, r0, r1
    845c:	e3a0c901 	mov	ip, #16384	; 0x4000
    8460:	e343cf80 	movt	ip, #16256	; 0x3f80
    8464:	e59c2010 	ldr	r2, [ip, #16]
    8468:	e4c32001 	strb	r2, [r3], #1
    846c:	e1530000 	cmp	r3, r0
    8470:	1afffffb 	bne	8464 <i2c_master_read+0x60>
    8474:	e3a03901 	mov	r3, #16384	; 0x4000
    8478:	e3433f80 	movt	r3, #16256	; 0x3f80
    847c:	e5932004 	ldr	r2, [r3, #4]
    8480:	e3822002 	orr	r2, r2, #2
    8484:	e5832004 	str	r2, [r3, #4]
    8488:	e6ef0071 	uxtb	r0, r1
    848c:	e12fff1e 	bx	lr
    8490:	e3a000ff 	mov	r0, #255	; 0xff
    8494:	e12fff1e 	bx	lr
    8498:	e3a000ff 	mov	r0, #255	; 0xff
    849c:	e12fff1e 	bx	lr

000084a0 <kernel_main>:
    84a0:	e92d4008 	push	{r3, lr}
    84a4:	eb0003dd 	bl	9420 <timer_stop>
    84a8:	eb00080a 	bl	a4d8 <disable_interrupts>
    84ac:	eb0003ec 	bl	9464 <timer_clear_pending>
    84b0:	eb000821 	bl	a53c <install_interrupt_table>
    84b4:	eb0003f0 	bl	947c <uart_init>
    84b8:	e30e3018 	movw	r3, #57368	; 0xe018
    84bc:	e3403000 	movt	r3, #0
    84c0:	e3a02000 	mov	r2, #0
    84c4:	e5832000 	str	r2, [r3]
    84c8:	eb000711 	bl	a114 <oled_init>
    84cc:	eb00078b 	bl	a300 <oled_clear_screen>
    84d0:	eb0006dc 	bl	a048 <oled_buf_clr>
    84d4:	eb00086f 	bl	a698 <enter_user_mode>
    84d8:	eafffffe 	b	84d8 <kernel_main+0x38>

000084dc <get_top_priority>:
    84dc:	e92d4010 	push	{r4, lr}
    84e0:	e3a01020 	mov	r1, #32
    84e4:	e1a00001 	mov	r0, r1
    84e8:	e3a03000 	mov	r3, #0
    84ec:	e30ec020 	movw	ip, #57376	; 0xe020
    84f0:	e340c000 	movt	ip, #0
    84f4:	e30ee014 	movw	lr, #57364	; 0xe014
    84f8:	e340e000 	movt	lr, #0
    84fc:	e3a04001 	mov	r4, #1
    8500:	e0632183 	rsb	r2, r3, r3, lsl #3
    8504:	e0832102 	add	r2, r3, r2, lsl #2
    8508:	e08c2102 	add	r2, ip, r2, lsl #2
    850c:	e5d22002 	ldrb	r2, [r2, #2]
    8510:	e6ef2072 	uxtb	r2, r2
    8514:	e1520001 	cmp	r2, r1
    8518:	8a000008 	bhi	8540 <get_top_priority+0x64>
    851c:	e59e2000 	ldr	r2, [lr]
    8520:	e0122314 	ands	r2, r2, r4, lsl r3
    8524:	0a000005 	beq	8540 <get_top_priority+0x64>
    8528:	e0632183 	rsb	r2, r3, r3, lsl #3
    852c:	e0832102 	add	r2, r3, r2, lsl #2
    8530:	e08c2102 	add	r2, ip, r2, lsl #2
    8534:	e5d21002 	ldrb	r1, [r2, #2]
    8538:	e6ef1071 	uxtb	r1, r1
    853c:	e1a00003 	mov	r0, r3
    8540:	e2833001 	add	r3, r3, #1
    8544:	e3530020 	cmp	r3, #32
    8548:	1affffec 	bne	8500 <get_top_priority+0x24>
    854c:	e8bd8010 	pop	{r4, pc}

00008550 <store_current_task>:
    8550:	e30e3010 	movw	r3, #57360	; 0xe010
    8554:	e3403000 	movt	r3, #0
    8558:	e5933000 	ldr	r3, [r3]
    855c:	e3730001 	cmn	r3, #1
    8560:	012fff1e 	bxeq	lr
    8564:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8568:	e30e3010 	movw	r3, #57360	; 0xe010
    856c:	e3403000 	movt	r3, #0
    8570:	e5933000 	ldr	r3, [r3]
    8574:	e30e2020 	movw	r2, #57376	; 0xe020
    8578:	e3402000 	movt	r2, #0
    857c:	e0631183 	rsb	r1, r3, r3, lsl #3
    8580:	e0833101 	add	r3, r3, r1, lsl #2
    8584:	e1a03103 	lsl	r3, r3, #2
    8588:	e7d23003 	ldrb	r3, [r2, r3]
    858c:	e31300ff 	tst	r3, #255	; 0xff
    8590:	1a00000a 	bne	85c0 <store_current_task+0x70>
    8594:	e30e3010 	movw	r3, #57360	; 0xe010
    8598:	e3403000 	movt	r3, #0
    859c:	e5933000 	ldr	r3, [r3]
    85a0:	e30e2020 	movw	r2, #57376	; 0xe020
    85a4:	e3402000 	movt	r2, #0
    85a8:	e0631183 	rsb	r1, r3, r3, lsl #3
    85ac:	e0833101 	add	r3, r3, r1, lsl #2
    85b0:	e1a03103 	lsl	r3, r3, #2
    85b4:	e3a01001 	mov	r1, #1
    85b8:	e7c21003 	strb	r1, [r2, r3]
    85bc:	ea00002c 	b	8674 <store_current_task+0x124>
    85c0:	e30e3010 	movw	r3, #57360	; 0xe010
    85c4:	e3403000 	movt	r3, #0
    85c8:	e5933000 	ldr	r3, [r3]
    85cc:	e30e2020 	movw	r2, #57376	; 0xe020
    85d0:	e3402000 	movt	r2, #0
    85d4:	e0631183 	rsb	r1, r3, r3, lsl #3
    85d8:	e0833101 	add	r3, r3, r1, lsl #2
    85dc:	e1a03103 	lsl	r3, r3, #2
    85e0:	e7d23003 	ldrb	r3, [r2, r3]
    85e4:	e6ef3073 	uxtb	r3, r3
    85e8:	e3530002 	cmp	r3, #2
    85ec:	1a000020 	bne	8674 <store_current_task+0x124>
    85f0:	e30e1010 	movw	r1, #57360	; 0xe010
    85f4:	e3401000 	movt	r1, #0
    85f8:	e591e000 	ldr	lr, [r1]
    85fc:	e30e3014 	movw	r3, #57364	; 0xe014
    8600:	e3403000 	movt	r3, #0
    8604:	e593c000 	ldr	ip, [r3]
    8608:	e3a02001 	mov	r2, #1
    860c:	e1ccce12 	bic	ip, ip, r2, lsl lr
    8610:	e583c000 	str	ip, [r3]
    8614:	e591e000 	ldr	lr, [r1]
    8618:	e30f3028 	movw	r3, #61480	; 0xf028
    861c:	e3403000 	movt	r3, #0
    8620:	e593c000 	ldr	ip, [r3]
    8624:	e18c2e12 	orr	r2, ip, r2, lsl lr
    8628:	e5832000 	str	r2, [r3]
    862c:	e5912000 	ldr	r2, [r1]
    8630:	e30e3020 	movw	r3, #57376	; 0xe020
    8634:	e3403000 	movt	r3, #0
    8638:	e062c182 	rsb	ip, r2, r2, lsl #3
    863c:	e082210c 	add	r2, r2, ip, lsl #2
    8640:	e0832102 	add	r2, r3, r2, lsl #2
    8644:	e592e008 	ldr	lr, [r2, #8]
    8648:	e591c000 	ldr	ip, [r1]
    864c:	e06c118c 	rsb	r1, ip, ip, lsl #3
    8650:	e1a02101 	lsl	r2, r1, #2
    8654:	e082100c 	add	r1, r2, ip
    8658:	e0831101 	add	r1, r3, r1, lsl #2
    865c:	e2811008 	add	r1, r1, #8
    8660:	e5911004 	ldr	r1, [r1, #4]
    8664:	e081100e 	add	r1, r1, lr
    8668:	e082200c 	add	r2, r2, ip
    866c:	e0833102 	add	r3, r3, r2, lsl #2
    8670:	e583100c 	str	r1, [r3, #12]
    8674:	e30e2010 	movw	r2, #57360	; 0xe010
    8678:	e3402000 	movt	r2, #0
    867c:	e5921000 	ldr	r1, [r2]
    8680:	e590c04c 	ldr	ip, [r0, #76]	; 0x4c
    8684:	e30e3020 	movw	r3, #57376	; 0xe020
    8688:	e3403000 	movt	r3, #0
    868c:	e061e181 	rsb	lr, r1, r1, lsl #3
    8690:	e081110e 	add	r1, r1, lr, lsl #2
    8694:	e0831101 	add	r1, r3, r1, lsl #2
    8698:	e581c024 	str	ip, [r1, #36]	; 0x24
    869c:	e5921000 	ldr	r1, [r2]
    86a0:	e590c048 	ldr	ip, [r0, #72]	; 0x48
    86a4:	e061e181 	rsb	lr, r1, r1, lsl #3
    86a8:	e081110e 	add	r1, r1, lr, lsl #2
    86ac:	e0831101 	add	r1, r3, r1, lsl #2
    86b0:	e581c028 	str	ip, [r1, #40]	; 0x28
    86b4:	e5921000 	ldr	r1, [r2]
    86b8:	e590c044 	ldr	ip, [r0, #68]	; 0x44
    86bc:	e061e181 	rsb	lr, r1, r1, lsl #3
    86c0:	e081110e 	add	r1, r1, lr, lsl #2
    86c4:	e0831101 	add	r1, r3, r1, lsl #2
    86c8:	e581c02c 	str	ip, [r1, #44]	; 0x2c
    86cc:	e5921000 	ldr	r1, [r2]
    86d0:	e590c040 	ldr	ip, [r0, #64]	; 0x40
    86d4:	e061e181 	rsb	lr, r1, r1, lsl #3
    86d8:	e081110e 	add	r1, r1, lr, lsl #2
    86dc:	e0831101 	add	r1, r3, r1, lsl #2
    86e0:	e581c030 	str	ip, [r1, #48]	; 0x30
    86e4:	e5921000 	ldr	r1, [r2]
    86e8:	e590c03c 	ldr	ip, [r0, #60]	; 0x3c
    86ec:	e061e181 	rsb	lr, r1, r1, lsl #3
    86f0:	e081110e 	add	r1, r1, lr, lsl #2
    86f4:	e0831101 	add	r1, r3, r1, lsl #2
    86f8:	e581c034 	str	ip, [r1, #52]	; 0x34
    86fc:	e5921000 	ldr	r1, [r2]
    8700:	e590c038 	ldr	ip, [r0, #56]	; 0x38
    8704:	e061e181 	rsb	lr, r1, r1, lsl #3
    8708:	e081110e 	add	r1, r1, lr, lsl #2
    870c:	e0831101 	add	r1, r3, r1, lsl #2
    8710:	e581c038 	str	ip, [r1, #56]	; 0x38
    8714:	e5921000 	ldr	r1, [r2]
    8718:	e590c034 	ldr	ip, [r0, #52]	; 0x34
    871c:	e061e181 	rsb	lr, r1, r1, lsl #3
    8720:	e081110e 	add	r1, r1, lr, lsl #2
    8724:	e0831101 	add	r1, r3, r1, lsl #2
    8728:	e581c03c 	str	ip, [r1, #60]	; 0x3c
    872c:	e5921000 	ldr	r1, [r2]
    8730:	e590c030 	ldr	ip, [r0, #48]	; 0x30
    8734:	e061e181 	rsb	lr, r1, r1, lsl #3
    8738:	e081110e 	add	r1, r1, lr, lsl #2
    873c:	e0831101 	add	r1, r3, r1, lsl #2
    8740:	e581c040 	str	ip, [r1, #64]	; 0x40
    8744:	e5921000 	ldr	r1, [r2]
    8748:	e590c02c 	ldr	ip, [r0, #44]	; 0x2c
    874c:	e061e181 	rsb	lr, r1, r1, lsl #3
    8750:	e081110e 	add	r1, r1, lr, lsl #2
    8754:	e0831101 	add	r1, r3, r1, lsl #2
    8758:	e581c044 	str	ip, [r1, #68]	; 0x44
    875c:	e5921000 	ldr	r1, [r2]
    8760:	e590c028 	ldr	ip, [r0, #40]	; 0x28
    8764:	e061e181 	rsb	lr, r1, r1, lsl #3
    8768:	e081110e 	add	r1, r1, lr, lsl #2
    876c:	e0831101 	add	r1, r3, r1, lsl #2
    8770:	e581c048 	str	ip, [r1, #72]	; 0x48
    8774:	e5921000 	ldr	r1, [r2]
    8778:	e590c024 	ldr	ip, [r0, #36]	; 0x24
    877c:	e061e181 	rsb	lr, r1, r1, lsl #3
    8780:	e081110e 	add	r1, r1, lr, lsl #2
    8784:	e0831101 	add	r1, r3, r1, lsl #2
    8788:	e581c04c 	str	ip, [r1, #76]	; 0x4c
    878c:	e5921000 	ldr	r1, [r2]
    8790:	e590c020 	ldr	ip, [r0, #32]
    8794:	e061e181 	rsb	lr, r1, r1, lsl #3
    8798:	e081110e 	add	r1, r1, lr, lsl #2
    879c:	e0831101 	add	r1, r3, r1, lsl #2
    87a0:	e581c050 	str	ip, [r1, #80]	; 0x50
    87a4:	e5921000 	ldr	r1, [r2]
    87a8:	e590c01c 	ldr	ip, [r0, #28]
    87ac:	e061e181 	rsb	lr, r1, r1, lsl #3
    87b0:	e081110e 	add	r1, r1, lr, lsl #2
    87b4:	e0831101 	add	r1, r3, r1, lsl #2
    87b8:	e581c054 	str	ip, [r1, #84]	; 0x54
    87bc:	e5921000 	ldr	r1, [r2]
    87c0:	e590c018 	ldr	ip, [r0, #24]
    87c4:	e061e181 	rsb	lr, r1, r1, lsl #3
    87c8:	e081110e 	add	r1, r1, lr, lsl #2
    87cc:	e0831101 	add	r1, r3, r1, lsl #2
    87d0:	e581c058 	str	ip, [r1, #88]	; 0x58
    87d4:	e5921000 	ldr	r1, [r2]
    87d8:	e590c014 	ldr	ip, [r0, #20]
    87dc:	e061e181 	rsb	lr, r1, r1, lsl #3
    87e0:	e081110e 	add	r1, r1, lr, lsl #2
    87e4:	e0831101 	add	r1, r3, r1, lsl #2
    87e8:	e581c05c 	str	ip, [r1, #92]	; 0x5c
    87ec:	e5921000 	ldr	r1, [r2]
    87f0:	e590c010 	ldr	ip, [r0, #16]
    87f4:	e061e181 	rsb	lr, r1, r1, lsl #3
    87f8:	e081110e 	add	r1, r1, lr, lsl #2
    87fc:	e0831101 	add	r1, r3, r1, lsl #2
    8800:	e581c060 	str	ip, [r1, #96]	; 0x60
    8804:	e5921000 	ldr	r1, [r2]
    8808:	e590c00c 	ldr	ip, [r0, #12]
    880c:	e061e181 	rsb	lr, r1, r1, lsl #3
    8810:	e081110e 	add	r1, r1, lr, lsl #2
    8814:	e0831101 	add	r1, r3, r1, lsl #2
    8818:	e581c064 	str	ip, [r1, #100]	; 0x64
    881c:	e5921000 	ldr	r1, [r2]
    8820:	e590c008 	ldr	ip, [r0, #8]
    8824:	e061e181 	rsb	lr, r1, r1, lsl #3
    8828:	e081110e 	add	r1, r1, lr, lsl #2
    882c:	e0831101 	add	r1, r3, r1, lsl #2
    8830:	e581c068 	str	ip, [r1, #104]	; 0x68
    8834:	e5921000 	ldr	r1, [r2]
    8838:	e590c004 	ldr	ip, [r0, #4]
    883c:	e061e181 	rsb	lr, r1, r1, lsl #3
    8840:	e081110e 	add	r1, r1, lr, lsl #2
    8844:	e0831101 	add	r1, r3, r1, lsl #2
    8848:	e581c06c 	str	ip, [r1, #108]	; 0x6c
    884c:	e5922000 	ldr	r2, [r2]
    8850:	e5901000 	ldr	r1, [r0]
    8854:	e0620182 	rsb	r0, r2, r2, lsl #3
    8858:	e0822100 	add	r2, r2, r0, lsl #2
    885c:	e0833102 	add	r3, r3, r2, lsl #2
    8860:	e5831070 	str	r1, [r3, #112]	; 0x70
    8864:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00008868 <restore_next_task>:
    8868:	e30e3010 	movw	r3, #57360	; 0xe010
    886c:	e3403000 	movt	r3, #0
    8870:	e5933000 	ldr	r3, [r3]
    8874:	e30e2020 	movw	r2, #57376	; 0xe020
    8878:	e3402000 	movt	r2, #0
    887c:	e0631183 	rsb	r1, r3, r3, lsl #3
    8880:	e0833101 	add	r3, r3, r1, lsl #2
    8884:	e1a03103 	lsl	r3, r3, #2
    8888:	e7d23003 	ldrb	r3, [r2, r3]
    888c:	e6ef3073 	uxtb	r3, r3
    8890:	e3530001 	cmp	r3, #1
    8894:	1a000009 	bne	88c0 <restore_next_task+0x58>
    8898:	e30e3010 	movw	r3, #57360	; 0xe010
    889c:	e3403000 	movt	r3, #0
    88a0:	e5933000 	ldr	r3, [r3]
    88a4:	e30e2020 	movw	r2, #57376	; 0xe020
    88a8:	e3402000 	movt	r2, #0
    88ac:	e0631183 	rsb	r1, r3, r3, lsl #3
    88b0:	e0833101 	add	r3, r3, r1, lsl #2
    88b4:	e1a03103 	lsl	r3, r3, #2
    88b8:	e3a01000 	mov	r1, #0
    88bc:	e7c21003 	strb	r1, [r2, r3]
    88c0:	e30e2010 	movw	r2, #57360	; 0xe010
    88c4:	e3402000 	movt	r2, #0
    88c8:	e5921000 	ldr	r1, [r2]
    88cc:	e30e3020 	movw	r3, #57376	; 0xe020
    88d0:	e3403000 	movt	r3, #0
    88d4:	e061c181 	rsb	ip, r1, r1, lsl #3
    88d8:	e081110c 	add	r1, r1, ip, lsl #2
    88dc:	e0831101 	add	r1, r3, r1, lsl #2
    88e0:	e2811020 	add	r1, r1, #32
    88e4:	e5911004 	ldr	r1, [r1, #4]
    88e8:	e580104c 	str	r1, [r0, #76]	; 0x4c
    88ec:	e5921000 	ldr	r1, [r2]
    88f0:	e061c181 	rsb	ip, r1, r1, lsl #3
    88f4:	e081110c 	add	r1, r1, ip, lsl #2
    88f8:	e0831101 	add	r1, r3, r1, lsl #2
    88fc:	e5911028 	ldr	r1, [r1, #40]	; 0x28
    8900:	e5801048 	str	r1, [r0, #72]	; 0x48
    8904:	e5921000 	ldr	r1, [r2]
    8908:	e061c181 	rsb	ip, r1, r1, lsl #3
    890c:	e081110c 	add	r1, r1, ip, lsl #2
    8910:	e0831101 	add	r1, r3, r1, lsl #2
    8914:	e2811028 	add	r1, r1, #40	; 0x28
    8918:	e5911004 	ldr	r1, [r1, #4]
    891c:	e5801044 	str	r1, [r0, #68]	; 0x44
    8920:	e5921000 	ldr	r1, [r2]
    8924:	e061c181 	rsb	ip, r1, r1, lsl #3
    8928:	e081110c 	add	r1, r1, ip, lsl #2
    892c:	e0831101 	add	r1, r3, r1, lsl #2
    8930:	e5911030 	ldr	r1, [r1, #48]	; 0x30
    8934:	e5801040 	str	r1, [r0, #64]	; 0x40
    8938:	e5921000 	ldr	r1, [r2]
    893c:	e061c181 	rsb	ip, r1, r1, lsl #3
    8940:	e081110c 	add	r1, r1, ip, lsl #2
    8944:	e0831101 	add	r1, r3, r1, lsl #2
    8948:	e2811030 	add	r1, r1, #48	; 0x30
    894c:	e5911004 	ldr	r1, [r1, #4]
    8950:	e580103c 	str	r1, [r0, #60]	; 0x3c
    8954:	e5921000 	ldr	r1, [r2]
    8958:	e061c181 	rsb	ip, r1, r1, lsl #3
    895c:	e081110c 	add	r1, r1, ip, lsl #2
    8960:	e0831101 	add	r1, r3, r1, lsl #2
    8964:	e5911038 	ldr	r1, [r1, #56]	; 0x38
    8968:	e5801038 	str	r1, [r0, #56]	; 0x38
    896c:	e5921000 	ldr	r1, [r2]
    8970:	e061c181 	rsb	ip, r1, r1, lsl #3
    8974:	e081110c 	add	r1, r1, ip, lsl #2
    8978:	e0831101 	add	r1, r3, r1, lsl #2
    897c:	e2811038 	add	r1, r1, #56	; 0x38
    8980:	e5911004 	ldr	r1, [r1, #4]
    8984:	e5801034 	str	r1, [r0, #52]	; 0x34
    8988:	e5921000 	ldr	r1, [r2]
    898c:	e061c181 	rsb	ip, r1, r1, lsl #3
    8990:	e081110c 	add	r1, r1, ip, lsl #2
    8994:	e0831101 	add	r1, r3, r1, lsl #2
    8998:	e5911040 	ldr	r1, [r1, #64]	; 0x40
    899c:	e5801030 	str	r1, [r0, #48]	; 0x30
    89a0:	e5921000 	ldr	r1, [r2]
    89a4:	e061c181 	rsb	ip, r1, r1, lsl #3
    89a8:	e081110c 	add	r1, r1, ip, lsl #2
    89ac:	e0831101 	add	r1, r3, r1, lsl #2
    89b0:	e2811040 	add	r1, r1, #64	; 0x40
    89b4:	e5911004 	ldr	r1, [r1, #4]
    89b8:	e580102c 	str	r1, [r0, #44]	; 0x2c
    89bc:	e5921000 	ldr	r1, [r2]
    89c0:	e061c181 	rsb	ip, r1, r1, lsl #3
    89c4:	e081110c 	add	r1, r1, ip, lsl #2
    89c8:	e0831101 	add	r1, r3, r1, lsl #2
    89cc:	e5911048 	ldr	r1, [r1, #72]	; 0x48
    89d0:	e5801028 	str	r1, [r0, #40]	; 0x28
    89d4:	e5921000 	ldr	r1, [r2]
    89d8:	e061c181 	rsb	ip, r1, r1, lsl #3
    89dc:	e081110c 	add	r1, r1, ip, lsl #2
    89e0:	e0831101 	add	r1, r3, r1, lsl #2
    89e4:	e2811048 	add	r1, r1, #72	; 0x48
    89e8:	e5911004 	ldr	r1, [r1, #4]
    89ec:	e5801024 	str	r1, [r0, #36]	; 0x24
    89f0:	e5921000 	ldr	r1, [r2]
    89f4:	e061c181 	rsb	ip, r1, r1, lsl #3
    89f8:	e081110c 	add	r1, r1, ip, lsl #2
    89fc:	e0831101 	add	r1, r3, r1, lsl #2
    8a00:	e5911050 	ldr	r1, [r1, #80]	; 0x50
    8a04:	e5801020 	str	r1, [r0, #32]
    8a08:	e5921000 	ldr	r1, [r2]
    8a0c:	e061c181 	rsb	ip, r1, r1, lsl #3
    8a10:	e081110c 	add	r1, r1, ip, lsl #2
    8a14:	e0831101 	add	r1, r3, r1, lsl #2
    8a18:	e2811050 	add	r1, r1, #80	; 0x50
    8a1c:	e5911004 	ldr	r1, [r1, #4]
    8a20:	e580101c 	str	r1, [r0, #28]
    8a24:	e5921000 	ldr	r1, [r2]
    8a28:	e061c181 	rsb	ip, r1, r1, lsl #3
    8a2c:	e081110c 	add	r1, r1, ip, lsl #2
    8a30:	e0831101 	add	r1, r3, r1, lsl #2
    8a34:	e5911058 	ldr	r1, [r1, #88]	; 0x58
    8a38:	e5801018 	str	r1, [r0, #24]
    8a3c:	e5921000 	ldr	r1, [r2]
    8a40:	e061c181 	rsb	ip, r1, r1, lsl #3
    8a44:	e081110c 	add	r1, r1, ip, lsl #2
    8a48:	e0831101 	add	r1, r3, r1, lsl #2
    8a4c:	e2811058 	add	r1, r1, #88	; 0x58
    8a50:	e5911004 	ldr	r1, [r1, #4]
    8a54:	e5801014 	str	r1, [r0, #20]
    8a58:	e5921000 	ldr	r1, [r2]
    8a5c:	e061c181 	rsb	ip, r1, r1, lsl #3
    8a60:	e081110c 	add	r1, r1, ip, lsl #2
    8a64:	e0831101 	add	r1, r3, r1, lsl #2
    8a68:	e5911060 	ldr	r1, [r1, #96]	; 0x60
    8a6c:	e5801010 	str	r1, [r0, #16]
    8a70:	e5921000 	ldr	r1, [r2]
    8a74:	e061c181 	rsb	ip, r1, r1, lsl #3
    8a78:	e081110c 	add	r1, r1, ip, lsl #2
    8a7c:	e0831101 	add	r1, r3, r1, lsl #2
    8a80:	e2811060 	add	r1, r1, #96	; 0x60
    8a84:	e5911004 	ldr	r1, [r1, #4]
    8a88:	e580100c 	str	r1, [r0, #12]
    8a8c:	e5921000 	ldr	r1, [r2]
    8a90:	e061c181 	rsb	ip, r1, r1, lsl #3
    8a94:	e081110c 	add	r1, r1, ip, lsl #2
    8a98:	e0831101 	add	r1, r3, r1, lsl #2
    8a9c:	e5911068 	ldr	r1, [r1, #104]	; 0x68
    8aa0:	e5801008 	str	r1, [r0, #8]
    8aa4:	e5921000 	ldr	r1, [r2]
    8aa8:	e061c181 	rsb	ip, r1, r1, lsl #3
    8aac:	e081110c 	add	r1, r1, ip, lsl #2
    8ab0:	e0831101 	add	r1, r3, r1, lsl #2
    8ab4:	e2811068 	add	r1, r1, #104	; 0x68
    8ab8:	e5911004 	ldr	r1, [r1, #4]
    8abc:	e5801004 	str	r1, [r0, #4]
    8ac0:	e5922000 	ldr	r2, [r2]
    8ac4:	e0621182 	rsb	r1, r2, r2, lsl #3
    8ac8:	e0822101 	add	r2, r2, r1, lsl #2
    8acc:	e0833102 	add	r3, r3, r2, lsl #2
    8ad0:	e5933070 	ldr	r3, [r3, #112]	; 0x70
    8ad4:	e5803000 	str	r3, [r0]
    8ad8:	e12fff1e 	bx	lr

00008adc <enforce>:
    8adc:	e30e3010 	movw	r3, #57360	; 0xe010
    8ae0:	e3403000 	movt	r3, #0
    8ae4:	e5933000 	ldr	r3, [r3]
    8ae8:	e353001f 	cmp	r3, #31
    8aec:	012fff1e 	bxeq	lr
    8af0:	e30e0010 	movw	r0, #57360	; 0xe010
    8af4:	e3400000 	movt	r0, #0
    8af8:	e590c000 	ldr	ip, [r0]
    8afc:	e30e3020 	movw	r3, #57376	; 0xe020
    8b00:	e3403000 	movt	r3, #0
    8b04:	e06c118c 	rsb	r1, ip, ip, lsl #3
    8b08:	e1a02101 	lsl	r2, r1, #2
    8b0c:	e082100c 	add	r1, r2, ip
    8b10:	e0831101 	add	r1, r3, r1, lsl #2
    8b14:	e5911018 	ldr	r1, [r1, #24]
    8b18:	e2811001 	add	r1, r1, #1
    8b1c:	e082200c 	add	r2, r2, ip
    8b20:	e0832102 	add	r2, r3, r2, lsl #2
    8b24:	e5821018 	str	r1, [r2, #24]
    8b28:	e5902000 	ldr	r2, [r0]
    8b2c:	e0621182 	rsb	r1, r2, r2, lsl #3
    8b30:	e0822101 	add	r2, r2, r1, lsl #2
    8b34:	e0832102 	add	r2, r3, r2, lsl #2
    8b38:	e5921018 	ldr	r1, [r2, #24]
    8b3c:	e5902000 	ldr	r2, [r0]
    8b40:	e0620182 	rsb	r0, r2, r2, lsl #3
    8b44:	e0822100 	add	r2, r2, r0, lsl #2
    8b48:	e0833102 	add	r3, r3, r2, lsl #2
    8b4c:	e5933004 	ldr	r3, [r3, #4]
    8b50:	e1510003 	cmp	r1, r3
    8b54:	9a000009 	bls	8b80 <enforce+0xa4>
    8b58:	e30e3010 	movw	r3, #57360	; 0xe010
    8b5c:	e3403000 	movt	r3, #0
    8b60:	e5933000 	ldr	r3, [r3]
    8b64:	e30e2020 	movw	r2, #57376	; 0xe020
    8b68:	e3402000 	movt	r2, #0
    8b6c:	e0631183 	rsb	r1, r3, r3, lsl #3
    8b70:	e0833101 	add	r3, r3, r1, lsl #2
    8b74:	e1a03103 	lsl	r3, r3, #2
    8b78:	e3a01002 	mov	r1, #2
    8b7c:	e7c21003 	strb	r1, [r2, r3]
    8b80:	e30e3010 	movw	r3, #57360	; 0xe010
    8b84:	e3403000 	movt	r3, #0
    8b88:	e5932000 	ldr	r2, [r3]
    8b8c:	e30e3020 	movw	r3, #57376	; 0xe020
    8b90:	e3403000 	movt	r3, #0
    8b94:	e0621182 	rsb	r1, r2, r2, lsl #3
    8b98:	e0822101 	add	r2, r2, r1, lsl #2
    8b9c:	e0833102 	add	r3, r3, r2, lsl #2
    8ba0:	e2833018 	add	r3, r3, #24
    8ba4:	e5933004 	ldr	r3, [r3, #4]
    8ba8:	e3530000 	cmp	r3, #0
    8bac:	012fff1e 	bxeq	lr
    8bb0:	e30e3010 	movw	r3, #57360	; 0xe010
    8bb4:	e3403000 	movt	r3, #0
    8bb8:	e5930000 	ldr	r0, [r3]
    8bbc:	e30e3020 	movw	r3, #57376	; 0xe020
    8bc0:	e3403000 	movt	r3, #0
    8bc4:	e0601180 	rsb	r1, r0, r0, lsl #3
    8bc8:	e1a02101 	lsl	r2, r1, #2
    8bcc:	e0821000 	add	r1, r2, r0
    8bd0:	e0831101 	add	r1, r3, r1, lsl #2
    8bd4:	e2811018 	add	r1, r1, #24
    8bd8:	e5911004 	ldr	r1, [r1, #4]
    8bdc:	e2411001 	sub	r1, r1, #1
    8be0:	e0822000 	add	r2, r2, r0
    8be4:	e0833102 	add	r3, r3, r2, lsl #2
    8be8:	e583101c 	str	r1, [r3, #28]
    8bec:	e12fff1e 	bx	lr

00008bf0 <wakeup>:
    8bf0:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    8bf4:	e3a03000 	mov	r3, #0
    8bf8:	e3a0c001 	mov	ip, #1
    8bfc:	e30f0028 	movw	r0, #61480	; 0xf028
    8c00:	e3400000 	movt	r0, #0
    8c04:	e30ee020 	movw	lr, #57376	; 0xe020
    8c08:	e340e000 	movt	lr, #0
    8c0c:	e30e501c 	movw	r5, #57372	; 0xe01c
    8c10:	e3405000 	movt	r5, #0
    8c14:	e1a06003 	mov	r6, r3
    8c18:	e30e4014 	movw	r4, #57364	; 0xe014
    8c1c:	e3404000 	movt	r4, #0
    8c20:	e1a0131c 	lsl	r1, ip, r3
    8c24:	e5902000 	ldr	r2, [r0]
    8c28:	e1110002 	tst	r1, r2
    8c2c:	0a000011 	beq	8c78 <wakeup+0x88>
    8c30:	e0632183 	rsb	r2, r3, r3, lsl #3
    8c34:	e0832102 	add	r2, r3, r2, lsl #2
    8c38:	e08e2102 	add	r2, lr, r2, lsl #2
    8c3c:	e592700c 	ldr	r7, [r2, #12]
    8c40:	e5952000 	ldr	r2, [r5]
    8c44:	e1570002 	cmp	r7, r2
    8c48:	2a00000a 	bcs	8c78 <wakeup+0x88>
    8c4c:	e0632183 	rsb	r2, r3, r3, lsl #3
    8c50:	e0832102 	add	r2, r3, r2, lsl #2
    8c54:	e08e7102 	add	r7, lr, r2, lsl #2
    8c58:	e7cec102 	strb	ip, [lr, r2, lsl #2]
    8c5c:	e5876018 	str	r6, [r7, #24]
    8c60:	e5902000 	ldr	r2, [r0]
    8c64:	e1c22001 	bic	r2, r2, r1
    8c68:	e5802000 	str	r2, [r0]
    8c6c:	e5942000 	ldr	r2, [r4]
    8c70:	e1811002 	orr	r1, r1, r2
    8c74:	e5841000 	str	r1, [r4]
    8c78:	e2833001 	add	r3, r3, #1
    8c7c:	e3530020 	cmp	r3, #32
    8c80:	1affffe6 	bne	8c20 <wakeup+0x30>
    8c84:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}

00008c88 <resetScreen>:
    8c88:	e92d4010 	push	{r4, lr}
    8c8c:	e30e3000 	movw	r3, #57344	; 0xe000
    8c90:	e3403000 	movt	r3, #0
    8c94:	e3a04000 	mov	r4, #0
    8c98:	e5834000 	str	r4, [r3]
    8c9c:	eb000597 	bl	a300 <oled_clear_screen>
    8ca0:	eb0004e8 	bl	a048 <oled_buf_clr>
    8ca4:	e1a03004 	mov	r3, r4
    8ca8:	e30e1020 	movw	r1, #57376	; 0xe020
    8cac:	e3401000 	movt	r1, #0
    8cb0:	e1a00004 	mov	r0, r4
    8cb4:	e0632183 	rsb	r2, r3, r3, lsl #3
    8cb8:	e0832102 	add	r2, r3, r2, lsl #2
    8cbc:	e0812102 	add	r2, r1, r2, lsl #2
    8cc0:	e5820020 	str	r0, [r2, #32]
    8cc4:	e2833001 	add	r3, r3, #1
    8cc8:	e353001f 	cmp	r3, #31
    8ccc:	1afffff8 	bne	8cb4 <resetScreen+0x2c>
    8cd0:	e8bd8010 	pop	{r4, pc}

00008cd4 <visualizer>:
    8cd4:	e92d4038 	push	{r3, r4, r5, lr}
    8cd8:	e30e3010 	movw	r3, #57360	; 0xe010
    8cdc:	e3403000 	movt	r3, #0
    8ce0:	e5933000 	ldr	r3, [r3]
    8ce4:	e353001f 	cmp	r3, #31
    8ce8:	0a00000d 	beq	8d24 <visualizer+0x50>
    8cec:	e30e3010 	movw	r3, #57360	; 0xe010
    8cf0:	e3403000 	movt	r3, #0
    8cf4:	e5930000 	ldr	r0, [r3]
    8cf8:	e30e3020 	movw	r3, #57376	; 0xe020
    8cfc:	e3403000 	movt	r3, #0
    8d00:	e0601180 	rsb	r1, r0, r0, lsl #3
    8d04:	e1a02101 	lsl	r2, r1, #2
    8d08:	e0821000 	add	r1, r2, r0
    8d0c:	e0831101 	add	r1, r3, r1, lsl #2
    8d10:	e5911020 	ldr	r1, [r1, #32]
    8d14:	e2811001 	add	r1, r1, #1
    8d18:	e0822000 	add	r2, r2, r0
    8d1c:	e0833102 	add	r3, r3, r2, lsl #2
    8d20:	e5831020 	str	r1, [r3, #32]
    8d24:	e3a00011 	mov	r0, #17
    8d28:	ebfffd39 	bl	8214 <gpio_get_level>
    8d2c:	e1a04000 	mov	r4, r0
    8d30:	e3a0001a 	mov	r0, #26
    8d34:	ebfffd36 	bl	8214 <gpio_get_level>
    8d38:	e1a05000 	mov	r5, r0
    8d3c:	e3500001 	cmp	r0, #1
    8d40:	030e3000 	movweq	r3, #57344	; 0xe000
    8d44:	03403000 	movteq	r3, #0
    8d48:	03a02001 	moveq	r2, #1
    8d4c:	05c32004 	strbeq	r2, [r3, #4]
    8d50:	e3540001 	cmp	r4, #1
    8d54:	1a000004 	bne	8d6c <visualizer+0x98>
    8d58:	e30e3000 	movw	r3, #57344	; 0xe000
    8d5c:	e3403000 	movt	r3, #0
    8d60:	e3a02001 	mov	r2, #1
    8d64:	e5c32005 	strb	r2, [r3, #5]
    8d68:	ea000010 	b	8db0 <visualizer+0xdc>
    8d6c:	e3540000 	cmp	r4, #0
    8d70:	1a00000e 	bne	8db0 <visualizer+0xdc>
    8d74:	e30e3000 	movw	r3, #57344	; 0xe000
    8d78:	e3403000 	movt	r3, #0
    8d7c:	e5d33005 	ldrb	r3, [r3, #5]
    8d80:	e3530001 	cmp	r3, #1
    8d84:	1a000009 	bne	8db0 <visualizer+0xdc>
    8d88:	e30e3000 	movw	r3, #57344	; 0xe000
    8d8c:	e3403000 	movt	r3, #0
    8d90:	e3a02000 	mov	r2, #0
    8d94:	e5c32005 	strb	r2, [r3, #5]
    8d98:	e30d3000 	movw	r3, #53248	; 0xd000
    8d9c:	e3403000 	movt	r3, #0
    8da0:	e5932000 	ldr	r2, [r3]
    8da4:	e2622001 	rsb	r2, r2, #1
    8da8:	e5832000 	str	r2, [r3]
    8dac:	ebffffb5 	bl	8c88 <resetScreen>
    8db0:	e30d3000 	movw	r3, #53248	; 0xd000
    8db4:	e3403000 	movt	r3, #0
    8db8:	e5933000 	ldr	r3, [r3]
    8dbc:	e3530000 	cmp	r3, #0
    8dc0:	0a00001c 	beq	8e38 <visualizer+0x164>
    8dc4:	e30e301c 	movw	r3, #57372	; 0xe01c
    8dc8:	e3403000 	movt	r3, #0
    8dcc:	e5933000 	ldr	r3, [r3]
    8dd0:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    8dd4:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    8dd8:	e0832293 	umull	r2, r3, r3, r2
    8ddc:	e7e641d3 	ubfx	r4, r3, #3, #7
    8de0:	e3540000 	cmp	r4, #0
    8de4:	1a000001 	bne	8df0 <visualizer+0x11c>
    8de8:	eb000544 	bl	a300 <oled_clear_screen>
    8dec:	eb000495 	bl	a048 <oled_buf_clr>
    8df0:	e30e3010 	movw	r3, #57360	; 0xe010
    8df4:	e3403000 	movt	r3, #0
    8df8:	e5930000 	ldr	r0, [r3]
    8dfc:	e1a01004 	mov	r1, r4
    8e00:	eb00046e 	bl	9fc0 <oled_buf_pixel_set>
    8e04:	e30e301c 	movw	r3, #57372	; 0xe01c
    8e08:	e3403000 	movt	r3, #0
    8e0c:	e5931000 	ldr	r1, [r3]
    8e10:	e308251f 	movw	r2, #34079	; 0x851f
    8e14:	e34521eb 	movt	r2, #20971	; 0x51eb
    8e18:	e0832291 	umull	r2, r3, r1, r2
    8e1c:	e1a032a3 	lsr	r3, r3, #5
    8e20:	e0833103 	add	r3, r3, r3, lsl #2
    8e24:	e0833103 	add	r3, r3, r3, lsl #2
    8e28:	e1510103 	cmp	r1, r3, lsl #2
    8e2c:	18bd8038 	popne	{r3, r4, r5, pc}
    8e30:	eb000509 	bl	a25c <oled_buf_draw>
    8e34:	e8bd8038 	pop	{r3, r4, r5, pc}
    8e38:	e3550000 	cmp	r5, #0
    8e3c:	1a000009 	bne	8e68 <visualizer+0x194>
    8e40:	e30e3000 	movw	r3, #57344	; 0xe000
    8e44:	e3403000 	movt	r3, #0
    8e48:	e5d33004 	ldrb	r3, [r3, #4]
    8e4c:	e3530001 	cmp	r3, #1
    8e50:	1a000004 	bne	8e68 <visualizer+0x194>
    8e54:	ebffff8b 	bl	8c88 <resetScreen>
    8e58:	e30e3000 	movw	r3, #57344	; 0xe000
    8e5c:	e3403000 	movt	r3, #0
    8e60:	e3a02000 	mov	r2, #0
    8e64:	e5c32004 	strb	r2, [r3, #4]
    8e68:	e30e1010 	movw	r1, #57360	; 0xe010
    8e6c:	e3401000 	movt	r1, #0
    8e70:	e5912000 	ldr	r2, [r1]
    8e74:	e30e3020 	movw	r3, #57376	; 0xe020
    8e78:	e3403000 	movt	r3, #0
    8e7c:	e0620182 	rsb	r0, r2, r2, lsl #3
    8e80:	e0822100 	add	r2, r2, r0, lsl #2
    8e84:	e0833102 	add	r3, r3, r2, lsl #2
    8e88:	e5933020 	ldr	r3, [r3, #32]
    8e8c:	e308251f 	movw	r2, #34079	; 0x851f
    8e90:	e34521eb 	movt	r2, #20971	; 0x51eb
    8e94:	e0832293 	umull	r2, r3, r3, r2
    8e98:	e7e642d3 	ubfx	r4, r3, #5, #7
    8e9c:	e5913000 	ldr	r3, [r1]
    8ea0:	e353001f 	cmp	r3, #31
    8ea4:	0a000002 	beq	8eb4 <visualizer+0x1e0>
    8ea8:	e5910000 	ldr	r0, [r1]
    8eac:	e1a01004 	mov	r1, r4
    8eb0:	eb000442 	bl	9fc0 <oled_buf_pixel_set>
    8eb4:	e30e3000 	movw	r3, #57344	; 0xe000
    8eb8:	e3403000 	movt	r3, #0
    8ebc:	e5933000 	ldr	r3, [r3]
    8ec0:	e3530000 	cmp	r3, #0
    8ec4:	18bd8038 	popne	{r3, r4, r5, pc}
    8ec8:	e30e301c 	movw	r3, #57372	; 0xe01c
    8ecc:	e3403000 	movt	r3, #0
    8ed0:	e5931000 	ldr	r1, [r3]
    8ed4:	e308251f 	movw	r2, #34079	; 0x851f
    8ed8:	e34521eb 	movt	r2, #20971	; 0x51eb
    8edc:	e0832291 	umull	r2, r3, r1, r2
    8ee0:	e1a032a3 	lsr	r3, r3, #5
    8ee4:	e0833103 	add	r3, r3, r3, lsl #2
    8ee8:	e0833103 	add	r3, r3, r3, lsl #2
    8eec:	e1510103 	cmp	r1, r3, lsl #2
    8ef0:	18bd8038 	popne	{r3, r4, r5, pc}
    8ef4:	e354007f 	cmp	r4, #127	; 0x7f
    8ef8:	030e3000 	movweq	r3, #57344	; 0xe000
    8efc:	03403000 	movteq	r3, #0
    8f00:	03a02001 	moveq	r2, #1
    8f04:	05832000 	streq	r2, [r3]
    8f08:	eb0004d3 	bl	a25c <oled_buf_draw>
    8f0c:	e8bd8038 	pop	{r3, r4, r5, pc}

00008f10 <irq_c_handler>:
    8f10:	e92d4010 	push	{r4, lr}
    8f14:	e1a04000 	mov	r4, r0
    8f18:	eb00014c 	bl	9450 <timer_is_pending>
    8f1c:	e3500000 	cmp	r0, #0
    8f20:	0a000000 	beq	8f28 <irq_c_handler+0x18>
    8f24:	eb00014e 	bl	9464 <timer_clear_pending>
    8f28:	e30e301c 	movw	r3, #57372	; 0xe01c
    8f2c:	e3403000 	movt	r3, #0
    8f30:	e5932000 	ldr	r2, [r3]
    8f34:	e2822001 	add	r2, r2, #1
    8f38:	e5832000 	str	r2, [r3]
    8f3c:	ebfffee6 	bl	8adc <enforce>
    8f40:	e1a00004 	mov	r0, r4
    8f44:	ebfffd81 	bl	8550 <store_current_task>
    8f48:	ebffff28 	bl	8bf0 <wakeup>
    8f4c:	ebfffd62 	bl	84dc <get_top_priority>
    8f50:	e30e3010 	movw	r3, #57360	; 0xe010
    8f54:	e3403000 	movt	r3, #0
    8f58:	e5830000 	str	r0, [r3]
    8f5c:	ebffff5c 	bl	8cd4 <visualizer>
    8f60:	e1a00004 	mov	r0, r4
    8f64:	ebfffe3f 	bl	8868 <restore_next_task>
    8f68:	e1a00004 	mov	r0, r4
    8f6c:	e8bd8010 	pop	{r4, pc}

00008f70 <swi_c_handler>:
    8f70:	e92d4030 	push	{r4, r5, lr}
    8f74:	e24dd00c 	sub	sp, sp, #12
    8f78:	e1a04000 	mov	r4, r0
    8f7c:	e1a05001 	mov	r5, r1
    8f80:	eb000559 	bl	a4ec <enable_interrupts>
    8f84:	e3540013 	cmp	r4, #19
    8f88:	979ff104 	ldrls	pc, [pc, r4, lsl #2]
    8f8c:	ea000065 	b	9128 <swi_c_handler+0x1b8>
    8f90:	00008fe0 	andeq	r8, r0, r0, ror #31
    8f94:	00008ff0 	strdeq	r8, [r0], -r0
    8f98:	00009008 	andeq	r9, r0, r8
    8f9c:	00009018 	andeq	r9, r0, r8, lsl r0
    8fa0:	0000902c 	andeq	r9, r0, ip, lsr #32
    8fa4:	0000903c 	andeq	r9, r0, ip, lsr r0
    8fa8:	00009054 	andeq	r9, r0, r4, asr r0
    8fac:	0000906c 	andeq	r9, r0, ip, rrx
    8fb0:	00009128 	andeq	r9, r0, r8, lsr #2
    8fb4:	00009128 	andeq	r9, r0, r8, lsr #2
    8fb8:	0000907c 	andeq	r9, r0, ip, ror r0
    8fbc:	00009090 	muleq	r0, r0, r0
    8fc0:	000090b4 	strheq	r9, [r0], -r4
    8fc4:	000090c8 	andeq	r9, r0, r8, asr #1
    8fc8:	000090d8 	ldrdeq	r9, [r0], -r8
    8fcc:	000090e8 	andeq	r9, r0, r8, ror #1
    8fd0:	000090f4 	strdeq	r9, [r0], -r4
    8fd4:	00009100 	andeq	r9, r0, r0, lsl #2
    8fd8:	0000910c 	andeq	r9, r0, ip, lsl #2
    8fdc:	00009118 	andeq	r9, r0, r8, lsl r1
    8fe0:	e5950000 	ldr	r0, [r5]
    8fe4:	eb0003cf 	bl	9f28 <syscall_sbrk>
    8fe8:	e1a04000 	mov	r4, r0
    8fec:	ea00004e 	b	912c <swi_c_handler+0x1bc>
    8ff0:	e5950000 	ldr	r0, [r5]
    8ff4:	e5951004 	ldr	r1, [r5, #4]
    8ff8:	e5952008 	ldr	r2, [r5, #8]
    8ffc:	eb000157 	bl	9560 <syscall_write>
    9000:	e1a04000 	mov	r4, r0
    9004:	ea000048 	b	912c <swi_c_handler+0x1bc>
    9008:	e5950000 	ldr	r0, [r5]
    900c:	eb0003db 	bl	9f80 <syscall_close>
    9010:	e1a04000 	mov	r4, r0
    9014:	ea000044 	b	912c <swi_c_handler+0x1bc>
    9018:	e5950000 	ldr	r0, [r5]
    901c:	e5951004 	ldr	r1, [r5, #4]
    9020:	eb0003d8 	bl	9f88 <syscall_fstat>
    9024:	e1a04000 	mov	r4, r0
    9028:	ea00003f 	b	912c <swi_c_handler+0x1bc>
    902c:	e5950000 	ldr	r0, [r5]
    9030:	eb0003d6 	bl	9f90 <syscall_isatty>
    9034:	e1a04000 	mov	r4, r0
    9038:	ea00003b 	b	912c <swi_c_handler+0x1bc>
    903c:	e5950000 	ldr	r0, [r5]
    9040:	e5951004 	ldr	r1, [r5, #4]
    9044:	e5952008 	ldr	r2, [r5, #8]
    9048:	eb0003d2 	bl	9f98 <syscall_lseek>
    904c:	e1a04000 	mov	r4, r0
    9050:	ea000035 	b	912c <swi_c_handler+0x1bc>
    9054:	e5950000 	ldr	r0, [r5]
    9058:	e5951004 	ldr	r1, [r5, #4]
    905c:	e5952008 	ldr	r2, [r5, #8]
    9060:	eb000150 	bl	95a8 <syscall_read>
    9064:	e1a04000 	mov	r4, r0
    9068:	ea00002f 	b	912c <swi_c_handler+0x1bc>
    906c:	e5950000 	ldr	r0, [r5]
    9070:	eb000137 	bl	9554 <syscall_exit>
    9074:	e3a04000 	mov	r4, #0
    9078:	ea00002b 	b	912c <swi_c_handler+0x1bc>
    907c:	e5950000 	ldr	r0, [r5]
    9080:	e5951004 	ldr	r1, [r5, #4]
    9084:	eb0001ad 	bl	9740 <thread_init>
    9088:	e1a04000 	mov	r4, r0
    908c:	ea000026 	b	912c <swi_c_handler+0x1bc>
    9090:	e5950000 	ldr	r0, [r5]
    9094:	e5951004 	ldr	r1, [r5, #4]
    9098:	e5952008 	ldr	r2, [r5, #8]
    909c:	e595300c 	ldr	r3, [r5, #12]
    90a0:	e595c040 	ldr	ip, [r5, #64]	; 0x40
    90a4:	e58dc000 	str	ip, [sp]
    90a8:	eb000171 	bl	9674 <thread_create>
    90ac:	e1a04000 	mov	r4, r0
    90b0:	ea00001d 	b	912c <swi_c_handler+0x1bc>
    90b4:	e5950000 	ldr	r0, [r5]
    90b8:	e5951004 	ldr	r1, [r5, #4]
    90bc:	eb0001ba 	bl	97ac <mutex_init>
    90c0:	e1a04000 	mov	r4, r0
    90c4:	ea000018 	b	912c <swi_c_handler+0x1bc>
    90c8:	e5950000 	ldr	r0, [r5]
    90cc:	eb0001cf 	bl	9810 <mutex_lock>
    90d0:	e3a04000 	mov	r4, #0
    90d4:	ea000014 	b	912c <swi_c_handler+0x1bc>
    90d8:	e5950000 	ldr	r0, [r5]
    90dc:	eb00021e 	bl	995c <mutex_unlock>
    90e0:	e3a04000 	mov	r4, #0
    90e4:	ea000010 	b	912c <swi_c_handler+0x1bc>
    90e8:	eb000355 	bl	9e44 <wait_until_next_period>
    90ec:	e3a04000 	mov	r4, #0
    90f0:	ea00000d 	b	912c <swi_c_handler+0x1bc>
    90f4:	eb000367 	bl	9e98 <get_time>
    90f8:	e1a04000 	mov	r4, r0
    90fc:	ea00000a 	b	912c <swi_c_handler+0x1bc>
    9100:	eb00025a 	bl	9a70 <scheduler_start>
    9104:	e1a04000 	mov	r4, r0
    9108:	ea000007 	b	912c <swi_c_handler+0x1bc>
    910c:	eb000365 	bl	9ea8 <get_priority>
    9110:	e1a04000 	mov	r4, r0
    9114:	ea000004 	b	912c <swi_c_handler+0x1bc>
    9118:	e5950000 	ldr	r0, [r5]
    911c:	eb00036b 	bl	9ed0 <spin_wait>
    9120:	e3a04000 	mov	r4, #0
    9124:	ea000000 	b	912c <swi_c_handler+0x1bc>
    9128:	e3a04000 	mov	r4, #0
    912c:	eb0004e9 	bl	a4d8 <disable_interrupts>
    9130:	e1a00004 	mov	r0, r4
    9134:	e28dd00c 	add	sp, sp, #12
    9138:	e8bd8030 	pop	{r4, r5, pc}

0000913c <printnumk>:
    913c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    9140:	e24dd008 	sub	sp, sp, #8
    9144:	e1a06002 	mov	r6, r2
    9148:	e1a07003 	mov	r7, r3
    914c:	e3500008 	cmp	r0, #8
    9150:	0a000004 	beq	9168 <printnumk+0x2c>
    9154:	e30c8020 	movw	r8, #49184	; 0xc020
    9158:	e3408000 	movt	r8, #0
    915c:	e3500010 	cmp	r0, #16
    9160:	13a08000 	movne	r8, #0
    9164:	ea000001 	b	9170 <printnumk+0x34>
    9168:	e30c801c 	movw	r8, #49180	; 0xc01c
    916c:	e3408000 	movt	r8, #0
    9170:	e28d4007 	add	r4, sp, #7
    9174:	e1a05000 	mov	r5, r0
    9178:	e3a09000 	mov	r9, #0
    917c:	e30ca008 	movw	sl, #49160	; 0xc008
    9180:	e340a000 	movt	sl, #0
    9184:	e1a00006 	mov	r0, r6
    9188:	e1a01007 	mov	r1, r7
    918c:	e1a02005 	mov	r2, r5
    9190:	e1a03009 	mov	r3, r9
    9194:	eb0007c8 	bl	b0bc <__aeabi_uldivmod>
    9198:	e7da3002 	ldrb	r3, [sl, r2]
    919c:	e4443001 	strb	r3, [r4], #-1
    91a0:	e1a00006 	mov	r0, r6
    91a4:	e1a01007 	mov	r1, r7
    91a8:	e1a02005 	mov	r2, r5
    91ac:	e1a03009 	mov	r3, r9
    91b0:	eb0007c1 	bl	b0bc <__aeabi_uldivmod>
    91b4:	e1a06000 	mov	r6, r0
    91b8:	e1a07001 	mov	r7, r1
    91bc:	e1963007 	orrs	r3, r6, r7
    91c0:	1affffef 	bne	9184 <printnumk+0x48>
    91c4:	e3580000 	cmp	r8, #0
    91c8:	0a000002 	beq	91d8 <printnumk+0x9c>
    91cc:	e5d80000 	ldrb	r0, [r8]
    91d0:	e3500000 	cmp	r0, #0
    91d4:	1a000004 	bne	91ec <printnumk+0xb0>
    91d8:	e2844001 	add	r4, r4, #1
    91dc:	e28d3008 	add	r3, sp, #8
    91e0:	e1540003 	cmp	r4, r3
    91e4:	1a000005 	bne	9200 <printnumk+0xc4>
    91e8:	ea000009 	b	9214 <printnumk+0xd8>
    91ec:	eb0000c5 	bl	9508 <uart_put_byte>
    91f0:	e5f80001 	ldrb	r0, [r8, #1]!
    91f4:	e3500000 	cmp	r0, #0
    91f8:	1afffffb 	bne	91ec <printnumk+0xb0>
    91fc:	eafffff5 	b	91d8 <printnumk+0x9c>
    9200:	e4d40001 	ldrb	r0, [r4], #1
    9204:	eb0000bf 	bl	9508 <uart_put_byte>
    9208:	e28d3008 	add	r3, sp, #8
    920c:	e1540003 	cmp	r4, r3
    9210:	1afffffa 	bne	9200 <printnumk+0xc4>
    9214:	e28dd008 	add	sp, sp, #8
    9218:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}

0000921c <printk>:
    921c:	e92d000f 	push	{r0, r1, r2, r3}
    9220:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    9224:	e24dd008 	sub	sp, sp, #8
    9228:	e59d4020 	ldr	r4, [sp, #32]
    922c:	e28d3024 	add	r3, sp, #36	; 0x24
    9230:	e58d3004 	str	r3, [sp, #4]
    9234:	e3a06000 	mov	r6, #0
    9238:	e3a08008 	mov	r8, #8
    923c:	e3a07010 	mov	r7, #16
    9240:	ea00005c 	b	93b8 <printk+0x19c>
    9244:	e3500025 	cmp	r0, #37	; 0x25
    9248:	0a000002 	beq	9258 <printk+0x3c>
    924c:	e2844001 	add	r4, r4, #1
    9250:	eb0000ac 	bl	9508 <uart_put_byte>
    9254:	ea000057 	b	93b8 <printk+0x19c>
    9258:	e5d43001 	ldrb	r3, [r4, #1]
    925c:	e353006f 	cmp	r3, #111	; 0x6f
    9260:	0a00002c 	beq	9318 <printk+0xfc>
    9264:	8a000006 	bhi	9284 <printk+0x68>
    9268:	e3530063 	cmp	r3, #99	; 0x63
    926c:	0a000045 	beq	9388 <printk+0x16c>
    9270:	e3530064 	cmp	r3, #100	; 0x64
    9274:	0a00000d 	beq	92b0 <printk+0x94>
    9278:	e3530025 	cmp	r3, #37	; 0x25
    927c:	1a00004a 	bne	93ac <printk+0x190>
    9280:	ea000046 	b	93a0 <printk+0x184>
    9284:	e3530073 	cmp	r3, #115	; 0x73
    9288:	0a000032 	beq	9358 <printk+0x13c>
    928c:	8a000002 	bhi	929c <printk+0x80>
    9290:	e3530070 	cmp	r3, #112	; 0x70
    9294:	0a000027 	beq	9338 <printk+0x11c>
    9298:	ea000043 	b	93ac <printk+0x190>
    929c:	e3530075 	cmp	r3, #117	; 0x75
    92a0:	0a000014 	beq	92f8 <printk+0xdc>
    92a4:	e3530078 	cmp	r3, #120	; 0x78
    92a8:	0a000022 	beq	9338 <printk+0x11c>
    92ac:	ea00003e 	b	93ac <printk+0x190>
    92b0:	e59d3004 	ldr	r3, [sp, #4]
    92b4:	e2832004 	add	r2, r3, #4
    92b8:	e58d2004 	str	r2, [sp, #4]
    92bc:	e5935000 	ldr	r5, [r3]
    92c0:	e3550000 	cmp	r5, #0
    92c4:	aa000006 	bge	92e4 <printk+0xc8>
    92c8:	e3a0002d 	mov	r0, #45	; 0x2d
    92cc:	eb00008d 	bl	9508 <uart_put_byte>
    92d0:	e2652000 	rsb	r2, r5, #0
    92d4:	e3a0000a 	mov	r0, #10
    92d8:	e1a03fc2 	asr	r3, r2, #31
    92dc:	ebffff96 	bl	913c <printnumk>
    92e0:	ea000033 	b	93b4 <printk+0x198>
    92e4:	e3a0000a 	mov	r0, #10
    92e8:	e1a02005 	mov	r2, r5
    92ec:	e1a03fc5 	asr	r3, r5, #31
    92f0:	ebffff91 	bl	913c <printnumk>
    92f4:	ea00002e 	b	93b4 <printk+0x198>
    92f8:	e59d3004 	ldr	r3, [sp, #4]
    92fc:	e2832004 	add	r2, r3, #4
    9300:	e58d2004 	str	r2, [sp, #4]
    9304:	e3a0000a 	mov	r0, #10
    9308:	e5932000 	ldr	r2, [r3]
    930c:	e1a03006 	mov	r3, r6
    9310:	ebffff89 	bl	913c <printnumk>
    9314:	ea000026 	b	93b4 <printk+0x198>
    9318:	e59d3004 	ldr	r3, [sp, #4]
    931c:	e2832004 	add	r2, r3, #4
    9320:	e58d2004 	str	r2, [sp, #4]
    9324:	e1a00008 	mov	r0, r8
    9328:	e5932000 	ldr	r2, [r3]
    932c:	e1a03006 	mov	r3, r6
    9330:	ebffff81 	bl	913c <printnumk>
    9334:	ea00001e 	b	93b4 <printk+0x198>
    9338:	e59d3004 	ldr	r3, [sp, #4]
    933c:	e2832004 	add	r2, r3, #4
    9340:	e58d2004 	str	r2, [sp, #4]
    9344:	e1a00007 	mov	r0, r7
    9348:	e5932000 	ldr	r2, [r3]
    934c:	e1a03006 	mov	r3, r6
    9350:	ebffff79 	bl	913c <printnumk>
    9354:	ea000016 	b	93b4 <printk+0x198>
    9358:	e59d3004 	ldr	r3, [sp, #4]
    935c:	e2832004 	add	r2, r3, #4
    9360:	e58d2004 	str	r2, [sp, #4]
    9364:	e5935000 	ldr	r5, [r3]
    9368:	e5d50000 	ldrb	r0, [r5]
    936c:	e3500000 	cmp	r0, #0
    9370:	0a00000f 	beq	93b4 <printk+0x198>
    9374:	eb000063 	bl	9508 <uart_put_byte>
    9378:	e5f50001 	ldrb	r0, [r5, #1]!
    937c:	e3500000 	cmp	r0, #0
    9380:	1afffffb 	bne	9374 <printk+0x158>
    9384:	ea00000a 	b	93b4 <printk+0x198>
    9388:	e59d3004 	ldr	r3, [sp, #4]
    938c:	e2832004 	add	r2, r3, #4
    9390:	e58d2004 	str	r2, [sp, #4]
    9394:	e5d30000 	ldrb	r0, [r3]
    9398:	eb00005a 	bl	9508 <uart_put_byte>
    939c:	ea000004 	b	93b4 <printk+0x198>
    93a0:	e3a00025 	mov	r0, #37	; 0x25
    93a4:	eb000057 	bl	9508 <uart_put_byte>
    93a8:	ea000001 	b	93b4 <printk+0x198>
    93ac:	e3e00000 	mvn	r0, #0
    93b0:	ea000003 	b	93c4 <printk+0x1a8>
    93b4:	e2844002 	add	r4, r4, #2
    93b8:	e5d40000 	ldrb	r0, [r4]
    93bc:	e3500000 	cmp	r0, #0
    93c0:	1affff9f 	bne	9244 <printk+0x28>
    93c4:	e28dd008 	add	sp, sp, #8
    93c8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    93cc:	e28dd010 	add	sp, sp, #16
    93d0:	e12fff1e 	bx	lr

000093d4 <timer_start>:
    93d4:	e3a03a0b 	mov	r3, #45056	; 0xb000
    93d8:	e3433f00 	movt	r3, #16128	; 0x3f00
    93dc:	e5830400 	str	r0, [r3, #1024]	; 0x400
    93e0:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    93e4:	e3822002 	orr	r2, r2, #2
    93e8:	e5832408 	str	r2, [r3, #1032]	; 0x408
    93ec:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    93f0:	e3c2200c 	bic	r2, r2, #12
    93f4:	e5832408 	str	r2, [r3, #1032]	; 0x408
    93f8:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    93fc:	e3822020 	orr	r2, r2, #32
    9400:	e5832408 	str	r2, [r3, #1032]	; 0x408
    9404:	e5932218 	ldr	r2, [r3, #536]	; 0x218
    9408:	e3822001 	orr	r2, r2, #1
    940c:	e5832218 	str	r2, [r3, #536]	; 0x218
    9410:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    9414:	e3822080 	orr	r2, r2, #128	; 0x80
    9418:	e5832408 	str	r2, [r3, #1032]	; 0x408
    941c:	e12fff1e 	bx	lr

00009420 <timer_stop>:
    9420:	e3a03a0b 	mov	r3, #45056	; 0xb000
    9424:	e3433f00 	movt	r3, #16128	; 0x3f00
    9428:	e5932224 	ldr	r2, [r3, #548]	; 0x224
    942c:	e3822001 	orr	r2, r2, #1
    9430:	e5832224 	str	r2, [r3, #548]	; 0x224
    9434:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    9438:	e3c22020 	bic	r2, r2, #32
    943c:	e5832408 	str	r2, [r3, #1032]	; 0x408
    9440:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    9444:	e3c22080 	bic	r2, r2, #128	; 0x80
    9448:	e5832408 	str	r2, [r3, #1032]	; 0x408
    944c:	e12fff1e 	bx	lr

00009450 <timer_is_pending>:
    9450:	e3a03a0b 	mov	r3, #45056	; 0xb000
    9454:	e3433f00 	movt	r3, #16128	; 0x3f00
    9458:	e5930200 	ldr	r0, [r3, #512]	; 0x200
    945c:	e2000001 	and	r0, r0, #1
    9460:	e12fff1e 	bx	lr

00009464 <timer_clear_pending>:
    9464:	e3a03a0b 	mov	r3, #45056	; 0xb000
    9468:	e3433f00 	movt	r3, #16128	; 0x3f00
    946c:	e593240c 	ldr	r2, [r3, #1036]	; 0x40c
    9470:	e3822001 	orr	r2, r2, #1
    9474:	e583240c 	str	r2, [r3, #1036]	; 0x40c
    9478:	e12fff1e 	bx	lr

0000947c <uart_init>:
    947c:	e92d4008 	push	{r3, lr}
    9480:	e3a0000f 	mov	r0, #15
    9484:	e3a01000 	mov	r1, #0
    9488:	ebfffb40 	bl	8190 <gpio_set_pull>
    948c:	e3a0000e 	mov	r0, #14
    9490:	e3a01000 	mov	r1, #0
    9494:	ebfffb3d 	bl	8190 <gpio_set_pull>
    9498:	e3a0000f 	mov	r0, #15
    949c:	e3a01002 	mov	r1, #2
    94a0:	ebfffb03 	bl	80b4 <gpio_config>
    94a4:	e3a0000e 	mov	r0, #14
    94a8:	e3a01002 	mov	r1, #2
    94ac:	ebfffb00 	bl	80b4 <gpio_config>
    94b0:	e3a03a05 	mov	r3, #20480	; 0x5000
    94b4:	e3433f21 	movt	r3, #16161	; 0x3f21
    94b8:	e5932004 	ldr	r2, [r3, #4]
    94bc:	e3822001 	orr	r2, r2, #1
    94c0:	e5832004 	str	r2, [r3, #4]
    94c4:	e3a02000 	mov	r2, #0
    94c8:	e5832044 	str	r2, [r3, #68]	; 0x44
    94cc:	e5932048 	ldr	r2, [r3, #72]	; 0x48
    94d0:	e3822006 	orr	r2, r2, #6
    94d4:	e5832048 	str	r2, [r3, #72]	; 0x48
    94d8:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
    94dc:	e3822003 	orr	r2, r2, #3
    94e0:	e583204c 	str	r2, [r3, #76]	; 0x4c
    94e4:	e300210e 	movw	r2, #270	; 0x10e
    94e8:	e5832068 	str	r2, [r3, #104]	; 0x68
    94ec:	e8bd8008 	pop	{r3, pc}

000094f0 <uart_close>:
    94f0:	e3a03a05 	mov	r3, #20480	; 0x5000
    94f4:	e3433f21 	movt	r3, #16161	; 0x3f21
    94f8:	e5932004 	ldr	r2, [r3, #4]
    94fc:	e3c22001 	bic	r2, r2, #1
    9500:	e5832004 	str	r2, [r3, #4]
    9504:	e12fff1e 	bx	lr

00009508 <uart_put_byte>:
    9508:	e3a02a05 	mov	r2, #20480	; 0x5000
    950c:	e3432f21 	movt	r2, #16161	; 0x3f21
    9510:	e5923054 	ldr	r3, [r2, #84]	; 0x54
    9514:	e3130040 	tst	r3, #64	; 0x40
    9518:	0afffffc 	beq	9510 <uart_put_byte+0x8>
    951c:	e3a03a05 	mov	r3, #20480	; 0x5000
    9520:	e3433f21 	movt	r3, #16161	; 0x3f21
    9524:	e5830040 	str	r0, [r3, #64]	; 0x40
    9528:	e12fff1e 	bx	lr

0000952c <uart_get_byte>:
    952c:	e3a02a05 	mov	r2, #20480	; 0x5000
    9530:	e3432f21 	movt	r2, #16161	; 0x3f21
    9534:	e5923054 	ldr	r3, [r2, #84]	; 0x54
    9538:	e3130001 	tst	r3, #1
    953c:	0afffffc 	beq	9534 <uart_get_byte+0x8>
    9540:	e3a03a05 	mov	r3, #20480	; 0x5000
    9544:	e3433f21 	movt	r3, #16161	; 0x3f21
    9548:	e5930040 	ldr	r0, [r3, #64]	; 0x40
    954c:	e6ef0070 	uxtb	r0, r0
    9550:	e12fff1e 	bx	lr

00009554 <syscall_exit>:
    9554:	e92d4008 	push	{r3, lr}
    9558:	eb0003de 	bl	a4d8 <disable_interrupts>
    955c:	eafffffe 	b	955c <syscall_exit+0x8>

00009560 <syscall_write>:
    9560:	e3500001 	cmp	r0, #1
    9564:	1a00000b 	bne	9598 <syscall_write+0x38>
    9568:	e3520000 	cmp	r2, #0
    956c:	da00000b 	ble	95a0 <syscall_write+0x40>
    9570:	e92d4070 	push	{r4, r5, r6, lr}
    9574:	e1a06002 	mov	r6, r2
    9578:	e1a04001 	mov	r4, r1
    957c:	e0815002 	add	r5, r1, r2
    9580:	e4d40001 	ldrb	r0, [r4], #1
    9584:	ebffffdf 	bl	9508 <uart_put_byte>
    9588:	e1540005 	cmp	r4, r5
    958c:	1afffffb 	bne	9580 <syscall_write+0x20>
    9590:	e1a00006 	mov	r0, r6
    9594:	e8bd8070 	pop	{r4, r5, r6, pc}
    9598:	e3e00000 	mvn	r0, #0
    959c:	e12fff1e 	bx	lr
    95a0:	e1a00002 	mov	r0, r2
    95a4:	e12fff1e 	bx	lr

000095a8 <syscall_read>:
    95a8:	e3500000 	cmp	r0, #0
    95ac:	1a00002e 	bne	966c <syscall_read+0xc4>
    95b0:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    95b4:	e1a06002 	mov	r6, r2
    95b8:	e1a08001 	mov	r8, r1
    95bc:	e3a05000 	mov	r5, #0
    95c0:	e3a09008 	mov	r9, #8
    95c4:	e3a0a020 	mov	sl, #32
    95c8:	ea00001e 	b	9648 <syscall_read+0xa0>
    95cc:	e3540008 	cmp	r4, #8
    95d0:	1354007f 	cmpne	r4, #127	; 0x7f
    95d4:	1a000009 	bne	9600 <syscall_read+0x58>
    95d8:	e3550000 	cmp	r5, #0
    95dc:	da000019 	ble	9648 <syscall_read+0xa0>
    95e0:	e2455001 	sub	r5, r5, #1
    95e4:	e1a00009 	mov	r0, r9
    95e8:	ebffffc6 	bl	9508 <uart_put_byte>
    95ec:	e1a0000a 	mov	r0, sl
    95f0:	ebffffc4 	bl	9508 <uart_put_byte>
    95f4:	e1a00009 	mov	r0, r9
    95f8:	ebffffc2 	bl	9508 <uart_put_byte>
    95fc:	ea000011 	b	9648 <syscall_read+0xa0>
    9600:	e354000a 	cmp	r4, #10
    9604:	0a000004 	beq	961c <syscall_read+0x74>
    9608:	e354000d 	cmp	r4, #13
    960c:	1a000008 	bne	9634 <syscall_read+0x8c>
    9610:	ebffffc5 	bl	952c <uart_get_byte>
    9614:	e350000a 	cmp	r0, #10
    9618:	1a000005 	bne	9634 <syscall_read+0x8c>
    961c:	e2854001 	add	r4, r5, #1
    9620:	e3a0000a 	mov	r0, #10
    9624:	e7c80005 	strb	r0, [r8, r5]
    9628:	ebffffb6 	bl	9508 <uart_put_byte>
    962c:	e1a05004 	mov	r5, r4
    9630:	ea000009 	b	965c <syscall_read+0xb4>
    9634:	e2857001 	add	r7, r5, #1
    9638:	e7c84005 	strb	r4, [r8, r5]
    963c:	e1a00004 	mov	r0, r4
    9640:	ebffffb0 	bl	9508 <uart_put_byte>
    9644:	e1a05007 	mov	r5, r7
    9648:	ebffffb7 	bl	952c <uart_get_byte>
    964c:	e1a04000 	mov	r4, r0
    9650:	e3500004 	cmp	r0, #4
    9654:	11550006 	cmpne	r5, r6
    9658:	baffffdb 	blt	95cc <syscall_read+0x24>
    965c:	e3a03000 	mov	r3, #0
    9660:	e7c83005 	strb	r3, [r8, r5]
    9664:	e1a00005 	mov	r0, r5
    9668:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    966c:	e3e00000 	mvn	r0, #0
    9670:	e12fff1e 	bx	lr

00009674 <thread_create>:
    9674:	e3510000 	cmp	r1, #0
    9678:	13500000 	cmpne	r0, #0
    967c:	0a00002b 	beq	9730 <thread_create+0xbc>
    9680:	e92d4070 	push	{r4, r5, r6, lr}
    9684:	e1a05000 	mov	r5, r0
    9688:	e1a04001 	mov	r4, r1
    968c:	e3a01001 	mov	r1, #1
    9690:	e1a01211 	lsl	r1, r1, r2
    9694:	e30e0014 	movw	r0, #57364	; 0xe014
    9698:	e3400000 	movt	r0, #0
    969c:	e5900000 	ldr	r0, [r0]
    96a0:	e1110000 	tst	r1, r0
    96a4:	1a000023 	bne	9738 <thread_create+0xc4>
    96a8:	e30e0014 	movw	r0, #57364	; 0xe014
    96ac:	e3400000 	movt	r0, #0
    96b0:	e590c000 	ldr	ip, [r0]
    96b4:	e181100c 	orr	r1, r1, ip
    96b8:	e5801000 	str	r1, [r0]
    96bc:	e30ec020 	movw	ip, #57376	; 0xe020
    96c0:	e340c000 	movt	ip, #0
    96c4:	e062e182 	rsb	lr, r2, r2, lsl #3
    96c8:	e1a0e10e 	lsl	lr, lr, #2
    96cc:	e08e0002 	add	r0, lr, r2
    96d0:	e1a00100 	lsl	r0, r0, #2
    96d4:	e08c1000 	add	r1, ip, r0
    96d8:	e3a06001 	mov	r6, #1
    96dc:	e7cc6000 	strb	r6, [ip, r0]
    96e0:	e6ef0072 	uxtb	r0, r2
    96e4:	e5c10001 	strb	r0, [r1, #1]
    96e8:	e5c10002 	strb	r0, [r1, #2]
    96ec:	e5813004 	str	r3, [r1, #4]
    96f0:	e59d0010 	ldr	r0, [sp, #16]
    96f4:	e5810008 	str	r0, [r1, #8]
    96f8:	e3a00000 	mov	r0, #0
    96fc:	e581000c 	str	r0, [r1, #12]
    9700:	e5916010 	ldr	r6, [r1, #16]
    9704:	e2816018 	add	r6, r1, #24
    9708:	e5810018 	str	r0, [r1, #24]
    970c:	e581001c 	str	r0, [r1, #28]
    9710:	e5815014 	str	r5, [r1, #20]
    9714:	e581506c 	str	r5, [r1, #108]	; 0x6c
    9718:	e3a03010 	mov	r3, #16
    971c:	e5813070 	str	r3, [r1, #112]	; 0x70
    9720:	e08e2002 	add	r2, lr, r2
    9724:	e08cc102 	add	ip, ip, r2, lsl #2
    9728:	e58c4028 	str	r4, [ip, #40]	; 0x28
    972c:	e8bd8070 	pop	{r4, r5, r6, pc}
    9730:	e3e00000 	mvn	r0, #0
    9734:	e12fff1e 	bx	lr
    9738:	e3e00000 	mvn	r0, #0
    973c:	e8bd8070 	pop	{r4, r5, r6, pc}

00009740 <thread_init>:
    9740:	e92d4070 	push	{r4, r5, r6, lr}
    9744:	e24dd008 	sub	sp, sp, #8
    9748:	e1a06000 	mov	r6, r0
    974c:	e1a05001 	mov	r5, r1
    9750:	e30e3014 	movw	r3, #57364	; 0xe014
    9754:	e3403000 	movt	r3, #0
    9758:	e3a02000 	mov	r2, #0
    975c:	e5832000 	str	r2, [r3]
    9760:	e30f3028 	movw	r3, #61480	; 0xf028
    9764:	e3403000 	movt	r3, #0
    9768:	e5832000 	str	r2, [r3]
    976c:	e30e3010 	movw	r3, #57360	; 0xe010
    9770:	e3403000 	movt	r3, #0
    9774:	e3e04000 	mvn	r4, #0
    9778:	e5834000 	str	r4, [r3]
    977c:	e5931000 	ldr	r1, [r3]
    9780:	e30c0024 	movw	r0, #49188	; 0xc024
    9784:	e3400000 	movt	r0, #0
    9788:	ebfffea3 	bl	921c <printk>
    978c:	e58d4000 	str	r4, [sp]
    9790:	e1a00006 	mov	r0, r6
    9794:	e1a01005 	mov	r1, r5
    9798:	e3a0201f 	mov	r2, #31
    979c:	e1a03004 	mov	r3, r4
    97a0:	ebffffb3 	bl	9674 <thread_create>
    97a4:	e28dd008 	add	sp, sp, #8
    97a8:	e8bd8070 	pop	{r4, r5, r6, pc}

000097ac <mutex_init>:
    97ac:	e30e3018 	movw	r3, #57368	; 0xe018
    97b0:	e3403000 	movt	r3, #0
    97b4:	e5933000 	ldr	r3, [r3]
    97b8:	e353001f 	cmp	r3, #31
    97bc:	8a000011 	bhi	9808 <mutex_init+0x5c>
    97c0:	e3a02000 	mov	r2, #0
    97c4:	e5c02001 	strb	r2, [r0, #1]
    97c8:	e5801004 	str	r1, [r0, #4]
    97cc:	e30e3018 	movw	r3, #57368	; 0xe018
    97d0:	e3403000 	movt	r3, #0
    97d4:	e5931000 	ldr	r1, [r3]
    97d8:	e6ef1071 	uxtb	r1, r1
    97dc:	e5c01000 	strb	r1, [r0]
    97e0:	e580200c 	str	r2, [r0, #12]
    97e4:	e593c000 	ldr	ip, [r3]
    97e8:	e30e1fa8 	movw	r1, #61352	; 0xefa8
    97ec:	e3401000 	movt	r1, #0
    97f0:	e781010c 	str	r0, [r1, ip, lsl #2]
    97f4:	e5931000 	ldr	r1, [r3]
    97f8:	e2811001 	add	r1, r1, #1
    97fc:	e5831000 	str	r1, [r3]
    9800:	e1a00002 	mov	r0, r2
    9804:	e12fff1e 	bx	lr
    9808:	e3e00000 	mvn	r0, #0
    980c:	e12fff1e 	bx	lr

00009810 <mutex_lock>:
    9810:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    9814:	e1a08000 	mov	r8, r0
    9818:	e30e3010 	movw	r3, #57360	; 0xe010
    981c:	e3403000 	movt	r3, #0
    9820:	e5932000 	ldr	r2, [r3]
    9824:	e30e3020 	movw	r3, #57376	; 0xe020
    9828:	e3403000 	movt	r3, #0
    982c:	e0621182 	rsb	r1, r2, r2, lsl #3
    9830:	e0822101 	add	r2, r2, r1, lsl #2
    9834:	e0833102 	add	r3, r3, r2, lsl #2
    9838:	e5d3a002 	ldrb	sl, [r3, #2]
    983c:	e6efa07a 	uxtb	sl, sl
    9840:	e1a0900a 	mov	r9, sl
    9844:	e3a03000 	mov	r3, #0
    9848:	e30e6018 	movw	r6, #57368	; 0xe018
    984c:	e3406000 	movt	r6, #0
    9850:	e30e7fa8 	movw	r7, #61352	; 0xefa8
    9854:	e3407000 	movt	r7, #0
    9858:	e30e5010 	movw	r5, #57360	; 0xe010
    985c:	e3405000 	movt	r5, #0
    9860:	ea00002e 	b	9920 <mutex_lock+0x110>
    9864:	e7974103 	ldr	r4, [r7, r3, lsl #2]
    9868:	e5d42001 	ldrb	r2, [r4, #1]
    986c:	e31200ff 	tst	r2, #255	; 0xff
    9870:	0a000004 	beq	9888 <mutex_lock+0x78>
    9874:	e5941008 	ldr	r1, [r4, #8]
    9878:	e5952000 	ldr	r2, [r5]
    987c:	e1510002 	cmp	r1, r2
    9880:	02833001 	addeq	r3, r3, #1
    9884:	0a000025 	beq	9920 <mutex_lock+0x110>
    9888:	e5d42001 	ldrb	r2, [r4, #1]
    988c:	e31200ff 	tst	r2, #255	; 0xff
    9890:	0a00001c 	beq	9908 <mutex_lock+0xf8>
    9894:	e5942004 	ldr	r2, [r4, #4]
    9898:	e1590002 	cmp	r9, r2
    989c:	3a000019 	bcc	9908 <mutex_lock+0xf8>
    98a0:	eb00030c 	bl	a4d8 <disable_interrupts>
    98a4:	e5942008 	ldr	r2, [r4, #8]
    98a8:	e30e3020 	movw	r3, #57376	; 0xe020
    98ac:	e3403000 	movt	r3, #0
    98b0:	e0621182 	rsb	r1, r2, r2, lsl #3
    98b4:	e0822101 	add	r2, r2, r1, lsl #2
    98b8:	e0833102 	add	r3, r3, r2, lsl #2
    98bc:	e5d33002 	ldrb	r3, [r3, #2]
    98c0:	e6ef3073 	uxtb	r3, r3
    98c4:	e1590003 	cmp	r9, r3
    98c8:	2a000006 	bcs	98e8 <mutex_lock+0xd8>
    98cc:	e5942008 	ldr	r2, [r4, #8]
    98d0:	e30e3020 	movw	r3, #57376	; 0xe020
    98d4:	e3403000 	movt	r3, #0
    98d8:	e0621182 	rsb	r1, r2, r2, lsl #3
    98dc:	e0822101 	add	r2, r2, r1, lsl #2
    98e0:	e0833102 	add	r3, r3, r2, lsl #2
    98e4:	e5c3a002 	strb	sl, [r3, #2]
    98e8:	e5953000 	ldr	r3, [r5]
    98ec:	e594200c 	ldr	r2, [r4, #12]
    98f0:	e3a01001 	mov	r1, #1
    98f4:	e1823311 	orr	r3, r2, r1, lsl r3
    98f8:	e584300c 	str	r3, [r4, #12]
    98fc:	eb0002fa 	bl	a4ec <enable_interrupts>
    9900:	e3a03000 	mov	r3, #0
    9904:	ea000005 	b	9920 <mutex_lock+0x110>
    9908:	e5952000 	ldr	r2, [r5]
    990c:	e594100c 	ldr	r1, [r4, #12]
    9910:	e3a00001 	mov	r0, #1
    9914:	e1c12210 	bic	r2, r1, r0, lsl r2
    9918:	e584200c 	str	r2, [r4, #12]
    991c:	e0833000 	add	r3, r3, r0
    9920:	e5962000 	ldr	r2, [r6]
    9924:	e1530002 	cmp	r3, r2
    9928:	3affffcd 	bcc	9864 <mutex_lock+0x54>
    992c:	e5d82001 	ldrb	r2, [r8, #1]
    9930:	e31200ff 	tst	r2, #255	; 0xff
    9934:	1affffca 	bne	9864 <mutex_lock+0x54>
    9938:	eb0002e6 	bl	a4d8 <disable_interrupts>
    993c:	e30e3010 	movw	r3, #57360	; 0xe010
    9940:	e3403000 	movt	r3, #0
    9944:	e5933000 	ldr	r3, [r3]
    9948:	e5883008 	str	r3, [r8, #8]
    994c:	e3a03001 	mov	r3, #1
    9950:	e5c83001 	strb	r3, [r8, #1]
    9954:	eb0002e4 	bl	a4ec <enable_interrupts>
    9958:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}

0000995c <mutex_unlock>:
    995c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    9960:	e1a04000 	mov	r4, r0
    9964:	eb0002db 	bl	a4d8 <disable_interrupts>
    9968:	e3a03000 	mov	r3, #0
    996c:	e5c43001 	strb	r3, [r4, #1]
    9970:	e30e3010 	movw	r3, #57360	; 0xe010
    9974:	e3403000 	movt	r3, #0
    9978:	e5932000 	ldr	r2, [r3]
    997c:	e30e3020 	movw	r3, #57376	; 0xe020
    9980:	e3403000 	movt	r3, #0
    9984:	e0621182 	rsb	r1, r2, r2, lsl #3
    9988:	e0822101 	add	r2, r2, r1, lsl #2
    998c:	e0833102 	add	r3, r3, r2, lsl #2
    9990:	e5d30001 	ldrb	r0, [r3, #1]
    9994:	e6ef0070 	uxtb	r0, r0
    9998:	e30e3018 	movw	r3, #57368	; 0xe018
    999c:	e3403000 	movt	r3, #0
    99a0:	e5933000 	ldr	r3, [r3]
    99a4:	e3530000 	cmp	r3, #0
    99a8:	0a000023 	beq	9a3c <mutex_unlock+0xe0>
    99ac:	e59f50b8 	ldr	r5, [pc, #184]	; 9a6c <mutex_unlock+0x110>
    99b0:	e3a0e000 	mov	lr, #0
    99b4:	e30e7010 	movw	r7, #57360	; 0xe010
    99b8:	e3407000 	movt	r7, #0
    99bc:	e1a0800e 	mov	r8, lr
    99c0:	e3a0c001 	mov	ip, #1
    99c4:	e30e4020 	movw	r4, #57376	; 0xe020
    99c8:	e3404000 	movt	r4, #0
    99cc:	e30e6018 	movw	r6, #57368	; 0xe018
    99d0:	e3406000 	movt	r6, #0
    99d4:	e5b51004 	ldr	r1, [r5, #4]!
    99d8:	e5d13001 	ldrb	r3, [r1, #1]
    99dc:	e31300ff 	tst	r3, #255	; 0xff
    99e0:	0a000011 	beq	9a2c <mutex_unlock+0xd0>
    99e4:	e5912008 	ldr	r2, [r1, #8]
    99e8:	e5973000 	ldr	r3, [r7]
    99ec:	e1520003 	cmp	r2, r3
    99f0:	1a00000d 	bne	9a2c <mutex_unlock+0xd0>
    99f4:	e1a03008 	mov	r3, r8
    99f8:	e591200c 	ldr	r2, [r1, #12]
    99fc:	e012231c 	ands	r2, r2, ip, lsl r3
    9a00:	0a000006 	beq	9a20 <mutex_unlock+0xc4>
    9a04:	e0632183 	rsb	r2, r3, r3, lsl #3
    9a08:	e0832102 	add	r2, r3, r2, lsl #2
    9a0c:	e0842102 	add	r2, r4, r2, lsl #2
    9a10:	e5d22002 	ldrb	r2, [r2, #2]
    9a14:	e6ef2072 	uxtb	r2, r2
    9a18:	e1500002 	cmp	r0, r2
    9a1c:	21a00002 	movcs	r0, r2
    9a20:	e2833001 	add	r3, r3, #1
    9a24:	e3530020 	cmp	r3, #32
    9a28:	1afffff2 	bne	99f8 <mutex_unlock+0x9c>
    9a2c:	e28ee001 	add	lr, lr, #1
    9a30:	e5963000 	ldr	r3, [r6]
    9a34:	e153000e 	cmp	r3, lr
    9a38:	8affffe5 	bhi	99d4 <mutex_unlock+0x78>
    9a3c:	e30e3010 	movw	r3, #57360	; 0xe010
    9a40:	e3403000 	movt	r3, #0
    9a44:	e5932000 	ldr	r2, [r3]
    9a48:	e6ef0070 	uxtb	r0, r0
    9a4c:	e30e3020 	movw	r3, #57376	; 0xe020
    9a50:	e3403000 	movt	r3, #0
    9a54:	e0621182 	rsb	r1, r2, r2, lsl #3
    9a58:	e0822101 	add	r2, r2, r1, lsl #2
    9a5c:	e0833102 	add	r3, r3, r2, lsl #2
    9a60:	e5c30002 	strb	r0, [r3, #2]
    9a64:	eb0002a0 	bl	a4ec <enable_interrupts>
    9a68:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    9a6c:	0000efa4 	andeq	lr, r0, r4, lsr #31

00009a70 <scheduler_start>:
    9a70:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9a74:	e24dd00c 	sub	sp, sp, #12
    9a78:	e3a00011 	mov	r0, #17
    9a7c:	e3a01002 	mov	r1, #2
    9a80:	ebfff9c2 	bl	8190 <gpio_set_pull>
    9a84:	e3a0001a 	mov	r0, #26
    9a88:	e3a01002 	mov	r1, #2
    9a8c:	ebfff9bf 	bl	8190 <gpio_set_pull>
    9a90:	e3a00007 	mov	r0, #7
    9a94:	e3a01002 	mov	r1, #2
    9a98:	ebfff9bc 	bl	8190 <gpio_set_pull>
    9a9c:	e3a00011 	mov	r0, #17
    9aa0:	e3a01000 	mov	r1, #0
    9aa4:	ebfff982 	bl	80b4 <gpio_config>
    9aa8:	e3a0001a 	mov	r0, #26
    9aac:	e3a01000 	mov	r1, #0
    9ab0:	ebfff97f 	bl	80b4 <gpio_config>
    9ab4:	e3a00007 	mov	r0, #7
    9ab8:	e3a01000 	mov	r1, #0
    9abc:	ebfff97c 	bl	80b4 <gpio_config>
    9ac0:	e30e3ea0 	movw	r3, #61088	; 0xeea0
    9ac4:	e3403000 	movt	r3, #0
    9ac8:	e3a00000 	mov	r0, #0
    9acc:	e3a01000 	mov	r1, #0
    9ad0:	e3431ff0 	movt	r1, #16368	; 0x3ff0
    9ad4:	e1c300f8 	strd	r0, [r3, #8]
    9ad8:	e3040635 	movw	r0, #17973	; 0x4635
    9adc:	e34a08eb 	movt	r0, #43243	; 0xa8eb
    9ae0:	e308126a 	movw	r1, #33386	; 0x826a
    9ae4:	e3431fea 	movt	r1, #16362	; 0x3fea
    9ae8:	e1c301f0 	strd	r0, [r3, #16]
    9aec:	e30503a4 	movw	r0, #21412	; 0x53a4
    9af0:	e3430e57 	movt	r0, #15959	; 0x3e57
    9af4:	e30f13cb 	movw	r1, #62411	; 0xf3cb
    9af8:	e3431fe8 	movt	r1, #16360	; 0x3fe8
    9afc:	e1c301f8 	strd	r0, [r3, #24]
    9b00:	e30a0dd6 	movw	r0, #44502	; 0xadd6
    9b04:	e349039e 	movt	r0, #37790	; 0x939e
    9b08:	e30317de 	movw	r1, #14302	; 0x37de
    9b0c:	e3431fe8 	movt	r1, #16360	; 0x3fe8
    9b10:	e1c302f0 	strd	r0, [r3, #32]
    9b14:	e30e05b4 	movw	r0, #58804	; 0xe5b4
    9b18:	e3480a5c 	movt	r0, #35420	; 0x8a5c
    9b1c:	e30c1aab 	movw	r1, #51883	; 0xcaab
    9b20:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    9b24:	e1c302f8 	strd	r0, [r3, #40]	; 0x28
    9b28:	e3090f17 	movw	r0, #40727	; 0x9f17
    9b2c:	e3460002 	movt	r0, #24578	; 0x6002
    9b30:	e308133c 	movw	r1, #33596	; 0x833c
    9b34:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    9b38:	e1c303f0 	strd	r0, [r3, #48]	; 0x30
    9b3c:	e30c04c6 	movw	r0, #50374	; 0xc4c6
    9b40:	e34e03e6 	movt	r0, #58342	; 0xe3e6
    9b44:	e30510da 	movw	r1, #20698	; 0x50da
    9b48:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    9b4c:	e1c303f8 	strd	r0, [r3, #56]	; 0x38
    9b50:	e30e0fb3 	movw	r0, #61363	; 0xefb3
    9b54:	e34e008a 	movt	r0, #57482	; 0xe08a
    9b58:	e3021b7f 	movw	r1, #11135	; 0x2b7f
    9b5c:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    9b60:	e1c304f0 	strd	r0, [r3, #64]	; 0x40
    9b64:	e3020e1f 	movw	r0, #11807	; 0x2e1f
    9b68:	e34e0e39 	movt	r0, #60985	; 0xee39
    9b6c:	e3001e94 	movw	r1, #3732	; 0xe94
    9b70:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    9b74:	e1c304f8 	strd	r0, [r3, #72]	; 0x48
    9b78:	e3070564 	movw	r0, #30052	; 0x7564
    9b7c:	e34e07ab 	movt	r0, #59307	; 0xe7ab
    9b80:	e30f17a4 	movw	r1, #63396	; 0xf7a4
    9b84:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9b88:	e1c305f0 	strd	r0, [r3, #80]	; 0x50
    9b8c:	e3080adb 	movw	r0, #35547	; 0x8adb
    9b90:	e34605fd 	movt	r0, #26109	; 0x65fd
    9b94:	e30e14f7 	movw	r1, #58615	; 0xe4f7
    9b98:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9b9c:	e1c305f8 	strd	r0, [r3, #88]	; 0x58
    9ba0:	e30f0213 	movw	r0, #61971	; 0xf213
    9ba4:	e34c0f41 	movt	r0, #53057	; 0xcf41
    9ba8:	e30d1566 	movw	r1, #54630	; 0xd566
    9bac:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9bb0:	e1c306f0 	strd	r0, [r3, #96]	; 0x60
    9bb4:	e30603f1 	movw	r0, #25585	; 0x63f1
    9bb8:	e3450dcc 	movt	r0, #24012	; 0x5dcc
    9bbc:	e30c184b 	movw	r1, #51275	; 0xc84b
    9bc0:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9bc4:	e1c306f8 	strd	r0, [r3, #104]	; 0x68
    9bc8:	e30a0b22 	movw	r0, #43810	; 0xab22
    9bcc:	e3430d5b 	movt	r0, #15707	; 0x3d5b
    9bd0:	e30b1d27 	movw	r1, #48423	; 0xbd27
    9bd4:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9bd8:	e1c307f0 	strd	r0, [r3, #112]	; 0x70
    9bdc:	e309024f 	movw	r0, #37455	; 0x924f
    9be0:	e34909ae 	movt	r0, #39342	; 0x99ae
    9be4:	e30b137c 	movw	r1, #45948	; 0xb37c
    9be8:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9bec:	e1c307f8 	strd	r0, [r3, #120]	; 0x78
    9bf0:	e3070ed0 	movw	r0, #32464	; 0x7ed0
    9bf4:	e34808a4 	movt	r0, #34980	; 0x88a4
    9bf8:	e30a1b0c 	movw	r1, #43788	; 0xab0c
    9bfc:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9c00:	e1c308f0 	strd	r0, [r3, #128]	; 0x80
    9c04:	e30d05fa 	movw	r0, #54778	; 0xd5fa
    9c08:	e342001c 	movt	r0, #8220	; 0x201c
    9c0c:	e30a1398 	movw	r1, #41880	; 0xa398
    9c10:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9c14:	e1c308f8 	strd	r0, [r3, #136]	; 0x88
    9c18:	e3080605 	movw	r0, #34309	; 0x8605
    9c1c:	e3460eac 	movt	r0, #28332	; 0x6eac
    9c20:	e3091cf5 	movw	r1, #40181	; 0x9cf5
    9c24:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9c28:	e1c309f0 	strd	r0, [r3, #144]	; 0x90
    9c2c:	e3a00e61 	mov	r0, #1552	; 0x610
    9c30:	e3470b9e 	movt	r0, #31646	; 0x7b9e
    9c34:	e309170f 	movw	r1, #38671	; 0x970f
    9c38:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9c3c:	e1c309f8 	strd	r0, [r3, #152]	; 0x98
    9c40:	e3040452 	movw	r0, #17490	; 0x4452
    9c44:	e3450586 	movt	r0, #21894	; 0x5586
    9c48:	e30911bc 	movw	r1, #37308	; 0x91bc
    9c4c:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9c50:	e1c30af0 	strd	r0, [r3, #160]	; 0xa0
    9c54:	e30400cc 	movw	r0, #16588	; 0x40cc
    9c58:	e34f0c65 	movt	r0, #64613	; 0xfc65
    9c5c:	e3081cfb 	movw	r1, #36091	; 0x8cfb
    9c60:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9c64:	e1c30af8 	strd	r0, [r3, #168]	; 0xa8
    9c68:	e30e09b8 	movw	r0, #59832	; 0xe9b8
    9c6c:	e3470ecf 	movt	r0, #32463	; 0x7ecf
    9c70:	e30818a4 	movw	r1, #34980	; 0x88a4
    9c74:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9c78:	e1c30bf0 	strd	r0, [r3, #176]	; 0xb0
    9c7c:	e30b0631 	movw	r0, #46641	; 0xb631
    9c80:	e34e0410 	movt	r0, #58384	; 0xe410
    9c84:	e30814a0 	movw	r1, #33952	; 0x84a0
    9c88:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9c8c:	e1c30bf8 	strd	r0, [r3, #184]	; 0xb8
    9c90:	e3020f1b 	movw	r0, #12059	; 0x2f1b
    9c94:	e34204dd 	movt	r0, #9437	; 0x24dd
    9c98:	e3081106 	movw	r1, #33030	; 0x8106
    9c9c:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9ca0:	e1c30cf0 	strd	r0, [r3, #192]	; 0xc0
    9ca4:	e30402af 	movw	r0, #17071	; 0x42af
    9ca8:	e3440fca 	movt	r0, #20426	; 0x4fca
    9cac:	e3071daa 	movw	r1, #32170	; 0x7daa
    9cb0:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9cb4:	e1c30cf8 	strd	r0, [r3, #200]	; 0xc8
    9cb8:	e30f00ed 	movw	r0, #61677	; 0xf0ed
    9cbc:	e34604d7 	movt	r0, #25815	; 0x64d7
    9cc0:	e3071a8d 	movw	r1, #31373	; 0x7a8d
    9cc4:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9cc8:	e1c30df0 	strd	r0, [r3, #208]	; 0xd0
    9ccc:	e30c02b9 	movw	r0, #49849	; 0xc2b9
    9cd0:	e3450cbb 	movt	r0, #23739	; 0x5cbb
    9cd4:	e30717c4 	movw	r1, #30660	; 0x77c4
    9cd8:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9cdc:	e1c30df8 	strd	r0, [r3, #216]	; 0xd8
    9ce0:	e3010d69 	movw	r0, #7529	; 0x1d69
    9ce4:	e3440d55 	movt	r0, #19797	; 0x4d55
    9ce8:	e3071510 	movw	r1, #29968	; 0x7510
    9cec:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9cf0:	e1c30ef0 	strd	r0, [r3, #224]	; 0xe0
    9cf4:	e30102c2 	movw	r0, #4802	; 0x12c2
    9cf8:	e342080f 	movt	r0, #10255	; 0x280f
    9cfc:	e307129b 	movw	r1, #29339	; 0x729b
    9d00:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9d04:	e1c30ef8 	strd	r0, [r3, #232]	; 0xe8
    9d08:	e30109e3 	movw	r0, #6627	; 0x19e3
    9d0c:	e34f0434 	movt	r0, #62516	; 0xf434
    9d10:	e307104f 	movw	r1, #28751	; 0x704f
    9d14:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9d18:	e1c30ff0 	strd	r0, [r3, #240]	; 0xf0
    9d1c:	e30302ca 	movw	r0, #13002	; 0x32ca
    9d20:	e34b01c4 	movt	r0, #45508	; 0xb1c4
    9d24:	e3061e2e 	movw	r1, #28206	; 0x6e2e
    9d28:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9d2c:	e1c30ff8 	strd	r0, [r3, #248]	; 0xf8
    9d30:	e2833c01 	add	r3, r3, #256	; 0x100
    9d34:	e30d0495 	movw	r0, #54421	; 0xd495
    9d38:	e3460809 	movt	r0, #26633	; 0x6809
    9d3c:	e3061c22 	movw	r1, #27682	; 0x6c22
    9d40:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9d44:	e1c300f0 	strd	r0, [r3]
    9d48:	e3a06000 	mov	r6, #0
    9d4c:	e3a07000 	mov	r7, #0
    9d50:	e3a05000 	mov	r5, #0
    9d54:	e1a04005 	mov	r4, r5
    9d58:	e30e8014 	movw	r8, #57364	; 0xe014
    9d5c:	e3408000 	movt	r8, #0
    9d60:	e3a09001 	mov	r9, #1
    9d64:	e30eb020 	movw	fp, #57376	; 0xe020
    9d68:	e340b000 	movt	fp, #0
    9d6c:	e5983000 	ldr	r3, [r8]
    9d70:	e0133419 	ands	r3, r3, r9, lsl r4
    9d74:	0a000014 	beq	9dcc <scheduler_start+0x35c>
    9d78:	e2855001 	add	r5, r5, #1
    9d7c:	e0653185 	rsb	r3, r5, r5, lsl #3
    9d80:	e0853103 	add	r3, r5, r3, lsl #2
    9d84:	e08b3103 	add	r3, fp, r3, lsl #2
    9d88:	e5930004 	ldr	r0, [r3, #4]
    9d8c:	e593a008 	ldr	sl, [r3, #8]
    9d90:	eb000311 	bl	a9dc <__aeabi_ui2d>
    9d94:	e1cd00f0 	strd	r0, [sp]
    9d98:	e1a0000a 	mov	r0, sl
    9d9c:	eb00030e 	bl	a9dc <__aeabi_ui2d>
    9da0:	e1a02000 	mov	r2, r0
    9da4:	e1a03001 	mov	r3, r1
    9da8:	e1cd00d0 	ldrd	r0, [sp]
    9dac:	eb0003ee 	bl	ad6c <__aeabi_ddiv>
    9db0:	e1a02000 	mov	r2, r0
    9db4:	e1a03001 	mov	r3, r1
    9db8:	e1a00006 	mov	r0, r6
    9dbc:	e1a01007 	mov	r1, r7
    9dc0:	eb000241 	bl	a6cc <__adddf3>
    9dc4:	e1a06000 	mov	r6, r0
    9dc8:	e1a07001 	mov	r7, r1
    9dcc:	e2844001 	add	r4, r4, #1
    9dd0:	e354001f 	cmp	r4, #31
    9dd4:	1affffe4 	bne	9d6c <scheduler_start+0x2fc>
    9dd8:	e30e3ea0 	movw	r3, #61088	; 0xeea0
    9ddc:	e3403000 	movt	r3, #0
    9de0:	e1a05185 	lsl	r5, r5, #3
    9de4:	e1a00006 	mov	r0, r6
    9de8:	e1a01007 	mov	r1, r7
    9dec:	e18320d5 	ldrd	r2, [r3, r5]
    9df0:	eb0004ab 	bl	b0a4 <__aeabi_dcmpgt>
    9df4:	e3500000 	cmp	r0, #0
    9df8:	1a00000e 	bne	9e38 <scheduler_start+0x3c8>
    9dfc:	e30e301c 	movw	r3, #57372	; 0xe01c
    9e00:	e3403000 	movt	r3, #0
    9e04:	e3a02000 	mov	r2, #0
    9e08:	e5832000 	str	r2, [r3]
    9e0c:	e30e3020 	movw	r3, #57376	; 0xe020
    9e10:	e3403000 	movt	r3, #0
    9e14:	e5c32e0c 	strb	r2, [r3, #3596]	; 0xe0c
    9e18:	e30e3010 	movw	r3, #57360	; 0xe010
    9e1c:	e3403000 	movt	r3, #0
    9e20:	e3a0201f 	mov	r2, #31
    9e24:	e5832000 	str	r2, [r3]
    9e28:	eb0001af 	bl	a4ec <enable_interrupts>
    9e2c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    9e30:	ebfffd67 	bl	93d4 <timer_start>
    9e34:	eafffffe 	b	9e34 <scheduler_start+0x3c4>
    9e38:	e3e00000 	mvn	r0, #0
    9e3c:	e28dd00c 	add	sp, sp, #12
    9e40:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00009e44 <wait_until_next_period>:
    9e44:	e30e3010 	movw	r3, #57360	; 0xe010
    9e48:	e3403000 	movt	r3, #0
    9e4c:	e5933000 	ldr	r3, [r3]
    9e50:	e30e2020 	movw	r2, #57376	; 0xe020
    9e54:	e3402000 	movt	r2, #0
    9e58:	e0631183 	rsb	r1, r3, r3, lsl #3
    9e5c:	e0833101 	add	r3, r3, r1, lsl #2
    9e60:	e1a03103 	lsl	r3, r3, #2
    9e64:	e3a01002 	mov	r1, #2
    9e68:	e7c21003 	strb	r1, [r2, r3]
    9e6c:	e30e0010 	movw	r0, #57360	; 0xe010
    9e70:	e3400000 	movt	r0, #0
    9e74:	e1a01002 	mov	r1, r2
    9e78:	e5903000 	ldr	r3, [r0]
    9e7c:	e0632183 	rsb	r2, r3, r3, lsl #3
    9e80:	e0833102 	add	r3, r3, r2, lsl #2
    9e84:	e7d13103 	ldrb	r3, [r1, r3, lsl #2]
    9e88:	e6ef3073 	uxtb	r3, r3
    9e8c:	e3530002 	cmp	r3, #2
    9e90:	0afffff8 	beq	9e78 <wait_until_next_period+0x34>
    9e94:	e12fff1e 	bx	lr

00009e98 <get_time>:
    9e98:	e30e301c 	movw	r3, #57372	; 0xe01c
    9e9c:	e3403000 	movt	r3, #0
    9ea0:	e5930000 	ldr	r0, [r3]
    9ea4:	e12fff1e 	bx	lr

00009ea8 <get_priority>:
    9ea8:	e30e3010 	movw	r3, #57360	; 0xe010
    9eac:	e3403000 	movt	r3, #0
    9eb0:	e5932000 	ldr	r2, [r3]
    9eb4:	e30e3020 	movw	r3, #57376	; 0xe020
    9eb8:	e3403000 	movt	r3, #0
    9ebc:	e0621182 	rsb	r1, r2, r2, lsl #3
    9ec0:	e0822101 	add	r2, r2, r1, lsl #2
    9ec4:	e0833102 	add	r3, r3, r2, lsl #2
    9ec8:	e5d30002 	ldrb	r0, [r3, #2]
    9ecc:	e12fff1e 	bx	lr

00009ed0 <spin_wait>:
    9ed0:	e30e3010 	movw	r3, #57360	; 0xe010
    9ed4:	e3403000 	movt	r3, #0
    9ed8:	e5932000 	ldr	r2, [r3]
    9edc:	e30e3020 	movw	r3, #57376	; 0xe020
    9ee0:	e3403000 	movt	r3, #0
    9ee4:	e0621182 	rsb	r1, r2, r2, lsl #3
    9ee8:	e0822101 	add	r2, r2, r1, lsl #2
    9eec:	e0833102 	add	r3, r3, r2, lsl #2
    9ef0:	e583001c 	str	r0, [r3, #28]
    9ef4:	e30e0010 	movw	r0, #57360	; 0xe010
    9ef8:	e3400000 	movt	r0, #0
    9efc:	e30e1020 	movw	r1, #57376	; 0xe020
    9f00:	e3401000 	movt	r1, #0
    9f04:	e5903000 	ldr	r3, [r0]
    9f08:	e0632183 	rsb	r2, r3, r3, lsl #3
    9f0c:	e0833102 	add	r3, r3, r2, lsl #2
    9f10:	e0813103 	add	r3, r1, r3, lsl #2
    9f14:	e2833018 	add	r3, r3, #24
    9f18:	e5933004 	ldr	r3, [r3, #4]
    9f1c:	e3530000 	cmp	r3, #0
    9f20:	1afffff7 	bne	9f04 <spin_wait+0x34>
    9f24:	e12fff1e 	bx	lr

00009f28 <syscall_sbrk>:
    9f28:	e30e3008 	movw	r3, #57352	; 0xe008
    9f2c:	e3403000 	movt	r3, #0
    9f30:	e5933000 	ldr	r3, [r3]
    9f34:	e3530000 	cmp	r3, #0
    9f38:	030e3008 	movweq	r3, #57352	; 0xe008
    9f3c:	03403000 	movteq	r3, #0
    9f40:	03002000 	movweq	r2, #0
    9f44:	03402001 	movteq	r2, #1
    9f48:	05832000 	streq	r2, [r3]
    9f4c:	e30e3008 	movw	r3, #57352	; 0xe008
    9f50:	e3403000 	movt	r3, #0
    9f54:	e5933000 	ldr	r3, [r3]
    9f58:	e0830000 	add	r0, r3, r0
    9f5c:	e3002000 	movw	r2, #0
    9f60:	e3402011 	movt	r2, #17
    9f64:	e1500002 	cmp	r0, r2
    9f68:	930e2008 	movwls	r2, #57352	; 0xe008
    9f6c:	93402000 	movtls	r2, #0
    9f70:	95820000 	strls	r0, [r2]
    9f74:	91a00003 	movls	r0, r3
    9f78:	83e00000 	mvnhi	r0, #0
    9f7c:	e12fff1e 	bx	lr

00009f80 <syscall_close>:
    9f80:	e3e00000 	mvn	r0, #0
    9f84:	e12fff1e 	bx	lr

00009f88 <syscall_fstat>:
    9f88:	e3a00000 	mov	r0, #0
    9f8c:	e12fff1e 	bx	lr

00009f90 <syscall_isatty>:
    9f90:	e3a00001 	mov	r0, #1
    9f94:	e12fff1e 	bx	lr

00009f98 <syscall_lseek>:
    9f98:	e3a00000 	mov	r0, #0
    9f9c:	e12fff1e 	bx	lr

00009fa0 <delay>:
    9fa0:	e2403001 	sub	r3, r0, #1
    9fa4:	e3500000 	cmp	r0, #0
    9fa8:	012fff1e 	bxeq	lr
    9fac:	e1a00000 	nop			; (mov r0, r0)
    9fb0:	e2433001 	sub	r3, r3, #1
    9fb4:	e3730001 	cmn	r3, #1
    9fb8:	1afffffb 	bne	9fac <delay+0xc>
    9fbc:	e12fff1e 	bx	lr

00009fc0 <oled_buf_pixel_set>:
    9fc0:	e350001f 	cmp	r0, #31
    9fc4:	9351007f 	cmpls	r1, #127	; 0x7f
    9fc8:	8a00000b 	bhi	9ffc <oled_buf_pixel_set+0x3c>
    9fcc:	e260001f 	rsb	r0, r0, #31
    9fd0:	e261107f 	rsb	r1, r1, #127	; 0x7f
    9fd4:	e1a031a0 	lsr	r3, r0, #3
    9fd8:	e0811383 	add	r1, r1, r3, lsl #7
    9fdc:	e30f202c 	movw	r2, #61484	; 0xf02c
    9fe0:	e3402000 	movt	r2, #0
    9fe4:	e2003007 	and	r3, r0, #7
    9fe8:	e3a00001 	mov	r0, #1
    9fec:	e7d2c001 	ldrb	ip, [r2, r1]
    9ff0:	e18c3310 	orr	r3, ip, r0, lsl r3
    9ff4:	e7c23001 	strb	r3, [r2, r1]
    9ff8:	e12fff1e 	bx	lr
    9ffc:	e3a00000 	mov	r0, #0
    a000:	e12fff1e 	bx	lr

0000a004 <oled_buf_pixel_clr>:
    a004:	e350001f 	cmp	r0, #31
    a008:	9351007f 	cmpls	r1, #127	; 0x7f
    a00c:	8a00000b 	bhi	a040 <oled_buf_pixel_clr+0x3c>
    a010:	e260001f 	rsb	r0, r0, #31
    a014:	e261107f 	rsb	r1, r1, #127	; 0x7f
    a018:	e1a031a0 	lsr	r3, r0, #3
    a01c:	e0811383 	add	r1, r1, r3, lsl #7
    a020:	e30f202c 	movw	r2, #61484	; 0xf02c
    a024:	e3402000 	movt	r2, #0
    a028:	e2003007 	and	r3, r0, #7
    a02c:	e3a00001 	mov	r0, #1
    a030:	e7d2c001 	ldrb	ip, [r2, r1]
    a034:	e1cc3310 	bic	r3, ip, r0, lsl r3
    a038:	e7c23001 	strb	r3, [r2, r1]
    a03c:	e12fff1e 	bx	lr
    a040:	e3a00000 	mov	r0, #0
    a044:	e12fff1e 	bx	lr

0000a048 <oled_buf_clr>:
    a048:	e59f3018 	ldr	r3, [pc, #24]	; a068 <oled_buf_clr+0x20>
    a04c:	e2831c02 	add	r1, r3, #512	; 0x200
    a050:	e3a02000 	mov	r2, #0
    a054:	e5e32001 	strb	r2, [r3, #1]!
    a058:	e1530001 	cmp	r3, r1
    a05c:	1afffffc 	bne	a054 <oled_buf_clr+0xc>
    a060:	e3a00001 	mov	r0, #1
    a064:	e12fff1e 	bx	lr
    a068:	0000f02b 	andeq	pc, r0, fp, lsr #32

0000a06c <oled_write_command>:
    a06c:	e92d4010 	push	{r4, lr}
    a070:	e1a04000 	mov	r4, r0
    a074:	e3a00009 	mov	r0, #9
    a078:	ebfff833 	bl	814c <gpio_clr>
    a07c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    a080:	ebffffc6 	bl	9fa0 <delay>
    a084:	e3a00000 	mov	r0, #0
    a088:	e3a01040 	mov	r1, #64	; 0x40
    a08c:	eb0000cf 	bl	a3d0 <spi_begin>
    a090:	e1a00004 	mov	r0, r4
    a094:	eb0000e0 	bl	a41c <spi_transfer>
    a098:	eb0000d9 	bl	a404 <spi_end>
    a09c:	e8bd8010 	pop	{r4, pc}

0000a0a0 <oled_write_data>:
    a0a0:	e92d4010 	push	{r4, lr}
    a0a4:	e1a04000 	mov	r4, r0
    a0a8:	e3a00009 	mov	r0, #9
    a0ac:	ebfff815 	bl	8108 <gpio_set>
    a0b0:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    a0b4:	ebffffb9 	bl	9fa0 <delay>
    a0b8:	e3a00000 	mov	r0, #0
    a0bc:	e3a01020 	mov	r1, #32
    a0c0:	eb0000c2 	bl	a3d0 <spi_begin>
    a0c4:	e1a00004 	mov	r0, r4
    a0c8:	eb0000d3 	bl	a41c <spi_transfer>
    a0cc:	eb0000cc 	bl	a404 <spi_end>
    a0d0:	e8bd8010 	pop	{r4, pc}

0000a0d4 <oled_reset>:
    a0d4:	e92d4008 	push	{r3, lr}
    a0d8:	e3a00010 	mov	r0, #16
    a0dc:	e3a01001 	mov	r1, #1
    a0e0:	ebfff7f3 	bl	80b4 <gpio_config>
    a0e4:	e3a00010 	mov	r0, #16
    a0e8:	ebfff806 	bl	8108 <gpio_set>
    a0ec:	e30806a0 	movw	r0, #34464	; 0x86a0
    a0f0:	e3400001 	movt	r0, #1
    a0f4:	ebffffa9 	bl	9fa0 <delay>
    a0f8:	e3a00010 	mov	r0, #16
    a0fc:	ebfff812 	bl	814c <gpio_clr>
    a100:	e30c0350 	movw	r0, #50000	; 0xc350
    a104:	ebffffa5 	bl	9fa0 <delay>
    a108:	e3a00010 	mov	r0, #16
    a10c:	ebfff7fd 	bl	8108 <gpio_set>
    a110:	e8bd8008 	pop	{r3, pc}

0000a114 <oled_init>:
    a114:	e92d4008 	push	{r3, lr}
    a118:	ebffffed 	bl	a0d4 <oled_reset>
    a11c:	e3a00010 	mov	r0, #16
    a120:	e3a01001 	mov	r1, #1
    a124:	ebfff7e2 	bl	80b4 <gpio_config>
    a128:	e3a00009 	mov	r0, #9
    a12c:	e3a01001 	mov	r1, #1
    a130:	ebfff7df 	bl	80b4 <gpio_config>
    a134:	e3a00010 	mov	r0, #16
    a138:	ebfff7f2 	bl	8108 <gpio_set>
    a13c:	e3a00009 	mov	r0, #9
    a140:	ebfff801 	bl	814c <gpio_clr>
    a144:	e3020710 	movw	r0, #10000	; 0x2710
    a148:	ebffff94 	bl	9fa0 <delay>
    a14c:	e3a00000 	mov	r0, #0
    a150:	e3a01020 	mov	r1, #32
    a154:	eb000080 	bl	a35c <spi_master_init>
    a158:	e3a000ae 	mov	r0, #174	; 0xae
    a15c:	ebffffc2 	bl	a06c <oled_write_command>
    a160:	e3a000d5 	mov	r0, #213	; 0xd5
    a164:	ebffffc0 	bl	a06c <oled_write_command>
    a168:	e3a00080 	mov	r0, #128	; 0x80
    a16c:	ebffffbe 	bl	a06c <oled_write_command>
    a170:	e3a000a8 	mov	r0, #168	; 0xa8
    a174:	ebffffbc 	bl	a06c <oled_write_command>
    a178:	e3a0001f 	mov	r0, #31
    a17c:	ebffffba 	bl	a06c <oled_write_command>
    a180:	e3a000d3 	mov	r0, #211	; 0xd3
    a184:	ebffffb8 	bl	a06c <oled_write_command>
    a188:	e3a00000 	mov	r0, #0
    a18c:	ebffffb6 	bl	a06c <oled_write_command>
    a190:	e3a00040 	mov	r0, #64	; 0x40
    a194:	ebffffb4 	bl	a06c <oled_write_command>
    a198:	e3a0008d 	mov	r0, #141	; 0x8d
    a19c:	ebffffb2 	bl	a06c <oled_write_command>
    a1a0:	e3a00014 	mov	r0, #20
    a1a4:	ebffffb0 	bl	a06c <oled_write_command>
    a1a8:	e3a00020 	mov	r0, #32
    a1ac:	ebffffae 	bl	a06c <oled_write_command>
    a1b0:	e3a00000 	mov	r0, #0
    a1b4:	ebffffac 	bl	a06c <oled_write_command>
    a1b8:	e3a000a1 	mov	r0, #161	; 0xa1
    a1bc:	ebffffaa 	bl	a06c <oled_write_command>
    a1c0:	e3a000c8 	mov	r0, #200	; 0xc8
    a1c4:	ebffffa8 	bl	a06c <oled_write_command>
    a1c8:	e3a000da 	mov	r0, #218	; 0xda
    a1cc:	ebffffa6 	bl	a06c <oled_write_command>
    a1d0:	e3a00002 	mov	r0, #2
    a1d4:	ebffffa4 	bl	a06c <oled_write_command>
    a1d8:	e3a00081 	mov	r0, #129	; 0x81
    a1dc:	ebffffa2 	bl	a06c <oled_write_command>
    a1e0:	e3a0008f 	mov	r0, #143	; 0x8f
    a1e4:	ebffffa0 	bl	a06c <oled_write_command>
    a1e8:	e3a000d9 	mov	r0, #217	; 0xd9
    a1ec:	ebffff9e 	bl	a06c <oled_write_command>
    a1f0:	e3a000f1 	mov	r0, #241	; 0xf1
    a1f4:	ebffff9c 	bl	a06c <oled_write_command>
    a1f8:	e3a000db 	mov	r0, #219	; 0xdb
    a1fc:	ebffff9a 	bl	a06c <oled_write_command>
    a200:	e3a00040 	mov	r0, #64	; 0x40
    a204:	ebffff98 	bl	a06c <oled_write_command>
    a208:	e3a000a4 	mov	r0, #164	; 0xa4
    a20c:	ebffff96 	bl	a06c <oled_write_command>
    a210:	e3a000a6 	mov	r0, #166	; 0xa6
    a214:	ebffff94 	bl	a06c <oled_write_command>
    a218:	e3a000af 	mov	r0, #175	; 0xaf
    a21c:	ebffff92 	bl	a06c <oled_write_command>
    a220:	e8bd8008 	pop	{r3, pc}

0000a224 <oled_start_sequence>:
    a224:	e92d4008 	push	{r3, lr}
    a228:	e3a00021 	mov	r0, #33	; 0x21
    a22c:	ebffff8e 	bl	a06c <oled_write_command>
    a230:	e3a00000 	mov	r0, #0
    a234:	ebffff8c 	bl	a06c <oled_write_command>
    a238:	e3a0007f 	mov	r0, #127	; 0x7f
    a23c:	ebffff8a 	bl	a06c <oled_write_command>
    a240:	e3a00022 	mov	r0, #34	; 0x22
    a244:	ebffff88 	bl	a06c <oled_write_command>
    a248:	e3a00000 	mov	r0, #0
    a24c:	ebffff86 	bl	a06c <oled_write_command>
    a250:	e3a00003 	mov	r0, #3
    a254:	ebffff84 	bl	a06c <oled_write_command>
    a258:	e8bd8008 	pop	{r3, pc}

0000a25c <oled_buf_draw>:
    a25c:	e92d4038 	push	{r3, r4, r5, lr}
    a260:	ebffffef 	bl	a224 <oled_start_sequence>
    a264:	e3a00009 	mov	r0, #9
    a268:	ebfff7a6 	bl	8108 <gpio_set>
    a26c:	e3a00000 	mov	r0, #0
    a270:	e3a01020 	mov	r1, #32
    a274:	eb000055 	bl	a3d0 <spi_begin>
    a278:	e59f401c 	ldr	r4, [pc, #28]	; a29c <oled_buf_draw+0x40>
    a27c:	e2845c02 	add	r5, r4, #512	; 0x200
    a280:	e5f40001 	ldrb	r0, [r4, #1]!
    a284:	eb000064 	bl	a41c <spi_transfer>
    a288:	e1540005 	cmp	r4, r5
    a28c:	1afffffb 	bne	a280 <oled_buf_draw+0x24>
    a290:	eb00005b 	bl	a404 <spi_end>
    a294:	e3a00001 	mov	r0, #1
    a298:	e8bd8038 	pop	{r3, r4, r5, pc}
    a29c:	0000f02b 	andeq	pc, r0, fp, lsr #32

0000a2a0 <oled_scroll_test>:
    a2a0:	e92d4038 	push	{r3, r4, r5, lr}
    a2a4:	ebffffde 	bl	a224 <oled_start_sequence>
    a2a8:	e3a00009 	mov	r0, #9
    a2ac:	ebfff795 	bl	8108 <gpio_set>
    a2b0:	e3a00000 	mov	r0, #0
    a2b4:	e3a01020 	mov	r1, #32
    a2b8:	eb000044 	bl	a3d0 <spi_begin>
    a2bc:	e3a04c02 	mov	r4, #512	; 0x200
    a2c0:	e30e500c 	movw	r5, #57356	; 0xe00c
    a2c4:	e3405000 	movt	r5, #0
    a2c8:	e5950000 	ldr	r0, [r5]
    a2cc:	e2803001 	add	r3, r0, #1
    a2d0:	e5853000 	str	r3, [r5]
    a2d4:	e6ef0070 	uxtb	r0, r0
    a2d8:	eb00004f 	bl	a41c <spi_transfer>
    a2dc:	e2544001 	subs	r4, r4, #1
    a2e0:	1afffff8 	bne	a2c8 <oled_scroll_test+0x28>
    a2e4:	eb000046 	bl	a404 <spi_end>
    a2e8:	e30e300c 	movw	r3, #57356	; 0xe00c
    a2ec:	e3403000 	movt	r3, #0
    a2f0:	e5932000 	ldr	r2, [r3]
    a2f4:	e2822001 	add	r2, r2, #1
    a2f8:	e5832000 	str	r2, [r3]
    a2fc:	e8bd8038 	pop	{r3, r4, r5, pc}

0000a300 <oled_clear_screen>:
    a300:	e92d4038 	push	{r3, r4, r5, lr}
    a304:	ebffffc6 	bl	a224 <oled_start_sequence>
    a308:	e3a00009 	mov	r0, #9
    a30c:	ebfff77d 	bl	8108 <gpio_set>
    a310:	e3a00000 	mov	r0, #0
    a314:	e3a01020 	mov	r1, #32
    a318:	eb00002c 	bl	a3d0 <spi_begin>
    a31c:	e3a04c02 	mov	r4, #512	; 0x200
    a320:	e3a05000 	mov	r5, #0
    a324:	e1a00005 	mov	r0, r5
    a328:	eb00003b 	bl	a41c <spi_transfer>
    a32c:	e2544001 	subs	r4, r4, #1
    a330:	1afffffb 	bne	a324 <oled_clear_screen+0x24>
    a334:	eb000032 	bl	a404 <spi_end>
    a338:	e8bd8038 	pop	{r3, r4, r5, pc}

0000a33c <wait>:
    a33c:	e2403001 	sub	r3, r0, #1
    a340:	e3500000 	cmp	r0, #0
    a344:	012fff1e 	bxeq	lr
    a348:	e1a00000 	nop			; (mov r0, r0)
    a34c:	e2433001 	sub	r3, r3, #1
    a350:	e3730001 	cmn	r3, #1
    a354:	1afffffb 	bne	a348 <wait+0xc>
    a358:	e12fff1e 	bx	lr

0000a35c <spi_master_init>:
    a35c:	e92d4010 	push	{r4, lr}
    a360:	e1a04001 	mov	r4, r1
    a364:	e3a00007 	mov	r0, #7
    a368:	e3a01004 	mov	r1, #4
    a36c:	ebfff750 	bl	80b4 <gpio_config>
    a370:	e3a00008 	mov	r0, #8
    a374:	e3a01004 	mov	r1, #4
    a378:	ebfff74d 	bl	80b4 <gpio_config>
    a37c:	e3a0000a 	mov	r0, #10
    a380:	e3a01004 	mov	r1, #4
    a384:	ebfff74a 	bl	80b4 <gpio_config>
    a388:	e3a0000b 	mov	r0, #11
    a38c:	e3a01004 	mov	r1, #4
    a390:	ebfff747 	bl	80b4 <gpio_config>
    a394:	e3a03901 	mov	r3, #16384	; 0x4000
    a398:	e3433f20 	movt	r3, #16160	; 0x3f20
    a39c:	e3a02000 	mov	r2, #0
    a3a0:	e5832000 	str	r2, [r3]
    a3a4:	e5932000 	ldr	r2, [r3]
    a3a8:	e3822030 	orr	r2, r2, #48	; 0x30
    a3ac:	e5832000 	str	r2, [r3]
    a3b0:	e5932000 	ldr	r2, [r3]
    a3b4:	e3c2200f 	bic	r2, r2, #15
    a3b8:	e3822040 	orr	r2, r2, #64	; 0x40
    a3bc:	e5832000 	str	r2, [r3]
    a3c0:	e5834008 	str	r4, [r3, #8]
    a3c4:	e3020710 	movw	r0, #10000	; 0x2710
    a3c8:	ebffffdb 	bl	a33c <wait>
    a3cc:	e8bd8010 	pop	{r4, pc}

0000a3d0 <spi_begin>:
    a3d0:	e3a03901 	mov	r3, #16384	; 0x4000
    a3d4:	e3433f20 	movt	r3, #16160	; 0x3f20
    a3d8:	e3a02000 	mov	r2, #0
    a3dc:	e5832000 	str	r2, [r3]
    a3e0:	e5932000 	ldr	r2, [r3]
    a3e4:	e3822030 	orr	r2, r2, #48	; 0x30
    a3e8:	e5832000 	str	r2, [r3]
    a3ec:	e5932000 	ldr	r2, [r3]
    a3f0:	e3c2200f 	bic	r2, r2, #15
    a3f4:	e3822040 	orr	r2, r2, #64	; 0x40
    a3f8:	e5832000 	str	r2, [r3]
    a3fc:	e5831008 	str	r1, [r3, #8]
    a400:	e12fff1e 	bx	lr

0000a404 <spi_end>:
    a404:	e3a03901 	mov	r3, #16384	; 0x4000
    a408:	e3433f20 	movt	r3, #16160	; 0x3f20
    a40c:	e5932000 	ldr	r2, [r3]
    a410:	e3c22080 	bic	r2, r2, #128	; 0x80
    a414:	e5832000 	str	r2, [r3]
    a418:	e12fff1e 	bx	lr

0000a41c <spi_transfer>:
    a41c:	e92d4070 	push	{r4, r5, r6, lr}
    a420:	e1a06000 	mov	r6, r0
    a424:	e3a03901 	mov	r3, #16384	; 0x4000
    a428:	e3433f20 	movt	r3, #16160	; 0x3f20
    a42c:	e5932000 	ldr	r2, [r3]
    a430:	e38220b0 	orr	r2, r2, #176	; 0xb0
    a434:	e5832000 	str	r2, [r3]
    a438:	e5933000 	ldr	r3, [r3]
    a43c:	e3130701 	tst	r3, #262144	; 0x40000
    a440:	1a000007 	bne	a464 <spi_transfer+0x48>
    a444:	e3a05001 	mov	r5, #1
    a448:	e3a04901 	mov	r4, #16384	; 0x4000
    a44c:	e3434f20 	movt	r4, #16160	; 0x3f20
    a450:	e1a00005 	mov	r0, r5
    a454:	ebffffb8 	bl	a33c <wait>
    a458:	e5943000 	ldr	r3, [r4]
    a45c:	e3130701 	tst	r3, #262144	; 0x40000
    a460:	0afffffa 	beq	a450 <spi_transfer+0x34>
    a464:	e3a03901 	mov	r3, #16384	; 0x4000
    a468:	e3433f20 	movt	r3, #16160	; 0x3f20
    a46c:	e5836004 	str	r6, [r3, #4]
    a470:	e5933000 	ldr	r3, [r3]
    a474:	e3130801 	tst	r3, #65536	; 0x10000
    a478:	1a000007 	bne	a49c <spi_transfer+0x80>
    a47c:	e3a05001 	mov	r5, #1
    a480:	e3a04901 	mov	r4, #16384	; 0x4000
    a484:	e3434f20 	movt	r4, #16160	; 0x3f20
    a488:	e1a00005 	mov	r0, r5
    a48c:	ebffffaa 	bl	a33c <wait>
    a490:	e5943000 	ldr	r3, [r4]
    a494:	e3130801 	tst	r3, #65536	; 0x10000
    a498:	0afffffa 	beq	a488 <spi_transfer+0x6c>
    a49c:	e3a03901 	mov	r3, #16384	; 0x4000
    a4a0:	e3433f20 	movt	r3, #16160	; 0x3f20
    a4a4:	e5930004 	ldr	r0, [r3, #4]
    a4a8:	e5932000 	ldr	r2, [r3]
    a4ac:	e3c22080 	bic	r2, r2, #128	; 0x80
    a4b0:	e5832000 	str	r2, [r3]
    a4b4:	e6ef0070 	uxtb	r0, r0
    a4b8:	e8bd8070 	pop	{r4, r5, r6, pc}

0000a4bc <delay_cycles>:
    a4bc:	e2500001 	subs	r0, r0, #1
    a4c0:	1afffffd 	bne	a4bc <delay_cycles>
    a4c4:	e1a0f00e 	mov	pc, lr

0000a4c8 <read_cpsr>:
    a4c8:	e10f0000 	mrs	r0, CPSR
    a4cc:	e1a0f00e 	mov	pc, lr

0000a4d0 <write_cpsr>:
    a4d0:	e129f000 	msr	CPSR_fc, r0
    a4d4:	e1a0f00e 	mov	pc, lr

0000a4d8 <disable_interrupts>:
    a4d8:	e10f0000 	mrs	r0, CPSR
    a4dc:	e3a01d07 	mov	r1, #448	; 0x1c0
    a4e0:	e1800001 	orr	r0, r0, r1
    a4e4:	e129f000 	msr	CPSR_fc, r0
    a4e8:	e1a0f00e 	mov	pc, lr

0000a4ec <enable_interrupts>:
    a4ec:	e10f0000 	mrs	r0, CPSR
    a4f0:	e3a01d07 	mov	r1, #448	; 0x1c0
    a4f4:	e1c00001 	bic	r0, r0, r1
    a4f8:	e129f000 	msr	CPSR_fc, r0
    a4fc:	e1a0f00e 	mov	pc, lr

0000a500 <interrupt_vector_table>:
    a500:	e59ff018 	ldr	pc, [pc, #24]	; a520 <_reset_asm_handler>
    a504:	e59ff018 	ldr	pc, [pc, #24]	; a524 <_undefined_instruction_asm_handler>
    a508:	e59ff018 	ldr	pc, [pc, #24]	; a528 <_swi_asm_handler>
    a50c:	e59ff018 	ldr	pc, [pc, #24]	; a52c <_prefetch_abort_asm_handler>
    a510:	e59ff018 	ldr	pc, [pc, #24]	; a530 <_data_abort_asm_handler>
    a514:	e59ff004 	ldr	pc, [pc, #4]	; a520 <_reset_asm_handler>
    a518:	e59ff014 	ldr	pc, [pc, #20]	; a534 <_irq_asm_handler>
    a51c:	e59ff014 	ldr	pc, [pc, #20]	; a538 <_fiq_asm_handler>

0000a520 <_reset_asm_handler>:
    a520:	0000a684 	andeq	sl, r0, r4, lsl #13

0000a524 <_undefined_instruction_asm_handler>:
    a524:	0000a688 	andeq	sl, r0, r8, lsl #13

0000a528 <_swi_asm_handler>:
    a528:	0000a560 	andeq	sl, r0, r0, ror #10

0000a52c <_prefetch_abort_asm_handler>:
    a52c:	0000a68c 	andeq	sl, r0, ip, lsl #13

0000a530 <_data_abort_asm_handler>:
    a530:	0000a690 	muleq	r0, r0, r6

0000a534 <_irq_asm_handler>:
    a534:	0000a5bc 			; <UNDEFINED> instruction: 0x0000a5bc

0000a538 <_fiq_asm_handler>:
    a538:	0000a694 	muleq	r0, r4, r6

0000a53c <install_interrupt_table>:
    a53c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a540:	e59f016c 	ldr	r0, [pc, #364]	; a6b4 <enter_user_mode+0x1c>
    a544:	e3a01000 	mov	r1, #0
    a548:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    a54c:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    a550:	e8b001fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8}
    a554:	e8a101fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8}
    a558:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a55c:	e12fff1e 	bx	lr

0000a560 <swi_asm_handler>:
    a560:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    a564:	e24dd008 	sub	sp, sp, #8
    a568:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a56c:	e1a0100d 	mov	r1, sp
    a570:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    a574:	e14f2000 	mrs	r2, SPSR
    a578:	e5812038 	str	r2, [r1, #56]	; 0x38
    a57c:	e581e03c 	str	lr, [r1, #60]	; 0x3c
    a580:	e51e0004 	ldr	r0, [lr, #-4]
    a584:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    a588:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    a58c:	ebfffa77 	bl	8f70 <swi_c_handler>
    a590:	e1a0100d 	mov	r1, sp
    a594:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    a598:	e591e03c 	ldr	lr, [r1, #60]	; 0x3c
    a59c:	e5912038 	ldr	r2, [r1, #56]	; 0x38
    a5a0:	e169f002 	msr	SPSR_fc, r2
    a5a4:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    a5a8:	e28dd004 	add	sp, sp, #4
    a5ac:	e8bd5ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a5b0:	e28dd008 	add	sp, sp, #8
    a5b4:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    a5b8:	e1b0f00e 	movs	pc, lr

0000a5bc <irq_asm_handler>:
    a5bc:	e59fd0f4 	ldr	sp, [pc, #244]	; a6b8 <enter_user_mode+0x20>
    a5c0:	e94d7fff 	stmdb	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    a5c4:	e24dd03c 	sub	sp, sp, #60	; 0x3c
    a5c8:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    a5cc:	e14f0000 	mrs	r0, SPSR
    a5d0:	e1a0100d 	mov	r1, sp
    a5d4:	e1a0200e 	mov	r2, lr
    a5d8:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    a5dc:	e92d0007 	push	{r0, r1, r2}
    a5e0:	e14f0000 	mrs	r0, SPSR
    a5e4:	e24ee004 	sub	lr, lr, #4
    a5e8:	e92d4001 	push	{r0, lr}
    a5ec:	e1a0000d 	mov	r0, sp
    a5f0:	ebfffa46 	bl	8f10 <irq_c_handler>
    a5f4:	e8bd4001 	pop	{r0, lr}
    a5f8:	e169f000 	msr	SPSR_fc, r0
    a5fc:	e8bd0007 	pop	{r0, r1, r2}
    a600:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    a604:	e169f000 	msr	SPSR_fc, r0
    a608:	e1a0d001 	mov	sp, r1
    a60c:	e1a0e002 	mov	lr, r2
    a610:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    a614:	e8dd7fff 	ldm	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    a618:	e28dd03c 	add	sp, sp, #60	; 0x3c
    a61c:	e1b0f00e 	movs	pc, lr
    a620:	e59fd090 	ldr	sp, [pc, #144]	; a6b8 <enter_user_mode+0x20>
    a624:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    a628:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a62c:	e1a0000d 	mov	r0, sp
    a630:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    a634:	e14f1000 	mrs	r1, SPSR
    a638:	e9204002 	stmdb	r0!, {r1, lr}
    a63c:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    a640:	e24ee004 	sub	lr, lr, #4
    a644:	e14f1000 	mrs	r1, SPSR
    a648:	e9200002 	stmdb	r0!, {r1}
    a64c:	e92d4000 	stmfd	sp!, {lr}
    a650:	e1a0100d 	mov	r1, sp
    a654:	ebfffa2d 	bl	8f10 <irq_c_handler>
    a658:	e8bd4000 	ldmfd	sp!, {lr}
    a65c:	e8b00002 	ldm	r0!, {r1}
    a660:	e169f001 	msr	SPSR_fc, r1
    a664:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    a668:	e8b04002 	ldm	r0!, {r1, lr}
    a66c:	e169f001 	msr	SPSR_fc, r1
    a670:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    a674:	e1a0d000 	mov	sp, r0
    a678:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a67c:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    a680:	e1b0f00e 	movs	pc, lr

0000a684 <reset_asm_handler>:
    a684:	eafff65d 	b	8000 <__start>

0000a688 <undefined_instruction_asm_handler>:
    a688:	e1200070 	bkpt	0x0000

0000a68c <prefetch_abort_asm_handler>:
    a68c:	e1200070 	bkpt	0x0000

0000a690 <data_abort_asm_handler>:
    a690:	e1200070 	bkpt	0x0000

0000a694 <fiq_asm_handler>:
    a694:	e1200070 	bkpt	0x0000

0000a698 <enter_user_mode>:
    a698:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a69c:	e10f0000 	mrs	r0, CPSR
    a6a0:	e3c000ff 	bic	r0, r0, #255	; 0xff
    a6a4:	e38000d0 	orr	r0, r0, #208	; 0xd0
    a6a8:	e121f000 	msr	CPSR_c, r0
    a6ac:	e59fd008 	ldr	sp, [pc, #8]	; a6bc <enter_user_mode+0x24>
    a6b0:	ea0bd652 	b	300000 <__user_program>
    a6b4:	0000a500 	andeq	sl, r0, r0, lsl #10
    a6b8:	00131000 	andseq	r1, r3, r0
    a6bc:	00130000 	andseq	r0, r3, r0

0000a6c0 <__aeabi_drsub>:
    a6c0:	e2211102 	eor	r1, r1, #-2147483648	; 0x80000000
    a6c4:	ea000000 	b	a6cc <__adddf3>

0000a6c8 <__aeabi_dsub>:
    a6c8:	e2233102 	eor	r3, r3, #-2147483648	; 0x80000000

0000a6cc <__adddf3>:
    a6cc:	e92d4030 	push	{r4, r5, lr}
    a6d0:	e1a04081 	lsl	r4, r1, #1
    a6d4:	e1a05083 	lsl	r5, r3, #1
    a6d8:	e1340005 	teq	r4, r5
    a6dc:	01300002 	teqeq	r0, r2
    a6e0:	1194c000 	orrsne	ip, r4, r0
    a6e4:	1195c002 	orrsne	ip, r5, r2
    a6e8:	11f0cac4 	mvnsne	ip, r4, asr #21
    a6ec:	11f0cac5 	mvnsne	ip, r5, asr #21
    a6f0:	0a00008c 	beq	a928 <__adddf3+0x25c>
    a6f4:	e1a04aa4 	lsr	r4, r4, #21
    a6f8:	e0745aa5 	rsbs	r5, r4, r5, lsr #21
    a6fc:	b2655000 	rsblt	r5, r5, #0
    a700:	da000006 	ble	a720 <__adddf3+0x54>
    a704:	e0844005 	add	r4, r4, r5
    a708:	e0202002 	eor	r2, r0, r2
    a70c:	e0213003 	eor	r3, r1, r3
    a710:	e0220000 	eor	r0, r2, r0
    a714:	e0231001 	eor	r1, r3, r1
    a718:	e0202002 	eor	r2, r0, r2
    a71c:	e0213003 	eor	r3, r1, r3
    a720:	e3550036 	cmp	r5, #54	; 0x36
    a724:	88bd4030 	pophi	{r4, r5, lr}
    a728:	812fff1e 	bxhi	lr
    a72c:	e3110102 	tst	r1, #-2147483648	; 0x80000000
    a730:	e1a01601 	lsl	r1, r1, #12
    a734:	e3a0c601 	mov	ip, #1048576	; 0x100000
    a738:	e18c1621 	orr	r1, ip, r1, lsr #12
    a73c:	0a000001 	beq	a748 <__adddf3+0x7c>
    a740:	e2700000 	rsbs	r0, r0, #0
    a744:	e2e11000 	rsc	r1, r1, #0
    a748:	e3130102 	tst	r3, #-2147483648	; 0x80000000
    a74c:	e1a03603 	lsl	r3, r3, #12
    a750:	e18c3623 	orr	r3, ip, r3, lsr #12
    a754:	0a000001 	beq	a760 <__adddf3+0x94>
    a758:	e2722000 	rsbs	r2, r2, #0
    a75c:	e2e33000 	rsc	r3, r3, #0
    a760:	e1340005 	teq	r4, r5
    a764:	0a000069 	beq	a910 <__adddf3+0x244>
    a768:	e2444001 	sub	r4, r4, #1
    a76c:	e275e020 	rsbs	lr, r5, #32
    a770:	ba000005 	blt	a78c <__adddf3+0xc0>
    a774:	e1a0ce12 	lsl	ip, r2, lr
    a778:	e0900532 	adds	r0, r0, r2, lsr r5
    a77c:	e2a11000 	adc	r1, r1, #0
    a780:	e0900e13 	adds	r0, r0, r3, lsl lr
    a784:	e0b11553 	adcs	r1, r1, r3, asr r5
    a788:	ea000006 	b	a7a8 <__adddf3+0xdc>
    a78c:	e2455020 	sub	r5, r5, #32
    a790:	e28ee020 	add	lr, lr, #32
    a794:	e3520001 	cmp	r2, #1
    a798:	e1a0ce13 	lsl	ip, r3, lr
    a79c:	238cc002 	orrcs	ip, ip, #2
    a7a0:	e0900553 	adds	r0, r0, r3, asr r5
    a7a4:	e0b11fc3 	adcs	r1, r1, r3, asr #31
    a7a8:	e2015102 	and	r5, r1, #-2147483648	; 0x80000000
    a7ac:	5a000002 	bpl	a7bc <__adddf3+0xf0>
    a7b0:	e27cc000 	rsbs	ip, ip, #0
    a7b4:	e2f00000 	rscs	r0, r0, #0
    a7b8:	e2e11000 	rsc	r1, r1, #0
    a7bc:	e3510601 	cmp	r1, #1048576	; 0x100000
    a7c0:	3a00000f 	bcc	a804 <__adddf3+0x138>
    a7c4:	e3510602 	cmp	r1, #2097152	; 0x200000
    a7c8:	3a000006 	bcc	a7e8 <__adddf3+0x11c>
    a7cc:	e1b010a1 	lsrs	r1, r1, #1
    a7d0:	e1b00060 	rrxs	r0, r0
    a7d4:	e1a0c06c 	rrx	ip, ip
    a7d8:	e2844001 	add	r4, r4, #1
    a7dc:	e1a02a84 	lsl	r2, r4, #21
    a7e0:	e3720501 	cmn	r2, #4194304	; 0x400000
    a7e4:	2a00006b 	bcs	a998 <__adddf3+0x2cc>
    a7e8:	e35c0102 	cmp	ip, #-2147483648	; 0x80000000
    a7ec:	01b0c0a0 	lsrseq	ip, r0, #1
    a7f0:	e2b00000 	adcs	r0, r0, #0
    a7f4:	e0a11a04 	adc	r1, r1, r4, lsl #20
    a7f8:	e1811005 	orr	r1, r1, r5
    a7fc:	e8bd4030 	pop	{r4, r5, lr}
    a800:	e12fff1e 	bx	lr
    a804:	e1b0c08c 	lsls	ip, ip, #1
    a808:	e0b00000 	adcs	r0, r0, r0
    a80c:	e0a11001 	adc	r1, r1, r1
    a810:	e3110601 	tst	r1, #1048576	; 0x100000
    a814:	e2444001 	sub	r4, r4, #1
    a818:	1afffff2 	bne	a7e8 <__adddf3+0x11c>
    a81c:	e3310000 	teq	r1, #0
    a820:	13a03014 	movne	r3, #20
    a824:	03a03034 	moveq	r3, #52	; 0x34
    a828:	01a01000 	moveq	r1, r0
    a82c:	03a00000 	moveq	r0, #0
    a830:	e1a02001 	mov	r2, r1
    a834:	e3520801 	cmp	r2, #65536	; 0x10000
    a838:	21a02822 	lsrcs	r2, r2, #16
    a83c:	22433010 	subcs	r3, r3, #16
    a840:	e3520c01 	cmp	r2, #256	; 0x100
    a844:	21a02422 	lsrcs	r2, r2, #8
    a848:	22433008 	subcs	r3, r3, #8
    a84c:	e3520010 	cmp	r2, #16
    a850:	21a02222 	lsrcs	r2, r2, #4
    a854:	22433004 	subcs	r3, r3, #4
    a858:	e3520004 	cmp	r2, #4
    a85c:	22433002 	subcs	r3, r3, #2
    a860:	304330a2 	subcc	r3, r3, r2, lsr #1
    a864:	e04331a2 	sub	r3, r3, r2, lsr #3
    a868:	e2532020 	subs	r2, r3, #32
    a86c:	aa000007 	bge	a890 <__adddf3+0x1c4>
    a870:	e292200c 	adds	r2, r2, #12
    a874:	da000004 	ble	a88c <__adddf3+0x1c0>
    a878:	e282c014 	add	ip, r2, #20
    a87c:	e262200c 	rsb	r2, r2, #12
    a880:	e1a00c11 	lsl	r0, r1, ip
    a884:	e1a01231 	lsr	r1, r1, r2
    a888:	ea000004 	b	a8a0 <__adddf3+0x1d4>
    a88c:	e2822014 	add	r2, r2, #20
    a890:	d262c020 	rsble	ip, r2, #32
    a894:	e1a01211 	lsl	r1, r1, r2
    a898:	d1811c30 	orrle	r1, r1, r0, lsr ip
    a89c:	d1a00210 	lslle	r0, r0, r2
    a8a0:	e0544003 	subs	r4, r4, r3
    a8a4:	a0811a04 	addge	r1, r1, r4, lsl #20
    a8a8:	a1811005 	orrge	r1, r1, r5
    a8ac:	a8bd4030 	popge	{r4, r5, lr}
    a8b0:	a12fff1e 	bxge	lr
    a8b4:	e1e04004 	mvn	r4, r4
    a8b8:	e254401f 	subs	r4, r4, #31
    a8bc:	aa00000f 	bge	a900 <__adddf3+0x234>
    a8c0:	e294400c 	adds	r4, r4, #12
    a8c4:	ca000006 	bgt	a8e4 <__adddf3+0x218>
    a8c8:	e2844014 	add	r4, r4, #20
    a8cc:	e2642020 	rsb	r2, r4, #32
    a8d0:	e1a00430 	lsr	r0, r0, r4
    a8d4:	e1800211 	orr	r0, r0, r1, lsl r2
    a8d8:	e1851431 	orr	r1, r5, r1, lsr r4
    a8dc:	e8bd4030 	pop	{r4, r5, lr}
    a8e0:	e12fff1e 	bx	lr
    a8e4:	e264400c 	rsb	r4, r4, #12
    a8e8:	e2642020 	rsb	r2, r4, #32
    a8ec:	e1a00230 	lsr	r0, r0, r2
    a8f0:	e1800411 	orr	r0, r0, r1, lsl r4
    a8f4:	e1a01005 	mov	r1, r5
    a8f8:	e8bd4030 	pop	{r4, r5, lr}
    a8fc:	e12fff1e 	bx	lr
    a900:	e1a00431 	lsr	r0, r1, r4
    a904:	e1a01005 	mov	r1, r5
    a908:	e8bd4030 	pop	{r4, r5, lr}
    a90c:	e12fff1e 	bx	lr
    a910:	e3340000 	teq	r4, #0
    a914:	e2233601 	eor	r3, r3, #1048576	; 0x100000
    a918:	02211601 	eoreq	r1, r1, #1048576	; 0x100000
    a91c:	02844001 	addeq	r4, r4, #1
    a920:	12455001 	subne	r5, r5, #1
    a924:	eaffff8f 	b	a768 <__adddf3+0x9c>
    a928:	e1f0cac4 	mvns	ip, r4, asr #21
    a92c:	11f0cac5 	mvnsne	ip, r5, asr #21
    a930:	0a00001d 	beq	a9ac <__adddf3+0x2e0>
    a934:	e1340005 	teq	r4, r5
    a938:	01300002 	teqeq	r0, r2
    a93c:	0a000004 	beq	a954 <__adddf3+0x288>
    a940:	e194c000 	orrs	ip, r4, r0
    a944:	01a01003 	moveq	r1, r3
    a948:	01a00002 	moveq	r0, r2
    a94c:	e8bd4030 	pop	{r4, r5, lr}
    a950:	e12fff1e 	bx	lr
    a954:	e1310003 	teq	r1, r3
    a958:	13a01000 	movne	r1, #0
    a95c:	13a00000 	movne	r0, #0
    a960:	18bd4030 	popne	{r4, r5, lr}
    a964:	112fff1e 	bxne	lr
    a968:	e1b0caa4 	lsrs	ip, r4, #21
    a96c:	1a000004 	bne	a984 <__adddf3+0x2b8>
    a970:	e1b00080 	lsls	r0, r0, #1
    a974:	e0b11001 	adcs	r1, r1, r1
    a978:	23811102 	orrcs	r1, r1, #-2147483648	; 0x80000000
    a97c:	e8bd4030 	pop	{r4, r5, lr}
    a980:	e12fff1e 	bx	lr
    a984:	e2944501 	adds	r4, r4, #4194304	; 0x400000
    a988:	32811601 	addcc	r1, r1, #1048576	; 0x100000
    a98c:	38bd4030 	popcc	{r4, r5, lr}
    a990:	312fff1e 	bxcc	lr
    a994:	e2015102 	and	r5, r1, #-2147483648	; 0x80000000
    a998:	e385147f 	orr	r1, r5, #2130706432	; 0x7f000000
    a99c:	e381160f 	orr	r1, r1, #15728640	; 0xf00000
    a9a0:	e3a00000 	mov	r0, #0
    a9a4:	e8bd4030 	pop	{r4, r5, lr}
    a9a8:	e12fff1e 	bx	lr
    a9ac:	e1f0cac4 	mvns	ip, r4, asr #21
    a9b0:	11a01003 	movne	r1, r3
    a9b4:	11a00002 	movne	r0, r2
    a9b8:	01f0cac5 	mvnseq	ip, r5, asr #21
    a9bc:	11a03001 	movne	r3, r1
    a9c0:	11a02000 	movne	r2, r0
    a9c4:	e1904601 	orrs	r4, r0, r1, lsl #12
    a9c8:	01925603 	orrseq	r5, r2, r3, lsl #12
    a9cc:	01310003 	teqeq	r1, r3
    a9d0:	13811702 	orrne	r1, r1, #524288	; 0x80000
    a9d4:	e8bd4030 	pop	{r4, r5, lr}
    a9d8:	e12fff1e 	bx	lr

0000a9dc <__aeabi_ui2d>:
    a9dc:	e3300000 	teq	r0, #0
    a9e0:	03a01000 	moveq	r1, #0
    a9e4:	012fff1e 	bxeq	lr
    a9e8:	e92d4030 	push	{r4, r5, lr}
    a9ec:	e3a04b01 	mov	r4, #1024	; 0x400
    a9f0:	e2844032 	add	r4, r4, #50	; 0x32
    a9f4:	e3a05000 	mov	r5, #0
    a9f8:	e3a01000 	mov	r1, #0
    a9fc:	eaffff86 	b	a81c <__adddf3+0x150>

0000aa00 <__aeabi_i2d>:
    aa00:	e3300000 	teq	r0, #0
    aa04:	03a01000 	moveq	r1, #0
    aa08:	012fff1e 	bxeq	lr
    aa0c:	e92d4030 	push	{r4, r5, lr}
    aa10:	e3a04b01 	mov	r4, #1024	; 0x400
    aa14:	e2844032 	add	r4, r4, #50	; 0x32
    aa18:	e2105102 	ands	r5, r0, #-2147483648	; 0x80000000
    aa1c:	42600000 	rsbmi	r0, r0, #0
    aa20:	e3a01000 	mov	r1, #0
    aa24:	eaffff7c 	b	a81c <__adddf3+0x150>

0000aa28 <__aeabi_f2d>:
    aa28:	e1b02080 	lsls	r2, r0, #1
    aa2c:	e1a011c2 	asr	r1, r2, #3
    aa30:	e1a01061 	rrx	r1, r1
    aa34:	e1a00e02 	lsl	r0, r2, #28
    aa38:	121234ff 	andsne	r3, r2, #-16777216	; 0xff000000
    aa3c:	133304ff 	teqne	r3, #-16777216	; 0xff000000
    aa40:	1221130e 	eorne	r1, r1, #939524096	; 0x38000000
    aa44:	112fff1e 	bxne	lr
    aa48:	e3320000 	teq	r2, #0
    aa4c:	133304ff 	teqne	r3, #-16777216	; 0xff000000
    aa50:	012fff1e 	bxeq	lr
    aa54:	e92d4030 	push	{r4, r5, lr}
    aa58:	e3a04d0e 	mov	r4, #896	; 0x380
    aa5c:	e2015102 	and	r5, r1, #-2147483648	; 0x80000000
    aa60:	e3c11102 	bic	r1, r1, #-2147483648	; 0x80000000
    aa64:	eaffff6c 	b	a81c <__adddf3+0x150>

0000aa68 <__aeabi_ul2d>:
    aa68:	e1902001 	orrs	r2, r0, r1
    aa6c:	012fff1e 	bxeq	lr
    aa70:	e92d4030 	push	{r4, r5, lr}
    aa74:	e3a05000 	mov	r5, #0
    aa78:	ea000006 	b	aa98 <__aeabi_l2d+0x1c>

0000aa7c <__aeabi_l2d>:
    aa7c:	e1902001 	orrs	r2, r0, r1
    aa80:	012fff1e 	bxeq	lr
    aa84:	e92d4030 	push	{r4, r5, lr}
    aa88:	e2115102 	ands	r5, r1, #-2147483648	; 0x80000000
    aa8c:	5a000001 	bpl	aa98 <__aeabi_l2d+0x1c>
    aa90:	e2700000 	rsbs	r0, r0, #0
    aa94:	e2e11000 	rsc	r1, r1, #0
    aa98:	e3a04b01 	mov	r4, #1024	; 0x400
    aa9c:	e2844032 	add	r4, r4, #50	; 0x32
    aaa0:	e1b0cb21 	lsrs	ip, r1, #22
    aaa4:	0affff44 	beq	a7bc <__adddf3+0xf0>
    aaa8:	e3a02003 	mov	r2, #3
    aaac:	e1b0c1ac 	lsrs	ip, ip, #3
    aab0:	12822003 	addne	r2, r2, #3
    aab4:	e1b0c1ac 	lsrs	ip, ip, #3
    aab8:	12822003 	addne	r2, r2, #3
    aabc:	e08221ac 	add	r2, r2, ip, lsr #3
    aac0:	e2623020 	rsb	r3, r2, #32
    aac4:	e1a0c310 	lsl	ip, r0, r3
    aac8:	e1a00230 	lsr	r0, r0, r2
    aacc:	e1800311 	orr	r0, r0, r1, lsl r3
    aad0:	e1a01231 	lsr	r1, r1, r2
    aad4:	e0844002 	add	r4, r4, r2
    aad8:	eaffff37 	b	a7bc <__adddf3+0xf0>

0000aadc <__aeabi_dmul>:
    aadc:	e92d4070 	push	{r4, r5, r6, lr}
    aae0:	e3a0c0ff 	mov	ip, #255	; 0xff
    aae4:	e38ccc07 	orr	ip, ip, #1792	; 0x700
    aae8:	e01c4a21 	ands	r4, ip, r1, lsr #20
    aaec:	101c5a23 	andsne	r5, ip, r3, lsr #20
    aaf0:	1134000c 	teqne	r4, ip
    aaf4:	1135000c 	teqne	r5, ip
    aaf8:	0b000075 	bleq	acd4 <__aeabi_dmul+0x1f8>
    aafc:	e0844005 	add	r4, r4, r5
    ab00:	e0216003 	eor	r6, r1, r3
    ab04:	e1c11a8c 	bic	r1, r1, ip, lsl #21
    ab08:	e1c33a8c 	bic	r3, r3, ip, lsl #21
    ab0c:	e1905601 	orrs	r5, r0, r1, lsl #12
    ab10:	11925603 	orrsne	r5, r2, r3, lsl #12
    ab14:	e3811601 	orr	r1, r1, #1048576	; 0x100000
    ab18:	e3833601 	orr	r3, r3, #1048576	; 0x100000
    ab1c:	0a00001d 	beq	ab98 <__aeabi_dmul+0xbc>
    ab20:	e08ec290 	umull	ip, lr, r0, r2
    ab24:	e3a05000 	mov	r5, #0
    ab28:	e0a5e291 	umlal	lr, r5, r1, r2
    ab2c:	e2062102 	and	r2, r6, #-2147483648	; 0x80000000
    ab30:	e0a5e390 	umlal	lr, r5, r0, r3
    ab34:	e3a06000 	mov	r6, #0
    ab38:	e0a65391 	umlal	r5, r6, r1, r3
    ab3c:	e33c0000 	teq	ip, #0
    ab40:	138ee001 	orrne	lr, lr, #1
    ab44:	e24440ff 	sub	r4, r4, #255	; 0xff
    ab48:	e3560c02 	cmp	r6, #512	; 0x200
    ab4c:	e2c44c03 	sbc	r4, r4, #768	; 0x300
    ab50:	2a000002 	bcs	ab60 <__aeabi_dmul+0x84>
    ab54:	e1b0e08e 	lsls	lr, lr, #1
    ab58:	e0b55005 	adcs	r5, r5, r5
    ab5c:	e0a66006 	adc	r6, r6, r6
    ab60:	e1821586 	orr	r1, r2, r6, lsl #11
    ab64:	e1811aa5 	orr	r1, r1, r5, lsr #21
    ab68:	e1a00585 	lsl	r0, r5, #11
    ab6c:	e1800aae 	orr	r0, r0, lr, lsr #21
    ab70:	e1a0e58e 	lsl	lr, lr, #11
    ab74:	e254c0fd 	subs	ip, r4, #253	; 0xfd
    ab78:	835c0c07 	cmphi	ip, #1792	; 0x700
    ab7c:	8a000011 	bhi	abc8 <__aeabi_dmul+0xec>
    ab80:	e35e0102 	cmp	lr, #-2147483648	; 0x80000000
    ab84:	01b0e0a0 	lsrseq	lr, r0, #1
    ab88:	e2b00000 	adcs	r0, r0, #0
    ab8c:	e0a11a04 	adc	r1, r1, r4, lsl #20
    ab90:	e8bd4070 	pop	{r4, r5, r6, lr}
    ab94:	e12fff1e 	bx	lr
    ab98:	e2066102 	and	r6, r6, #-2147483648	; 0x80000000
    ab9c:	e1861001 	orr	r1, r6, r1
    aba0:	e1800002 	orr	r0, r0, r2
    aba4:	e0211003 	eor	r1, r1, r3
    aba8:	e05440ac 	subs	r4, r4, ip, lsr #1
    abac:	c074500c 	rsbsgt	r5, r4, ip
    abb0:	c1811a04 	orrgt	r1, r1, r4, lsl #20
    abb4:	c8bd4070 	popgt	{r4, r5, r6, lr}
    abb8:	c12fff1e 	bxgt	lr
    abbc:	e3811601 	orr	r1, r1, #1048576	; 0x100000
    abc0:	e3a0e000 	mov	lr, #0
    abc4:	e2544001 	subs	r4, r4, #1
    abc8:	ca00005d 	bgt	ad44 <__aeabi_dmul+0x268>
    abcc:	e3740036 	cmn	r4, #54	; 0x36
    abd0:	d3a00000 	movle	r0, #0
    abd4:	d2011102 	andle	r1, r1, #-2147483648	; 0x80000000
    abd8:	d8bd4070 	pople	{r4, r5, r6, lr}
    abdc:	d12fff1e 	bxle	lr
    abe0:	e2644000 	rsb	r4, r4, #0
    abe4:	e2544020 	subs	r4, r4, #32
    abe8:	aa00001a 	bge	ac58 <__aeabi_dmul+0x17c>
    abec:	e294400c 	adds	r4, r4, #12
    abf0:	ca00000c 	bgt	ac28 <__aeabi_dmul+0x14c>
    abf4:	e2844014 	add	r4, r4, #20
    abf8:	e2645020 	rsb	r5, r4, #32
    abfc:	e1a03510 	lsl	r3, r0, r5
    ac00:	e1a00430 	lsr	r0, r0, r4
    ac04:	e1800511 	orr	r0, r0, r1, lsl r5
    ac08:	e2012102 	and	r2, r1, #-2147483648	; 0x80000000
    ac0c:	e3c11102 	bic	r1, r1, #-2147483648	; 0x80000000
    ac10:	e0900fa3 	adds	r0, r0, r3, lsr #31
    ac14:	e0a21431 	adc	r1, r2, r1, lsr r4
    ac18:	e19ee083 	orrs	lr, lr, r3, lsl #1
    ac1c:	01c00fa3 	biceq	r0, r0, r3, lsr #31
    ac20:	e8bd4070 	pop	{r4, r5, r6, lr}
    ac24:	e12fff1e 	bx	lr
    ac28:	e264400c 	rsb	r4, r4, #12
    ac2c:	e2645020 	rsb	r5, r4, #32
    ac30:	e1a03410 	lsl	r3, r0, r4
    ac34:	e1a00530 	lsr	r0, r0, r5
    ac38:	e1800411 	orr	r0, r0, r1, lsl r4
    ac3c:	e2011102 	and	r1, r1, #-2147483648	; 0x80000000
    ac40:	e0900fa3 	adds	r0, r0, r3, lsr #31
    ac44:	e2a11000 	adc	r1, r1, #0
    ac48:	e19ee083 	orrs	lr, lr, r3, lsl #1
    ac4c:	01c00fa3 	biceq	r0, r0, r3, lsr #31
    ac50:	e8bd4070 	pop	{r4, r5, r6, lr}
    ac54:	e12fff1e 	bx	lr
    ac58:	e2645020 	rsb	r5, r4, #32
    ac5c:	e18ee510 	orr	lr, lr, r0, lsl r5
    ac60:	e1a03430 	lsr	r3, r0, r4
    ac64:	e1833511 	orr	r3, r3, r1, lsl r5
    ac68:	e1a00431 	lsr	r0, r1, r4
    ac6c:	e2011102 	and	r1, r1, #-2147483648	; 0x80000000
    ac70:	e1c00431 	bic	r0, r0, r1, lsr r4
    ac74:	e0800fa3 	add	r0, r0, r3, lsr #31
    ac78:	e19ee083 	orrs	lr, lr, r3, lsl #1
    ac7c:	01c00fa3 	biceq	r0, r0, r3, lsr #31
    ac80:	e8bd4070 	pop	{r4, r5, r6, lr}
    ac84:	e12fff1e 	bx	lr
    ac88:	e3340000 	teq	r4, #0
    ac8c:	1a000008 	bne	acb4 <__aeabi_dmul+0x1d8>
    ac90:	e2016102 	and	r6, r1, #-2147483648	; 0x80000000
    ac94:	e1b00080 	lsls	r0, r0, #1
    ac98:	e0a11001 	adc	r1, r1, r1
    ac9c:	e3110601 	tst	r1, #1048576	; 0x100000
    aca0:	02444001 	subeq	r4, r4, #1
    aca4:	0afffffa 	beq	ac94 <__aeabi_dmul+0x1b8>
    aca8:	e1811006 	orr	r1, r1, r6
    acac:	e3350000 	teq	r5, #0
    acb0:	112fff1e 	bxne	lr
    acb4:	e2036102 	and	r6, r3, #-2147483648	; 0x80000000
    acb8:	e1b02082 	lsls	r2, r2, #1
    acbc:	e0a33003 	adc	r3, r3, r3
    acc0:	e3130601 	tst	r3, #1048576	; 0x100000
    acc4:	02455001 	subeq	r5, r5, #1
    acc8:	0afffffa 	beq	acb8 <__aeabi_dmul+0x1dc>
    accc:	e1833006 	orr	r3, r3, r6
    acd0:	e12fff1e 	bx	lr
    acd4:	e134000c 	teq	r4, ip
    acd8:	e00c5a23 	and	r5, ip, r3, lsr #20
    acdc:	1135000c 	teqne	r5, ip
    ace0:	0a000007 	beq	ad04 <__aeabi_dmul+0x228>
    ace4:	e1906081 	orrs	r6, r0, r1, lsl #1
    ace8:	11926083 	orrsne	r6, r2, r3, lsl #1
    acec:	1affffe5 	bne	ac88 <__aeabi_dmul+0x1ac>
    acf0:	e0211003 	eor	r1, r1, r3
    acf4:	e2011102 	and	r1, r1, #-2147483648	; 0x80000000
    acf8:	e3a00000 	mov	r0, #0
    acfc:	e8bd4070 	pop	{r4, r5, r6, lr}
    ad00:	e12fff1e 	bx	lr
    ad04:	e1906081 	orrs	r6, r0, r1, lsl #1
    ad08:	01a00002 	moveq	r0, r2
    ad0c:	01a01003 	moveq	r1, r3
    ad10:	11926083 	orrsne	r6, r2, r3, lsl #1
    ad14:	0a000010 	beq	ad5c <__aeabi_dmul+0x280>
    ad18:	e134000c 	teq	r4, ip
    ad1c:	1a000001 	bne	ad28 <__aeabi_dmul+0x24c>
    ad20:	e1906601 	orrs	r6, r0, r1, lsl #12
    ad24:	1a00000c 	bne	ad5c <__aeabi_dmul+0x280>
    ad28:	e135000c 	teq	r5, ip
    ad2c:	1a000003 	bne	ad40 <__aeabi_dmul+0x264>
    ad30:	e1926603 	orrs	r6, r2, r3, lsl #12
    ad34:	11a00002 	movne	r0, r2
    ad38:	11a01003 	movne	r1, r3
    ad3c:	1a000006 	bne	ad5c <__aeabi_dmul+0x280>
    ad40:	e0211003 	eor	r1, r1, r3
    ad44:	e2011102 	and	r1, r1, #-2147483648	; 0x80000000
    ad48:	e381147f 	orr	r1, r1, #2130706432	; 0x7f000000
    ad4c:	e381160f 	orr	r1, r1, #15728640	; 0xf00000
    ad50:	e3a00000 	mov	r0, #0
    ad54:	e8bd4070 	pop	{r4, r5, r6, lr}
    ad58:	e12fff1e 	bx	lr
    ad5c:	e381147f 	orr	r1, r1, #2130706432	; 0x7f000000
    ad60:	e381173e 	orr	r1, r1, #16252928	; 0xf80000
    ad64:	e8bd4070 	pop	{r4, r5, r6, lr}
    ad68:	e12fff1e 	bx	lr

0000ad6c <__aeabi_ddiv>:
    ad6c:	e92d4070 	push	{r4, r5, r6, lr}
    ad70:	e3a0c0ff 	mov	ip, #255	; 0xff
    ad74:	e38ccc07 	orr	ip, ip, #1792	; 0x700
    ad78:	e01c4a21 	ands	r4, ip, r1, lsr #20
    ad7c:	101c5a23 	andsne	r5, ip, r3, lsr #20
    ad80:	1134000c 	teqne	r4, ip
    ad84:	1135000c 	teqne	r5, ip
    ad88:	0b00005e 	bleq	af08 <__aeabi_ddiv+0x19c>
    ad8c:	e0444005 	sub	r4, r4, r5
    ad90:	e021e003 	eor	lr, r1, r3
    ad94:	e1925603 	orrs	r5, r2, r3, lsl #12
    ad98:	e1a01601 	lsl	r1, r1, #12
    ad9c:	0a00004c 	beq	aed4 <__aeabi_ddiv+0x168>
    ada0:	e1a03603 	lsl	r3, r3, #12
    ada4:	e3a05201 	mov	r5, #268435456	; 0x10000000
    ada8:	e1853223 	orr	r3, r5, r3, lsr #4
    adac:	e1833c22 	orr	r3, r3, r2, lsr #24
    adb0:	e1a02402 	lsl	r2, r2, #8
    adb4:	e1855221 	orr	r5, r5, r1, lsr #4
    adb8:	e1855c20 	orr	r5, r5, r0, lsr #24
    adbc:	e1a06400 	lsl	r6, r0, #8
    adc0:	e20e1102 	and	r1, lr, #-2147483648	; 0x80000000
    adc4:	e1550003 	cmp	r5, r3
    adc8:	01560002 	cmpeq	r6, r2
    adcc:	e2a440fd 	adc	r4, r4, #253	; 0xfd
    add0:	e2844c03 	add	r4, r4, #768	; 0x300
    add4:	2a000001 	bcs	ade0 <__aeabi_ddiv+0x74>
    add8:	e1b030a3 	lsrs	r3, r3, #1
    addc:	e1a02062 	rrx	r2, r2
    ade0:	e0566002 	subs	r6, r6, r2
    ade4:	e0c55003 	sbc	r5, r5, r3
    ade8:	e1b030a3 	lsrs	r3, r3, #1
    adec:	e1a02062 	rrx	r2, r2
    adf0:	e3a00601 	mov	r0, #1048576	; 0x100000
    adf4:	e3a0c702 	mov	ip, #524288	; 0x80000
    adf8:	e056e002 	subs	lr, r6, r2
    adfc:	e0d5e003 	sbcs	lr, r5, r3
    ae00:	20466002 	subcs	r6, r6, r2
    ae04:	21a0500e 	movcs	r5, lr
    ae08:	2180000c 	orrcs	r0, r0, ip
    ae0c:	e1b030a3 	lsrs	r3, r3, #1
    ae10:	e1a02062 	rrx	r2, r2
    ae14:	e056e002 	subs	lr, r6, r2
    ae18:	e0d5e003 	sbcs	lr, r5, r3
    ae1c:	20466002 	subcs	r6, r6, r2
    ae20:	21a0500e 	movcs	r5, lr
    ae24:	218000ac 	orrcs	r0, r0, ip, lsr #1
    ae28:	e1b030a3 	lsrs	r3, r3, #1
    ae2c:	e1a02062 	rrx	r2, r2
    ae30:	e056e002 	subs	lr, r6, r2
    ae34:	e0d5e003 	sbcs	lr, r5, r3
    ae38:	20466002 	subcs	r6, r6, r2
    ae3c:	21a0500e 	movcs	r5, lr
    ae40:	2180012c 	orrcs	r0, r0, ip, lsr #2
    ae44:	e1b030a3 	lsrs	r3, r3, #1
    ae48:	e1a02062 	rrx	r2, r2
    ae4c:	e056e002 	subs	lr, r6, r2
    ae50:	e0d5e003 	sbcs	lr, r5, r3
    ae54:	20466002 	subcs	r6, r6, r2
    ae58:	21a0500e 	movcs	r5, lr
    ae5c:	218001ac 	orrcs	r0, r0, ip, lsr #3
    ae60:	e195e006 	orrs	lr, r5, r6
    ae64:	0a00000d 	beq	aea0 <__aeabi_ddiv+0x134>
    ae68:	e1a05205 	lsl	r5, r5, #4
    ae6c:	e1855e26 	orr	r5, r5, r6, lsr #28
    ae70:	e1a06206 	lsl	r6, r6, #4
    ae74:	e1a03183 	lsl	r3, r3, #3
    ae78:	e1833ea2 	orr	r3, r3, r2, lsr #29
    ae7c:	e1a02182 	lsl	r2, r2, #3
    ae80:	e1b0c22c 	lsrs	ip, ip, #4
    ae84:	1affffdb 	bne	adf8 <__aeabi_ddiv+0x8c>
    ae88:	e3110601 	tst	r1, #1048576	; 0x100000
    ae8c:	1a000006 	bne	aeac <__aeabi_ddiv+0x140>
    ae90:	e1811000 	orr	r1, r1, r0
    ae94:	e3a00000 	mov	r0, #0
    ae98:	e3a0c102 	mov	ip, #-2147483648	; 0x80000000
    ae9c:	eaffffd5 	b	adf8 <__aeabi_ddiv+0x8c>
    aea0:	e3110601 	tst	r1, #1048576	; 0x100000
    aea4:	01811000 	orreq	r1, r1, r0
    aea8:	03a00000 	moveq	r0, #0
    aeac:	e254c0fd 	subs	ip, r4, #253	; 0xfd
    aeb0:	835c0c07 	cmphi	ip, #1792	; 0x700
    aeb4:	8affff43 	bhi	abc8 <__aeabi_dmul+0xec>
    aeb8:	e055c003 	subs	ip, r5, r3
    aebc:	0056c002 	subseq	ip, r6, r2
    aec0:	01b0c0a0 	lsrseq	ip, r0, #1
    aec4:	e2b00000 	adcs	r0, r0, #0
    aec8:	e0a11a04 	adc	r1, r1, r4, lsl #20
    aecc:	e8bd4070 	pop	{r4, r5, r6, lr}
    aed0:	e12fff1e 	bx	lr
    aed4:	e20ee102 	and	lr, lr, #-2147483648	; 0x80000000
    aed8:	e18e1621 	orr	r1, lr, r1, lsr #12
    aedc:	e09440ac 	adds	r4, r4, ip, lsr #1
    aee0:	c074500c 	rsbsgt	r5, r4, ip
    aee4:	c1811a04 	orrgt	r1, r1, r4, lsl #20
    aee8:	c8bd4070 	popgt	{r4, r5, r6, lr}
    aeec:	c12fff1e 	bxgt	lr
    aef0:	e3811601 	orr	r1, r1, #1048576	; 0x100000
    aef4:	e3a0e000 	mov	lr, #0
    aef8:	e2544001 	subs	r4, r4, #1
    aefc:	eaffff31 	b	abc8 <__aeabi_dmul+0xec>
    af00:	e185e006 	orr	lr, r5, r6
    af04:	eaffff2f 	b	abc8 <__aeabi_dmul+0xec>
    af08:	e00c5a23 	and	r5, ip, r3, lsr #20
    af0c:	e134000c 	teq	r4, ip
    af10:	0135000c 	teqeq	r5, ip
    af14:	0affff90 	beq	ad5c <__aeabi_dmul+0x280>
    af18:	e134000c 	teq	r4, ip
    af1c:	1a000006 	bne	af3c <__aeabi_ddiv+0x1d0>
    af20:	e1904601 	orrs	r4, r0, r1, lsl #12
    af24:	1affff8c 	bne	ad5c <__aeabi_dmul+0x280>
    af28:	e135000c 	teq	r5, ip
    af2c:	1affff83 	bne	ad40 <__aeabi_dmul+0x264>
    af30:	e1a00002 	mov	r0, r2
    af34:	e1a01003 	mov	r1, r3
    af38:	eaffff87 	b	ad5c <__aeabi_dmul+0x280>
    af3c:	e135000c 	teq	r5, ip
    af40:	1a000004 	bne	af58 <__aeabi_ddiv+0x1ec>
    af44:	e1925603 	orrs	r5, r2, r3, lsl #12
    af48:	0affff68 	beq	acf0 <__aeabi_dmul+0x214>
    af4c:	e1a00002 	mov	r0, r2
    af50:	e1a01003 	mov	r1, r3
    af54:	eaffff80 	b	ad5c <__aeabi_dmul+0x280>
    af58:	e1906081 	orrs	r6, r0, r1, lsl #1
    af5c:	11926083 	orrsne	r6, r2, r3, lsl #1
    af60:	1affff48 	bne	ac88 <__aeabi_dmul+0x1ac>
    af64:	e1904081 	orrs	r4, r0, r1, lsl #1
    af68:	1affff74 	bne	ad40 <__aeabi_dmul+0x264>
    af6c:	e1925083 	orrs	r5, r2, r3, lsl #1
    af70:	1affff5e 	bne	acf0 <__aeabi_dmul+0x214>
    af74:	eaffff78 	b	ad5c <__aeabi_dmul+0x280>

0000af78 <__gedf2>:
    af78:	e3e0c000 	mvn	ip, #0
    af7c:	ea000002 	b	af8c <__cmpdf2+0x4>

0000af80 <__ledf2>:
    af80:	e3a0c001 	mov	ip, #1
    af84:	ea000000 	b	af8c <__cmpdf2+0x4>

0000af88 <__cmpdf2>:
    af88:	e3a0c001 	mov	ip, #1
    af8c:	e52dc004 	push	{ip}		; (str ip, [sp, #-4]!)
    af90:	e1a0c081 	lsl	ip, r1, #1
    af94:	e1f0cacc 	mvns	ip, ip, asr #21
    af98:	e1a0c083 	lsl	ip, r3, #1
    af9c:	11f0cacc 	mvnsne	ip, ip, asr #21
    afa0:	0a00000e 	beq	afe0 <__cmpdf2+0x58>
    afa4:	e28dd004 	add	sp, sp, #4
    afa8:	e190c081 	orrs	ip, r0, r1, lsl #1
    afac:	0192c083 	orrseq	ip, r2, r3, lsl #1
    afb0:	11310003 	teqne	r1, r3
    afb4:	01300002 	teqeq	r0, r2
    afb8:	03a00000 	moveq	r0, #0
    afbc:	012fff1e 	bxeq	lr
    afc0:	e3700000 	cmn	r0, #0
    afc4:	e1310003 	teq	r1, r3
    afc8:	51510003 	cmppl	r1, r3
    afcc:	01500002 	cmpeq	r0, r2
    afd0:	21a00fc3 	asrcs	r0, r3, #31
    afd4:	31e00fc3 	mvncc	r0, r3, asr #31
    afd8:	e3800001 	orr	r0, r0, #1
    afdc:	e12fff1e 	bx	lr
    afe0:	e1a0c081 	lsl	ip, r1, #1
    afe4:	e1f0cacc 	mvns	ip, ip, asr #21
    afe8:	1a000001 	bne	aff4 <__cmpdf2+0x6c>
    afec:	e190c601 	orrs	ip, r0, r1, lsl #12
    aff0:	1a000004 	bne	b008 <__cmpdf2+0x80>
    aff4:	e1a0c083 	lsl	ip, r3, #1
    aff8:	e1f0cacc 	mvns	ip, ip, asr #21
    affc:	1affffe8 	bne	afa4 <__cmpdf2+0x1c>
    b000:	e192c603 	orrs	ip, r2, r3, lsl #12
    b004:	0affffe6 	beq	afa4 <__cmpdf2+0x1c>
    b008:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    b00c:	e12fff1e 	bx	lr

0000b010 <__aeabi_cdrcmple>:
    b010:	e1a0c000 	mov	ip, r0
    b014:	e1a00002 	mov	r0, r2
    b018:	e1a0200c 	mov	r2, ip
    b01c:	e1a0c001 	mov	ip, r1
    b020:	e1a01003 	mov	r1, r3
    b024:	e1a0300c 	mov	r3, ip
    b028:	eaffffff 	b	b02c <__aeabi_cdcmpeq>

0000b02c <__aeabi_cdcmpeq>:
    b02c:	e92d4001 	push	{r0, lr}
    b030:	ebffffd4 	bl	af88 <__cmpdf2>
    b034:	e3500000 	cmp	r0, #0
    b038:	43700000 	cmnmi	r0, #0
    b03c:	e8bd4001 	pop	{r0, lr}
    b040:	e12fff1e 	bx	lr

0000b044 <__aeabi_dcmpeq>:
    b044:	e52de008 	str	lr, [sp, #-8]!
    b048:	ebfffff7 	bl	b02c <__aeabi_cdcmpeq>
    b04c:	03a00001 	moveq	r0, #1
    b050:	13a00000 	movne	r0, #0
    b054:	e49de008 	ldr	lr, [sp], #8
    b058:	e12fff1e 	bx	lr

0000b05c <__aeabi_dcmplt>:
    b05c:	e52de008 	str	lr, [sp, #-8]!
    b060:	ebfffff1 	bl	b02c <__aeabi_cdcmpeq>
    b064:	33a00001 	movcc	r0, #1
    b068:	23a00000 	movcs	r0, #0
    b06c:	e49de008 	ldr	lr, [sp], #8
    b070:	e12fff1e 	bx	lr

0000b074 <__aeabi_dcmple>:
    b074:	e52de008 	str	lr, [sp, #-8]!
    b078:	ebffffeb 	bl	b02c <__aeabi_cdcmpeq>
    b07c:	93a00001 	movls	r0, #1
    b080:	83a00000 	movhi	r0, #0
    b084:	e49de008 	ldr	lr, [sp], #8
    b088:	e12fff1e 	bx	lr

0000b08c <__aeabi_dcmpge>:
    b08c:	e52de008 	str	lr, [sp, #-8]!
    b090:	ebffffde 	bl	b010 <__aeabi_cdrcmple>
    b094:	93a00001 	movls	r0, #1
    b098:	83a00000 	movhi	r0, #0
    b09c:	e49de008 	ldr	lr, [sp], #8
    b0a0:	e12fff1e 	bx	lr

0000b0a4 <__aeabi_dcmpgt>:
    b0a4:	e52de008 	str	lr, [sp, #-8]!
    b0a8:	ebffffd8 	bl	b010 <__aeabi_cdrcmple>
    b0ac:	33a00001 	movcc	r0, #1
    b0b0:	23a00000 	movcs	r0, #0
    b0b4:	e49de008 	ldr	lr, [sp], #8
    b0b8:	e12fff1e 	bx	lr

0000b0bc <__aeabi_uldivmod>:
    b0bc:	e3530000 	cmp	r3, #0
    b0c0:	03520000 	cmpeq	r2, #0
    b0c4:	1a000004 	bne	b0dc <__aeabi_uldivmod+0x20>
    b0c8:	e3510000 	cmp	r1, #0
    b0cc:	03500000 	cmpeq	r0, #0
    b0d0:	13e01000 	mvnne	r1, #0
    b0d4:	13e00000 	mvnne	r0, #0
    b0d8:	ea000027 	b	b17c <__aeabi_idiv0>
    b0dc:	e24dd008 	sub	sp, sp, #8
    b0e0:	e92d6000 	push	{sp, lr}
    b0e4:	eb000014 	bl	b13c <__gnu_uldivmod_helper>
    b0e8:	e59de004 	ldr	lr, [sp, #4]
    b0ec:	e28dd008 	add	sp, sp, #8
    b0f0:	e8bd000c 	pop	{r2, r3}
    b0f4:	e12fff1e 	bx	lr

0000b0f8 <__gnu_ldivmod_helper>:
    b0f8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    b0fc:	e59d6020 	ldr	r6, [sp, #32]
    b100:	e1a07002 	mov	r7, r2
    b104:	e1a0a003 	mov	sl, r3
    b108:	e1a04000 	mov	r4, r0
    b10c:	e1a05001 	mov	r5, r1
    b110:	eb00001a 	bl	b180 <__divdi3>
    b114:	e1a03000 	mov	r3, r0
    b118:	e0020197 	mul	r2, r7, r1
    b11c:	e0898097 	umull	r8, r9, r7, r0
    b120:	e023239a 	mla	r3, sl, r3, r2
    b124:	e0544008 	subs	r4, r4, r8
    b128:	e0839009 	add	r9, r3, r9
    b12c:	e0c55009 	sbc	r5, r5, r9
    b130:	e8860030 	stm	r6, {r4, r5}
    b134:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    b138:	e12fff1e 	bx	lr

0000b13c <__gnu_uldivmod_helper>:
    b13c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    b140:	e59d5018 	ldr	r5, [sp, #24]
    b144:	e1a04002 	mov	r4, r2
    b148:	e1a08003 	mov	r8, r3
    b14c:	e1a06000 	mov	r6, r0
    b150:	e1a07001 	mov	r7, r1
    b154:	eb000067 	bl	b2f8 <__udivdi3>
    b158:	e0080890 	mul	r8, r0, r8
    b15c:	e0832490 	umull	r2, r3, r0, r4
    b160:	e0248491 	mla	r4, r1, r4, r8
    b164:	e0566002 	subs	r6, r6, r2
    b168:	e0843003 	add	r3, r4, r3
    b16c:	e0c77003 	sbc	r7, r7, r3
    b170:	e88500c0 	stm	r5, {r6, r7}
    b174:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    b178:	e12fff1e 	bx	lr

0000b17c <__aeabi_idiv0>:
    b17c:	e12fff1e 	bx	lr

0000b180 <__divdi3>:
    b180:	e3510000 	cmp	r1, #0
    b184:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b188:	a1a04000 	movge	r4, r0
    b18c:	a1a05001 	movge	r5, r1
    b190:	a3a0a000 	movge	sl, #0
    b194:	ba000053 	blt	b2e8 <__divdi3+0x168>
    b198:	e3530000 	cmp	r3, #0
    b19c:	a1a08002 	movge	r8, r2
    b1a0:	a1a09003 	movge	r9, r3
    b1a4:	ba00004b 	blt	b2d8 <__divdi3+0x158>
    b1a8:	e1550009 	cmp	r5, r9
    b1ac:	01540008 	cmpeq	r4, r8
    b1b0:	33a02000 	movcc	r2, #0
    b1b4:	33a03000 	movcc	r3, #0
    b1b8:	3a00003b 	bcc	b2ac <__divdi3+0x12c>
    b1bc:	e1a01009 	mov	r1, r9
    b1c0:	e1a00008 	mov	r0, r8
    b1c4:	eb000093 	bl	b418 <__clzdi2>
    b1c8:	e1a01005 	mov	r1, r5
    b1cc:	e1a0b000 	mov	fp, r0
    b1d0:	e1a00004 	mov	r0, r4
    b1d4:	eb00008f 	bl	b418 <__clzdi2>
    b1d8:	e060000b 	rsb	r0, r0, fp
    b1dc:	e240e020 	sub	lr, r0, #32
    b1e0:	e1a07019 	lsl	r7, r9, r0
    b1e4:	e1877e18 	orr	r7, r7, r8, lsl lr
    b1e8:	e260c020 	rsb	ip, r0, #32
    b1ec:	e1877c38 	orr	r7, r7, r8, lsr ip
    b1f0:	e1550007 	cmp	r5, r7
    b1f4:	e1a06018 	lsl	r6, r8, r0
    b1f8:	01540006 	cmpeq	r4, r6
    b1fc:	e1a01000 	mov	r1, r0
    b200:	33a02000 	movcc	r2, #0
    b204:	33a03000 	movcc	r3, #0
    b208:	3a000005 	bcc	b224 <__divdi3+0xa4>
    b20c:	e3a08001 	mov	r8, #1
    b210:	e0544006 	subs	r4, r4, r6
    b214:	e1a03e18 	lsl	r3, r8, lr
    b218:	e1833c38 	orr	r3, r3, r8, lsr ip
    b21c:	e0c55007 	sbc	r5, r5, r7
    b220:	e1a02018 	lsl	r2, r8, r0
    b224:	e3500000 	cmp	r0, #0
    b228:	0a00001f 	beq	b2ac <__divdi3+0x12c>
    b22c:	e1b070a7 	lsrs	r7, r7, #1
    b230:	e1a06066 	rrx	r6, r6
    b234:	ea000007 	b	b258 <__divdi3+0xd8>
    b238:	e0544006 	subs	r4, r4, r6
    b23c:	e0c55007 	sbc	r5, r5, r7
    b240:	e0944004 	adds	r4, r4, r4
    b244:	e0a55005 	adc	r5, r5, r5
    b248:	e2944001 	adds	r4, r4, #1
    b24c:	e2a55000 	adc	r5, r5, #0
    b250:	e2500001 	subs	r0, r0, #1
    b254:	0a000006 	beq	b274 <__divdi3+0xf4>
    b258:	e1570005 	cmp	r7, r5
    b25c:	01560004 	cmpeq	r6, r4
    b260:	9afffff4 	bls	b238 <__divdi3+0xb8>
    b264:	e0944004 	adds	r4, r4, r4
    b268:	e0a55005 	adc	r5, r5, r5
    b26c:	e2500001 	subs	r0, r0, #1
    b270:	1afffff8 	bne	b258 <__divdi3+0xd8>
    b274:	e261c020 	rsb	ip, r1, #32
    b278:	e1a00134 	lsr	r0, r4, r1
    b27c:	e0922004 	adds	r2, r2, r4
    b280:	e241e020 	sub	lr, r1, #32
    b284:	e1800c15 	orr	r0, r0, r5, lsl ip
    b288:	e1a04135 	lsr	r4, r5, r1
    b28c:	e1800e35 	orr	r0, r0, r5, lsr lr
    b290:	e1a07114 	lsl	r7, r4, r1
    b294:	e1877e10 	orr	r7, r7, r0, lsl lr
    b298:	e1a06110 	lsl	r6, r0, r1
    b29c:	e0a33005 	adc	r3, r3, r5
    b2a0:	e1877c30 	orr	r7, r7, r0, lsr ip
    b2a4:	e0522006 	subs	r2, r2, r6
    b2a8:	e0c33007 	sbc	r3, r3, r7
    b2ac:	e29a0000 	adds	r0, sl, #0
    b2b0:	13a00001 	movne	r0, #1
    b2b4:	e3a01000 	mov	r1, #0
    b2b8:	e2704000 	rsbs	r4, r0, #0
    b2bc:	e2e15000 	rsc	r5, r1, #0
    b2c0:	e0222004 	eor	r2, r2, r4
    b2c4:	e0233005 	eor	r3, r3, r5
    b2c8:	e0900002 	adds	r0, r0, r2
    b2cc:	e0a11003 	adc	r1, r1, r3
    b2d0:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b2d4:	e12fff1e 	bx	lr
    b2d8:	e2728000 	rsbs	r8, r2, #0
    b2dc:	e1e0a00a 	mvn	sl, sl
    b2e0:	e2e39000 	rsc	r9, r3, #0
    b2e4:	eaffffaf 	b	b1a8 <__divdi3+0x28>
    b2e8:	e2704000 	rsbs	r4, r0, #0
    b2ec:	e2e15000 	rsc	r5, r1, #0
    b2f0:	e3e0a000 	mvn	sl, #0
    b2f4:	eaffffa7 	b	b198 <__divdi3+0x18>

0000b2f8 <__udivdi3>:
    b2f8:	e1510003 	cmp	r1, r3
    b2fc:	01500002 	cmpeq	r0, r2
    b300:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    b304:	e1a04000 	mov	r4, r0
    b308:	e1a05001 	mov	r5, r1
    b30c:	e1a08002 	mov	r8, r2
    b310:	e1a09003 	mov	r9, r3
    b314:	33a00000 	movcc	r0, #0
    b318:	33a01000 	movcc	r1, #0
    b31c:	3a00003b 	bcc	b410 <__udivdi3+0x118>
    b320:	e1a01003 	mov	r1, r3
    b324:	e1a00002 	mov	r0, r2
    b328:	eb00003a 	bl	b418 <__clzdi2>
    b32c:	e1a01005 	mov	r1, r5
    b330:	e1a0a000 	mov	sl, r0
    b334:	e1a00004 	mov	r0, r4
    b338:	eb000036 	bl	b418 <__clzdi2>
    b33c:	e060300a 	rsb	r3, r0, sl
    b340:	e243e020 	sub	lr, r3, #32
    b344:	e1a07319 	lsl	r7, r9, r3
    b348:	e1877e18 	orr	r7, r7, r8, lsl lr
    b34c:	e263c020 	rsb	ip, r3, #32
    b350:	e1877c38 	orr	r7, r7, r8, lsr ip
    b354:	e1550007 	cmp	r5, r7
    b358:	e1a06318 	lsl	r6, r8, r3
    b35c:	01540006 	cmpeq	r4, r6
    b360:	e1a02003 	mov	r2, r3
    b364:	33a00000 	movcc	r0, #0
    b368:	33a01000 	movcc	r1, #0
    b36c:	3a000005 	bcc	b388 <__udivdi3+0x90>
    b370:	e3a08001 	mov	r8, #1
    b374:	e0544006 	subs	r4, r4, r6
    b378:	e1a01e18 	lsl	r1, r8, lr
    b37c:	e1811c38 	orr	r1, r1, r8, lsr ip
    b380:	e0c55007 	sbc	r5, r5, r7
    b384:	e1a00318 	lsl	r0, r8, r3
    b388:	e3530000 	cmp	r3, #0
    b38c:	0a00001f 	beq	b410 <__udivdi3+0x118>
    b390:	e1b070a7 	lsrs	r7, r7, #1
    b394:	e1a06066 	rrx	r6, r6
    b398:	ea000007 	b	b3bc <__udivdi3+0xc4>
    b39c:	e0544006 	subs	r4, r4, r6
    b3a0:	e0c55007 	sbc	r5, r5, r7
    b3a4:	e0944004 	adds	r4, r4, r4
    b3a8:	e0a55005 	adc	r5, r5, r5
    b3ac:	e2944001 	adds	r4, r4, #1
    b3b0:	e2a55000 	adc	r5, r5, #0
    b3b4:	e2533001 	subs	r3, r3, #1
    b3b8:	0a000006 	beq	b3d8 <__udivdi3+0xe0>
    b3bc:	e1570005 	cmp	r7, r5
    b3c0:	01560004 	cmpeq	r6, r4
    b3c4:	9afffff4 	bls	b39c <__udivdi3+0xa4>
    b3c8:	e0944004 	adds	r4, r4, r4
    b3cc:	e0a55005 	adc	r5, r5, r5
    b3d0:	e2533001 	subs	r3, r3, #1
    b3d4:	1afffff8 	bne	b3bc <__udivdi3+0xc4>
    b3d8:	e0948000 	adds	r8, r4, r0
    b3dc:	e0a59001 	adc	r9, r5, r1
    b3e0:	e1a03234 	lsr	r3, r4, r2
    b3e4:	e2621020 	rsb	r1, r2, #32
    b3e8:	e2420020 	sub	r0, r2, #32
    b3ec:	e1833115 	orr	r3, r3, r5, lsl r1
    b3f0:	e1a0c235 	lsr	ip, r5, r2
    b3f4:	e1833035 	orr	r3, r3, r5, lsr r0
    b3f8:	e1a0721c 	lsl	r7, ip, r2
    b3fc:	e1877013 	orr	r7, r7, r3, lsl r0
    b400:	e1a06213 	lsl	r6, r3, r2
    b404:	e1877133 	orr	r7, r7, r3, lsr r1
    b408:	e0580006 	subs	r0, r8, r6
    b40c:	e0c91007 	sbc	r1, r9, r7
    b410:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    b414:	e12fff1e 	bx	lr

0000b418 <__clzdi2>:
    b418:	e92d4010 	push	{r4, lr}
    b41c:	e3510000 	cmp	r1, #0
    b420:	1a000002 	bne	b430 <__clzdi2+0x18>
    b424:	eb000005 	bl	b440 <__clzsi2>
    b428:	e2800020 	add	r0, r0, #32
    b42c:	ea000001 	b	b438 <__clzdi2+0x20>
    b430:	e1a00001 	mov	r0, r1
    b434:	eb000001 	bl	b440 <__clzsi2>
    b438:	e8bd4010 	pop	{r4, lr}
    b43c:	e12fff1e 	bx	lr

0000b440 <__clzsi2>:
    b440:	e3a0101c 	mov	r1, #28
    b444:	e3500801 	cmp	r0, #65536	; 0x10000
    b448:	21a00820 	lsrcs	r0, r0, #16
    b44c:	22411010 	subcs	r1, r1, #16
    b450:	e3500c01 	cmp	r0, #256	; 0x100
    b454:	21a00420 	lsrcs	r0, r0, #8
    b458:	22411008 	subcs	r1, r1, #8
    b45c:	e3500010 	cmp	r0, #16
    b460:	21a00220 	lsrcs	r0, r0, #4
    b464:	22411004 	subcs	r1, r1, #4
    b468:	e28f2008 	add	r2, pc, #8
    b46c:	e7d20000 	ldrb	r0, [r2, r0]
    b470:	e0800001 	add	r0, r0, r1
    b474:	e12fff1e 	bx	lr
    b478:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    b47c:	01010101 	tsteq	r1, r1, lsl #2
	...

Disassembly of section .rodata:

0000c000 <__rodata_start>:
    c000:	0083f001 	addeq	pc, r3, r1
    c004:	00836401 	addeq	r6, r3, r1, lsl #8

0000c008 <digits>:
    c008:	33323130 	teqcc	r2, #48, 2
    c00c:	37363534 			; <UNDEFINED> instruction: 0x37363534
    c010:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    c014:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .rodata.str1.4:

0000c01c <.rodata.str1.4>:
    c01c:	00000030 	andeq	r0, r0, r0, lsr r0
    c020:	00007830 	andeq	r7, r0, r0, lsr r8
    c024:	45524854 	ldrbmi	r4, [r2, #-2132]	; 0x854
    c028:	49204441 	stmdbmi	r0!, {r0, r6, sl, lr}
    c02c:	2054494e 	subscs	r4, r4, lr, asr #18
    c030:	6425203d 	strtvs	r2, [r5], #-61	; 0x3d
    c034:	0000000a 	andeq	r0, r0, sl

Disassembly of section .ARM.exidx:

0000c038 <.ARM.exidx>:
    c038:	7ffff148 	svcvc	0x00fff148
    c03c:	00000001 	andeq	r0, r0, r1

Disassembly of section .data:

0000d000 <__data_start>:
    d000:	00000001 	andeq	r0, r0, r1

0000d004 <cnt>:
    d004:	Address 0x0000d004 is out of bounds.


Disassembly of section .bss:

0000e000 <__bss_start>:
    e000:	00000000 	andeq	r0, r0, r0

0000e004 <prevReset>:
	...

0000e005 <prevToggle>:
    e005:	00000000 	andeq	r0, r0, r0

0000e008 <heap_end>:
    e008:	00000000 	andeq	r0, r0, r0

0000e00c <cnt.3728>:
    e00c:	00000000 	andeq	r0, r0, r0

0000e010 <running_index>:
    e010:	00000000 	andeq	r0, r0, r0

0000e014 <runnable_BV>:
    e014:	00000000 	andeq	r0, r0, r0

0000e018 <mutex_count>:
    e018:	00000000 	andeq	r0, r0, r0

0000e01c <system_time>:
    e01c:	00000000 	andeq	r0, r0, r0

0000e020 <TCBs>:
	...

0000eea0 <UBTest>:
	...

0000efa8 <mutexes>:
	...

0000f028 <waiting_BV>:
    f028:	00000000 	andeq	r0, r0, r0

0000f02c <_oled_frame_buffer>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	00000175 	andeq	r0, r0, r5, ror r1
       4:	00000004 	andeq	r0, r0, r4
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	00000064 	andeq	r0, r0, r4, rrx
      10:	00005101 	andeq	r5, r0, r1, lsl #2
      14:	00010500 	andeq	r0, r1, r0, lsl #10
      18:	00805400 	addeq	r5, r0, r0, lsl #8
      1c:	00006000 	andeq	r6, r0, r0
      20:	00000000 	andeq	r0, r0, r0
      24:	08010200 	stmdaeq	r1, {r9}
      28:	000000f4 	strdeq	r0, [r0], -r4
      2c:	59050202 	stmdbpl	r5, {r1, r9}
      30:	03000001 	movweq	r0, #1
      34:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
      38:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
      3c:	00000005 	andeq	r0, r0, r5
      40:	00e30400 	rsceq	r0, r3, r0, lsl #8
      44:	16030000 	strne	r0, [r3], -r0
      48:	0000004c 	andeq	r0, r0, ip, asr #32
      4c:	eb080102 	bl	20045c <__end+0xcf45c>
      50:	02000000 	andeq	r0, r0, #0
      54:	012c0702 	teqeq	ip, r2, lsl #14
      58:	04020000 	streq	r0, [r2], #-0
      5c:	00003b07 	andeq	r3, r0, r7, lsl #22
      60:	07080200 	streq	r0, [r8, -r0, lsl #4]
      64:	00000031 	andeq	r0, r0, r1, lsr r0
      68:	00042205 	andeq	r2, r4, r5, lsl #4
      6c:	54170100 	ldrpl	r0, [r7], #-256	; 0x100
      70:	20000080 	andcs	r0, r0, r0, lsl #1
      74:	01000000 	mrseq	r0, (UNDEF: 0)
      78:	0000ac9c 	muleq	r0, ip, ip
      7c:	80640600 	rsbhi	r0, r4, r0, lsl #12
      80:	01440000 	mrseq	r0, (UNDEF: 68)
      84:	00960000 	addseq	r0, r6, r0
      88:	01070000 	mrseq	r0, (UNDEF: 7)
      8c:	07310151 			; <UNDEFINED> instruction: 0x07310151
      90:	08025001 	stmdaeq	r2, {r0, ip, lr}
      94:	7008002f 	andvc	r0, r8, pc, lsr #32
      98:	44000080 	strmi	r0, [r0], #-128	; 0x80
      9c:	07000001 	streq	r0, [r0, -r1]
      a0:	31015101 	tstcc	r1, r1, lsl #2
      a4:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
      a8:	00002308 	andeq	r2, r0, r8, lsl #6
      ac:	00013f05 	andeq	r3, r1, r5, lsl #30
      b0:	741d0100 	ldrvc	r0, [sp], #-256	; 0x100
      b4:	10000080 	andne	r0, r0, r0, lsl #1
      b8:	01000000 	mrseq	r0, (UNDEF: 0)
      bc:	0000d29c 	muleq	r0, ip, r2
      c0:	80800800 	addhi	r0, r0, r0, lsl #16
      c4:	015a0000 	cmpeq	sl, r0
      c8:	01070000 	mrseq	r0, (UNDEF: 7)
      cc:	2f080250 	svccs	0x00080250
      d0:	0e050000 	cdpeq	0, 0, cr0, cr5, cr0, {0}
      d4:	01000000 	mrseq	r0, (UNDEF: 0)
      d8:	00808422 	addeq	r8, r0, r2, lsr #8
      dc:	00001000 	andeq	r1, r0, r0
      e0:	f89c0100 			; <UNDEFINED> instruction: 0xf89c0100
      e4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
      e8:	00008090 	muleq	r0, r0, r0
      ec:	0000016b 	andeq	r0, r0, fp, ror #2
      f0:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
      f4:	00002f08 	andeq	r2, r0, r8, lsl #30
      f8:	00001c05 	andeq	r1, r0, r5, lsl #24
      fc:	94270100 	strtls	r0, [r7], #-256	; 0x100
     100:	10000080 	andne	r0, r0, r0, lsl #1
     104:	01000000 	mrseq	r0, (UNDEF: 0)
     108:	00011e9c 	muleq	r1, ip, lr
     10c:	80a00800 	adchi	r0, r0, r0, lsl #16
     110:	015a0000 	cmpeq	sl, r0
     114:	01070000 	mrseq	r0, (UNDEF: 7)
     118:	23080250 	movwcs	r0, #33360	; 0x8250
     11c:	f9050000 			; <UNDEFINED> instruction: 0xf9050000
     120:	01000000 	mrseq	r0, (UNDEF: 0)
     124:	0080a42c 	addeq	sl, r0, ip, lsr #8
     128:	00001000 	andeq	r1, r0, r0
     12c:	449c0100 	ldrmi	r0, [ip], #256	; 0x100
     130:	08000001 	stmdaeq	r0, {r0}
     134:	000080b0 	strheq	r8, [r0], -r0
     138:	0000016b 	andeq	r0, r0, fp, ror #2
     13c:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
     140:	00002308 	andeq	r2, r0, r8, lsl #6
     144:	00014d09 	andeq	r4, r1, r9, lsl #26
     148:	5a370200 	bpl	dc0950 <__user_program+0xac0950>
     14c:	0a000001 	beq	158 <__start-0x7ea8>
     150:	00000041 	andeq	r0, r0, r1, asr #32
     154:	0000410a 	andeq	r4, r0, sl, lsl #2
     158:	28090000 	stmdacs	r9, {}	; <UNPREDICTABLE>
     15c:	02000000 	andeq	r0, r0, #0
     160:	00016b3d 	andeq	r6, r1, sp, lsr fp
     164:	00410a00 	subeq	r0, r1, r0, lsl #20
     168:	0b000000 	bleq	170 <__start-0x7e90>
     16c:	00000048 	andeq	r0, r0, r8, asr #32
     170:	410a4302 	tstmi	sl, r2, lsl #6
     174:	00000000 	andeq	r0, r0, r0
     178:	0001f400 	andeq	pc, r1, r0, lsl #8
     17c:	a0000400 	andge	r0, r0, r0, lsl #8
     180:	04000000 	streq	r0, [r0], #-0
     184:	00006401 	andeq	r6, r0, r1, lsl #8
     188:	01d40100 	bicseq	r0, r4, r0, lsl #2
     18c:	018e0000 	orreq	r0, lr, r0
     190:	80b40000 	adcshi	r0, r4, r0
     194:	01940000 	orrseq	r0, r4, r0
     198:	00730000 	rsbseq	r0, r3, r0
     19c:	01020000 	mrseq	r0, (UNDEF: 2)
     1a0:	0000eb08 	andeq	lr, r0, r8, lsl #22
     1a4:	00e40300 	rsceq	r0, r4, r0, lsl #6
     1a8:	0e020000 	cdpeq	0, 0, cr0, cr2, cr0, {0}
     1ac:	00000037 	andeq	r0, r0, r7, lsr r0
     1b0:	f4080102 	vst4.8	{d0,d2,d4,d6}, [r8], r2
     1b4:	02000000 	andeq	r0, r0, #0
     1b8:	01590502 	cmpeq	r9, r2, lsl #10
     1bc:	04040000 	streq	r0, [r4], #-0
     1c0:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     1c4:	05080200 	streq	r0, [r8, #-512]	; 0x200
     1c8:	00000000 	andeq	r0, r0, r0
     1cc:	0000e303 	andeq	lr, r0, r3, lsl #6
     1d0:	25160200 	ldrcs	r0, [r6, #-512]	; 0x200
     1d4:	02000000 	andeq	r0, r0, #0
     1d8:	012c0702 	teqeq	ip, r2, lsl #14
     1dc:	71030000 	mrsvc	r0, (UNDEF: 3)
     1e0:	02000001 	andeq	r0, r0, #1
     1e4:	0000701a 	andeq	r7, r0, sl, lsl r0
     1e8:	07040200 	streq	r0, [r4, -r0, lsl #4]
     1ec:	0000003b 	andeq	r0, r0, fp, lsr r0
     1f0:	31070802 	tstcc	r7, r2, lsl #16
     1f4:	05000000 	streq	r0, [r0, #-0]
     1f8:	0000014d 	andeq	r0, r0, sp, asr #2
     1fc:	80b45501 	adcshi	r5, r4, r1, lsl #10
     200:	00540000 	subseq	r0, r4, r0
     204:	9c010000 	stcls	0, cr0, [r1], {-0}
     208:	000000dd 	ldrdeq	r0, [r0], -sp
     20c:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
     210:	53550100 	cmppl	r5, #0, 2
     214:	00000000 	andeq	r0, r0, r0
     218:	07000000 	streq	r0, [r0, -r0]
     21c:	006e7566 	rsbeq	r7, lr, r6, ror #10
     220:	00535501 	subseq	r5, r3, r1, lsl #10
     224:	51010000 	mrspl	r0, (UNDEF: 1)
     228:	67657208 	strbvs	r7, [r5, -r8, lsl #4]!
     22c:	655a0100 	ldrbvs	r0, [sl, #-256]	; 0x100
     230:	21000000 	mrscs	r0, (UNDEF: 0)
     234:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
     238:	00000152 	andeq	r0, r0, r2, asr r1
     23c:	00655c01 	rsbeq	r5, r5, r1, lsl #24
     240:	005a0000 	subseq	r0, sl, r0
     244:	cd090000 	stcgt	0, cr0, [r9, #-0]
     248:	01000001 	tsteq	r0, r1
     24c:	0000655e 	andeq	r6, r0, lr, asr r5
     250:	00007800 	andeq	r7, r0, r0, lsl #16
     254:	28050000 	stmdacs	r5, {}	; <UNPREDICTABLE>
     258:	01000000 	mrseq	r0, (UNDEF: 0)
     25c:	00810865 	addeq	r0, r1, r5, ror #16
     260:	00004400 	andeq	r4, r0, r0, lsl #8
     264:	029c0100 	addseq	r0, ip, #0, 2
     268:	06000001 	streq	r0, [r0], -r1
     26c:	006e6970 	rsbeq	r6, lr, r0, ror r9
     270:	00536501 	subseq	r6, r3, r1, lsl #10
     274:	008b0000 	addeq	r0, fp, r0
     278:	05000000 	streq	r0, [r0, #-0]
     27c:	00000048 	andeq	r0, r0, r8, asr #32
     280:	814c7101 	cmphi	ip, r1, lsl #2
     284:	00440000 	subeq	r0, r4, r0
     288:	9c010000 	stcls	0, cr0, [r1], {-0}
     28c:	00000127 	andeq	r0, r0, r7, lsr #2
     290:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
     294:	53710100 	cmnpl	r1, #0, 2
     298:	c5000000 	strgt	r0, [r0, #-0]
     29c:	00000000 	andeq	r0, r0, r0
     2a0:	00016305 	andeq	r6, r1, r5, lsl #6
     2a4:	907d0100 	rsbsls	r0, sp, r0, lsl #2
     2a8:	84000081 	strhi	r0, [r0], #-129	; 0x81
     2ac:	01000000 	mrseq	r0, (UNDEF: 0)
     2b0:	0001939c 	muleq	r1, ip, r3
     2b4:	69700600 	ldmdbvs	r0!, {r9, sl}^
     2b8:	7d01006e 	stcvc	0, cr0, [r1, #-440]	; 0xfffffe48
     2bc:	00000053 	andeq	r0, r0, r3, asr r0
     2c0:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     2c4:	0001c70a 	andeq	ip, r1, sl, lsl #14
     2c8:	537d0100 	cmnpl	sp, #0, 2
     2cc:	20000000 	andcs	r0, r0, r0
     2d0:	0b000001 	bleq	2dc <__start-0x7d24>
     2d4:	000081b8 			; <UNDEFINED> instruction: 0x000081b8
     2d8:	000001ea 	andeq	r0, r0, sl, ror #3
     2dc:	0000016e 	andeq	r0, r0, lr, ror #2
     2e0:	0250010c 	subseq	r0, r0, #12, 2
     2e4:	0b009608 	bleq	25b0c <__bss_end+0x15b0c>
     2e8:	000081e0 	andeq	r8, r0, r0, ror #3
     2ec:	000001ea 	andeq	r0, r0, sl, ror #3
     2f0:	00000182 	andeq	r0, r0, r2, lsl #3
     2f4:	0250010c 	subseq	r0, r0, #12, 2
     2f8:	0d009608 	stceq	6, cr9, [r0, #-32]	; 0xffffffe0
     2fc:	00008208 	andeq	r8, r0, r8, lsl #4
     300:	000001ea 	andeq	r0, r0, sl, ror #3
     304:	0250010c 	subseq	r0, r0, #12, 2
     308:	00009608 	andeq	r9, r0, r8, lsl #12
     30c:	00017f0e 	andeq	r7, r1, lr, lsl #30
     310:	2c8f0100 	stfcss	f0, [pc], {0}
     314:	14000000 	strne	r0, [r0], #-0
     318:	34000082 	strcc	r0, [r0], #-130	; 0x82
     31c:	01000000 	mrseq	r0, (UNDEF: 0)
     320:	0001cb9c 	muleq	r1, ip, fp
     324:	69700600 	ldmdbvs	r0!, {r9, sl}^
     328:	8f01006e 	svchi	0x0001006e
     32c:	00000053 	andeq	r0, r0, r3, asr r0
     330:	00000141 	andeq	r0, r0, r1, asr #2
     334:	6c617608 	stclvs	6, cr7, [r1], #-32	; 0xffffffe0
     338:	65900100 	ldrvs	r0, [r0, #256]	; 0x100
     33c:	7b000000 	blvc	344 <__start-0x7cbc>
     340:	00000001 	andeq	r0, r0, r1
     344:	00017a0f 	andeq	r7, r1, pc, lsl #20
     348:	da520100 	ble	1480750 <__user_program+0x1180750>
     34c:	00000001 	andeq	r0, r0, r1
     350:	103f2000 	eorsne	r2, pc, r0
     354:	000001df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     358:	01e50411 	mvneq	r0, r1, lsl r4
     35c:	65120000 	ldrvs	r0, [r2, #-0]
     360:	13000000 	movwne	r0, #0
     364:	000001ba 			; <UNDEFINED> instruction: 0x000001ba
     368:	65141903 	ldrvs	r1, [r4, #-2307]	; 0x903
     36c:	00000000 	andeq	r0, r0, r0
     370:	00021700 	andeq	r1, r2, r0, lsl #14
     374:	ba000400 	blt	137c <__start-0x6c84>
     378:	04000001 	streq	r0, [r0], #-1
     37c:	00006401 	andeq	r6, r0, r1, lsl #8
     380:	02170100 	andseq	r0, r7, #0, 2
     384:	01050000 	mrseq	r0, (UNDEF: 5)
     388:	82480000 	subhi	r0, r8, #0
     38c:	00c40000 	sbceq	r0, r4, r0
     390:	01070000 	mrseq	r0, (UNDEF: 7)
     394:	01020000 	mrseq	r0, (UNDEF: 2)
     398:	0000f408 	andeq	pc, r0, r8, lsl #8
     39c:	05020200 	streq	r0, [r2, #-512]	; 0x200
     3a0:	00000159 	andeq	r0, r0, r9, asr r1
     3a4:	69050403 	stmdbvs	r5, {r0, r1, sl}
     3a8:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     3ac:	00000508 	andeq	r0, r0, r8, lsl #10
     3b0:	e3040000 	movw	r0, #16384	; 0x4000
     3b4:	02000000 	andeq	r0, r0, #0
     3b8:	00004c16 	andeq	r4, r0, r6, lsl ip
     3bc:	08010200 	stmdaeq	r1, {r9}
     3c0:	000000eb 	andeq	r0, r0, fp, ror #1
     3c4:	00024504 	andeq	r4, r2, r4, lsl #10
     3c8:	5e180200 	cdppl	2, 1, cr0, cr8, cr0, {0}
     3cc:	02000000 	andeq	r0, r0, #0
     3d0:	012c0702 	teqeq	ip, r2, lsl #14
     3d4:	04020000 	streq	r0, [r2], #-0
     3d8:	00003b07 	andeq	r3, r0, r7, lsl #22
     3dc:	07080200 	streq	r0, [r8, -r0, lsl #4]
     3e0:	00000031 	andeq	r0, r0, r1, lsr r0
     3e4:	00020305 	andeq	r0, r2, r5, lsl #6
     3e8:	48210100 	stmdami	r1!, {r8}
     3ec:	10000082 	andne	r0, r0, r2, lsl #1
     3f0:	01000000 	mrseq	r0, (UNDEF: 0)
     3f4:	00009a9c 	muleq	r0, ip, sl
     3f8:	82540600 	subshi	r0, r4, #0, 12
     3fc:	01c90000 	biceq	r0, r9, r0
     400:	01070000 	mrseq	r0, (UNDEF: 7)
     404:	dc0a0350 	stcle	3, cr0, [sl], {80}	; 0x50
     408:	08000005 	stmdaeq	r0, {r0, r2}
     40c:	0000025e 	andeq	r0, r0, lr, asr r2
     410:	00532501 	subseq	r2, r3, r1, lsl #10
     414:	82580000 	subshi	r0, r8, #0
     418:	00b40000 	adcseq	r0, r4, r0
     41c:	9c010000 	stcls	0, cr0, [r1], {-0}
     420:	00000192 	muleq	r0, r2, r1
     424:	00023d09 	andeq	r3, r2, r9, lsl #26
     428:	41250100 	teqmi	r5, r0, lsl #2
     42c:	99000000 	stmdbls	r0, {}	; <UNPREDICTABLE>
     430:	0a000001 	beq	43c <__start-0x7bc4>
     434:	0000024e 	andeq	r0, r0, lr, asr #4
     438:	01923401 	orrseq	r3, r2, r1, lsl #8
     43c:	91020000 	mrsls	r0, (UNDEF: 2)
     440:	020c0a74 	andeq	r0, ip, #116, 20	; 0x74000
     444:	38010000 	stmdacc	r1, {}	; <UNPREDICTABLE>
     448:	000001a9 	andeq	r0, r0, r9, lsr #3
     44c:	0b709102 	bleq	1c2485c <__user_program+0x192485c>
     450:	00000211 	andeq	r0, r0, r1, lsl r2
     454:	00533d01 	subseq	r3, r3, r1, lsl #26
     458:	680c0000 	stmdavs	ip, {}	; <UNPREDICTABLE>
     45c:	28000082 	stmdacs	r0, {r1, r7}
     460:	20000000 	andcs	r0, r0, r0
     464:	0a000001 	beq	470 <__start-0x7b90>
     468:	000001f7 	strdeq	r0, [r0], -r7
     46c:	01b92801 			; <UNDEFINED> instruction: 0x01b92801
     470:	91020000 	mrsls	r0, (UNDEF: 2)
     474:	8290066c 	addshi	r0, r0, #108, 12	; 0x6c00000
     478:	01da0000 	bicseq	r0, sl, r0
     47c:	01070000 	mrseq	r0, (UNDEF: 7)
     480:	49080252 	stmdbmi	r8, {r1, r4, r6, r9}
     484:	01510107 	cmpeq	r1, r7, lsl #2
     488:	50010733 	andpl	r0, r1, r3, lsr r7
     48c:	00649102 	rsbeq	r9, r4, r2, lsl #2
     490:	82a00c00 	adchi	r0, r0, #0, 24
     494:	00280000 	eoreq	r0, r8, r0
     498:	01570000 	cmpeq	r7, r0
     49c:	f70a0000 			; <UNDEFINED> instruction: 0xf70a0000
     4a0:	01000001 	tsteq	r0, r1
     4a4:	0001b92d 	andeq	fp, r1, sp, lsr #18
     4a8:	6c910200 	lfmvs	f0, 4, [r1], {0}
     4ac:	0082c806 	addeq	ip, r2, r6, lsl #16
     4b0:	0001da00 	andeq	sp, r1, r0, lsl #20
     4b4:	52010700 	andpl	r0, r1, #0, 14
     4b8:	07490802 	strbeq	r0, [r9, -r2, lsl #16]
     4bc:	33015101 	movwcc	r5, #4353	; 0x1101
     4c0:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
     4c4:	00006491 	muleq	r0, r1, r4
     4c8:	0082e00d 	addeq	lr, r2, sp
     4cc:	0001da00 	andeq	sp, r1, r0, lsl #20
     4d0:	00017600 	andeq	r7, r1, r0, lsl #12
     4d4:	52010700 	andpl	r0, r1, #0, 14
     4d8:	07490802 	strbeq	r0, [r9, -r2, lsl #16]
     4dc:	31015101 	tstcc	r1, r1, lsl #2
     4e0:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
     4e4:	06006c91 			; <UNDEFINED> instruction: 0x06006c91
     4e8:	000082f0 	strdeq	r8, [r0], -r0
     4ec:	000001ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     4f0:	02520107 	subseq	r0, r2, #-1073741823	; 0xc0000001
     4f4:	01074908 	tsteq	r7, r8, lsl #18
     4f8:	07320151 			; <UNDEFINED> instruction: 0x07320151
     4fc:	91025001 	tstls	r2, r1
     500:	0e000068 	cdpeq	0, 0, cr0, cr0, cr8, {3}
     504:	00000041 	andeq	r0, r0, r1, asr #32
     508:	000001a2 	andeq	r0, r0, r2, lsr #3
     50c:	0001a20f 	andeq	sl, r1, pc, lsl #4
     510:	02000000 	andeq	r0, r0, #0
     514:	02780704 	rsbseq	r0, r8, #4, 14	; 0x100000
     518:	410e0000 	mrsmi	r0, (UNDEF: 14)
     51c:	b9000000 	stmdblt	r0, {}	; <UNPREDICTABLE>
     520:	0f000001 	svceq	0x00000001
     524:	000001a2 	andeq	r0, r0, r2, lsr #3
     528:	410e0001 	tstmi	lr, r1
     52c:	c9000000 	stmdbgt	r0, {}	; <UNPREDICTABLE>
     530:	0f000001 	svceq	0x00000001
     534:	000001a2 	andeq	r0, r0, r2, lsr #3
     538:	e7100002 	ldr	r0, [r0, -r2]
     53c:	03000001 	movweq	r0, #1
     540:	0001da19 	andeq	sp, r1, r9, lsl sl
     544:	00531100 	subseq	r1, r3, r0, lsl #2
     548:	12000000 	andne	r0, r0, #0
     54c:	00000267 	andeq	r0, r0, r7, ror #4
     550:	00412203 	subeq	r2, r1, r3, lsl #4
     554:	01f90000 	mvnseq	r0, r0
     558:	f9110000 			; <UNDEFINED> instruction: 0xf9110000
     55c:	11000001 	tstne	r0, r1
     560:	00000053 	andeq	r0, r0, r3, asr r0
     564:	00004111 	andeq	r4, r0, r1, lsl r1
     568:	04130000 	ldreq	r0, [r3], #-0
     56c:	00000041 	andeq	r0, r0, r1, asr #32
     570:	00022d14 	andeq	r2, r2, r4, lsl sp
     574:	412b0300 	teqmi	fp, r0, lsl #6
     578:	11000000 	mrsne	r0, (UNDEF: 0)
     57c:	000001f9 	strdeq	r0, [r0], -r9
     580:	00005311 	andeq	r5, r0, r1, lsl r3
     584:	00411100 	subeq	r1, r1, r0, lsl #2
     588:	00000000 	andeq	r0, r0, r0
     58c:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     590:	02de0004 	sbcseq	r0, lr, #4
     594:	01040000 	mrseq	r0, (UNDEF: 4)
     598:	00000064 	andeq	r0, r0, r4, rrx
     59c:	00028601 	andeq	r8, r2, r1, lsl #12
     5a0:	00010500 	andeq	r0, r1, r0, lsl #10
     5a4:	00830c00 	addeq	r0, r3, r0, lsl #24
     5a8:	00019400 	andeq	r9, r1, r0, lsl #8
     5ac:	00019200 	andeq	r9, r1, r0, lsl #4
     5b0:	08010200 	stmdaeq	r1, {r9}
     5b4:	000000f4 	strdeq	r0, [r0], -r4
     5b8:	59050202 	stmdbpl	r5, {r1, r9}
     5bc:	03000001 	movweq	r0, #1
     5c0:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     5c4:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
     5c8:	00000005 	andeq	r0, r0, r5
     5cc:	00e30400 	rsceq	r0, r3, r0, lsl #8
     5d0:	16020000 	strne	r0, [r2], -r0
     5d4:	0000004c 	andeq	r0, r0, ip, asr #32
     5d8:	eb080102 	bl	2009e8 <__end+0xcf9e8>
     5dc:	04000000 	streq	r0, [r0], #-0
     5e0:	00000245 	andeq	r0, r0, r5, asr #4
     5e4:	005e1802 	subseq	r1, lr, r2, lsl #16
     5e8:	02020000 	andeq	r0, r2, #0
     5ec:	00012c07 	andeq	r2, r1, r7, lsl #24
     5f0:	01710400 	cmneq	r1, r0, lsl #8
     5f4:	1a020000 	bne	805fc <__bss_end+0x705fc>
     5f8:	00000070 	andeq	r0, r0, r0, ror r0
     5fc:	3b070402 	blcc	1c160c <__end+0x9060c>
     600:	02000000 	andeq	r0, r0, #0
     604:	00310708 	eorseq	r0, r1, r8, lsl #14
     608:	e7050000 	str	r0, [r5, -r0]
     60c:	01000001 	tsteq	r0, r1
     610:	00830c21 	addeq	r0, r3, r1, lsr #24
     614:	00005400 	andeq	r5, r0, r0, lsl #8
     618:	ff9c0100 			; <UNDEFINED> instruction: 0xff9c0100
     61c:	06000000 	streq	r0, [r0], -r0
     620:	006b6c63 	rsbeq	r6, fp, r3, ror #24
     624:	00532101 	subseq	r2, r3, r1, lsl #2
     628:	01ba0000 			; <UNDEFINED> instruction: 0x01ba0000
     62c:	1c070000 	stcne	0, cr0, [r7], {-0}
     630:	ab000083 	blge	844 <__start-0x77bc>
     634:	ba000001 	blt	640 <__start-0x79c0>
     638:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     63c:	30015101 	andcc	r5, r1, r1, lsl #2
     640:	01500108 	cmpeq	r0, r8, lsl #2
     644:	28070032 	stmdacs	r7, {r1, r4, r5}
     648:	ab000083 	blge	85c <__start-0x77a4>
     64c:	d2000001 	andle	r0, r0, #1
     650:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     654:	30015101 	andcc	r5, r1, r1, lsl #2
     658:	01500108 	cmpeq	r0, r8, lsl #2
     65c:	34070033 	strcc	r0, [r7], #-51	; 0x33
     660:	c1000083 	smlabbgt	r0, r3, r0, r0
     664:	ea000001 	b	670 <__start-0x7990>
     668:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     66c:	34015101 	strcc	r5, [r1], #-257	; 0x101
     670:	01500108 	cmpeq	r0, r8, lsl #2
     674:	40090032 	andmi	r0, r9, r2, lsr r0
     678:	c1000083 	smlabbgt	r0, r3, r0, r0
     67c:	08000001 	stmdaeq	r0, {r0}
     680:	34015101 	strcc	r5, [r1], #-257	; 0x101
     684:	01500108 	cmpeq	r0, r8, lsl #2
     688:	0a000033 	beq	75c <__start-0x78a4>
     68c:	00000267 	andeq	r0, r0, r7, ror #4
     690:	00412d01 	subeq	r2, r1, r1, lsl #26
     694:	83600000 	cmnhi	r0, #0
     698:	00a40000 	adceq	r0, r4, r0
     69c:	9c010000 	stcls	0, cr0, [r1], {-0}
     6a0:	00000153 	andeq	r0, r0, r3, asr r1
     6a4:	66756206 	ldrbtvs	r6, [r5], -r6, lsl #4
     6a8:	532d0100 	teqpl	sp, #0, 2
     6ac:	db000001 	blle	6b8 <__start-0x7948>
     6b0:	06000001 	streq	r0, [r0], -r1
     6b4:	006e656c 	rsbeq	r6, lr, ip, ror #10
     6b8:	00532d01 	subseq	r2, r3, r1, lsl #26
     6bc:	02390000 	eorseq	r0, r9, #0
     6c0:	810b0000 	mrshi	r0, (UNDEF: 11)
     6c4:	01000002 	tsteq	r0, r2
     6c8:	0000412d 	andeq	r4, r0, sp, lsr #2
     6cc:	00026500 	andeq	r6, r2, r0, lsl #10
     6d0:	00690c00 	rsbeq	r0, r9, r0, lsl #24
     6d4:	00333801 	eorseq	r3, r3, r1, lsl #16
     6d8:	02910000 	addseq	r0, r1, #0
     6dc:	0d000000 	stceq	0, cr0, [r0, #-0]
     6e0:	00004104 	andeq	r4, r0, r4, lsl #2
     6e4:	022d0a00 	eoreq	r0, sp, #0, 20
     6e8:	45010000 	strmi	r0, [r1, #-0]
     6ec:	00000041 	andeq	r0, r0, r1, asr #32
     6f0:	00008404 	andeq	r8, r0, r4, lsl #8
     6f4:	0000009c 	muleq	r0, ip, r0
     6f8:	01ab9c01 			; <UNDEFINED> instruction: 0x01ab9c01
     6fc:	62060000 	andvs	r0, r6, #0
     700:	01006675 	tsteq	r0, r5, ror r6
     704:	00015345 	andeq	r5, r1, r5, asr #6
     708:	0002d900 	andeq	sp, r2, r0, lsl #18
     70c:	656c0e00 	strbvs	r0, [ip, #-3584]!	; 0xe00
     710:	4501006e 	strmi	r0, [r1, #-110]	; 0x6e
     714:	00000053 	andeq	r0, r0, r3, asr r0
     718:	810b5101 	tsthi	fp, r1, lsl #2
     71c:	01000002 	tsteq	r0, r2
     720:	00004145 	andeq	r4, r0, r5, asr #2
     724:	00033700 	andeq	r3, r3, r0, lsl #14
     728:	00690c00 	rsbeq	r0, r9, r0, lsl #24
     72c:	00335701 	eorseq	r5, r3, r1, lsl #14
     730:	03630000 	cmneq	r3, #0
     734:	0f000000 	svceq	0x00000000
     738:	00000163 	andeq	r0, r0, r3, ror #2
     73c:	01c14b03 	biceq	r4, r1, r3, lsl #22
     740:	41100000 	tstmi	r0, r0
     744:	10000000 	andne	r0, r0, r0
     748:	00000041 	andeq	r0, r0, r1, asr #32
     74c:	014d1100 	mrseq	r1, (UNDEF: 93)
     750:	37030000 	strcc	r0, [r3, -r0]
     754:	00004110 	andeq	r4, r0, r0, lsl r1
     758:	00411000 	subeq	r1, r1, r0
     75c:	00000000 	andeq	r0, r0, r0
     760:	0000096c 	andeq	r0, r0, ip, ror #18
     764:	03df0004 	bicseq	r0, pc, #4
     768:	01040000 	mrseq	r0, (UNDEF: 4)
     76c:	00000064 	andeq	r0, r0, r4, rrx
     770:	00034501 	andeq	r4, r3, r1, lsl #10
     774:	00018e00 	andeq	r8, r1, r0, lsl #28
     778:	0084a000 	addeq	sl, r4, r0
     77c:	000c9c00 	andeq	r9, ip, r0, lsl #24
     780:	00025000 	andeq	r5, r2, r0
     784:	00e40200 	rsceq	r0, r4, r0, lsl #4
     788:	0e020000 	cdpeq	0, 0, cr0, cr2, cr0, {0}
     78c:	00000030 	andeq	r0, r0, r0, lsr r0
     790:	f4080103 	vst4.8	{d0,d2,d4,d6}, [r8], r3
     794:	03000000 	movweq	r0, #0
     798:	01590502 	cmpeq	r9, r2, lsl #10
     79c:	04040000 	streq	r0, [r4], #-0
     7a0:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     7a4:	05080300 	streq	r0, [r8, #-768]	; 0x300
     7a8:	00000000 	andeq	r0, r0, r0
     7ac:	0000e302 	andeq	lr, r0, r2, lsl #6
     7b0:	57160200 	ldrpl	r0, [r6, -r0, lsl #4]
     7b4:	03000000 	movweq	r0, #0
     7b8:	00eb0801 	rsceq	r0, fp, r1, lsl #16
     7bc:	02030000 	andeq	r0, r3, #0
     7c0:	00012c07 	andeq	r2, r1, r7, lsl #24
     7c4:	01710200 	cmneq	r1, r0, lsl #4
     7c8:	1a020000 	bne	807d0 <__bss_end+0x707d0>
     7cc:	00000070 	andeq	r0, r0, r0, ror r0
     7d0:	3b070403 	blcc	1c17e4 <__end+0x907e4>
     7d4:	03000000 	movweq	r0, #0
     7d8:	00310708 	eorseq	r0, r1, r8, lsl #14
     7dc:	ac050000 	stcge	0, cr0, [r5], {-0}
     7e0:	10000005 	andne	r0, r0, r5
     7e4:	00c70403 	sbceq	r0, r7, r3, lsl #8
     7e8:	a2060000 	andge	r0, r6, #0
     7ec:	03000002 	movweq	r0, #2
     7f0:	00004c05 	andeq	r4, r0, r5, lsl #24
     7f4:	29060000 	stmdbcs	r6, {}	; <UNPREDICTABLE>
     7f8:	03000005 	movweq	r0, #5
     7fc:	00004c06 	andeq	r4, r0, r6, lsl #24
     800:	de060100 	adfles	f0, f6, f0
     804:	03000004 	movweq	r0, #4
     808:	00006507 	andeq	r6, r0, r7, lsl #10
     80c:	5f060400 	svcpl	0x00060400
     810:	03000004 	movweq	r0, #4
     814:	00006508 	andeq	r6, r0, r8, lsl #10
     818:	f2060800 	vadd.i8	d0, d6, d0
     81c:	03000002 	movweq	r0, #2
     820:	00006509 	andeq	r6, r0, r9, lsl #10
     824:	02000c00 	andeq	r0, r0, #0, 24
     828:	00000530 	andeq	r0, r0, r0, lsr r5
     82c:	00d20a03 	sbcseq	r0, r2, r3, lsl #20
     830:	7e070000 	cdpvc	0, 0, cr0, cr7, cr0, {0}
     834:	02000000 	andeq	r0, r0, #0
     838:	000003e6 	andeq	r0, r0, r6, ror #7
     83c:	00e23c04 	rsceq	r3, r2, r4, lsl #24
     840:	04080000 	streq	r0, [r8], #-0
     844:	000000e8 	andeq	r0, r0, r8, ror #1
     848:	04840509 	streq	r0, [r4], #1289	; 0x509
     84c:	04740000 	ldrbteq	r0, [r4], #-0
     850:	00025f3f 	andeq	r5, r2, pc, lsr pc
     854:	05220600 	streq	r0, [r2, #-1536]!	; 0x600
     858:	41040000 	mrsmi	r0, (UNDEF: 4)
     85c:	0000004c 	andeq	r0, r0, ip, asr #32
     860:	07fd0600 	ldrbeq	r0, [sp, r0, lsl #12]!
     864:	42040000 	andmi	r0, r4, #0
     868:	0000004c 	andeq	r0, r0, ip, asr #32
     86c:	064c0601 	strbeq	r0, [ip], -r1, lsl #12
     870:	43040000 	movwmi	r0, #16384	; 0x4000
     874:	0000004c 	andeq	r0, r0, ip, asr #32
     878:	03910602 	orrseq	r0, r1, #2097152	; 0x200000
     87c:	44040000 	strmi	r0, [r4], #-0
     880:	00000065 	andeq	r0, r0, r5, rrx
     884:	04c40604 	strbeq	r0, [r4], #1540	; 0x604
     888:	45040000 	strmi	r0, [r4, #-0]
     88c:	00000065 	andeq	r0, r0, r5, rrx
     890:	05a00608 	streq	r0, [r0, #1544]!	; 0x608
     894:	46040000 	strmi	r0, [r4], -r0
     898:	00000065 	andeq	r0, r0, r5, rrx
     89c:	0509060c 	streq	r0, [r9, #-1548]	; 0x60c
     8a0:	47040000 	strmi	r0, [r4, -r0]
     8a4:	00000065 	andeq	r0, r0, r5, rrx
     8a8:	6e660a10 	mcrvs	10, 3, r0, cr6, cr0, {0}
     8ac:	65480400 	strbvs	r0, [r8, #-1024]	; 0x400
     8b0:	14000000 	strne	r0, [r0], #-0
     8b4:	0003c706 	andeq	ip, r3, r6, lsl #14
     8b8:	65490400 	strbvs	r0, [r9, #-1024]	; 0x400
     8bc:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     8c0:	00062c06 	andeq	r2, r6, r6, lsl #24
     8c4:	654a0400 	strbvs	r0, [sl, #-1024]	; 0x400
     8c8:	1c000000 	stcne	0, cr0, [r0], {-0}
     8cc:	00053f06 	andeq	r3, r5, r6, lsl #30
     8d0:	654c0400 	strbvs	r0, [ip, #-1024]	; 0x400
     8d4:	20000000 	andcs	r0, r0, r0
     8d8:	00068106 	andeq	r8, r6, r6, lsl #2
     8dc:	654f0400 	strbvs	r0, [pc, #-1024]	; 4e4 <__start-0x7b1c>
     8e0:	24000000 	strcs	r0, [r0], #-0
     8e4:	0005f506 	andeq	pc, r5, r6, lsl #10
     8e8:	65500400 	ldrbvs	r0, [r0, #-1024]	; 0x400
     8ec:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
     8f0:	3231720a 	eorscc	r7, r1, #-1610612736	; 0xa0000000
     8f4:	65510400 	ldrbvs	r0, [r1, #-1024]	; 0x400
     8f8:	2c000000 	stccs	0, cr0, [r0], {-0}
     8fc:	3131720a 	teqcc	r1, sl, lsl #4
     900:	65520400 	ldrbvs	r0, [r2, #-1024]	; 0x400
     904:	30000000 	andcc	r0, r0, r0
     908:	3031720a 	eorscc	r7, r1, sl, lsl #4
     90c:	65530400 	ldrbvs	r0, [r3, #-1024]	; 0x400
     910:	34000000 	strcc	r0, [r0], #-0
     914:	0039720a 	eorseq	r7, r9, sl, lsl #4
     918:	00655404 	rsbeq	r5, r5, r4, lsl #8
     91c:	0a380000 	beq	e00924 <__user_program+0xb00924>
     920:	04003872 	streq	r3, [r0], #-2162	; 0x872
     924:	00006555 	andeq	r6, r0, r5, asr r5
     928:	720a3c00 	andvc	r3, sl, #0, 24
     92c:	56040037 			; <UNDEFINED> instruction: 0x56040037
     930:	00000065 	andeq	r0, r0, r5, rrx
     934:	36720a40 	ldrbtcc	r0, [r2], -r0, asr #20
     938:	65570400 	ldrbvs	r0, [r7, #-1024]	; 0x400
     93c:	44000000 	strmi	r0, [r0], #-0
     940:	0035720a 	eorseq	r7, r5, sl, lsl #4
     944:	00655804 	rsbeq	r5, r5, r4, lsl #16
     948:	0a480000 	beq	1200950 <__user_program+0xf00950>
     94c:	04003472 	streq	r3, [r0], #-1138	; 0x472
     950:	00006559 	andeq	r6, r0, r9, asr r5
     954:	720a4c00 	andvc	r4, sl, #0, 24
     958:	5a040033 	bpl	100a2c <__bss_end+0xf0a2c>
     95c:	00000065 	andeq	r0, r0, r5, rrx
     960:	32720a50 	rsbscc	r0, r2, #80, 20	; 0x50000
     964:	655b0400 	ldrbvs	r0, [fp, #-1024]	; 0x400
     968:	54000000 	strpl	r0, [r0], #-0
     96c:	0031720a 	eorseq	r7, r1, sl, lsl #4
     970:	00655c04 	rsbeq	r5, r5, r4, lsl #24
     974:	0a580000 	beq	160097c <__user_program+0x130097c>
     978:	04003072 	streq	r3, [r0], #-114	; 0x72
     97c:	0000655d 	andeq	r6, r0, sp, asr r5
     980:	3b065c00 	blcc	197988 <__end+0x66988>
     984:	04000006 	streq	r0, [r0], #-6
     988:	0000655e 	andeq	r6, r0, lr, asr r5
     98c:	81066000 	mrshi	r6, (UNDEF: 6)
     990:	04000005 	streq	r0, [r0], #-5
     994:	0000655f 	andeq	r6, r0, pc, asr r5
     998:	4a066400 	bmi	1999a0 <__end+0x689a0>
     99c:	04000004 	streq	r0, [r0], #-4
     9a0:	00006560 	andeq	r6, r0, r0, ror #10
     9a4:	38066800 	stmdacc	r6, {fp, sp, lr}
     9a8:	04000005 	streq	r0, [r0], #-5
     9ac:	00006561 	andeq	r6, r0, r1, ror #10
     9b0:	20066c00 	andcs	r6, r6, r0, lsl #24
     9b4:	04000003 	streq	r0, [r0], #-3
     9b8:	00006562 	andeq	r6, r0, r2, ror #10
     9bc:	02007000 	andeq	r7, r0, #0
     9c0:	0000036d 	andeq	r0, r0, sp, ror #6
     9c4:	026a6304 	rsbeq	r6, sl, #4, 6	; 0x10000000
     9c8:	e9070000 	stmdb	r7, {}	; <UNPREDICTABLE>
     9cc:	0b000000 	bleq	9d4 <__start-0x762c>
     9d0:	000002fe 	strdeq	r0, [r0], -lr
     9d4:	84a02301 	strthi	r2, [r0], #769	; 0x301
     9d8:	003c0000 	eorseq	r0, ip, r0
     9dc:	9c010000 	stcls	0, cr0, [r1], {-0}
     9e0:	000002d6 	ldrdeq	r0, [r0], -r6
     9e4:	0084a80c 	addeq	sl, r4, ip, lsl #16
     9e8:	00073a00 	andeq	r3, r7, r0, lsl #20
     9ec:	84ac0c00 	strthi	r0, [ip], #3072	; 0xc00
     9f0:	07410000 	strbeq	r0, [r1, -r0]
     9f4:	b00c0000 	andlt	r0, ip, r0
     9f8:	48000084 	stmdami	r0, {r2, r7}
     9fc:	0c000007 	stceq	0, cr0, [r0], {7}
     a00:	000084b4 			; <UNDEFINED> instruction: 0x000084b4
     a04:	0000074f 	andeq	r0, r0, pc, asr #14
     a08:	0084b80c 	addeq	fp, r4, ip, lsl #16
     a0c:	00075c00 	andeq	r5, r7, r0, lsl #24
     a10:	84cc0c00 	strbhi	r0, [ip], #3072	; 0xc00
     a14:	07630000 	strbeq	r0, [r3, -r0]!
     a18:	d00c0000 	andle	r0, ip, r0
     a1c:	6a000084 	bvs	c34 <__start-0x73cc>
     a20:	0c000007 	stceq	0, cr0, [r0], {7}
     a24:	000084d4 	ldrdeq	r8, [r0], -r4
     a28:	00000771 	andeq	r0, r0, r1, ror r7
     a2c:	0084d80c 	addeq	sp, r4, ip, lsl #16
     a30:	00078200 	andeq	r8, r7, r0, lsl #4
     a34:	d60d0000 	strle	r0, [sp], -r0
     a38:	01000002 	tsteq	r0, r2
     a3c:	00006535 	andeq	r6, r0, r5, lsr r5
     a40:	0084dc00 	addeq	sp, r4, r0, lsl #24
     a44:	00007400 	andeq	r7, r0, r0, lsl #8
     a48:	1b9c0100 	blne	fe700e50 <__user_program+0xfe400e50>
     a4c:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
     a50:	36010069 	strcc	r0, [r1], -r9, rrx
     a54:	00000065 	andeq	r0, r0, r5, rrx
     a58:	00000388 	andeq	r0, r0, r8, lsl #7
     a5c:	0006980f 	andeq	r9, r6, pc, lsl #16
     a60:	65370100 	ldrvs	r0, [r7, #-256]!	; 0x100
     a64:	a7000000 	strge	r0, [r0, -r0]
     a68:	0f000003 	svceq	0x00000003
     a6c:	000002da 	ldrdeq	r0, [r0], -sl
     a70:	00653801 	rsbeq	r3, r5, r1, lsl #16
     a74:	03c70000 	biceq	r0, r7, #0
     a78:	0b000000 	bleq	a80 <__start-0x7580>
     a7c:	00000562 	andeq	r0, r0, r2, ror #10
     a80:	85504201 	ldrbhi	r4, [r0, #-513]	; 0x201
     a84:	03180000 	tsteq	r8, #0
     a88:	9c010000 	stcls	0, cr0, [r1], {-0}
     a8c:	00000340 	andeq	r0, r0, r0, asr #6
     a90:	0004f410 	andeq	pc, r4, r0, lsl r4	; <UNPREDICTABLE>
     a94:	40420100 	submi	r0, r2, r0, lsl #2
     a98:	f2000003 	vhadd.s8	d0, d0, d3
     a9c:	00000003 	andeq	r0, r0, r3
     aa0:	00650408 	rsbeq	r0, r5, r8, lsl #8
     aa4:	0f0b0000 	svceq	0x000b0000
     aa8:	01000006 	tsteq	r0, r6
     aac:	00886862 	addeq	r6, r8, r2, ror #16
     ab0:	00027400 	andeq	r7, r2, r0, lsl #8
     ab4:	699c0100 	ldmibvs	ip, {r8}
     ab8:	11000003 	tstne	r0, r3
     abc:	000004f4 	strdeq	r0, [r0], -r4
     ac0:	03406201 	movteq	r6, #513	; 0x201
     ac4:	50010000 	andpl	r0, r1, r0
     ac8:	030a1200 	movweq	r1, #41472	; 0xa200
     acc:	7d010000 	stcvc	0, cr0, [r1, #-0]
     ad0:	00008adc 	ldrdeq	r8, [r0], -ip
     ad4:	00000114 	andeq	r0, r0, r4, lsl r1
     ad8:	a50b9c01 	strge	r9, [fp, #-3073]	; 0xc01
     adc:	01000005 	tsteq	r0, r5
     ae0:	008bf08c 	addeq	pc, fp, ip, lsl #1
     ae4:	00009800 	andeq	r9, r0, r0, lsl #16
     ae8:	9d9c0100 	ldflss	f0, [ip]
     aec:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
     af0:	8d010069 	stchi	0, cr0, [r1, #-420]	; 0xfffffe5c
     af4:	00000065 	andeq	r0, r0, r5, rrx
     af8:	00000413 	andeq	r0, r0, r3, lsl r4
     afc:	04711300 	ldrbteq	r1, [r1], #-768	; 0x300
     b00:	9b010000 	blls	40b08 <__bss_end+0x30b08>
     b04:	00008c88 	andeq	r8, r0, r8, lsl #25
     b08:	0000004c 	andeq	r0, r0, ip, asr #32
     b0c:	03d29c01 	bicseq	r9, r2, #256	; 0x100
     b10:	690e0000 	stmdbvs	lr, {}	; <UNPREDICTABLE>
     b14:	3e9f0100 	fmlcce	f0, f7, f0
     b18:	32000000 	andcc	r0, r0, #0
     b1c:	0c000004 	stceq	0, cr0, [r0], {4}
     b20:	00008ca0 	andeq	r8, r0, r0, lsr #25
     b24:	0000076a 	andeq	r0, r0, sl, ror #14
     b28:	008ca40c 	addeq	sl, ip, ip, lsl #8
     b2c:	00077100 	andeq	r7, r7, r0, lsl #2
     b30:	e7130000 	ldr	r0, [r3, -r0]
     b34:	01000002 	tsteq	r0, r2
     b38:	008cd4a8 	addeq	sp, ip, r8, lsr #9
     b3c:	00023c00 	andeq	r3, r2, r0, lsl #24
     b40:	999c0100 	ldmibls	ip, {r8}
     b44:	0f000004 	svceq	0x00000004
     b48:	000003f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     b4c:	0025ad01 	eoreq	sl, r5, r1, lsl #26
     b50:	04510000 	ldrbeq	r0, [r1], #-0
     b54:	cf0f0000 	svcgt	0x000f0000
     b58:	01000003 	tsteq	r0, r3
     b5c:	000025ae 	andeq	r2, r0, lr, lsr #11
     b60:	00046f00 	andeq	r6, r4, r0, lsl #30
     b64:	02ab0f00 	adceq	r0, fp, #0, 30
     b68:	bc010000 	stclt	0, cr0, [r1], {-0}
     b6c:	0000003e 	andeq	r0, r0, lr, lsr r0
     b70:	00000482 	andeq	r0, r0, r2, lsl #9
     b74:	008d2c14 	addeq	r2, sp, r4, lsl ip
     b78:	00079300 	andeq	r9, r7, r0, lsl #6
     b7c:	00042700 	andeq	r2, r4, r0, lsl #14
     b80:	50011500 	andpl	r1, r1, r0, lsl #10
     b84:	14004101 	strne	r4, [r0], #-257	; 0x101
     b88:	00008d38 	andeq	r8, r0, r8, lsr sp
     b8c:	00000793 	muleq	r0, r3, r7
     b90:	0000043a 	andeq	r0, r0, sl, lsr r4
     b94:	01500115 	cmpeq	r0, r5, lsl r1
     b98:	b00c004a 	andlt	r0, ip, sl, asr #32
     b9c:	9d00008d 	stcls	0, cr0, [r0, #-564]	; 0xfffffdcc
     ba0:	0c000003 	stceq	0, cr0, [r0], {3}
     ba4:	00008dec 	andeq	r8, r0, ip, ror #27
     ba8:	0000076a 	andeq	r0, r0, sl, ror #14
     bac:	008df00c 	addeq	pc, sp, ip
     bb0:	00077100 	andeq	r7, r7, r0, lsl #2
     bb4:	8e041400 	cfcpyshi	mvf1, mvf4
     bb8:	07a80000 	streq	r0, [r8, r0]!
     bbc:	04690000 	strbteq	r0, [r9], #-0
     bc0:	01150000 	tsteq	r5, r0
     bc4:	00740251 	rsbseq	r0, r4, r1, asr r2
     bc8:	8e340c00 	cdphi	12, 3, cr0, cr4, cr0, {0}
     bcc:	07c20000 	strbeq	r0, [r2, r0]
     bd0:	580c0000 	stmdapl	ip, {}	; <UNPREDICTABLE>
     bd4:	9d00008e 	stcls	0, cr0, [r0, #-568]	; 0xfffffdc8
     bd8:	14000003 	strne	r0, [r0], #-3
     bdc:	00008eb4 			; <UNDEFINED> instruction: 0x00008eb4
     be0:	000007a8 	andeq	r0, r0, r8, lsr #15
     be4:	0000048f 	andeq	r0, r0, pc, lsl #9
     be8:	02510115 	subseq	r0, r1, #1073741829	; 0x40000005
     bec:	0c000074 	stceq	0, cr0, [r0], {116}	; 0x74
     bf0:	00008f0c 	andeq	r8, r0, ip, lsl #30
     bf4:	000007c2 	andeq	r0, r0, r2, asr #15
     bf8:	03370d00 	teqeq	r7, #0, 26
     bfc:	df010000 	svcle	0x00010000
     c00:	0000051c 	andeq	r0, r0, ip, lsl r5
     c04:	00008f10 	andeq	r8, r0, r0, lsl pc
     c08:	00000060 	andeq	r0, r0, r0, rrx
     c0c:	051c9c01 	ldreq	r9, [ip, #-3073]	; 0xc01
     c10:	f4100000 			; <UNDEFINED> instruction: 0xf4100000
     c14:	01000004 	tsteq	r0, r4
     c18:	000340df 	ldrdeq	r4, [r3], -pc	; <UNPREDICTABLE>
     c1c:	0004b800 	andeq	fp, r4, r0, lsl #16
     c20:	8f1c0c00 	svchi	0x001c0c00
     c24:	07d30000 	ldrbeq	r0, [r3, r0]
     c28:	280c0000 	stmdacs	ip, {}	; <UNPREDICTABLE>
     c2c:	4800008f 	stmdami	r0, {r0, r1, r2, r3, r7}
     c30:	0c000007 	stceq	0, cr0, [r0], {7}
     c34:	00008f40 	andeq	r8, r0, r0, asr #30
     c38:	00000369 	andeq	r0, r0, r9, ror #6
     c3c:	008f4814 	addeq	r4, pc, r4, lsl r8	; <UNPREDICTABLE>
     c40:	00031b00 	andeq	r1, r3, r0, lsl #22
     c44:	0004f000 	andeq	pc, r4, r0
     c48:	50011500 	andpl	r1, r1, r0, lsl #10
     c4c:	00007402 	andeq	r7, r0, r2, lsl #8
     c50:	008f4c0c 	addeq	r4, pc, ip, lsl #24
     c54:	00037a00 	andeq	r7, r3, r0, lsl #20
     c58:	8f500c00 	svchi	0x00500c00
     c5c:	02d60000 	sbcseq	r0, r6, #0
     c60:	600c0000 	andvs	r0, ip, r0
     c64:	d200008f 	andle	r0, r0, #143	; 0x8f
     c68:	16000003 	strne	r0, [r0], -r3
     c6c:	00008f68 	andeq	r8, r0, r8, ror #30
     c70:	00000346 	andeq	r0, r0, r6, asr #6
     c74:	02500115 	subseq	r0, r0, #1073741829	; 0x40000005
     c78:	00000074 	andeq	r0, r0, r4, ror r0
     c7c:	d10d0417 	tstle	sp, r7, lsl r4
     c80:	01000005 	tsteq	r0, r5
     c84:	00051cfe 	strdeq	r1, [r5], -lr
     c88:	008f7000 	addeq	r7, pc, r0
     c8c:	0001cc00 	andeq	ip, r1, r0, lsl #24
     c90:	1a9c0100 	bne	fe701098 <__user_program+0xfe401098>
     c94:	10000006 	andne	r0, r0, r6
     c98:	000004cb 	andeq	r0, r0, fp, asr #9
     c9c:	003efe01 	eorseq	pc, lr, r1, lsl #28
     ca0:	04d60000 	ldrbeq	r0, [r6], #0
     ca4:	f4100000 			; <UNDEFINED> instruction: 0xf4100000
     ca8:	01000004 	tsteq	r0, r4
     cac:	00061afe 	strdeq	r1, [r6], -lr
     cb0:	0006c400 	andeq	ip, r6, r0, lsl #8
     cb4:	047d1800 	ldrbteq	r1, [sp], #-2048	; 0x800
     cb8:	00010000 	andeq	r0, r1, r0
     cbc:	00051c01 	andeq	r1, r5, r1, lsl #24
     cc0:	0006e200 	andeq	lr, r6, r0, lsl #4
     cc4:	8f840c00 	svchi	0x00840c00
     cc8:	07de0000 	ldrbeq	r0, [lr, r0]
     ccc:	e80c0000 	stmda	ip, {}	; <UNPREDICTABLE>
     cd0:	e500008f 	str	r0, [r0, #-143]	; 0x8f
     cd4:	0c000007 	stceq	0, cr0, [r0], {7}
     cd8:	00009000 	andeq	r9, r0, r0
     cdc:	000007fa 	strdeq	r0, [r0], -sl
     ce0:	0090100c 	addseq	r1, r0, ip
     ce4:	00081f00 	andeq	r1, r8, r0, lsl #30
     ce8:	90240c00 	eorls	r0, r4, r0, lsl #24
     cec:	08340000 	ldmdaeq	r4!, {}	; <UNPREDICTABLE>
     cf0:	340c0000 	strcc	r0, [ip], #-0
     cf4:	4e000090 	mcrmi	0, 0, r0, cr0, cr0, {4}
     cf8:	0c000008 	stceq	0, cr0, [r0], {8}
     cfc:	0000904c 	andeq	r9, r0, ip, asr #32
     d00:	00000863 	andeq	r0, r0, r3, ror #16
     d04:	0090640c 	addseq	r6, r0, ip, lsl #8
     d08:	00088200 	andeq	r8, r8, r0, lsl #4
     d0c:	90740c00 	rsbsls	r0, r4, r0, lsl #24
     d10:	08a10000 	stmiaeq	r1!, {}	; <UNPREDICTABLE>
     d14:	880c0000 	stmdahi	ip, {}	; <UNPREDICTABLE>
     d18:	b2000090 	andlt	r0, r0, #144	; 0x90
     d1c:	0c000008 	stceq	0, cr0, [r0], {8}
     d20:	000090ac 	andeq	r9, r0, ip, lsr #1
     d24:	000008cc 	andeq	r0, r0, ip, asr #17
     d28:	0090c00c 	addseq	ip, r0, ip
     d2c:	0008f500 	andeq	pc, r8, r0, lsl #10
     d30:	90d00c00 	sbcsls	r0, r0, r0, lsl #24
     d34:	09150000 	ldmdbeq	r5, {}	; <UNPREDICTABLE>
     d38:	e00c0000 	and	r0, ip, r0
     d3c:	26000090 			; <UNDEFINED> instruction: 0x26000090
     d40:	0c000009 	stceq	0, cr0, [r0], {9}
     d44:	000090ec 	andeq	r9, r0, ip, ror #1
     d48:	00000937 	andeq	r0, r0, r7, lsr r9
     d4c:	0090f80c 	addseq	pc, r0, ip, lsl #16
     d50:	00093e00 	andeq	r3, r9, r0, lsl #28
     d54:	91040c00 	tstls	r4, r0, lsl #24
     d58:	09490000 	stmdbeq	r9, {}^	; <UNPREDICTABLE>
     d5c:	100c0000 	andne	r0, ip, r0
     d60:	55000091 	strpl	r0, [r0, #-145]	; 0x91
     d64:	0c000009 	stceq	0, cr0, [r0], {9}
     d68:	00009120 	andeq	r9, r0, r0, lsr #2
     d6c:	00000961 	andeq	r0, r0, r1, ror #18
     d70:	0091300c 	addseq	r3, r1, ip
     d74:	00074100 	andeq	r4, r7, r0, lsl #2
     d78:	04080000 	streq	r0, [r8], #-0
     d7c:	0000003e 	andeq	r0, r0, lr, lsr r0
     d80:	00025f19 	andeq	r5, r2, r9, lsl pc
     d84:	00063000 	andeq	r3, r6, r0
     d88:	06301a00 	ldrteq	r1, [r0], -r0, lsl #20
     d8c:	001f0000 	andseq	r0, pc, r0
     d90:	78070403 	stmdavc	r7, {r0, r1, sl}
     d94:	1b000002 	blne	da4 <__start-0x725c>
     d98:	000005c5 	andeq	r0, r0, r5, asr #11
     d9c:	06486604 	strbeq	r6, [r8], -r4, lsl #12
     da0:	03050000 	movweq	r0, #20480	; 0x5000
     da4:	0000e020 	andeq	lr, r0, r0, lsr #32
     da8:	00062007 	andeq	r2, r6, r7
     dac:	065d1900 	ldrbeq	r1, [sp], -r0, lsl #18
     db0:	065d0000 	ldrbeq	r0, [sp], -r0
     db4:	301a0000 	andscc	r0, sl, r0
     db8:	1f000006 	svcne	0x00000006
     dbc:	d2040800 	andle	r0, r4, #0, 16
     dc0:	1b000000 	blne	dc8 <__start-0x7238>
     dc4:	000003ae 	andeq	r0, r0, lr, lsr #7
     dc8:	064d6804 	strbeq	r6, [sp], -r4, lsl #16
     dcc:	03050000 	movweq	r0, #20480	; 0x5000
     dd0:	0000efa8 	andeq	lr, r0, r8, lsr #31
     dd4:	0005751b 	andeq	r7, r5, fp, lsl r5
     dd8:	856a0400 	strbhi	r0, [sl, #-1024]!	; 0x400
     ddc:	05000006 	streq	r0, [r0, #-6]
     de0:	00e01803 	rsceq	r1, r0, r3, lsl #16
     de4:	00650700 	rsbeq	r0, r5, r0, lsl #14
     de8:	3e1b0000 	cdpcc	0, 1, cr0, cr11, cr0, {0}
     dec:	04000004 	streq	r0, [r0], #-4
     df0:	0006856c 	andeq	r8, r6, ip, ror #10
     df4:	14030500 	strne	r0, [r3], #-1280	; 0x500
     df8:	1b0000e0 	blne	1180 <__start-0x6e80>
     dfc:	000004d3 	ldrdeq	r0, [r0], -r3
     e00:	06856e04 	streq	r6, [r5], r4, lsl #28
     e04:	03050000 	movweq	r0, #20480	; 0x5000
     e08:	0000f028 	andeq	pc, r0, r8, lsr #32
     e0c:	0003a01b 	andeq	sl, r3, fp, lsl r0
     e10:	85700400 	ldrbhi	r0, [r0, #-1024]!	; 0x400
     e14:	05000006 	streq	r0, [r0, #-6]
     e18:	00e01003 	rsceq	r1, r0, r3
     e1c:	06681b00 	strbteq	r1, [r8], -r0, lsl #22
     e20:	72040000 	andvc	r0, r4, #0
     e24:	00000685 	andeq	r0, r0, r5, lsl #13
     e28:	e01c0305 	ands	r0, ip, r5, lsl #6
     e2c:	de190000 	cdple	0, 1, cr0, cr9, cr0, {0}
     e30:	de000006 	cdple	0, 0, cr0, cr0, cr6, {0}
     e34:	1a000006 	bne	e54 <__start-0x71ac>
     e38:	00000630 	andeq	r0, r0, r0, lsr r6
     e3c:	08030020 	stmdaeq	r3, {r5}
     e40:	0005ca04 	andeq	ip, r5, r4, lsl #20
     e44:	040f1b00 	streq	r1, [pc], #-2816	; e4c <__start-0x71b4>
     e48:	74040000 	strvc	r0, [r4], #-0
     e4c:	000006ce 	andeq	r0, r0, lr, asr #13
     e50:	eea00305 	cdp	3, 10, cr0, cr0, cr5, {0}
     e54:	271b0000 	ldrcs	r0, [fp, -r0]
     e58:	01000006 	tsteq	r0, r6
     e5c:	00003e17 	andeq	r3, r0, r7, lsl lr
     e60:	00030500 	andeq	r0, r3, r0, lsl #10
     e64:	1b0000e0 	blne	11ec <__start-0x6e14>
     e68:	000002cc 	andeq	r0, r0, ip, asr #5
     e6c:	004c1901 	subeq	r1, ip, r1, lsl #18
     e70:	03050000 	movweq	r0, #20480	; 0x5000
     e74:	0000e004 	andeq	lr, r0, r4
     e78:	00065d1b 	andeq	r5, r6, fp, lsl sp
     e7c:	4c1b0100 	ldfmis	f0, [fp], {-0}
     e80:	05000000 	streq	r0, [r0, #-0]
     e84:	00e00503 	rsceq	r0, r0, r3, lsl #10
     e88:	04161b00 	ldreq	r1, [r6], #-2816	; 0xb00
     e8c:	1e010000 	cdpne	0, 0, cr0, cr1, cr0, {0}
     e90:	0000003e 	andeq	r0, r0, lr, lsr r0
     e94:	d0000305 	andle	r0, r0, r5, lsl #6
     e98:	211c0000 	tstcs	ip, r0
     e9c:	05000006 	streq	r0, [r0, #-6]
     ea0:	042b1c2c 	strteq	r1, [fp], #-3116	; 0xc2c
     ea4:	30060000 	andcc	r0, r6, r0
     ea8:	0003591c 	andeq	r5, r3, ip, lsl r9
     eac:	1d390500 	cfldr32ne	mvfx0, [r9, #-0]
     eb0:	00000588 	andeq	r0, r0, r8, lsl #11
     eb4:	075c1009 	ldrbeq	r1, [ip, -r9]
     eb8:	001e0000 	andseq	r0, lr, r0
     ebc:	0002981c 	andeq	r9, r2, ip, lsl r8
     ec0:	1c310700 	ldcne	7, cr0, [r1], #-0
     ec4:	00000421 	andeq	r0, r0, r1, lsr #8
     ec8:	fd1c3208 	ldc2	2, cr3, [ip, #-32]	; 0xffffffe0
     ecc:	08000005 	stmdaeq	r0, {r0, r2}
     ed0:	02b21f31 	adcseq	r1, r2, #49, 30	; 0xc4
     ed4:	29080000 	stmdbcs	r8, {}	; <UNPREDICTABLE>
     ed8:	0000004c 	andeq	r0, r0, ip, asr #32
     edc:	00000782 	andeq	r0, r0, r2, lsl #15
     ee0:	f91f001e 			; <UNDEFINED> instruction: 0xf91f001e
     ee4:	09000004 	stmdbeq	r0, {r2}
     ee8:	00003e17 	andeq	r3, r0, r7, lsl lr
     eec:	00079300 	andeq	r9, r7, r0, lsl #6
     ef0:	20001e00 	andcs	r1, r0, r0, lsl #28
     ef4:	0000017f 	andeq	r0, r0, pc, ror r1
     ef8:	0025520a 	eoreq	r5, r5, sl, lsl #4
     efc:	07a80000 	streq	r0, [r8, r0]!
     f00:	4c210000 	stcmi	0, cr0, [r1], #-0
     f04:	00000000 	andeq	r0, r0, r0
     f08:	00054f20 	andeq	r4, r5, r0, lsr #30
     f0c:	4c270800 	stcmi	8, cr0, [r7], #-0
     f10:	c2000000 	andgt	r0, r0, #0
     f14:	21000007 	tstcs	r0, r7
     f18:	00000065 	andeq	r0, r0, r5, rrx
     f1c:	00006521 	andeq	r6, r0, r1, lsr #10
     f20:	991f0000 	ldmdbls	pc, {}	; <UNPREDICTABLE>
     f24:	08000004 	stmdaeq	r0, {r2}
     f28:	00004c2a 	andeq	r4, r0, sl, lsr #24
     f2c:	0007d300 	andeq	sp, r7, r0, lsl #6
     f30:	22001e00 	andcs	r1, r0, #0, 28
     f34:	000003b6 			; <UNDEFINED> instruction: 0x000003b6
     f38:	003e3305 	eorseq	r3, lr, r5, lsl #6
     f3c:	fd1c0000 	ldc2	0, cr0, [ip, #-0]
     f40:	06000003 	streq	r0, [r0], -r3
     f44:	02bf202b 	adcseq	r2, pc, #43	; 0x2b
     f48:	7c040000 	stcvc	0, cr0, [r4], {-0}
     f4c:	0000051c 	andeq	r0, r0, ip, lsl r5
     f50:	000007fa 	strdeq	r0, [r0], -sl
     f54:	00003e21 	andeq	r3, r0, r1, lsr #28
     f58:	14200000 	strtne	r0, [r0], #-0
     f5c:	04000005 	streq	r0, [r0], #-5
     f60:	00003e86 	andeq	r3, r0, r6, lsl #29
     f64:	00081900 	andeq	r1, r8, r0, lsl #18
     f68:	003e2100 	eorseq	r2, lr, r0, lsl #2
     f6c:	19210000 	stmdbne	r1!, {}	; <UNPREDICTABLE>
     f70:	21000008 	tstcs	r0, r8
     f74:	0000003e 	andeq	r0, r0, lr, lsr r0
     f78:	30040800 	andcc	r0, r4, r0, lsl #16
     f7c:	20000000 	andcs	r0, r0, r0
     f80:	000005b7 			; <UNDEFINED> instruction: 0x000005b7
     f84:	003e8f04 	eorseq	r8, lr, r4, lsl #30
     f88:	08340000 	ldmdaeq	r4!, {}	; <UNPREDICTABLE>
     f8c:	3e210000 	cdpcc	0, 2, cr0, cr1, cr0, {0}
     f90:	00000000 	andeq	r0, r0, r0
     f94:	00032920 	andeq	r2, r3, r0, lsr #18
     f98:	3e990400 	cdpcc	4, 9, cr0, cr9, cr0, {0}
     f9c:	4e000000 	cdpmi	0, 0, cr0, cr0, cr0, {0}
     fa0:	21000008 	tstcs	r0, r8
     fa4:	0000003e 	andeq	r0, r0, lr, lsr r0
     fa8:	00051c21 	andeq	r1, r5, r1, lsr #24
     fac:	89200000 	stmdbhi	r0!, {}	; <UNPREDICTABLE>
     fb0:	04000006 	streq	r0, [r0], #-6
     fb4:	00003ea2 	andeq	r3, r0, r2, lsr #29
     fb8:	00086300 	andeq	r6, r8, r0, lsl #6
     fbc:	003e2100 	eorseq	r2, lr, r0, lsl #2
     fc0:	20000000 	andcs	r0, r0, r0
     fc4:	00000312 	andeq	r0, r0, r2, lsl r3
     fc8:	003ead04 	eorseq	sl, lr, r4, lsl #26
     fcc:	08820000 	stmeq	r2, {}	; <UNPREDICTABLE>
     fd0:	3e210000 	cdpcc	0, 2, cr0, cr1, cr0, {0}
     fd4:	21000000 	mrscs	r0, (UNDEF: 0)
     fd8:	0000003e 	andeq	r0, r0, lr, lsr r0
     fdc:	00003e21 	andeq	r3, r0, r1, lsr #28
     fe0:	74200000 	strtvc	r0, [r0], #-0
     fe4:	04000006 	streq	r0, [r0], #-6
     fe8:	00003eb7 			; <UNDEFINED> instruction: 0x00003eb7
     fec:	0008a100 	andeq	sl, r8, r0, lsl #2
     ff0:	003e2100 	eorseq	r2, lr, r0, lsl #2
     ff4:	19210000 	stmdbne	r1!, {}	; <UNPREDICTABLE>
     ff8:	21000008 	tstcs	r0, r8
     ffc:	0000003e 	andeq	r0, r0, lr, lsr r0
    1000:	04e72300 	strbteq	r2, [r7], #768	; 0x300
    1004:	bf040000 	svclt	0x00040000
    1008:	000008b2 			; <UNDEFINED> instruction: 0x000008b2
    100c:	00003e21 	andeq	r3, r0, r1, lsr #28
    1010:	53200000 	teqpl	r0, #0
    1014:	04000004 	streq	r0, [r0], #-4
    1018:	00003ecd 	andeq	r3, r0, sp, asr #29
    101c:	0008cc00 	andeq	ip, r8, r0, lsl #24
    1020:	00d72100 	sbcseq	r2, r7, r0, lsl #2
    1024:	40210000 	eormi	r0, r1, r0
    1028:	00000003 	andeq	r0, r0, r3
    102c:	00038320 	andeq	r8, r3, r0, lsr #6
    1030:	3eda0400 	cdpcc	4, 13, cr0, cr10, cr0, {0}
    1034:	f5000000 			; <UNDEFINED> instruction: 0xf5000000
    1038:	21000008 	tstcs	r0, r8
    103c:	000000d7 	ldrdeq	r0, [r0], -r7
    1040:	00034021 	andeq	r4, r3, r1, lsr #32
    1044:	00702100 	rsbseq	r2, r0, r0, lsl #2
    1048:	70210000 	eorvc	r0, r1, r0
    104c:	21000000 	mrscs	r0, (UNDEF: 0)
    1050:	00000070 	andeq	r0, r0, r0, ror r0
    1054:	03db2000 	bicseq	r2, fp, #0
    1058:	e8040000 	stmda	r4, {}	; <UNPREDICTABLE>
    105c:	0000003e 	andeq	r0, r0, lr, lsr r0
    1060:	0000090f 	andeq	r0, r0, pc, lsl #18
    1064:	00090f21 	andeq	r0, r9, r1, lsr #30
    1068:	00702100 	rsbseq	r2, r0, r0, lsl #2
    106c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1070:	0000c704 	andeq	ip, r0, r4, lsl #14
    1074:	04662300 	strbteq	r2, [r6], #-768	; 0x300
    1078:	f2040000 	vhadd.s8	d0, d4, d0
    107c:	00000926 	andeq	r0, r0, r6, lsr #18
    1080:	00090f21 	andeq	r0, r9, r1, lsr #30
    1084:	df230000 	svcle	0x00230000
    1088:	04000005 	streq	r0, [r0], #-5
    108c:	000937f8 	strdeq	r3, [r9], -r8
    1090:	090f2100 	stmdbeq	pc, {r8, sp}	; <UNPREDICTABLE>
    1094:	1c000000 	stcne	0, cr0, [r0], {-0}
    1098:	000004b4 			; <UNDEFINED> instruction: 0x000004b4
    109c:	ec22fb04 	stc	11, cr15, [r2], #-16
    10a0:	04000005 	streq	r0, [r0], #-5
    10a4:	000070fe 	strdeq	r7, [r0], -lr
    10a8:	03732400 	cmneq	r3, #0, 8
    10ac:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
    10b0:	00003e01 	andeq	r3, r0, r1, lsl #28
    10b4:	04a72400 	strteq	r2, [r7], #1024	; 0x400
    10b8:	0d040000 	stceq	0, cr0, [r4, #-0]
    10bc:	00007001 	andeq	r7, r0, r1
    10c0:	06422500 	strbeq	r2, [r2], -r0, lsl #10
    10c4:	15040000 	strne	r0, [r4, #-0]
    10c8:	00702101 	rsbseq	r2, r0, r1, lsl #2
    10cc:	00000000 	andeq	r0, r0, r0
    10d0:	000002f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    10d4:	06040004 	streq	r0, [r4], -r4
    10d8:	01040000 	mrseq	r0, (UNDEF: 4)
    10dc:	00000064 	andeq	r0, r0, r4, rrx
    10e0:	0006f001 	andeq	pc, r6, r1
    10e4:	00010500 	andeq	r0, r1, r0, lsl #10
    10e8:	00913c00 	addseq	r3, r1, r0, lsl #24
    10ec:	00029800 	andeq	r9, r2, r0, lsl #16
    10f0:	00044900 	andeq	r4, r4, r0, lsl #18
    10f4:	00e40200 	rsceq	r0, r4, r0, lsl #4
    10f8:	0e020000 	cdpeq	0, 0, cr0, cr2, cr0, {0}
    10fc:	00000030 	andeq	r0, r0, r0, lsr r0
    1100:	f4080103 	vst4.8	{d0,d2,d4,d6}, [r8], r3
    1104:	03000000 	movweq	r0, #0
    1108:	01590502 	cmpeq	r9, r2, lsl #10
    110c:	72020000 	andvc	r0, r2, #0
    1110:	02000001 	andeq	r0, r0, #1
    1114:	00004912 	andeq	r4, r0, r2, lsl r9
    1118:	05040400 	streq	r0, [r4, #-1024]	; 0x400
    111c:	00746e69 	rsbseq	r6, r4, r9, ror #28
    1120:	00050803 	andeq	r0, r5, r3, lsl #16
    1124:	02000000 	andeq	r0, r0, #0
    1128:	000000e3 	andeq	r0, r0, r3, ror #1
    112c:	00621602 	rsbeq	r1, r2, r2, lsl #12
    1130:	01030000 	mrseq	r0, (UNDEF: 3)
    1134:	0000eb08 	andeq	lr, r0, r8, lsl #22
    1138:	07020300 	streq	r0, [r2, -r0, lsl #6]
    113c:	0000012c 	andeq	r0, r0, ip, lsr #2
    1140:	00017102 	andeq	r7, r1, r2, lsl #2
    1144:	7b1a0200 	blvc	68194c <__user_program+0x38194c>
    1148:	03000000 	movweq	r0, #0
    114c:	003b0704 	eorseq	r0, fp, r4, lsl #14
    1150:	ab020000 	blge	81158 <__bss_end+0x71158>
    1154:	02000006 	andeq	r0, r0, #6
    1158:	00008d1c 	andeq	r8, r0, ip, lsl sp
    115c:	07080300 	streq	r0, [r8, -r0, lsl #6]
    1160:	00000031 	andeq	r0, r0, r1, lsr r0
    1164:	0006c002 	andeq	ip, r6, r2
    1168:	9f130300 	svcls	0x00130300
    116c:	05000000 	streq	r0, [r0, #-0]
    1170:	000006be 			; <UNDEFINED> instruction: 0x000006be
    1174:	b6000404 	strlt	r0, [r0], -r4, lsl #8
    1178:	06000000 	streq	r0, [r0], -r0
    117c:	00000705 	andeq	r0, r0, r5, lsl #14
    1180:	000000b6 	strheq	r0, [r0], -r6
    1184:	04070000 	streq	r0, [r7], #-0
    1188:	0006b408 	andeq	fp, r6, r8, lsl #8
    118c:	3c210100 	stfccs	f0, [r1], #-0
    1190:	e0000091 	mul	r0, r1, r0
    1194:	01000000 	mrseq	r0, (UNDEF: 0)
    1198:	00012a9c 	muleq	r1, ip, sl
    119c:	06e40900 	strbteq	r0, [r4], r0, lsl #18
    11a0:	21010000 	mrscs	r0, (UNDEF: 1)
    11a4:	00000057 	andeq	r0, r0, r7, asr r0
    11a8:	0000082c 	andeq	r0, r0, ip, lsr #16
    11ac:	6d756e0a 	ldclvs	14, cr6, [r5, #-40]!	; 0xffffffd8
    11b0:	82210100 	eorhi	r0, r1, #0, 2
    11b4:	4d000000 	stcmi	0, cr0, [r0, #-0]
    11b8:	0b000008 	bleq	11e0 <__start-0x6e20>
    11bc:	000006dd 	ldrdeq	r0, [r0], -sp
    11c0:	012a2201 	teqeq	sl, r1, lsl #4
    11c4:	08850000 	stmeq	r5, {}	; <UNPREDICTABLE>
    11c8:	620c0000 	andvs	r0, ip, #0
    11cc:	01006675 	tsteq	r0, r5, ror r6
    11d0:	00013023 	andeq	r3, r1, r3, lsr #32
    11d4:	58910200 	ldmpl	r1, {r9}
    11d8:	7274700d 	rsbsvc	r7, r4, #13
    11dc:	2a240100 	bcs	9015e4 <__user_program+0x6015e4>
    11e0:	bc000001 	stclt	0, cr0, [r0], {1}
    11e4:	0e000008 	cdpeq	0, 0, cr0, cr0, cr8, {0}
    11e8:	000091f0 	strdeq	r9, [r0], -r0
    11ec:	000002e6 	andeq	r0, r0, r6, ror #5
    11f0:	0092080e 	addseq	r0, r2, lr, lsl #16
    11f4:	0002e600 	andeq	lr, r2, r0, lsl #12
    11f8:	040f0000 	streq	r0, [pc], #-0	; 1200 <__start-0x6e00>
    11fc:	00000025 	andeq	r0, r0, r5, lsr #32
    1200:	00002510 	andeq	r2, r0, r0, lsl r5
    1204:	00014000 	andeq	r4, r1, r0
    1208:	01401100 	mrseq	r1, (UNDEF: 80)
    120c:	00070000 	andeq	r0, r7, r0
    1210:	78070403 	stmdavc	r7, {r0, r1, sl}
    1214:	12000002 	andne	r0, r0, #2
    1218:	000006e9 	andeq	r0, r0, r9, ror #13
    121c:	00493f01 	subeq	r3, r9, r1, lsl #30
    1220:	921c0000 	andsls	r0, ip, #0
    1224:	01b80000 			; <UNDEFINED> instruction: 0x01b80000
    1228:	9c010000 	stcls	0, cr0, [r1], {-0}
    122c:	000002b5 			; <UNDEFINED> instruction: 0x000002b5
    1230:	746d660a 	strbtvc	r6, [sp], #-1546	; 0x60a
    1234:	b53f0100 	ldrlt	r0, [pc, #-256]!	; 113c <__start-0x6ec4>
    1238:	24000002 	strcs	r0, [r0], #-2
    123c:	13000009 	movwne	r0, #9
    1240:	0004f414 	andeq	pc, r4, r4, lsl r4	; <UNPREDICTABLE>
    1244:	94400100 	strbls	r0, [r0], #-256	; 0x100
    1248:	02000000 	andeq	r0, r0, #0
    124c:	00155491 	mulseq	r5, r1, r4
    1250:	a7000000 	strge	r0, [r0, -r0]
    1254:	0d000001 	stceq	0, cr0, [r0, #-4]
    1258:	006d756e 	rsbeq	r7, sp, lr, ror #10
    125c:	00706101 	rsbseq	r6, r0, r1, lsl #2
    1260:	095b0000 	ldmdbeq	fp, {}^	; <UNPREDICTABLE>
    1264:	34160000 	ldrcc	r0, [r6], #-0
    1268:	b8000093 	stmdalt	r0, {r0, r1, r4, r7}
    126c:	17000000 	strne	r0, [r0, -r0]
    1270:	78025001 	stmdavc	r2, {r0, ip, lr}
    1274:	15000000 	strne	r0, [r0, #-0]
    1278:	00000018 	andeq	r0, r0, r8, lsl r0
    127c:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    1280:	6d756e0d 	ldclvs	14, cr6, [r5, #-52]!	; 0xffffffcc
    1284:	70680100 	rsbvc	r0, r8, r0, lsl #2
    1288:	7a000000 	bvc	1290 <__start-0x6d70>
    128c:	16000009 	strne	r0, [r0], -r9
    1290:	00009354 	andeq	r9, r0, r4, asr r3
    1294:	000000b8 	strheq	r0, [r0], -r8
    1298:	02500117 	subseq	r0, r0, #-1073741819	; 0xc0000005
    129c:	00000077 	andeq	r0, r0, r7, ror r0
    12a0:	0092b018 	addseq	fp, r2, r8, lsl r0
    12a4:	00004800 	andeq	r4, r0, r0, lsl #16
    12a8:	00022300 	andeq	r2, r2, r0, lsl #6
    12ac:	756e0d00 	strbvc	r0, [lr, #-3328]!	; 0xd00
    12b0:	5001006d 	andpl	r0, r1, sp, rrx
    12b4:	0000003e 	andeq	r0, r0, lr, lsr r0
    12b8:	00000999 	muleq	r0, r9, r9
    12bc:	0092d019 	addseq	sp, r2, r9, lsl r0
    12c0:	0002e600 	andeq	lr, r2, r0, lsl #12
    12c4:	00020000 	andeq	r0, r2, r0
    12c8:	50011700 	andpl	r1, r1, r0, lsl #14
    12cc:	002d0802 	eoreq	r0, sp, r2, lsl #16
    12d0:	0092e019 	addseq	lr, r2, r9, lsl r0
    12d4:	0000b800 	andeq	fp, r0, r0, lsl #16
    12d8:	00021300 	andeq	r1, r2, r0, lsl #6
    12dc:	50011700 	andpl	r1, r1, r0, lsl #14
    12e0:	16003a01 	strne	r3, [r0], -r1, lsl #20
    12e4:	000092f4 	strdeq	r9, [r0], -r4
    12e8:	000000b8 	strheq	r0, [r0], -r8
    12ec:	01500117 	cmpeq	r0, r7, lsl r1
    12f0:	1800003a 	stmdane	r0, {r1, r3, r4, r5}
    12f4:	000092f8 	strdeq	r9, [r0], -r8
    12f8:	00000020 	andeq	r0, r0, r0, lsr #32
    12fc:	0000024f 	andeq	r0, r0, pc, asr #4
    1300:	6d756e0d 	ldclvs	14, cr6, [r5, #-52]!	; 0xffffffcc
    1304:	705b0100 	subsvc	r0, fp, r0, lsl #2
    1308:	ac000000 	stcge	0, cr0, [r0], {-0}
    130c:	16000009 	strne	r0, [r0], -r9
    1310:	00009314 	andeq	r9, r0, r4, lsl r3
    1314:	000000b8 	strheq	r0, [r0], -r8
    1318:	01500117 	cmpeq	r0, r7, lsl r1
    131c:	1800003a 	stmdane	r0, {r1, r3, r4, r5}
    1320:	00009358 	andeq	r9, r0, r8, asr r3
    1324:	00000030 	andeq	r0, r0, r0, lsr r0
    1328:	00000275 	andeq	r0, r0, r5, ror r2
    132c:	0006a20b 	andeq	sl, r6, fp, lsl #4
    1330:	2a6e0100 	bcs	1b81738 <__user_program+0x1881738>
    1334:	cb000001 	blgt	1340 <__start-0x6cc0>
    1338:	0e000009 	cdpeq	0, 0, cr0, cr0, cr9, {0}
    133c:	00009378 	andeq	r9, r0, r8, ror r3
    1340:	000002e6 	andeq	r0, r0, r6, ror #5
    1344:	93881800 	orrls	r1, r8, #0, 16
    1348:	00180000 	andseq	r0, r8, r0
    134c:	029b0000 	addseq	r0, fp, #0
    1350:	380b0000 	stmdacc	fp, {}	; <UNPREDICTABLE>
    1354:	01000007 	tsteq	r0, r7
    1358:	00003e77 	andeq	r3, r0, r7, ror lr
    135c:	0009eb00 	andeq	lr, r9, r0, lsl #22
    1360:	939c0e00 	orrsls	r0, ip, #0, 28
    1364:	02e60000 	rsceq	r0, r6, #0
    1368:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    136c:	00009254 	andeq	r9, r0, r4, asr r2
    1370:	000002e6 	andeq	r0, r0, r6, ror #5
    1374:	0093a816 	addseq	sl, r3, r6, lsl r8
    1378:	0002e600 	andeq	lr, r2, r0, lsl #12
    137c:	50011700 	andpl	r1, r1, r0, lsl #14
    1380:	00250802 	eoreq	r0, r5, r2, lsl #16
    1384:	bb040f00 	bllt	104f8c <__bss_end+0xf4f8c>
    1388:	1a000002 	bne	1398 <__start-0x6c68>
    138c:	00000030 	andeq	r0, r0, r0, lsr r0
    1390:	00003010 	andeq	r3, r0, r0, lsl r0
    1394:	0002d000 	andeq	sp, r2, r0
    1398:	01401100 	mrseq	r1, (UNDEF: 80)
    139c:	00100000 	andseq	r0, r0, r0
    13a0:	0006d614 	andeq	sp, r6, r4, lsl r6
    13a4:	e1180100 	tst	r8, r0, lsl #2
    13a8:	05000002 	streq	r0, [r0, #-2]
    13ac:	00c00803 	sbceq	r0, r0, r3, lsl #16
    13b0:	02c01a00 	sbceq	r1, r0, #0, 20
    13b4:	c81b0000 	ldmdagt	fp, {}	; <UNPREDICTABLE>
    13b8:	05000006 	streq	r0, [r0, #-6]
    13bc:	00571c3d 	subseq	r1, r7, sp, lsr ip
    13c0:	00000000 	andeq	r0, r0, r0
    13c4:	000000bf 	strheq	r0, [r0], -pc	; <UNPREDICTABLE>
    13c8:	076e0004 	strbeq	r0, [lr, -r4]!
    13cc:	01040000 	mrseq	r0, (UNDEF: 4)
    13d0:	00000064 	andeq	r0, r0, r4, rrx
    13d4:	00071b01 	andeq	r1, r7, r1, lsl #22
    13d8:	00010500 	andeq	r0, r1, r0, lsl #10
    13dc:	0093d400 	addseq	sp, r3, r0, lsl #8
    13e0:	0000a800 	andeq	sl, r0, r0, lsl #16
    13e4:	00052f00 	andeq	r2, r5, r0, lsl #30
    13e8:	08010200 	stmdaeq	r1, {r9}
    13ec:	000000f4 	strdeq	r0, [r0], -r4
    13f0:	59050202 	stmdbpl	r5, {r1, r9}
    13f4:	03000001 	movweq	r0, #1
    13f8:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
    13fc:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
    1400:	00000005 	andeq	r0, r0, r5
    1404:	08010200 	stmdaeq	r1, {r9}
    1408:	000000eb 	andeq	r0, r0, fp, ror #1
    140c:	2c070202 	sfmcs	f0, 4, [r7], {2}
    1410:	04000001 	streq	r0, [r0], #-1
    1414:	00000171 	andeq	r0, r0, r1, ror r1
    1418:	005a1a02 	subseq	r1, sl, r2, lsl #20
    141c:	04020000 	streq	r0, [r2], #-0
    1420:	00003b07 	andeq	r3, r0, r7, lsl #22
    1424:	07080200 	streq	r0, [r8, -r0, lsl #4]
    1428:	00000031 	andeq	r0, r0, r1, lsr r0
    142c:	00070f05 	andeq	r0, r7, r5, lsl #30
    1430:	d40e0100 	strle	r0, [lr], #-256	; 0x100
    1434:	4c000093 	stcmi	0, cr0, [r0], {147}	; 0x93
    1438:	01000000 	mrseq	r0, (UNDEF: 0)
    143c:	00008b9c 	muleq	r0, ip, fp
    1440:	070a0600 	streq	r0, [sl, -r0, lsl #12]
    1444:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
    1448:	00000033 	andeq	r0, r0, r3, lsr r0
    144c:	07005001 	streq	r5, [r0, -r1]
    1450:	00000621 	andeq	r0, r0, r1, lsr #12
    1454:	94201801 	strtls	r1, [r0], #-2049	; 0x801
    1458:	00300000 	eorseq	r0, r0, r0
    145c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1460:	0003b608 	andeq	fp, r3, r8, lsl #12
    1464:	33200100 	teqcc	r0, #0, 2
    1468:	50000000 	andpl	r0, r0, r0
    146c:	14000094 	strne	r0, [r0], #-148	; 0x94
    1470:	01000000 	mrseq	r0, (UNDEF: 0)
    1474:	0359079c 	cmpeq	r9, #156, 14	; 0x2700000
    1478:	26010000 	strcs	r0, [r1], -r0
    147c:	00009464 	andeq	r9, r0, r4, ror #8
    1480:	00000018 	andeq	r0, r0, r8, lsl r0
    1484:	60009c01 	andvs	r9, r0, r1, lsl #24
    1488:	04000001 	streq	r0, [r0], #-1
    148c:	00080000 	andeq	r0, r8, r0
    1490:	64010400 	strvs	r0, [r1], #-1024	; 0x400
    1494:	01000000 	mrseq	r0, (UNDEF: 0)
    1498:	0000074a 	andeq	r0, r0, sl, asr #14
    149c:	00000105 	andeq	r0, r0, r5, lsl #2
    14a0:	0000947c 	andeq	r9, r0, ip, ror r4
    14a4:	000000d8 	ldrdeq	r0, [r0], -r8
    14a8:	0000059e 	muleq	r0, lr, r5
    14ac:	f4080102 	vst4.8	{d0,d2,d4,d6}, [r8], r2
    14b0:	02000000 	andeq	r0, r0, #0
    14b4:	01590502 	cmpeq	r9, r2, lsl #10
    14b8:	04030000 	streq	r0, [r3], #-0
    14bc:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
    14c0:	05080200 	streq	r0, [r8, #-512]	; 0x200
    14c4:	00000000 	andeq	r0, r0, r0
    14c8:	0000e304 	andeq	lr, r0, r4, lsl #6
    14cc:	4c160200 	lfmmi	f0, 4, [r6], {-0}
    14d0:	02000000 	andeq	r0, r0, #0
    14d4:	00eb0801 	rsceq	r0, fp, r1, lsl #16
    14d8:	02020000 	andeq	r0, r2, #0
    14dc:	00012c07 	andeq	r2, r1, r7, lsl #24
    14e0:	01710400 	cmneq	r1, r0, lsl #8
    14e4:	1a020000 	bne	814ec <__bss_end+0x714ec>
    14e8:	00000065 	andeq	r0, r0, r5, rrx
    14ec:	3b070402 	blcc	1c24fc <__end+0x914fc>
    14f0:	02000000 	andeq	r0, r0, #0
    14f4:	00310708 	eorseq	r0, r1, r8, lsl #14
    14f8:	98050000 	stmdals	r5, {}	; <UNPREDICTABLE>
    14fc:	01000002 	tsteq	r0, r2
    1500:	00947c0f 	addseq	r7, r4, pc, lsl #24
    1504:	00007400 	andeq	r7, r0, r0, lsl #8
    1508:	f29c0100 	vaddw.s16	q0, q6, d0
    150c:	06000000 	streq	r0, [r0], -r0
    1510:	0000073d 	andeq	r0, r0, sp, lsr r7
    1514:	005a1b01 	subseq	r1, sl, r1, lsl #22
    1518:	010e0000 	mrseq	r0, (UNDEF: 14)
    151c:	00948c07 	addseq	r8, r4, r7, lsl #24
    1520:	00013b00 	andeq	r3, r1, r0, lsl #22
    1524:	0000ad00 	andeq	sl, r0, r0, lsl #26
    1528:	51010800 	tstpl	r1, r0, lsl #16
    152c:	01083001 	tsteq	r8, r1
    1530:	003f0150 	eorseq	r0, pc, r0, asr r1	; <UNPREDICTABLE>
    1534:	00949807 	addseq	r9, r4, r7, lsl #16
    1538:	00013b00 	andeq	r3, r1, r0, lsl #22
    153c:	0000c500 	andeq	ip, r0, r0, lsl #10
    1540:	51010800 	tstpl	r1, r0, lsl #16
    1544:	01083001 	tsteq	r8, r1
    1548:	003e0150 	eorseq	r0, lr, r0, asr r1
    154c:	0094a407 	addseq	sl, r4, r7, lsl #8
    1550:	00015100 	andeq	r5, r1, r0, lsl #2
    1554:	0000dd00 	andeq	sp, r0, r0, lsl #26
    1558:	51010800 	tstpl	r1, r0, lsl #16
    155c:	01083201 	tsteq	r8, r1, lsl #4
    1560:	003f0150 	eorseq	r0, pc, r0, asr r1	; <UNPREDICTABLE>
    1564:	0094b009 	addseq	fp, r4, r9
    1568:	00015100 	andeq	r5, r1, r0, lsl #2
    156c:	51010800 	tstpl	r1, r0, lsl #16
    1570:	01083201 	tsteq	r8, r1, lsl #4
    1574:	003e0150 	eorseq	r0, lr, r0, asr r1
    1578:	075d0a00 	ldrbeq	r0, [sp, -r0, lsl #20]
    157c:	20010000 	andcs	r0, r1, r0
    1580:	000094f0 	strdeq	r9, [r0], -r0
    1584:	00000018 	andeq	r0, r0, r8, lsl r0
    1588:	c8059c01 	stmdagt	r5, {r0, sl, fp, ip, pc}
    158c:	01000006 	tsteq	r0, r6
    1590:	00950824 	addseq	r0, r5, r4, lsr #16
    1594:	00002400 	andeq	r2, r0, r0, lsl #8
    1598:	269c0100 	ldrcs	r0, [ip], r0, lsl #2
    159c:	0b000001 	bleq	15a8 <__start-0x6a58>
    15a0:	00000738 	andeq	r0, r0, r8, lsr r7
    15a4:	00412401 	subeq	r2, r1, r1, lsl #8
    15a8:	50010000 	andpl	r0, r1, r0
    15ac:	072f0c00 	streq	r0, [pc, -r0, lsl #24]!
    15b0:	29010000 	stmdbcs	r1, {}	; <UNPREDICTABLE>
    15b4:	00000041 	andeq	r0, r0, r1, asr #32
    15b8:	0000952c 	andeq	r9, r0, ip, lsr #10
    15bc:	00000028 	andeq	r0, r0, r8, lsr #32
    15c0:	630d9c01 	movwvs	r9, #56321	; 0xdc01
    15c4:	03000001 	movweq	r0, #1
    15c8:	0001514b 	andeq	r5, r1, fp, asr #2
    15cc:	00410e00 	subeq	r0, r1, r0, lsl #28
    15d0:	410e0000 	mrsmi	r0, (UNDEF: 14)
    15d4:	00000000 	andeq	r0, r0, r0
    15d8:	00014d0f 	andeq	r4, r1, pc, lsl #26
    15dc:	0e370300 	cdpeq	3, 3, cr0, cr7, cr0, {0}
    15e0:	00000041 	andeq	r0, r0, r1, asr #32
    15e4:	0000410e 	andeq	r4, r0, lr, lsl #2
    15e8:	f6000000 			; <UNDEFINED> instruction: 0xf6000000
    15ec:	04000009 	streq	r0, [r0], #-9
    15f0:	0008f000 	andeq	pc, r8, r0
    15f4:	64010400 	strvs	r0, [r1], #-1024	; 0x400
    15f8:	01000000 	mrseq	r0, (UNDEF: 0)
    15fc:	000007c5 	andeq	r0, r0, r5, asr #15
    1600:	00000786 	andeq	r0, r0, r6, lsl #15
    1604:	00009554 	andeq	r9, r0, r4, asr r5
    1608:	00000a4c 	andeq	r0, r0, ip, asr #20
    160c:	00000627 	andeq	r0, r0, r7, lsr #12
    1610:	f4080102 	vst4.8	{d0,d2,d4,d6}, [r8], r2
    1614:	02000000 	andeq	r0, r0, #0
    1618:	01590502 	cmpeq	r9, r2, lsl #10
    161c:	04030000 	streq	r0, [r3], #-0
    1620:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
    1624:	05080200 	streq	r0, [r8, #-512]	; 0x200
    1628:	00000000 	andeq	r0, r0, r0
    162c:	0000e304 	andeq	lr, r0, r4, lsl #6
    1630:	4c160200 	lfmmi	f0, 4, [r6], {-0}
    1634:	02000000 	andeq	r0, r0, #0
    1638:	00eb0801 	rsceq	r0, fp, r1, lsl #16
    163c:	02020000 	andeq	r0, r2, #0
    1640:	00012c07 	andeq	r2, r1, r7, lsl #24
    1644:	01710400 	cmneq	r1, r0, lsl #8
    1648:	1a020000 	bne	81650 <__bss_end+0x71650>
    164c:	00000065 	andeq	r0, r0, r5, rrx
    1650:	3b070402 	blcc	1c2660 <__end+0x91660>
    1654:	02000000 	andeq	r0, r0, #0
    1658:	00310708 	eorseq	r0, r1, r8, lsl #14
    165c:	ac050000 	stcge	0, cr0, [r5], {-0}
    1660:	10000005 	andne	r0, r0, r5
    1664:	00bc0403 	adcseq	r0, ip, r3, lsl #8
    1668:	a2060000 	andge	r0, r6, #0
    166c:	03000002 	movweq	r0, #2
    1670:	00004105 	andeq	r4, r0, r5, lsl #2
    1674:	29060000 	stmdbcs	r6, {}	; <UNPREDICTABLE>
    1678:	03000005 	movweq	r0, #5
    167c:	00004106 	andeq	r4, r0, r6, lsl #2
    1680:	de060100 	adfles	f0, f6, f0
    1684:	03000004 	movweq	r0, #4
    1688:	00005a07 	andeq	r5, r0, r7, lsl #20
    168c:	5f060400 	svcpl	0x00060400
    1690:	03000004 	movweq	r0, #4
    1694:	00005a08 	andeq	r5, r0, r8, lsl #20
    1698:	f2060800 	vadd.i8	d0, d6, d0
    169c:	03000002 	movweq	r0, #2
    16a0:	00005a09 	andeq	r5, r0, r9, lsl #20
    16a4:	04000c00 	streq	r0, [r0], #-3072	; 0xc00
    16a8:	00000530 	andeq	r0, r0, r0, lsr r5
    16ac:	00c70a03 	sbceq	r0, r7, r3, lsl #20
    16b0:	73070000 	movwvc	r0, #28672	; 0x7000
    16b4:	04000000 	streq	r0, [r0], #-0
    16b8:	000003e6 	andeq	r0, r0, r6, ror #7
    16bc:	00d73e04 	sbcseq	r3, r7, r4, lsl #28
    16c0:	04080000 	streq	r0, [r8], #-0
    16c4:	000000dd 	ldrdeq	r0, [r0], -sp
    16c8:	04840509 	streq	r0, [r4], #1289	; 0x509
    16cc:	04740000 	ldrbteq	r0, [r4], #-0
    16d0:	00025441 	andeq	r5, r2, r1, asr #8
    16d4:	05220600 	streq	r0, [r2, #-1536]!	; 0x600
    16d8:	43040000 	movwmi	r0, #16384	; 0x4000
    16dc:	00000041 	andeq	r0, r0, r1, asr #32
    16e0:	07fd0600 	ldrbeq	r0, [sp, r0, lsl #12]!
    16e4:	44040000 	strmi	r0, [r4], #-0
    16e8:	00000041 	andeq	r0, r0, r1, asr #32
    16ec:	064c0601 	strbeq	r0, [ip], -r1, lsl #12
    16f0:	45040000 	strmi	r0, [r4, #-0]
    16f4:	00000041 	andeq	r0, r0, r1, asr #32
    16f8:	03910602 	orrseq	r0, r1, #2097152	; 0x200000
    16fc:	46040000 	strmi	r0, [r4], -r0
    1700:	0000005a 	andeq	r0, r0, sl, asr r0
    1704:	04c40604 	strbeq	r0, [r4], #1540	; 0x604
    1708:	47040000 	strmi	r0, [r4, -r0]
    170c:	0000005a 	andeq	r0, r0, sl, asr r0
    1710:	05a00608 	streq	r0, [r0, #1544]!	; 0x608
    1714:	48040000 	stmdami	r4, {}	; <UNPREDICTABLE>
    1718:	0000005a 	andeq	r0, r0, sl, asr r0
    171c:	0509060c 	streq	r0, [r9, #-1548]	; 0x60c
    1720:	49040000 	stmdbmi	r4, {}	; <UNPREDICTABLE>
    1724:	0000005a 	andeq	r0, r0, sl, asr r0
    1728:	6e660a10 	mcrvs	10, 3, r0, cr6, cr0, {0}
    172c:	5a4a0400 	bpl	1282734 <__user_program+0xf82734>
    1730:	14000000 	strne	r0, [r0], #-0
    1734:	0003c706 	andeq	ip, r3, r6, lsl #14
    1738:	5a4b0400 	bpl	12c2740 <__user_program+0xfc2740>
    173c:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    1740:	00062c06 	andeq	r2, r6, r6, lsl #24
    1744:	5a4c0400 	bpl	130274c <__user_program+0x100274c>
    1748:	1c000000 	stcne	0, cr0, [r0], {-0}
    174c:	00053f06 	andeq	r3, r5, r6, lsl #30
    1750:	5a4e0400 	bpl	1382758 <__user_program+0x1082758>
    1754:	20000000 	andcs	r0, r0, r0
    1758:	00068106 	andeq	r8, r6, r6, lsl #2
    175c:	5a510400 	bpl	1442764 <__user_program+0x1142764>
    1760:	24000000 	strcs	r0, [r0], #-0
    1764:	0005f506 	andeq	pc, r5, r6, lsl #10
    1768:	5a520400 	bpl	1482770 <__user_program+0x1182770>
    176c:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
    1770:	3231720a 	eorscc	r7, r1, #-1610612736	; 0xa0000000
    1774:	5a530400 	bpl	14c277c <__user_program+0x11c277c>
    1778:	2c000000 	stccs	0, cr0, [r0], {-0}
    177c:	3131720a 	teqcc	r1, sl, lsl #4
    1780:	5a540400 	bpl	1502788 <__user_program+0x1202788>
    1784:	30000000 	andcc	r0, r0, r0
    1788:	3031720a 	eorscc	r7, r1, sl, lsl #4
    178c:	5a550400 	bpl	1542794 <__user_program+0x1242794>
    1790:	34000000 	strcc	r0, [r0], #-0
    1794:	0039720a 	eorseq	r7, r9, sl, lsl #4
    1798:	005a5604 	subseq	r5, sl, r4, lsl #12
    179c:	0a380000 	beq	e017a4 <__user_program+0xb017a4>
    17a0:	04003872 	streq	r3, [r0], #-2162	; 0x872
    17a4:	00005a57 	andeq	r5, r0, r7, asr sl
    17a8:	720a3c00 	andvc	r3, sl, #0, 24
    17ac:	58040037 	stmdapl	r4, {r0, r1, r2, r4, r5}
    17b0:	0000005a 	andeq	r0, r0, sl, asr r0
    17b4:	36720a40 	ldrbtcc	r0, [r2], -r0, asr #20
    17b8:	5a590400 	bpl	16427c0 <__user_program+0x13427c0>
    17bc:	44000000 	strmi	r0, [r0], #-0
    17c0:	0035720a 	eorseq	r7, r5, sl, lsl #4
    17c4:	005a5a04 	subseq	r5, sl, r4, lsl #20
    17c8:	0a480000 	beq	12017d0 <__user_program+0xf017d0>
    17cc:	04003472 	streq	r3, [r0], #-1138	; 0x472
    17d0:	00005a5b 	andeq	r5, r0, fp, asr sl
    17d4:	720a4c00 	andvc	r4, sl, #0, 24
    17d8:	5c040033 	stcpl	0, cr0, [r4], {51}	; 0x33
    17dc:	0000005a 	andeq	r0, r0, sl, asr r0
    17e0:	32720a50 	rsbscc	r0, r2, #80, 20	; 0x50000
    17e4:	5a5d0400 	bpl	17427ec <__user_program+0x14427ec>
    17e8:	54000000 	strpl	r0, [r0], #-0
    17ec:	0031720a 	eorseq	r7, r1, sl, lsl #4
    17f0:	005a5e04 	subseq	r5, sl, r4, lsl #28
    17f4:	0a580000 	beq	16017fc <__user_program+0x13017fc>
    17f8:	04003072 	streq	r3, [r0], #-114	; 0x72
    17fc:	00005a5f 	andeq	r5, r0, pc, asr sl
    1800:	3b065c00 	blcc	198808 <__end+0x67808>
    1804:	04000006 	streq	r0, [r0], #-6
    1808:	00005a60 	andeq	r5, r0, r0, ror #20
    180c:	81066000 	mrshi	r6, (UNDEF: 6)
    1810:	04000005 	streq	r0, [r0], #-5
    1814:	00005a61 	andeq	r5, r0, r1, ror #20
    1818:	4a066400 	bmi	19a820 <__end+0x69820>
    181c:	04000004 	streq	r0, [r0], #-4
    1820:	00005a62 	andeq	r5, r0, r2, ror #20
    1824:	38066800 	stmdacc	r6, {fp, sp, lr}
    1828:	04000005 	streq	r0, [r0], #-5
    182c:	00005a63 	andeq	r5, r0, r3, ror #20
    1830:	20066c00 	andcs	r6, r6, r0, lsl #24
    1834:	04000003 	streq	r0, [r0], #-3
    1838:	00005a64 	andeq	r5, r0, r4, ror #20
    183c:	04007000 	streq	r7, [r0], #-0
    1840:	0000036d 	andeq	r0, r0, sp, ror #6
    1844:	025f6504 	subseq	r6, pc, #4, 10	; 0x1000000
    1848:	de070000 	cdple	0, 0, cr0, cr7, cr0, {0}
    184c:	0b000000 	bleq	1854 <__start-0x67ac>
    1850:	000004e7 	andeq	r0, r0, r7, ror #9
    1854:	95541601 	ldrbls	r1, [r4, #-1537]	; 0x601
    1858:	000c0000 	andeq	r0, ip, r0
    185c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1860:	00000292 	muleq	r0, r2, r2
    1864:	0005220c 	andeq	r2, r5, ip, lsl #4
    1868:	33160100 	tstcc	r6, #0, 2
    186c:	ff000000 			; <UNDEFINED> instruction: 0xff000000
    1870:	0d000009 	stceq	0, cr0, [r0, #-36]	; 0xffffffdc
    1874:	0000955c 	andeq	r9, r0, ip, asr r5
    1878:	00000975 	andeq	r0, r0, r5, ror r9
    187c:	05140e00 	ldreq	r0, [r4, #-3584]	; 0xe00
    1880:	1d010000 	stcne	0, cr0, [r1, #-0]
    1884:	00000033 	andeq	r0, r0, r3, lsr r0
    1888:	00009560 	andeq	r9, r0, r0, ror #10
    188c:	00000048 	andeq	r0, r0, r8, asr #32
    1890:	02ef9c01 	rsceq	r9, pc, #256	; 0x100
    1894:	780c0000 	stmdavc	ip, {}	; <UNPREDICTABLE>
    1898:	01000007 	tsteq	r0, r7
    189c:	0000331d 	andeq	r3, r0, sp, lsl r3
    18a0:	000a2000 	andeq	r2, sl, r0
    18a4:	74700f00 	ldrbtvc	r0, [r0], #-3840	; 0xf00
    18a8:	1d010072 	stcne	0, cr0, [r1, #-456]	; 0xfffffe38
    18ac:	000002ef 	andeq	r0, r0, pc, ror #5
    18b0:	00000a73 	andeq	r0, r0, r3, ror sl
    18b4:	6e656c0f 	cdpvs	12, 6, cr6, cr5, cr15, {0}
    18b8:	331d0100 	tstcc	sp, #0, 2
    18bc:	9f000000 	svcls	0x00000000
    18c0:	1000000a 	andne	r0, r0, sl
    18c4:	1f010069 	svcne	0x00010069
    18c8:	00000033 	andeq	r0, r0, r3, lsr r0
    18cc:	00000ac8 	andeq	r0, r0, r8, asr #21
    18d0:	0095880d 	addseq	r8, r5, sp, lsl #16
    18d4:	00097c00 	andeq	r7, r9, r0, lsl #24
    18d8:	04080000 	streq	r0, [r8], #-0
    18dc:	00000025 	andeq	r0, r0, r5, lsr #32
    18e0:	0006740e 	andeq	r7, r6, lr, lsl #8
    18e4:	332e0100 	teqcc	lr, #0, 2
    18e8:	a8000000 	stmdage	r0, {}	; <UNPREDICTABLE>
    18ec:	cc000095 	stcgt	0, cr0, [r0], {149}	; 0x95
    18f0:	01000000 	mrseq	r0, (UNDEF: 0)
    18f4:	0003cf9c 	muleq	r3, ip, pc	; <UNPREDICTABLE>
    18f8:	07780c00 	ldrbeq	r0, [r8, -r0, lsl #24]!
    18fc:	2e010000 	cdpcs	0, 0, cr0, cr1, cr0, {0}
    1900:	00000033 	andeq	r0, r0, r3, lsr r0
    1904:	00000b1c 	andeq	r0, r0, ip, lsl fp
    1908:	7274700f 	rsbsvc	r7, r4, #15
    190c:	ef2e0100 	svc	0x002e0100
    1910:	56000002 	strpl	r0, [r0], -r2
    1914:	0f00000b 	svceq	0x0000000b
    1918:	006e656c 	rsbeq	r6, lr, ip, ror #10
    191c:	00332e01 	eorseq	r2, r3, r1, lsl #28
    1920:	0b7f0000 	bleq	1fc1928 <__user_program+0x1cc1928>
    1924:	6f110000 	svcvs	0x00110000
    1928:	01000007 	tsteq	r0, r7
    192c:	00003330 	andeq	r3, r0, r0, lsr r3
    1930:	000ba800 	andeq	sl, fp, r0, lsl #16
    1934:	077d1100 	ldrbeq	r1, [sp, -r0, lsl #2]!
    1938:	31010000 	mrscc	r0, (UNDEF: 1)
    193c:	00000041 	andeq	r0, r0, r1, asr #32
    1940:	00000be7 	andeq	r0, r0, r7, ror #23
    1944:	0095ec12 	addseq	lr, r5, r2, lsl ip
    1948:	00097c00 	andeq	r7, r9, r0, lsl #24
    194c:	00036d00 	andeq	r6, r3, r0, lsl #26
    1950:	50011300 	andpl	r1, r1, r0, lsl #6
    1954:	00007902 	andeq	r7, r0, r2, lsl #18
    1958:	0095f412 	addseq	pc, r5, r2, lsl r4	; <UNPREDICTABLE>
    195c:	00097c00 	andeq	r7, r9, r0, lsl #24
    1960:	00038100 	andeq	r8, r3, r0, lsl #2
    1964:	50011300 	andpl	r1, r1, r0, lsl #6
    1968:	00007a02 	andeq	r7, r0, r2, lsl #20
    196c:	0095fc12 	addseq	pc, r5, r2, lsl ip	; <UNPREDICTABLE>
    1970:	00097c00 	andeq	r7, r9, r0, lsl #24
    1974:	00039500 	andeq	r9, r3, r0, lsl #10
    1978:	50011300 	andpl	r1, r1, r0, lsl #6
    197c:	00007902 	andeq	r7, r0, r2, lsl #18
    1980:	0096140d 	addseq	r1, r6, sp, lsl #8
    1984:	00098d00 	andeq	r8, r9, r0, lsl #26
    1988:	962c1200 	strtls	r1, [ip], -r0, lsl #4
    198c:	097c0000 	ldmdbeq	ip!, {}^	; <UNPREDICTABLE>
    1990:	03b10000 			; <UNDEFINED> instruction: 0x03b10000
    1994:	01130000 	tsteq	r3, r0
    1998:	003a0150 	eorseq	r0, sl, r0, asr r1
    199c:	00964412 	addseq	r4, r6, r2, lsl r4
    19a0:	00097c00 	andeq	r7, r9, r0, lsl #24
    19a4:	0003c500 	andeq	ip, r3, r0, lsl #10
    19a8:	50011300 	andpl	r1, r1, r0, lsl #6
    19ac:	00007402 	andeq	r7, r0, r2, lsl #8
    19b0:	00964c0d 	addseq	r4, r6, sp, lsl #24
    19b4:	00098d00 	andeq	r8, r9, r0, lsl #26
    19b8:	830e0000 	movwhi	r0, #57344	; 0xe000
    19bc:	01000003 	tsteq	r0, r3
    19c0:	00003353 	andeq	r3, r0, r3, asr r3
    19c4:	00967400 	addseq	r7, r6, r0, lsl #8
    19c8:	0000cc00 	andeq	ip, r0, r0, lsl #24
    19cc:	2e9c0100 	fmlcse	f0, f4, f0
    19d0:	0f000004 	svceq	0x00000004
    19d4:	01006e66 	tsteq	r0, r6, ror #28
    19d8:	0000cc53 	andeq	ip, r0, r3, asr ip
    19dc:	000c1000 	andeq	r1, ip, r0
    19e0:	083f0c00 	ldmdaeq	pc!, {sl, fp}	; <UNPREDICTABLE>
    19e4:	53010000 	movwpl	r0, #4096	; 0x1000
    19e8:	0000042e 	andeq	r0, r0, lr, lsr #8
    19ec:	00000c52 	andeq	r0, r0, r2, asr ip
    19f0:	0004e20c 	andeq	lr, r4, ip, lsl #4
    19f4:	65530100 	ldrbvs	r0, [r3, #-256]	; 0x100
    19f8:	86000000 	strhi	r0, [r0], -r0
    19fc:	0f00000c 	svceq	0x0000000c
    1a00:	54010043 	strpl	r0, [r1], #-67	; 0x43
    1a04:	00000065 	andeq	r0, r0, r5, rrx
    1a08:	00000cb2 			; <UNDEFINED> instruction: 0x00000cb2
    1a0c:	01005414 	tsteq	r0, r4, lsl r4
    1a10:	00006554 	andeq	r6, r0, r4, asr r5
    1a14:	00910200 	addseq	r0, r1, r0, lsl #4
    1a18:	5a040800 	bpl	103a20 <__bss_end+0xf3a20>
    1a1c:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    1a20:	00000453 	andeq	r0, r0, r3, asr r4
    1a24:	00334b01 	eorseq	r4, r3, r1, lsl #22
    1a28:	97400000 	strbls	r0, [r0, -r0]
    1a2c:	006c0000 	rsbeq	r0, ip, r0
    1a30:	9c010000 	stcls	0, cr0, [r1], {-0}
    1a34:	000004ab 	andeq	r0, r0, fp, lsr #9
    1a38:	0008110c 	andeq	r1, r8, ip, lsl #2
    1a3c:	cc4b0100 	stfgte	f0, [fp], {-0}
    1a40:	de000000 	cdple	0, 0, cr0, cr0, cr0, {0}
    1a44:	0c00000c 	stceq	0, cr0, [r0], {12}
    1a48:	0000083a 	andeq	r0, r0, sl, lsr r8
    1a4c:	042e4b01 	strteq	r4, [lr], #-2817	; 0xb01
    1a50:	0cfc0000 	ldcleq	0, cr0, [ip]
    1a54:	8c120000 	ldchi	0, cr0, [r2], {-0}
    1a58:	98000097 	stmdals	r0, {r0, r1, r2, r4, r7}
    1a5c:	82000009 	andhi	r0, r0, #9
    1a60:	13000004 	movwne	r0, #4
    1a64:	03055001 	movweq	r5, #20481	; 0x5001
    1a68:	0000c024 	andeq	ip, r0, r4, lsr #32
    1a6c:	97a41500 	strls	r1, [r4, r0, lsl #10]!
    1a70:	03cf0000 	biceq	r0, pc, #0
    1a74:	01130000 	tsteq	r3, r0
    1a78:	00740253 	rsbseq	r0, r4, r3, asr r2
    1a7c:	01520113 	cmpeq	r2, r3, lsl r1
    1a80:	5101134f 	tstpl	r1, pc, asr #6
    1a84:	13007502 	movwne	r7, #1282	; 0x502
    1a88:	76025001 	strvc	r5, [r2], -r1
    1a8c:	7d021300 	stcvc	3, cr1, [r2, #-0]
    1a90:	00740200 	rsbseq	r0, r4, r0, lsl #4
    1a94:	db0e0000 	blle	381a9c <__user_program+0x81a9c>
    1a98:	01000003 	tsteq	r0, r3
    1a9c:	0000336e 	andeq	r3, r0, lr, ror #6
    1aa0:	0097ac00 	addseq	sl, r7, r0, lsl #24
    1aa4:	00006400 	andeq	r6, r0, r0, lsl #8
    1aa8:	e39c0100 	orrs	r0, ip, #0, 2
    1aac:	0c000004 	stceq	0, cr0, [r0], {4}
    1ab0:	000007e9 	andeq	r0, r0, r9, ror #15
    1ab4:	04e36e01 	strbteq	r6, [r3], #3585	; 0xe01
    1ab8:	0d1a0000 	ldceq	0, cr0, [sl, #-0]
    1abc:	de0c0000 	cdple	0, 0, cr0, cr12, cr0, {0}
    1ac0:	01000004 	tsteq	r0, r4
    1ac4:	0000656e 	andeq	r6, r0, lr, ror #10
    1ac8:	000d5a00 	andeq	r5, sp, r0, lsl #20
    1acc:	04080000 	streq	r0, [r8], #-0
    1ad0:	000000bc 	strheq	r0, [r0], -ip
    1ad4:	0004660b 	andeq	r6, r4, fp, lsl #12
    1ad8:	107c0100 	rsbsne	r0, ip, r0, lsl #2
    1adc:	4c000098 	stcmi	0, cr0, [r0], {152}	; 0x98
    1ae0:	01000001 	tsteq	r0, r1
    1ae4:	0005659c 	muleq	r5, ip, r5
    1ae8:	07e90c00 	strbeq	r0, [r9, r0, lsl #24]!
    1aec:	7c010000 	stcvc	0, cr0, [r1], {-0}
    1af0:	000004e3 	andeq	r0, r0, r3, ror #9
    1af4:	00000d92 	muleq	r0, r2, sp
    1af8:	00064c16 	andeq	r4, r6, r6, lsl ip
    1afc:	5a7d0100 	bpl	1f41f04 <__user_program+0x1c41f04>
    1b00:	01000000 	mrseq	r0, (UNDEF: 0)
    1b04:	00691059 	rsbeq	r1, r9, r9, asr r0
    1b08:	005a7f01 	subseq	r7, sl, r1, lsl #30
    1b0c:	0db00000 	ldceq	0, cr0, [r0]
    1b10:	30170000 	andscc	r0, r7, r0
    1b14:	52000000 	andpl	r0, r0, #0
    1b18:	11000005 	tstne	r0, r5
    1b1c:	000007e4 	andeq	r0, r0, r4, ror #15
    1b20:	04e38301 	strbteq	r8, [r3], #769	; 0x301
    1b24:	0de60000 	stcleq	0, cr0, [r6]
    1b28:	a40d0000 	strge	r0, [sp], #-0
    1b2c:	75000098 	strvc	r0, [r0, #-152]	; 0x98
    1b30:	0d000009 	stceq	0, cr0, [r0, #-36]	; 0xffffffdc
    1b34:	00009900 	andeq	r9, r0, r0, lsl #18
    1b38:	000009b9 			; <UNDEFINED> instruction: 0x000009b9
    1b3c:	993c0d00 	ldmdbls	ip!, {r8, sl, fp}
    1b40:	09750000 	ldmdbeq	r5!, {}^	; <UNPREDICTABLE>
    1b44:	580d0000 	stmdapl	sp, {}	; <UNPREDICTABLE>
    1b48:	b9000099 	stmdblt	r0, {r0, r3, r4, r7}
    1b4c:	00000009 	andeq	r0, r0, r9
    1b50:	0005df0b 	andeq	sp, r5, fp, lsl #30
    1b54:	5ca70100 	stfpls	f0, [r7]
    1b58:	14000099 	strne	r0, [r0], #-153	; 0x99
    1b5c:	01000001 	tsteq	r0, r1
    1b60:	0005fb9c 	muleq	r5, ip, fp
    1b64:	07e90c00 	strbeq	r0, [r9, r0, lsl #24]!
    1b68:	a7010000 	strge	r0, [r1, -r0]
    1b6c:	000004e3 	andeq	r0, r0, r3, ror #9
    1b70:	00000df9 	strdeq	r0, [r0], -r9
    1b74:	00082411 	andeq	r2, r8, r1, lsl r4
    1b78:	5aaa0100 	bpl	fea81f80 <__user_program+0xfe781f80>
    1b7c:	25000000 	strcs	r0, [r0, #-0]
    1b80:	1000000e 	andne	r0, r0, lr
    1b84:	ab010069 	blge	41d30 <__bss_end+0x31d30>
    1b88:	0000005a 	andeq	r0, r0, sl, asr r0
    1b8c:	00000e38 	andeq	r0, r0, r8, lsr lr
    1b90:	00004817 	andeq	r4, r0, r7, lsl r8
    1b94:	0005e800 	andeq	lr, r5, r0, lsl #16
    1b98:	07e41100 	strbeq	r1, [r4, r0, lsl #2]!
    1b9c:	ad010000 	stcge	0, cr0, [r1, #-0]
    1ba0:	000004e3 	andeq	r0, r0, r3, ror #9
    1ba4:	00000e57 	andeq	r0, r0, r7, asr lr
    1ba8:	00006018 	andeq	r6, r0, r8, lsl r0
    1bac:	07ef1100 	strbeq	r1, [pc, r0, lsl #2]!
    1bb0:	b0010000 	andlt	r0, r1, r0
    1bb4:	0000005a 	andeq	r0, r0, sl, asr r0
    1bb8:	00000e6a 	andeq	r0, r0, sl, ror #28
    1bbc:	00007818 	andeq	r7, r0, r8, lsl r8
    1bc0:	07f61100 	ldrbeq	r1, [r6, r0, lsl #2]!
    1bc4:	b4010000 	strlt	r0, [r1], #-0
    1bc8:	0000005a 	andeq	r0, r0, sl, asr r0
    1bcc:	00000e7d 	andeq	r0, r0, sp, ror lr
    1bd0:	0d000000 	stceq	0, cr0, [r0, #-0]
    1bd4:	00009968 	andeq	r9, r0, r8, ror #18
    1bd8:	00000975 	andeq	r0, r0, r5, ror r9
    1bdc:	009a680d 	addseq	r6, sl, sp, lsl #16
    1be0:	0009b900 	andeq	fp, r9, r0, lsl #18
    1be4:	73190000 	tstvc	r9, #0
    1be8:	01000003 	tsteq	r0, r3
    1bec:	000033bf 			; <UNDEFINED> instruction: 0x000033bf
    1bf0:	009a7000 	addseq	r7, sl, r0
    1bf4:	0003d400 	andeq	sp, r3, r0, lsl #8
    1bf8:	ea9c0100 	b	fe702000 <__user_program+0xfe402000>
    1bfc:	10000006 	andne	r0, r0, r6
    1c00:	ea010069 	b	41dac <__bss_end+0x31dac>
    1c04:	00000033 	andeq	r0, r0, r3, lsr r0
    1c08:	00000e90 	muleq	r0, r0, lr
    1c0c:	00076811 	andeq	r6, r7, r1, lsl r8
    1c10:	33eb0100 	mvncc	r0, #0, 2
    1c14:	af000000 	svcge	0x00000000
    1c18:	1100000e 	tstne	r0, lr
    1c1c:	000007dc 	ldrdeq	r0, [r0], -ip
    1c20:	06eaed01 	strbteq	lr, [sl], r1, lsl #26
    1c24:	0ece0000 	cdpeq	0, 12, cr0, cr14, cr0, {0}
    1c28:	84120000 	ldrhi	r0, [r2], #-0
    1c2c:	c000009a 	mulgt	r0, sl, r0
    1c30:	57000009 	strpl	r0, [r0, -r9]
    1c34:	13000006 	movwne	r0, #6
    1c38:	32015101 	andcc	r5, r1, #1073741824	; 0x40000000
    1c3c:	01500113 	cmpeq	r0, r3, lsl r1
    1c40:	90120041 	andsls	r0, r2, r1, asr #32
    1c44:	c000009a 	mulgt	r0, sl, r0
    1c48:	6f000009 	svcvs	0x00000009
    1c4c:	13000006 	movwne	r0, #6
    1c50:	32015101 	andcc	r5, r1, #1073741824	; 0x40000000
    1c54:	01500113 	cmpeq	r0, r3, lsl r1
    1c58:	9c12004a 	ldcls	0, cr0, [r2], {74}	; 0x4a
    1c5c:	c000009a 	mulgt	r0, sl, r0
    1c60:	87000009 	strhi	r0, [r0, -r9]
    1c64:	13000006 	movwne	r0, #6
    1c68:	32015101 	andcc	r5, r1, #1073741824	; 0x40000000
    1c6c:	01500113 	cmpeq	r0, r3, lsl r1
    1c70:	a8120037 	ldmdage	r2, {r0, r1, r2, r4, r5}
    1c74:	d600009a 			; <UNDEFINED> instruction: 0xd600009a
    1c78:	9f000009 	svcls	0x00000009
    1c7c:	13000006 	movwne	r0, #6
    1c80:	30015101 	andcc	r5, r1, r1, lsl #2
    1c84:	01500113 	cmpeq	r0, r3, lsl r1
    1c88:	b4120041 	ldrlt	r0, [r2], #-65	; 0x41
    1c8c:	d600009a 			; <UNDEFINED> instruction: 0xd600009a
    1c90:	b7000009 	strlt	r0, [r0, -r9]
    1c94:	13000006 	movwne	r0, #6
    1c98:	30015101 	andcc	r5, r1, r1, lsl #2
    1c9c:	01500113 	cmpeq	r0, r3, lsl r1
    1ca0:	c012004a 	andsgt	r0, r2, sl, asr #32
    1ca4:	d600009a 			; <UNDEFINED> instruction: 0xd600009a
    1ca8:	cf000009 	svcgt	0x00000009
    1cac:	13000006 	movwne	r0, #6
    1cb0:	30015101 	andcc	r5, r1, r1, lsl #2
    1cb4:	01500113 	cmpeq	r0, r3, lsl r1
    1cb8:	2c0d0037 	stccs	0, cr0, [sp], {55}	; 0x37
    1cbc:	b900009e 	stmdblt	r0, {r1, r2, r3, r4, r7}
    1cc0:	15000009 	strne	r0, [r0, #-9]
    1cc4:	00009e34 	andeq	r9, r0, r4, lsr lr
    1cc8:	000009ec 	andeq	r0, r0, ip, ror #19
    1ccc:	03500113 	cmpeq	r0, #-1073741820	; 0xc0000004
    1cd0:	0003e80a 	andeq	lr, r3, sl, lsl #16
    1cd4:	04080200 	streq	r0, [r8], #-512	; 0x200
    1cd8:	000005ca 	andeq	r0, r0, sl, asr #11
    1cdc:	0004b41a 	andeq	fp, r4, sl, lsl r4
    1ce0:	01020100 	mrseq	r0, (UNDEF: 18)
    1ce4:	00009e44 	andeq	r9, r0, r4, asr #28
    1ce8:	00000054 	andeq	r0, r0, r4, asr r0
    1cec:	ec1b9c01 	ldc	12, cr9, [fp], {1}
    1cf0:	01000005 	tsteq	r0, r5
    1cf4:	00650108 	rsbeq	r0, r5, r8, lsl #2
    1cf8:	9e980000 	cdpls	0, 9, cr0, cr8, cr0, {0}
    1cfc:	00100000 	andseq	r0, r0, r0
    1d00:	9c010000 	stcls	0, cr0, [r1], {-0}
    1d04:	0004a71b 	andeq	sl, r4, fp, lsl r7
    1d08:	010c0100 	mrseq	r0, (UNDEF: 28)
    1d0c:	00000065 	andeq	r0, r0, r5, rrx
    1d10:	00009ea8 	andeq	r9, r0, r8, lsr #29
    1d14:	00000028 	andeq	r0, r0, r8, lsr #32
    1d18:	421c9c01 	andsmi	r9, ip, #256	; 0x100
    1d1c:	01000006 	tsteq	r0, r6
    1d20:	9ed00110 	mrcls	1, 6, r0, cr0, cr0, {0}
    1d24:	00580000 	subseq	r0, r8, r0
    1d28:	9c010000 	stcls	0, cr0, [r1], {-0}
    1d2c:	00000755 	andeq	r0, r0, r5, asr r7
    1d30:	00736d1d 	rsbseq	r6, r3, sp, lsl sp
    1d34:	65011001 	strvs	r1, [r1, #-1]
    1d38:	0a000000 	beq	1d40 <__start-0x62c0>
    1d3c:	0000000f 	andeq	r0, r0, pc
    1d40:	0002bf1e 	andeq	fp, r2, lr, lsl pc
    1d44:	01190100 	tsteq	r9, r0, lsl #2
    1d48:	000007a6 	andeq	r0, r0, r6, lsr #15
    1d4c:	00009f28 	andeq	r9, r0, r8, lsr #30
    1d50:	00000058 	andeq	r0, r0, r8, asr r0
    1d54:	07a69c01 	streq	r9, [r6, r1, lsl #24]!
    1d58:	c01f0000 	andsgt	r0, pc, r0
    1d5c:	01000007 	tsteq	r0, r7
    1d60:	00330119 	eorseq	r0, r3, r9, lsl r1
    1d64:	0f370000 	svceq	0x00370000
    1d68:	06200000 	strteq	r0, [r0], -r0
    1d6c:	01000008 	tsteq	r0, r8
    1d70:	0025011a 	eoreq	r0, r5, sl, lsl r1
    1d74:	19200000 	stmdbne	r0!, {}	; <UNPREDICTABLE>
    1d78:	01000008 	tsteq	r0, r8
    1d7c:	0025011b 	eoreq	r0, r5, fp, lsl r1
    1d80:	b2210000 	eorlt	r0, r1, #0
    1d84:	01000007 	tsteq	r0, r7
    1d88:	02ef011c 	rsceq	r0, pc, #28, 2
    1d8c:	53010000 	movwpl	r0, #4096	; 0x1000
    1d90:	1e042200 	cdpne	2, 0, cr2, cr4, cr0, {0}
    1d94:	000005b7 			; <UNDEFINED> instruction: 0x000005b7
    1d98:	33012e01 	movwcc	r2, #7681	; 0x1e01
    1d9c:	80000000 	andhi	r0, r0, r0
    1da0:	0800009f 	stmdaeq	r0, {r0, r1, r2, r3, r4, r7}
    1da4:	01000000 	mrseq	r0, (UNDEF: 0)
    1da8:	0007d39c 	muleq	r7, ip, r3
    1dac:	07781f00 	ldrbeq	r1, [r8, -r0, lsl #30]!
    1db0:	2e010000 	cdpcs	0, 0, cr0, cr1, cr0, {0}
    1db4:	00003301 	andeq	r3, r0, r1, lsl #6
    1db8:	000f5800 	andeq	r5, pc, r0, lsl #16
    1dbc:	291e0000 	ldmdbcs	lr, {}	; <UNPREDICTABLE>
    1dc0:	01000003 	tsteq	r0, r3
    1dc4:	00330132 	eorseq	r0, r3, r2, lsr r1
    1dc8:	9f880000 	svcls	0x00880000
    1dcc:	00080000 	andeq	r0, r8, r0
    1dd0:	9c010000 	stcls	0, cr0, [r1], {-0}
    1dd4:	0000080b 	andeq	r0, r0, fp, lsl #16
    1dd8:	0007781f 	andeq	r7, r7, pc, lsl r8
    1ddc:	01320100 	teqeq	r2, r0, lsl #2
    1de0:	00000033 	andeq	r0, r0, r3, lsr r0
    1de4:	00000f79 	andeq	r0, r0, r9, ror pc
    1de8:	00747323 	rsbseq	r7, r4, r3, lsr #6
    1dec:	a6013201 	strge	r3, [r1], -r1, lsl #4
    1df0:	01000007 	tsteq	r0, r7
    1df4:	891e0051 	ldmdbhi	lr, {r0, r4, r6}
    1df8:	01000006 	tsteq	r0, r6
    1dfc:	00330136 	eorseq	r0, r3, r6, lsr r1
    1e00:	9f900000 	svcls	0x00900000
    1e04:	00080000 	andeq	r0, r8, r0
    1e08:	9c010000 	stcls	0, cr0, [r1], {-0}
    1e0c:	00000836 	andeq	r0, r0, r6, lsr r8
    1e10:	0007781f 	andeq	r7, r7, pc, lsl r8
    1e14:	01360100 	teqeq	r6, r0, lsl #2
    1e18:	00000033 	andeq	r0, r0, r3, lsr r0
    1e1c:	00000f9a 	muleq	r0, sl, pc	; <UNPREDICTABLE>
    1e20:	03121e00 	tsteq	r2, #0, 28
    1e24:	3a010000 	bcc	41e2c <__bss_end+0x31e2c>
    1e28:	00003301 	andeq	r3, r0, r1, lsl #6
    1e2c:	009f9800 	addseq	r9, pc, r0, lsl #16
    1e30:	00000800 	andeq	r0, r0, r0, lsl #16
    1e34:	7d9c0100 	ldfvcs	f0, [ip]
    1e38:	1f000008 	svcne	0x00000008
    1e3c:	00000778 	andeq	r0, r0, r8, ror r7
    1e40:	33013a01 	movwcc	r3, #6657	; 0x1a01
    1e44:	bb000000 	bllt	1e4c <__start-0x61b4>
    1e48:	2300000f 	movwcs	r0, #15
    1e4c:	00727470 	rsbseq	r7, r2, r0, ror r4
    1e50:	33013a01 	movwcc	r3, #6657	; 0x1a01
    1e54:	01000000 	mrseq	r0, (UNDEF: 0)
    1e58:	69642351 	stmdbvs	r4!, {r0, r4, r6, r8, r9, sp}^
    1e5c:	3a010072 	bcc	4202c <__bss_end+0x3202c>
    1e60:	00003301 	andeq	r3, r0, r1, lsl #6
    1e64:	00520100 	subseq	r0, r2, r0, lsl #2
    1e68:	00025424 	andeq	r5, r2, r4, lsr #8
    1e6c:	00088d00 	andeq	r8, r8, r0, lsl #26
    1e70:	088d2500 	stmeq	sp, {r8, sl, sp}
    1e74:	001f0000 	andseq	r0, pc, r0
    1e78:	78070402 	stmdavc	r7, {r1, sl}
    1e7c:	26000002 	strcs	r0, [r0], -r2
    1e80:	000005c5 	andeq	r0, r0, r5, asr #11
    1e84:	08a56804 	stmiaeq	r5!, {r2, fp, sp, lr}
    1e88:	03050000 	movweq	r0, #20480	; 0x5000
    1e8c:	0000e020 	andeq	lr, r0, r0, lsr #32
    1e90:	00087d07 	andeq	r7, r8, r7, lsl #26
    1e94:	08ba2400 	ldmeq	sl!, {sl, sp}
    1e98:	08ba0000 	ldmeq	sl!, {}	; <UNPREDICTABLE>
    1e9c:	8d250000 	stchi	0, cr0, [r5, #-0]
    1ea0:	1f000008 	svcne	0x00000008
    1ea4:	c7040800 	strgt	r0, [r4, -r0, lsl #16]
    1ea8:	26000000 	strcs	r0, [r0], -r0
    1eac:	000003ae 	andeq	r0, r0, lr, lsr #7
    1eb0:	08aa6a04 	stmiaeq	sl!, {r2, r9, fp, sp, lr}
    1eb4:	03050000 	movweq	r0, #20480	; 0x5000
    1eb8:	0000efa8 	andeq	lr, r0, r8, lsr #31
    1ebc:	00057526 	andeq	r7, r5, r6, lsr #10
    1ec0:	e26c0400 	rsb	r0, ip, #0, 8
    1ec4:	05000008 	streq	r0, [r0, #-8]
    1ec8:	00e01803 	rsceq	r1, r0, r3, lsl #16
    1ecc:	005a0700 	subseq	r0, sl, r0, lsl #14
    1ed0:	3e260000 	cdpcc	0, 2, cr0, cr6, cr0, {0}
    1ed4:	04000004 	streq	r0, [r0], #-4
    1ed8:	0008e26e 	andeq	lr, r8, lr, ror #4
    1edc:	14030500 	strne	r0, [r3], #-1280	; 0x500
    1ee0:	260000e0 	strcs	r0, [r0], -r0, ror #1
    1ee4:	000004d3 	ldrdeq	r0, [r0], -r3
    1ee8:	08e27004 	stmiaeq	r2!, {r2, ip, sp, lr}^
    1eec:	03050000 	movweq	r0, #20480	; 0x5000
    1ef0:	0000f028 	andeq	pc, r0, r8, lsr #32
    1ef4:	0003a026 	andeq	sl, r3, r6, lsr #32
    1ef8:	e2720400 	rsbs	r0, r2, #0, 8
    1efc:	05000008 	streq	r0, [r0, #-8]
    1f00:	00e01003 	rsceq	r1, r0, r3
    1f04:	06682600 	strbteq	r2, [r8], -r0, lsl #12
    1f08:	74040000 	strvc	r0, [r4], #-0
    1f0c:	000008e2 	andeq	r0, r0, r2, ror #17
    1f10:	e01c0305 	ands	r0, ip, r5, lsl #6
    1f14:	ea240000 	b	901f1c <__user_program+0x601f1c>
    1f18:	3b000006 	blcc	1f38 <__start-0x60c8>
    1f1c:	25000009 	strcs	r0, [r0, #-9]
    1f20:	0000088d 	andeq	r0, r0, sp, lsl #17
    1f24:	0f260020 	svceq	0x00260020
    1f28:	04000004 	streq	r0, [r0], #-4
    1f2c:	00092b76 	andeq	r2, r9, r6, ror fp
    1f30:	a0030500 	andge	r0, r3, r0, lsl #10
    1f34:	260000ee 	strcs	r0, [r0], -lr, ror #1
    1f38:	000007b7 			; <UNDEFINED> instruction: 0x000007b7
    1f3c:	02ef1301 	rsceq	r1, pc, #67108864	; 0x4000000
    1f40:	03050000 	movweq	r0, #20480	; 0x5000
    1f44:	0000e008 	andeq	lr, r0, r8
    1f48:	00080620 	andeq	r0, r8, r0, lsr #12
    1f4c:	011a0100 	tsteq	sl, r0, lsl #2
    1f50:	00000025 	andeq	r0, r0, r5, lsr #32
    1f54:	00081920 	andeq	r1, r8, r0, lsr #18
    1f58:	011b0100 	tsteq	fp, r0, lsl #2
    1f5c:	00000025 	andeq	r0, r0, r5, lsr #32
    1f60:	00042b27 	andeq	r2, r4, r7, lsr #22
    1f64:	28300500 	ldmdacs	r0!, {r8, sl}
    1f68:	000006c8 	andeq	r0, r0, r8, asr #13
    1f6c:	098d3d06 	stmibeq	sp, {r1, r2, r8, sl, fp, ip, sp}
    1f70:	41290000 	teqmi	r9, r0
    1f74:	00000000 	andeq	r0, r0, r0
    1f78:	00072f2a 	andeq	r2, r7, sl, lsr #30
    1f7c:	41440600 	cmpmi	r4, r0, lsl #12
    1f80:	2b000000 	blcs	1f88 <__start-0x6078>
    1f84:	000006e9 	andeq	r0, r0, r9, ror #13
    1f88:	00331308 	eorseq	r1, r3, r8, lsl #6
    1f8c:	09ae0000 	stmibeq	lr!, {}	; <UNPREDICTABLE>
    1f90:	ae290000 	cdpge	0, 2, cr0, cr9, cr0, {0}
    1f94:	2c000009 	stccs	0, cr0, [r0], {9}
    1f98:	b4040800 	strlt	r0, [r4], #-2048	; 0x800
    1f9c:	2d000009 	stccs	0, cr0, [r0, #-36]	; 0xffffffdc
    1fa0:	00000025 	andeq	r0, r0, r5, lsr #32
    1fa4:	0003fd27 	andeq	pc, r3, r7, lsr #26
    1fa8:	282b0500 	stmdacs	fp!, {r8, sl}
    1fac:	00000163 	andeq	r0, r0, r3, ror #2
    1fb0:	09d64b07 	ldmibeq	r6, {r0, r1, r2, r8, r9, fp, lr}^
    1fb4:	41290000 	teqmi	r9, r0
    1fb8:	29000000 	stmdbcs	r0, {}	; <UNPREDICTABLE>
    1fbc:	00000041 	andeq	r0, r0, r1, asr #32
    1fc0:	014d2800 	cmpeq	sp, r0, lsl #16
    1fc4:	37070000 	strcc	r0, [r7, -r0]
    1fc8:	000009ec 	andeq	r0, r0, ip, ror #19
    1fcc:	00004129 	andeq	r4, r0, r9, lsr #2
    1fd0:	00412900 	subeq	r2, r1, r0, lsl #18
    1fd4:	2e000000 	cdpcs	0, 0, cr0, cr0, cr0, {0}
    1fd8:	0000070f 	andeq	r0, r0, pc, lsl #14
    1fdc:	33292709 	teqcc	r9, #2359296	; 0x240000
    1fe0:	00000000 	andeq	r0, r0, r0
    1fe4:	00081a00 	andeq	r1, r8, r0, lsl #20
    1fe8:	a5000400 	strge	r0, [r0, #-1024]	; 0x400
    1fec:	0400000b 	streq	r0, [r0], #-11
    1ff0:	00006401 	andeq	r6, r0, r1, lsl #8
    1ff4:	086f0100 	stmdaeq	pc!, {r8}^	; <UNPREDICTABLE>
    1ff8:	018e0000 	orreq	r0, lr, r0
    1ffc:	9fa00000 	svcls	0x00a00000
    2000:	039c0000 	orrseq	r0, ip, #0
    2004:	08430000 	stmdaeq	r3, {}^	; <UNPREDICTABLE>
    2008:	01020000 	mrseq	r0, (UNDEF: 2)
    200c:	0000f408 	andeq	pc, r0, r8, lsl #8
    2010:	05020200 	streq	r0, [r2, #-512]	; 0x200
    2014:	00000159 	andeq	r0, r0, r9, asr r1
    2018:	69050403 	stmdbvs	r5, {r0, r1, sl}
    201c:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    2020:	00000508 	andeq	r0, r0, r8, lsl #10
    2024:	e3040000 	movw	r0, #16384	; 0x4000
    2028:	02000000 	andeq	r0, r0, #0
    202c:	00004c16 	andeq	r4, r0, r6, lsl ip
    2030:	08010200 	stmdaeq	r1, {r9}
    2034:	000000eb 	andeq	r0, r0, fp, ror #1
    2038:	2c070202 	sfmcs	f0, 4, [r7], {2}
    203c:	04000001 	streq	r0, [r0], #-1
    2040:	00000171 	andeq	r0, r0, r1, ror r1
    2044:	00651a02 	rsbeq	r1, r5, r2, lsl #20
    2048:	04020000 	streq	r0, [r2], #-0
    204c:	00003b07 	andeq	r3, r0, r7, lsl #22
    2050:	07080200 	streq	r0, [r8, -r0, lsl #4]
    2054:	00000031 	andeq	r0, r0, r1, lsr r0
    2058:	00085105 	andeq	r5, r8, r5, lsl #2
    205c:	a0080100 	andge	r0, r8, r0, lsl #2
    2060:	2000009f 	mulcs	r0, pc, r0	; <UNPREDICTABLE>
    2064:	01000000 	mrseq	r0, (UNDEF: 0)
    2068:	0000989c 	muleq	r0, ip, r8
    206c:	084b0600 	stmdaeq	fp, {r9, sl}^
    2070:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
    2074:	0000005a 	andeq	r0, r0, sl, asr r0
    2078:	00000fdc 	ldrdeq	r0, [r0], -ip
    207c:	054f0700 	strbeq	r0, [pc, #-1792]	; 1984 <__start-0x667c>
    2080:	10010000 	andne	r0, r1, r0
    2084:	00000041 	andeq	r0, r0, r1, asr #32
    2088:	00009fc0 	andeq	r9, r0, r0, asr #31
    208c:	00000044 	andeq	r0, r0, r4, asr #32
    2090:	00ee9c01 	rsceq	r9, lr, r1, lsl #24
    2094:	72080000 	andvc	r0, r8, #0
    2098:	0100776f 	tsteq	r0, pc, ror #14
    209c:	00005a10 	andeq	r5, r0, r0, lsl sl
    20a0:	000ffa00 	andeq	pc, pc, r0, lsl #20
    20a4:	6f630800 	svcvs	0x00630800
    20a8:	1001006c 	andne	r0, r1, ip, rrx
    20ac:	0000005a 	andeq	r0, r0, sl, asr r0
    20b0:	00001041 	andeq	r1, r0, r1, asr #32
    20b4:	0001cd09 	andeq	ip, r1, r9, lsl #26
    20b8:	33120100 	tstcc	r2, #0, 2
    20bc:	8b000000 	blhi	20c4 <__start-0x5f3c>
    20c0:	09000010 	stmdbeq	r0, {r4}
    20c4:	000003a8 	andeq	r0, r0, r8, lsr #7
    20c8:	00331201 	eorseq	r1, r3, r1, lsl #4
    20cc:	10bf0000 	adcsne	r0, pc, r0
    20d0:	07000000 	streq	r0, [r0, -r0]
    20d4:	000008ce 	andeq	r0, r0, lr, asr #17
    20d8:	00411c01 	subeq	r1, r1, r1, lsl #24
    20dc:	a0040000 	andge	r0, r4, r0
    20e0:	00440000 	subeq	r0, r4, r0
    20e4:	9c010000 	stcls	0, cr0, [r1], {-0}
    20e8:	00000144 	andeq	r0, r0, r4, asr #2
    20ec:	776f7208 	strbvc	r7, [pc, -r8, lsl #4]!
    20f0:	5a1c0100 	bpl	7024f8 <__user_program+0x4024f8>
    20f4:	d2000000 	andle	r0, r0, #0
    20f8:	08000010 	stmdaeq	r0, {r4}
    20fc:	006c6f63 	rsbeq	r6, ip, r3, ror #30
    2100:	005a1c01 	subseq	r1, sl, r1, lsl #24
    2104:	11190000 	tstne	r9, r0
    2108:	cd090000 	stcgt	0, cr0, [r9, #-0]
    210c:	01000001 	tsteq	r0, r1
    2110:	0000331e 	andeq	r3, r0, lr, lsl r3
    2114:	00116300 	andseq	r6, r1, r0, lsl #6
    2118:	03a80900 			; <UNDEFINED> instruction: 0x03a80900
    211c:	1e010000 	cdpne	0, 0, cr0, cr1, cr0, {0}
    2120:	00000033 	andeq	r0, r0, r3, lsr r0
    2124:	00001197 	muleq	r0, r7, r1
    2128:	02b20a00 	adcseq	r0, r2, #0, 20
    212c:	29010000 	stmdbcs	r1, {}	; <UNPREDICTABLE>
    2130:	00000041 	andeq	r0, r0, r1, asr #32
    2134:	0000a048 	andeq	sl, r0, r8, asr #32
    2138:	00000024 	andeq	r0, r0, r4, lsr #32
    213c:	016b9c01 	cmneq	fp, r1, lsl #24
    2140:	690b0000 	stmdbvs	fp, {}	; <UNPREDICTABLE>
    2144:	332b0100 	teqcc	fp, #0, 2
    2148:	aa000000 	bge	2150 <__start-0x5eb0>
    214c:	00000011 	andeq	r0, r0, r1, lsl r0
    2150:	0008f505 	andeq	pc, r8, r5, lsl #10
    2154:	6c3f0100 	ldfvss	f0, [pc], #-0	; 215c <__start-0x5ea4>
    2158:	340000a0 	strcc	r0, [r0], #-160	; 0xa0
    215c:	01000000 	mrseq	r0, (UNDEF: 0)
    2160:	0001ee9c 	muleq	r1, ip, lr
    2164:	09000600 	stmdbeq	r0, {r9, sl}
    2168:	3f010000 	svccc	0x00010000
    216c:	0000004c 	andeq	r0, r0, ip, asr #32
    2170:	000011d1 	ldrdeq	r1, [r0], -r1	; <UNPREDICTABLE>
    2174:	00a07c0c 	adceq	r7, r0, ip, lsl #24
    2178:	0007a100 	andeq	sl, r7, r0, lsl #2
    217c:	0001a200 	andeq	sl, r1, r0, lsl #4
    2180:	50010d00 	andpl	r0, r1, r0, lsl #26
    2184:	0c003901 	stceq	9, cr3, [r0], {1}
    2188:	0000a084 	andeq	sl, r0, r4, lsl #1
    218c:	00000073 	andeq	r0, r0, r3, ror r0
    2190:	000001b7 			; <UNDEFINED> instruction: 0x000001b7
    2194:	0350010d 	cmpeq	r0, #1073741827	; 0x40000003
    2198:	0003e80a 	andeq	lr, r3, sl, lsl #16
    219c:	00a0900c 	adceq	r9, r0, ip
    21a0:	0007b200 	andeq	fp, r7, r0, lsl #4
    21a4:	0001d000 	andeq	sp, r1, r0
    21a8:	51010d00 	tstpl	r1, r0, lsl #26
    21ac:	0d400802 	stcleq	8, cr0, [r0, #-8]
    21b0:	30015001 	andcc	r5, r1, r1
    21b4:	a0980c00 	addsge	r0, r8, r0, lsl #24
    21b8:	07c80000 	strbeq	r0, [r8, r0]
    21bc:	01e40000 	mvneq	r0, r0
    21c0:	010d0000 	mrseq	r0, (UNDEF: 13)
    21c4:	00740250 	rsbseq	r0, r4, r0, asr r2
    21c8:	a09c0e00 	addsge	r0, ip, r0, lsl #28
    21cc:	07dd0000 	ldrbeq	r0, [sp, r0]
    21d0:	05000000 	streq	r0, [r0, #-0]
    21d4:	0000085f 	andeq	r0, r0, pc, asr r8
    21d8:	a0a04901 	adcge	r4, r0, r1, lsl #18
    21dc:	00340000 	eorseq	r0, r4, r0
    21e0:	9c010000 	stcls	0, cr0, [r1], {-0}
    21e4:	00000271 	andeq	r0, r0, r1, ror r2
    21e8:	00086a06 	andeq	r6, r8, r6, lsl #20
    21ec:	4c490100 	stfmie	f0, [r9], {-0}
    21f0:	f2000000 	vhadd.s8	d0, d0, d0
    21f4:	0c000011 	stceq	0, cr0, [r0], {17}
    21f8:	0000a0b0 	strheq	sl, [r0], -r0
    21fc:	000007e4 	andeq	r0, r0, r4, ror #15
    2200:	00000225 	andeq	r0, r0, r5, lsr #4
    2204:	0150010d 	cmpeq	r0, sp, lsl #2
    2208:	b80c0039 	stmdalt	ip, {r0, r3, r4, r5}
    220c:	730000a0 	movwvc	r0, #160	; 0xa0
    2210:	3a000000 	bcc	2218 <__start-0x5de8>
    2214:	0d000002 	stceq	0, cr0, [r0, #-8]
    2218:	0a035001 	beq	d6224 <__bss_end+0xc6224>
    221c:	0c0003e8 	stceq	3, cr0, [r0], {232}	; 0xe8
    2220:	0000a0c4 	andeq	sl, r0, r4, asr #1
    2224:	000007b2 			; <UNDEFINED> instruction: 0x000007b2
    2228:	00000253 	andeq	r0, r0, r3, asr r2
    222c:	0251010d 	subseq	r0, r1, #1073741827	; 0x40000003
    2230:	010d2008 	tsteq	sp, r8
    2234:	00300150 	eorseq	r0, r0, r0, asr r1
    2238:	00a0cc0c 	adceq	ip, r0, ip, lsl #24
    223c:	0007c800 	andeq	ip, r7, r0, lsl #16
    2240:	00026700 	andeq	r6, r2, r0, lsl #14
    2244:	50010d00 	andpl	r0, r1, r0, lsl #26
    2248:	00007402 	andeq	r7, r0, r2, lsl #8
    224c:	00a0d00e 	adceq	sp, r0, lr
    2250:	0007dd00 	andeq	sp, r7, r0, lsl #26
    2254:	08050000 	stmdaeq	r5, {}	; <UNPREDICTABLE>
    2258:	01000009 	tsteq	r0, r9
    225c:	00a0d452 	adceq	sp, r0, r2, asr r4
    2260:	00004000 	andeq	r4, r0, r0
    2264:	f29c0100 	vaddw.s16	q0, q6, d0
    2268:	0c000002 	stceq	0, cr0, [r0], {2}
    226c:	0000a0e4 	andeq	sl, r0, r4, ror #1
    2270:	000007f5 	strdeq	r0, [r0], -r5
    2274:	0000029e 	muleq	r0, lr, r2
    2278:	0151010d 	cmpeq	r1, sp, lsl #2
    227c:	50010d31 	andpl	r0, r1, r1, lsr sp
    2280:	0c004001 	stceq	0, cr4, [r0], {1}
    2284:	0000a0ec 	andeq	sl, r0, ip, ror #1
    2288:	000007e4 	andeq	r0, r0, r4, ror #15
    228c:	000002b1 			; <UNDEFINED> instruction: 0x000002b1
    2290:	0150010d 	cmpeq	r0, sp, lsl #2
    2294:	f80e0040 			; <UNDEFINED> instruction: 0xf80e0040
    2298:	730000a0 	movwvc	r0, #160	; 0xa0
    229c:	0c000000 	stceq	0, cr0, [r0], {-0}
    22a0:	0000a100 	andeq	sl, r0, r0, lsl #2
    22a4:	000007a1 	andeq	r0, r0, r1, lsr #15
    22a8:	000002cd 	andeq	r0, r0, sp, asr #5
    22ac:	0150010d 	cmpeq	r0, sp, lsl #2
    22b0:	080c0040 	stmdaeq	ip, {r6}
    22b4:	730000a1 	movwvc	r0, #161	; 0xa1
    22b8:	e2000000 	and	r0, r0, #0
    22bc:	0d000002 	stceq	0, cr0, [r0, #-8]
    22c0:	0a035001 	beq	d62cc <__bss_end+0xc62cc>
    22c4:	0f00c350 	svceq	0x0000c350
    22c8:	0000a110 	andeq	sl, r0, r0, lsl r1
    22cc:	000007e4 	andeq	r0, r0, r4, ror #15
    22d0:	0150010d 	cmpeq	r0, sp, lsl #2
    22d4:	05000040 	streq	r0, [r0, #-64]	; 0x40
    22d8:	00000421 	andeq	r0, r0, r1, lsr #8
    22dc:	a1147101 	tstge	r4, r1, lsl #2
    22e0:	01100000 	tsteq	r0, r0
    22e4:	9c010000 	stcls	0, cr0, [r1], {-0}
    22e8:	00000580 	andeq	r0, r0, r0, lsl #11
    22ec:	00a11c0e 	adceq	r1, r1, lr, lsl #24
    22f0:	00027100 	andeq	r7, r2, r0, lsl #2
    22f4:	a1280c00 	teqge	r8, r0, lsl #24
    22f8:	07f50000 	ldrbeq	r0, [r5, r0]!
    22fc:	03280000 	teqeq	r8, #0
    2300:	010d0000 	mrseq	r0, (UNDEF: 13)
    2304:	0d310151 	ldfeqs	f0, [r1, #-324]!	; 0xfffffebc
    2308:	40015001 	andmi	r5, r1, r1
    230c:	a1340c00 	teqge	r4, r0, lsl #24
    2310:	07f50000 	ldrbeq	r0, [r5, r0]!
    2314:	03400000 	movteq	r0, #0
    2318:	010d0000 	mrseq	r0, (UNDEF: 13)
    231c:	0d310151 	ldfeqs	f0, [r1, #-324]!	; 0xfffffebc
    2320:	39015001 	stmdbcc	r1, {r0, ip, lr}
    2324:	a13c0c00 	teqge	ip, r0, lsl #24
    2328:	07e40000 	strbeq	r0, [r4, r0]!
    232c:	03530000 	cmpeq	r3, #0
    2330:	010d0000 	mrseq	r0, (UNDEF: 13)
    2334:	00400150 	subeq	r0, r0, r0, asr r1
    2338:	00a1440c 	adceq	r4, r1, ip, lsl #8
    233c:	0007a100 	andeq	sl, r7, r0, lsl #2
    2340:	00036600 	andeq	r6, r3, r0, lsl #12
    2344:	50010d00 	andpl	r0, r1, r0, lsl #26
    2348:	0c003901 	stceq	9, cr3, [r0], {1}
    234c:	0000a14c 	andeq	sl, r0, ip, asr #2
    2350:	00000073 	andeq	r0, r0, r3, ror r0
    2354:	0000037b 	andeq	r0, r0, fp, ror r3
    2358:	0350010d 	cmpeq	r0, #1073741827	; 0x40000003
    235c:	0027100a 	eoreq	r1, r7, sl
    2360:	00a1580c 	adceq	r5, r1, ip, lsl #16
    2364:	00080b00 	andeq	r0, r8, r0, lsl #22
    2368:	00039400 	andeq	r9, r3, r0, lsl #8
    236c:	51010d00 	tstpl	r1, r0, lsl #26
    2370:	0d200802 	stceq	8, cr0, [r0, #-8]!
    2374:	30015001 	andcc	r5, r1, r1
    2378:	a1600c00 	cmnge	r0, r0, lsl #24
    237c:	016b0000 	cmneq	fp, r0
    2380:	03a80000 			; <UNDEFINED> instruction: 0x03a80000
    2384:	010d0000 	mrseq	r0, (UNDEF: 13)
    2388:	ae090250 	mcrge	2, 0, r0, cr9, cr0, {2}
    238c:	a1680c00 	cmnge	r8, r0, lsl #24
    2390:	016b0000 	cmneq	fp, r0
    2394:	03bc0000 			; <UNDEFINED> instruction: 0x03bc0000
    2398:	010d0000 	mrseq	r0, (UNDEF: 13)
    239c:	d5090250 	strle	r0, [r9, #-592]	; 0x250
    23a0:	a1700c00 	cmnge	r0, r0, lsl #24
    23a4:	016b0000 	cmneq	fp, r0
    23a8:	03d00000 	bicseq	r0, r0, #0
    23ac:	010d0000 	mrseq	r0, (UNDEF: 13)
    23b0:	80090250 	andhi	r0, r9, r0, asr r2
    23b4:	a1780c00 	cmnge	r8, r0, lsl #24
    23b8:	016b0000 	cmneq	fp, r0
    23bc:	03e40000 	mvneq	r0, #0
    23c0:	010d0000 	mrseq	r0, (UNDEF: 13)
    23c4:	a8090250 	stmdage	r9, {r4, r6, r9}
    23c8:	a1800c00 	orrge	r0, r0, r0, lsl #24
    23cc:	016b0000 	cmneq	fp, r0
    23d0:	03f70000 	mvnseq	r0, #0
    23d4:	010d0000 	mrseq	r0, (UNDEF: 13)
    23d8:	004f0150 	subeq	r0, pc, r0, asr r1	; <UNPREDICTABLE>
    23dc:	00a1880c 	adceq	r8, r1, ip, lsl #16
    23e0:	00016b00 	andeq	r6, r1, r0, lsl #22
    23e4:	00040b00 	andeq	r0, r4, r0, lsl #22
    23e8:	50010d00 	andpl	r0, r1, r0, lsl #26
    23ec:	00d30902 	sbcseq	r0, r3, r2, lsl #18
    23f0:	00a1900c 	adceq	r9, r1, ip
    23f4:	00016b00 	andeq	r6, r1, r0, lsl #22
    23f8:	00041e00 	andeq	r1, r4, r0, lsl #28
    23fc:	50010d00 	andpl	r0, r1, r0, lsl #26
    2400:	0c003001 	stceq	0, cr3, [r0], {1}
    2404:	0000a198 	muleq	r0, r8, r1
    2408:	0000016b 	andeq	r0, r0, fp, ror #2
    240c:	00000432 	andeq	r0, r0, r2, lsr r4
    2410:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
    2414:	0c004008 	stceq	0, cr4, [r0], {8}
    2418:	0000a1a0 	andeq	sl, r0, r0, lsr #3
    241c:	0000016b 	andeq	r0, r0, fp, ror #2
    2420:	00000446 	andeq	r0, r0, r6, asr #8
    2424:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
    2428:	0c008d09 	stceq	13, cr8, [r0], {9}
    242c:	0000a1a8 	andeq	sl, r0, r8, lsr #3
    2430:	0000016b 	andeq	r0, r0, fp, ror #2
    2434:	00000459 	andeq	r0, r0, r9, asr r4
    2438:	0150010d 	cmpeq	r0, sp, lsl #2
    243c:	b00c0044 	andlt	r0, ip, r4, asr #32
    2440:	6b0000a1 	blvs	26cc <__start-0x5934>
    2444:	6d000001 	stcvs	0, cr0, [r0, #-4]
    2448:	0d000004 	stceq	0, cr0, [r0, #-16]
    244c:	08025001 	stmdaeq	r2, {r0, ip, lr}
    2450:	b80c0020 	stmdalt	ip, {r5}
    2454:	6b0000a1 	blvs	26e0 <__start-0x5920>
    2458:	80000001 	andhi	r0, r0, r1
    245c:	0d000004 	stceq	0, cr0, [r0, #-16]
    2460:	30015001 	andcc	r5, r1, r1
    2464:	a1c00c00 	bicge	r0, r0, r0, lsl #24
    2468:	016b0000 	cmneq	fp, r0
    246c:	04940000 	ldreq	r0, [r4], #0
    2470:	010d0000 	mrseq	r0, (UNDEF: 13)
    2474:	a1090250 	tstge	r9, r0, asr r2
    2478:	a1c80c00 	bicge	r0, r8, r0, lsl #24
    247c:	016b0000 	cmneq	fp, r0
    2480:	04a80000 	strteq	r0, [r8], #0
    2484:	010d0000 	mrseq	r0, (UNDEF: 13)
    2488:	c8090250 	stmdagt	r9, {r4, r6, r9}
    248c:	a1d00c00 	bicsge	r0, r0, r0, lsl #24
    2490:	016b0000 	cmneq	fp, r0
    2494:	04bc0000 	ldrteq	r0, [ip], #0
    2498:	010d0000 	mrseq	r0, (UNDEF: 13)
    249c:	da090250 	ble	242de4 <__end+0x111de4>
    24a0:	a1d80c00 	bicsge	r0, r8, r0, lsl #24
    24a4:	016b0000 	cmneq	fp, r0
    24a8:	04cf0000 	strbeq	r0, [pc], #0	; 24b0 <__start-0x5b50>
    24ac:	010d0000 	mrseq	r0, (UNDEF: 13)
    24b0:	00320150 	eorseq	r0, r2, r0, asr r1
    24b4:	00a1e00c 	adceq	lr, r1, ip
    24b8:	00016b00 	andeq	r6, r1, r0, lsl #22
    24bc:	0004e300 	andeq	lr, r4, r0, lsl #6
    24c0:	50010d00 	andpl	r0, r1, r0, lsl #26
    24c4:	00810902 	addeq	r0, r1, r2, lsl #18
    24c8:	00a1e80c 	adceq	lr, r1, ip, lsl #16
    24cc:	00016b00 	andeq	r6, r1, r0, lsl #22
    24d0:	0004f700 	andeq	pc, r4, r0, lsl #14
    24d4:	50010d00 	andpl	r0, r1, r0, lsl #26
    24d8:	008f0902 	addeq	r0, pc, r2, lsl #18
    24dc:	00a1f00c 	adceq	pc, r1, ip
    24e0:	00016b00 	andeq	r6, r1, r0, lsl #22
    24e4:	00050b00 	andeq	r0, r5, r0, lsl #22
    24e8:	50010d00 	andpl	r0, r1, r0, lsl #26
    24ec:	00d90902 	sbcseq	r0, r9, r2, lsl #18
    24f0:	00a1f80c 	adceq	pc, r1, ip, lsl #16
    24f4:	00016b00 	andeq	r6, r1, r0, lsl #22
    24f8:	00051f00 	andeq	r1, r5, r0, lsl #30
    24fc:	50010d00 	andpl	r0, r1, r0, lsl #26
    2500:	00f10902 	rscseq	r0, r1, r2, lsl #18
    2504:	00a2000c 	adceq	r0, r2, ip
    2508:	00016b00 	andeq	r6, r1, r0, lsl #22
    250c:	00053300 	andeq	r3, r5, r0, lsl #6
    2510:	50010d00 	andpl	r0, r1, r0, lsl #26
    2514:	00db0902 	sbcseq	r0, fp, r2, lsl #18
    2518:	00a2080c 	adceq	r0, r2, ip, lsl #16
    251c:	00016b00 	andeq	r6, r1, r0, lsl #22
    2520:	00054700 	andeq	r4, r5, r0, lsl #14
    2524:	50010d00 	andpl	r0, r1, r0, lsl #26
    2528:	00400802 	subeq	r0, r0, r2, lsl #16
    252c:	00a2100c 	adceq	r1, r2, ip
    2530:	00016b00 	andeq	r6, r1, r0, lsl #22
    2534:	00055b00 	andeq	r5, r5, r0, lsl #22
    2538:	50010d00 	andpl	r0, r1, r0, lsl #26
    253c:	00a40902 	adceq	r0, r4, r2, lsl #18
    2540:	00a2180c 	adceq	r1, r2, ip, lsl #16
    2544:	00016b00 	andeq	r6, r1, r0, lsl #22
    2548:	00056f00 	andeq	r6, r5, r0, lsl #30
    254c:	50010d00 	andpl	r0, r1, r0, lsl #26
    2550:	00a60902 	adceq	r0, r6, r2, lsl #18
    2554:	00a2200f 	adceq	r2, r2, pc
    2558:	00016b00 	andeq	r6, r1, r0, lsl #22
    255c:	50010d00 	andpl	r0, r1, r0, lsl #26
    2560:	00af0902 	adceq	r0, pc, r2, lsl #18
    2564:	08e10500 	stmiaeq	r1!, {r8, sl}^
    2568:	97010000 	strls	r0, [r1, -r0]
    256c:	0000a224 	andeq	sl, r0, r4, lsr #4
    2570:	00000038 	andeq	r0, r0, r8, lsr r0
    2574:	06079c01 	streq	r9, [r7], -r1, lsl #24
    2578:	300c0000 	andcc	r0, ip, r0
    257c:	6b0000a2 	blvs	280c <__start-0x57f4>
    2580:	a9000001 	stmdbge	r0, {r0}
    2584:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    2588:	08025001 	stmdaeq	r2, {r0, ip, lr}
    258c:	380c0021 	stmdacc	ip, {r0, r5}
    2590:	6b0000a2 	blvs	2820 <__start-0x57e0>
    2594:	bc000001 	stclt	0, cr0, [r0], {1}
    2598:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    259c:	30015001 	andcc	r5, r1, r1
    25a0:	a2400c00 	subge	r0, r0, #0, 24
    25a4:	016b0000 	cmneq	fp, r0
    25a8:	05d00000 	ldrbeq	r0, [r0]
    25ac:	010d0000 	mrseq	r0, (UNDEF: 13)
    25b0:	7f080250 	svcvc	0x00080250
    25b4:	a2480c00 	subge	r0, r8, #0, 24
    25b8:	016b0000 	cmneq	fp, r0
    25bc:	05e40000 	strbeq	r0, [r4, #0]!
    25c0:	010d0000 	mrseq	r0, (UNDEF: 13)
    25c4:	22080250 	andcs	r0, r8, #80, 4
    25c8:	a2500c00 	subsge	r0, r0, #0, 24
    25cc:	016b0000 	cmneq	fp, r0
    25d0:	05f70000 	ldrbeq	r0, [r7, #0]!
    25d4:	010d0000 	mrseq	r0, (UNDEF: 13)
    25d8:	00300150 	eorseq	r0, r0, r0, asr r1
    25dc:	00a2580f 	adceq	r5, r2, pc, lsl #16
    25e0:	00016b00 	andeq	r6, r1, r0, lsl #22
    25e4:	50010d00 	andpl	r0, r1, r0, lsl #26
    25e8:	00003301 	andeq	r3, r0, r1, lsl #6
    25ec:	0004990a 	andeq	r9, r4, sl, lsl #18
    25f0:	41300100 	teqmi	r0, r0, lsl #2
    25f4:	5c000000 	stcpl	0, cr0, [r0], {-0}
    25f8:	440000a2 	strmi	r0, [r0], #-162	; 0xa2
    25fc:	01000000 	mrseq	r0, (UNDEF: 0)
    2600:	0006779c 	muleq	r6, ip, r7
    2604:	03a80900 			; <UNDEFINED> instruction: 0x03a80900
    2608:	32010000 	andcc	r0, r1, #0
    260c:	00000033 	andeq	r0, r0, r3, lsr r0
    2610:	00001213 	andeq	r1, r0, r3, lsl r2
    2614:	00a2640e 	adceq	r6, r2, lr, lsl #8
    2618:	00058000 	andeq	r8, r5, r0
    261c:	a26c0c00 	rsbge	r0, ip, #0, 24
    2620:	07e40000 	strbeq	r0, [r4, r0]!
    2624:	064b0000 	strbeq	r0, [fp], -r0
    2628:	010d0000 	mrseq	r0, (UNDEF: 13)
    262c:	00390150 	eorseq	r0, r9, r0, asr r1
    2630:	00a2780c 	adceq	r7, r2, ip, lsl #16
    2634:	0007b200 	andeq	fp, r7, r0, lsl #4
    2638:	00066400 	andeq	r6, r6, r0, lsl #8
    263c:	51010d00 	tstpl	r1, r0, lsl #26
    2640:	0d200802 	stceq	8, cr0, [r0, #-8]!
    2644:	30015001 	andcc	r5, r1, r1
    2648:	a2880e00 	addge	r0, r8, #0, 28
    264c:	07c80000 	strbeq	r0, [r8, r0]
    2650:	940e0000 	strls	r0, [lr], #-0
    2654:	dd0000a2 	stcle	0, cr0, [r0, #-648]	; 0xfffffd78
    2658:	00000007 	andeq	r0, r0, r7
    265c:	00088305 	andeq	r8, r8, r5, lsl #6
    2660:	a05b0100 	subsge	r0, fp, r0, lsl #2
    2664:	600000a2 	andvs	r0, r0, r2, lsr #1
    2668:	01000000 	mrseq	r0, (UNDEF: 0)
    266c:	0006f29c 	muleq	r6, ip, r2
    2670:	00690b00 	rsbeq	r0, r9, r0, lsl #22
    2674:	00335c01 	eorseq	r5, r3, r1, lsl #24
    2678:	12600000 	rsbne	r0, r0, #0
    267c:	63100000 	tstvs	r0, #0
    2680:	0100746e 	tsteq	r0, lr, ror #8
    2684:	0000335d 	andeq	r3, r0, sp, asr r3
    2688:	0c030500 	cfstr32eq	mvfx0, [r3], {-0}
    268c:	0e0000e0 	cdpeq	0, 0, cr0, cr0, cr0, {7}
    2690:	0000a2a8 	andeq	sl, r0, r8, lsr #5
    2694:	00000580 	andeq	r0, r0, r0, lsl #11
    2698:	00a2b00c 	adceq	fp, r2, ip
    269c:	0007e400 	andeq	lr, r7, r0, lsl #8
    26a0:	0006c600 	andeq	ip, r6, r0, lsl #12
    26a4:	50010d00 	andpl	r0, r1, r0, lsl #26
    26a8:	0c003901 	stceq	9, cr3, [r0], {1}
    26ac:	0000a2bc 			; <UNDEFINED> instruction: 0x0000a2bc
    26b0:	000007b2 			; <UNDEFINED> instruction: 0x000007b2
    26b4:	000006df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    26b8:	0251010d 	subseq	r0, r1, #1073741827	; 0x40000003
    26bc:	010d2008 	tsteq	sp, r8
    26c0:	00300150 	eorseq	r0, r0, r0, asr r1
    26c4:	00a2dc0e 	adceq	sp, r2, lr, lsl #24
    26c8:	0007c800 	andeq	ip, r7, r0, lsl #16
    26cc:	a2e80e00 	rscge	r0, r8, #0, 28
    26d0:	07dd0000 	ldrbeq	r0, [sp, r0]
    26d4:	05000000 	streq	r0, [r0, #-0]
    26d8:	000005fd 	strdeq	r0, [r0], -sp
    26dc:	a3006701 	movwge	r6, #1793	; 0x701
    26e0:	003c0000 	eorseq	r0, ip, r0
    26e4:	9c010000 	stcls	0, cr0, [r1], {-0}
    26e8:	00000767 	andeq	r0, r0, r7, ror #14
    26ec:	0100690b 	tsteq	r0, fp, lsl #18
    26f0:	00003368 	andeq	r3, r0, r8, ror #6
    26f4:	0012a700 	andseq	sl, r2, r0, lsl #14
    26f8:	a3080e00 	movwge	r0, #36352	; 0x8e00
    26fc:	05800000 	streq	r0, [r0]
    2700:	100c0000 	andne	r0, ip, r0
    2704:	e40000a3 	str	r0, [r0], #-163	; 0xa3
    2708:	30000007 	andcc	r0, r0, r7
    270c:	0d000007 	stceq	0, cr0, [r0, #-28]	; 0xffffffe4
    2710:	39015001 	stmdbcc	r1, {r0, ip, lr}
    2714:	a31c0c00 	tstge	ip, #0, 24
    2718:	07b20000 	ldreq	r0, [r2, r0]!
    271c:	07490000 	strbeq	r0, [r9, -r0]
    2720:	010d0000 	mrseq	r0, (UNDEF: 13)
    2724:	20080251 	andcs	r0, r8, r1, asr r2
    2728:	0150010d 	cmpeq	r0, sp, lsl #2
    272c:	2c0c0030 	stccs	0, cr0, [ip], {48}	; 0x30
    2730:	c80000a3 	stmdagt	r0, {r0, r1, r5, r7}
    2734:	5d000007 	stcpl	0, cr0, [r0, #-28]	; 0xffffffe4
    2738:	0d000007 	stceq	0, cr0, [r0, #-28]	; 0xffffffe4
    273c:	75025001 	strvc	r5, [r2, #-1]
    2740:	380e0000 	stmdacc	lr, {}	; <UNPREDICTABLE>
    2744:	dd0000a3 	stcle	0, cr0, [r0, #-652]	; 0xfffffd74
    2748:	00000007 	andeq	r0, r0, r7
    274c:	746e6311 	strbtvc	r6, [lr], #-785	; 0x311
    2750:	41060100 	mrsmi	r0, (UNDEF: 22)
    2754:	05000000 	streq	r0, [r0, #-0]
    2758:	00d00403 	sbcseq	r0, r0, r3, lsl #8
    275c:	00411200 	subeq	r1, r1, r0, lsl #4
    2760:	07890000 	streq	r0, [r9, r0]
    2764:	89130000 	ldmdbhi	r3, {}	; <UNPREDICTABLE>
    2768:	ff000007 			; <UNDEFINED> instruction: 0xff000007
    276c:	04020001 	streq	r0, [r2], #-1
    2770:	00027807 	andeq	r7, r2, r7, lsl #16
    2774:	08b11400 	ldmeq	r1!, {sl, ip}
    2778:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
    277c:	00000778 	andeq	r0, r0, r8, ror r7
    2780:	f02c0305 			; <UNDEFINED> instruction: 0xf02c0305
    2784:	48150000 	ldmdami	r5, {}	; <UNPREDICTABLE>
    2788:	03000000 	movweq	r0, #0
    278c:	0007b243 	andeq	fp, r7, r3, asr #4
    2790:	00411600 	subeq	r1, r1, r0, lsl #12
    2794:	15000000 	strne	r0, [r0, #-0]
    2798:	000008c4 	andeq	r0, r0, r4, asr #17
    279c:	07c87404 	strbeq	r7, [r8, r4, lsl #8]
    27a0:	41160000 	tstmi	r6, r0
    27a4:	16000000 	strne	r0, [r0], -r0
    27a8:	0000005a 	andeq	r0, r0, sl, asr r0
    27ac:	08941700 	ldmeq	r4, {r8, r9, sl, ip}
    27b0:	82040000 	andhi	r0, r4, #0
    27b4:	00000041 	andeq	r0, r0, r1, asr #32
    27b8:	000007dd 	ldrdeq	r0, [r0], -sp
    27bc:	00004116 	andeq	r4, r0, r6, lsl r1
    27c0:	57180000 	ldrpl	r0, [r8, -r0]
    27c4:	04000008 	streq	r0, [r0], #-8
    27c8:	0028157a 	eoreq	r1, r8, sl, ror r5
    27cc:	3d030000 	stccc	0, cr0, [r3, #-0]
    27d0:	000007f5 	strdeq	r0, [r0], -r5
    27d4:	00004116 	andeq	r4, r0, r6, lsl r1
    27d8:	4d150000 	ldcmi	0, cr0, [r5, #-0]
    27dc:	03000001 	movweq	r0, #1
    27e0:	00080b37 	andeq	r0, r8, r7, lsr fp
    27e4:	00411600 	subeq	r1, r1, r0, lsl #12
    27e8:	41160000 	tstmi	r6, r0
    27ec:	00000000 	andeq	r0, r0, r0
    27f0:	0008a119 	andeq	sl, r8, r9, lsl r1
    27f4:	166e0400 	strbtne	r0, [lr], -r0, lsl #8
    27f8:	0000005a 	andeq	r0, r0, sl, asr r0
    27fc:	00005a16 	andeq	r5, r0, r6, lsl sl
    2800:	16000000 	strne	r0, [r0], -r0
    2804:	04000002 	streq	r0, [r0], #-2
    2808:	000d2b00 	andeq	r2, sp, r0, lsl #22
    280c:	64010400 	strvs	r0, [r1], #-1024	; 0x400
    2810:	01000000 	mrseq	r0, (UNDEF: 0)
    2814:	00000913 	andeq	r0, r0, r3, lsl r9
    2818:	0000018e 	andeq	r0, r0, lr, lsl #3
    281c:	0000a33c 	andeq	sl, r0, ip, lsr r3
    2820:	00000180 	andeq	r0, r0, r0, lsl #3
    2824:	00000963 	andeq	r0, r0, r3, ror #18
    2828:	f4080102 	vst4.8	{d0,d2,d4,d6}, [r8], r2
    282c:	02000000 	andeq	r0, r0, #0
    2830:	01590502 	cmpeq	r9, r2, lsl #10
    2834:	04030000 	streq	r0, [r3], #-0
    2838:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
    283c:	05080200 	streq	r0, [r8, #-512]	; 0x200
    2840:	00000000 	andeq	r0, r0, r0
    2844:	0000e304 	andeq	lr, r0, r4, lsl #6
    2848:	4c160200 	lfmmi	f0, 4, [r6], {-0}
    284c:	02000000 	andeq	r0, r0, #0
    2850:	00eb0801 	rsceq	r0, fp, r1, lsl #16
    2854:	02020000 	andeq	r0, r2, #0
    2858:	00012c07 	andeq	r2, r1, r7, lsl #24
    285c:	01710400 	cmneq	r1, r0, lsl #8
    2860:	1a020000 	bne	82868 <__bss_end+0x72868>
    2864:	00000065 	andeq	r0, r0, r5, rrx
    2868:	3b070402 	blcc	1c3878 <__end+0x92878>
    286c:	02000000 	andeq	r0, r0, #0
    2870:	00310708 	eorseq	r0, r1, r8, lsl #14
    2874:	47050000 	strmi	r0, [r5, -r0]
    2878:	01000006 	tsteq	r0, r6
    287c:	00a33c36 	adceq	r3, r3, r6, lsr ip
    2880:	00002000 	andeq	r2, r0, r0
    2884:	989c0100 	ldmls	ip, {r8}
    2888:	06000000 	streq	r0, [r0], -r0
    288c:	00000851 	andeq	r0, r0, r1, asr r8
    2890:	00653601 	rsbeq	r3, r5, r1, lsl #12
    2894:	12ee0000 	rscne	r0, lr, #0
    2898:	05000000 	streq	r0, [r0, #-0]
    289c:	000008a1 	andeq	r0, r0, r1, lsr #17
    28a0:	a35c3c01 	cmpge	ip, #256	; 0x100
    28a4:	00740000 	rsbseq	r0, r4, r0
    28a8:	9c010000 	stcls	0, cr0, [r1], {-0}
    28ac:	0000014c 	andeq	r0, r0, ip, asr #2
    28b0:	00050406 	andeq	r0, r5, r6, lsl #8
    28b4:	5a3c0100 	bpl	f02cbc <__user_program+0xc02cbc>
    28b8:	0c000000 	stceq	0, cr0, [r0], {-0}
    28bc:	07000013 	smladeq	r0, r3, r0, r0
    28c0:	006b6c63 	rsbeq	r6, fp, r3, ror #24
    28c4:	005a3c01 	subseq	r3, sl, r1, lsl #24
    28c8:	132d0000 	teqne	sp, #0
    28cc:	76080000 	strvc	r0, [r8], -r0
    28d0:	01007261 	tsteq	r0, r1, ror #4
    28d4:	0000653d 	andeq	r6, r0, sp, lsr r5
    28d8:	00134b00 	andseq	r4, r3, r0, lsl #22
    28dc:	a3700900 	cmnge	r0, #0, 18
    28e0:	02070000 	andeq	r0, r7, #0
    28e4:	00f20000 	rscseq	r0, r2, r0
    28e8:	010a0000 	mrseq	r0, (UNDEF: 10)
    28ec:	0a340151 	beq	d02e38 <__user_program+0xa02e38>
    28f0:	37015001 	strcc	r5, [r1, -r1]
    28f4:	a37c0900 	cmnge	ip, #0, 18
    28f8:	02070000 	andeq	r0, r7, #0
    28fc:	010a0000 	mrseq	r0, (UNDEF: 10)
    2900:	010a0000 	mrseq	r0, (UNDEF: 10)
    2904:	0a340151 	beq	d02e50 <__user_program+0xa02e50>
    2908:	38015001 	stmdacc	r1, {r0, ip, lr}
    290c:	a3880900 	orrge	r0, r8, #0, 18
    2910:	02070000 	andeq	r0, r7, #0
    2914:	01220000 	teqeq	r2, r0
    2918:	010a0000 	mrseq	r0, (UNDEF: 10)
    291c:	0a340151 	beq	d02e68 <__user_program+0xa02e68>
    2920:	3a015001 	bcc	5692c <__bss_end+0x4692c>
    2924:	a3940900 	orrsge	r0, r4, #0, 18
    2928:	02070000 	andeq	r0, r7, #0
    292c:	013a0000 	teqeq	sl, r0
    2930:	010a0000 	mrseq	r0, (UNDEF: 10)
    2934:	0a340151 	beq	d02e80 <__user_program+0xa02e80>
    2938:	3b015001 	blcc	56944 <__bss_end+0x46944>
    293c:	a3cc0b00 	bicge	r0, ip, #0, 22
    2940:	00730000 	rsbseq	r0, r3, r0
    2944:	010a0000 	mrseq	r0, (UNDEF: 10)
    2948:	100a0350 	andne	r0, sl, r0, asr r3
    294c:	05000027 	streq	r0, [r0, #-39]	; 0x27
    2950:	000008c4 	andeq	r0, r0, r4, asr #17
    2954:	a3d05f01 	bicsge	r5, r0, #1, 30
    2958:	00340000 	eorseq	r0, r4, r0
    295c:	9c010000 	stcls	0, cr0, [r1], {-0}
    2960:	0000018b 	andeq	r0, r0, fp, lsl #3
    2964:	0009240c 	andeq	r2, r9, ip, lsl #8
    2968:	415f0100 	cmpmi	pc, r0, lsl #2
    296c:	01000000 	mrseq	r0, (UNDEF: 0)
    2970:	6c630d50 	stclvs	13, cr0, [r3], #-320	; 0xfffffec0
    2974:	5f01006b 	svcpl	0x0001006b
    2978:	0000005a 	andeq	r0, r0, sl, asr r0
    297c:	76085101 	strvc	r5, [r8], -r1, lsl #2
    2980:	01007261 	tsteq	r0, r1, ror #4
    2984:	00006560 	andeq	r6, r0, r0, ror #10
    2988:	00136e00 	andseq	r6, r3, r0, lsl #28
    298c:	570e0000 	strpl	r0, [lr, -r0]
    2990:	01000008 	tsteq	r0, r8
    2994:	00a40483 	adceq	r0, r4, r3, lsl #9
    2998:	00001800 	andeq	r1, r0, r0, lsl #16
    299c:	0f9c0100 	svceq	0x009c0100
    29a0:	00000894 	muleq	r0, r4, r8
    29a4:	00418901 	subeq	r8, r1, r1, lsl #18
    29a8:	a41c0000 	ldrge	r0, [ip], #-0
    29ac:	00a00000 	adceq	r0, r0, r0
    29b0:	9c010000 	stcls	0, cr0, [r1], {-0}
    29b4:	00000207 	andeq	r0, r0, r7, lsl #4
    29b8:	00086a06 	andeq	r6, r8, r6, lsl #20
    29bc:	41890100 	orrmi	r0, r9, r0, lsl #2
    29c0:	91000000 	mrsls	r0, (UNDEF: 0)
    29c4:	08000013 	stmdaeq	r0, {r0, r1, r4}
    29c8:	00726176 	rsbseq	r6, r2, r6, ror r1
    29cc:	00658a01 	rsbeq	r8, r5, r1, lsl #20
    29d0:	13b20000 			; <UNDEFINED> instruction: 0x13b20000
    29d4:	72080000 	andvc	r0, r8, #0
    29d8:	01007465 	tsteq	r0, r5, ror #8
    29dc:	0000658b 	andeq	r6, r0, fp, lsl #11
    29e0:	0013ec00 	andseq	lr, r3, r0, lsl #24
    29e4:	a4580900 	ldrbge	r0, [r8], #-2304	; 0x900
    29e8:	00730000 	rsbseq	r0, r3, r0
    29ec:	01f60000 	mvnseq	r0, r0
    29f0:	010a0000 	mrseq	r0, (UNDEF: 10)
    29f4:	00750250 	rsbseq	r0, r5, r0, asr r2
    29f8:	a4900b00 	ldrge	r0, [r0], #2816	; 0xb00
    29fc:	00730000 	rsbseq	r0, r3, r0
    2a00:	010a0000 	mrseq	r0, (UNDEF: 10)
    2a04:	00750250 	rsbseq	r0, r5, r0, asr r2
    2a08:	4d100000 	ldcmi	0, cr0, [r0, #-0]
    2a0c:	03000001 	movweq	r0, #1
    2a10:	00411137 	subeq	r1, r1, r7, lsr r1
    2a14:	41110000 	tstmi	r1, r0
    2a18:	00000000 	andeq	r0, r0, r0
    2a1c:	00005e00 	andeq	r5, r0, r0, lsl #28
    2a20:	37000200 	strcc	r0, [r0, -r0, lsl #4]
    2a24:	0400000e 	streq	r0, [r0], #-14
    2a28:	0009fa01 	andeq	pc, r9, r1, lsl #20
    2a2c:	00800000 	addeq	r0, r0, r0
    2a30:	00805400 	addeq	r5, r0, r0, lsl #8
    2a34:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
    2a38:	6b62696c 	blvs	189cff0 <__user_program+0x159cff0>
    2a3c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
    2a40:	6f6f622f 	svcvs	0x006f622f
    2a44:	00532e74 	subseq	r2, r3, r4, ror lr
    2a48:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xd2f
    2a4c:	6667682f 	strbtvs	r6, [r7], -pc, lsr #16
    2a50:	34332f73 	ldrtcc	r2, [r3], #-3955	; 0xf73
    2a54:	31662f39 	cmncc	r6, r9, lsr pc
    2a58:	616c2d37 	cmnvs	ip, r7, lsr sp
    2a5c:	642d3362 	strtvs	r3, [sp], #-866	; 0x362
    2a60:	64697661 	strbtvs	r7, [r9], #-1633	; 0x661
    2a64:	656d616a 	strbvs	r6, [sp, #-362]!	; 0x16a
    2a68:	6f632f73 	svcvs	0x00632f73
    2a6c:	47006564 	strmi	r6, [r0, -r4, ror #10]
    2a70:	4120554e 	teqmi	r0, lr, asr #10
    2a74:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
    2a78:	302e3432 	eorcc	r3, lr, r2, lsr r4
    2a7c:	5d800100 	stfpls	f0, [r0]
    2a80:	02000000 	andeq	r0, r0, #0
    2a84:	000e4b00 	andeq	r4, lr, r0, lsl #22
    2a88:	52010400 	andpl	r0, r1, #0, 8
    2a8c:	bc00000a 	stclt	0, cr0, [r0], {10}
    2a90:	000000a4 	andeq	r0, r0, r4, lsr #1
    2a94:	330000a5 	movwcc	r0, #165	; 0xa5
    2a98:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
    2a9c:	732f6b62 	teqvc	pc, #100352	; 0x18800
    2aa0:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
    2aa4:	532e6d72 	teqpl	lr, #7296	; 0x1c80
    2aa8:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
    2aac:	67682f74 			; <UNDEFINED> instruction: 0x67682f74
    2ab0:	332f7366 	teqcc	pc, #-1744830463	; 0x98000001
    2ab4:	662f3934 			; <UNDEFINED> instruction: 0x662f3934
    2ab8:	6c2d3731 	stcvs	7, cr3, [sp], #-196	; 0xffffff3c
    2abc:	2d336261 	lfmcs	f6, 4, [r3, #-388]!	; 0xfffffe7c
    2ac0:	69766164 	ldmdbvs	r6!, {r2, r5, r6, r8, sp, lr}^
    2ac4:	6d616a64 	vstmdbvs	r1!, {s13-s112}
    2ac8:	632f7365 	teqvs	pc, #-1811939327	; 0x94000001
    2acc:	0065646f 	rsbeq	r6, r5, pc, ror #8
    2ad0:	20554e47 	subscs	r4, r5, r7, asr #28
    2ad4:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    2ad8:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
    2adc:	80010030 	andhi	r0, r1, r0, lsr r0
    2ae0:	00000068 	andeq	r0, r0, r8, rrx
    2ae4:	0e5f0002 	cdpeq	0, 5, cr0, cr15, cr2, {0}
    2ae8:	01040000 	mrseq	r0, (UNDEF: 4)
    2aec:	00000aa3 	andeq	r0, r0, r3, lsr #21
    2af0:	0000a500 	andeq	sl, r0, r0, lsl #10
    2af4:	0000a6c0 	andeq	sl, r0, r0, asr #13
    2af8:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
    2afc:	732f6c65 	teqvc	pc, #25856	; 0x6500
    2b00:	732f6372 	teqvc	pc, #-939524095	; 0xc8000001
    2b04:	72657075 	rsbvc	r7, r5, #117	; 0x75
    2b08:	6f736976 	svcvs	0x00736976
    2b0c:	00532e72 	subseq	r2, r3, r2, ror lr
    2b10:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 2a5c <__start-0x55a4>
    2b14:	63652f65 	cmnvs	r5, #404	; 0x194
    2b18:	39343365 	ldmdbcc	r4!, {r0, r2, r5, r6, r8, r9, ip, sp}
    2b1c:	3934332f 	ldmdbcc	r4!, {r0, r1, r2, r3, r5, r8, r9, ip, sp}
    2b20:	662f332f 	strtvs	r3, [pc], -pc, lsr #6
    2b24:	6c2d3731 	stcvs	7, cr3, [sp], #-196	; 0xffffff3c
    2b28:	2d336261 	lfmcs	f6, 4, [r3, #-388]!	; 0xfffffe7c
    2b2c:	69766164 	ldmdbvs	r6!, {r2, r5, r6, r8, sp, lr}^
    2b30:	6d616a64 	vstmdbvs	r1!, {s13-s112}
    2b34:	632f7365 	teqvs	pc, #-1811939327	; 0x94000001
    2b38:	0065646f 	rsbeq	r6, r5, pc, ror #8
    2b3c:	20554e47 	subscs	r4, r5, r7, asr #28
    2b40:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    2b44:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
    2b48:	80010030 	andhi	r0, r1, r0, lsr r0

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <__end+0x18f0ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <__user_program+0xb83840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x19d87c>
  40:	1119270b 	tstne	r9, fp, lsl #14
  44:	40061201 	andmi	r1, r6, r1, lsl #4
  48:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  4c:	00001301 	andeq	r1, r0, r1, lsl #6
  50:	01828906 	orreq	r8, r2, r6, lsl #18
  54:	31011101 	tstcc	r1, r1, lsl #2
  58:	00130113 	andseq	r0, r3, r3, lsl r1
  5c:	828a0700 	addhi	r0, sl, #0, 14
  60:	18020001 	stmdane	r2, {r0}
  64:	00184291 	mulseq	r8, r1, r2
  68:	82890800 	addhi	r0, r9, #0, 16
  6c:	01110101 	tsteq	r1, r1, lsl #2
  70:	00001331 	andeq	r1, r0, r1, lsr r3
  74:	3f012e09 	svccc	0x00012e09
  78:	3a0e0319 	bcc	380ce4 <__user_program+0x80ce4>
  7c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
  80:	01193c19 	tsteq	r9, r9, lsl ip
  84:	0a000013 	beq	d8 <__start-0x7f28>
  88:	13490005 	movtne	r0, #36869	; 0x9005
  8c:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
  90:	03193f01 	tsteq	r9, #1, 30
  94:	3b0b3a0e 	blcc	2ce8d4 <__end+0x19d8d4>
  98:	3c19270b 	ldccc	7, cr2, [r9], {11}
  9c:	00000019 	andeq	r0, r0, r9, lsl r0
  a0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
  a4:	030b130e 	movweq	r1, #45838	; 0xb30e
  a8:	110e1b0e 	tstne	lr, lr, lsl #22
  ac:	10061201 	andne	r1, r6, r1, lsl #4
  b0:	02000017 	andeq	r0, r0, #23
  b4:	0b0b0024 	bleq	2c014c <__end+0x18f14c>
  b8:	0e030b3e 	vmoveq.16	d3[0], r0
  bc:	16030000 	strne	r0, [r3], -r0
  c0:	3a0e0300 	bcc	380cc8 <__user_program+0x80cc8>
  c4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  c8:	04000013 	streq	r0, [r0], #-19
  cc:	0b0b0024 	bleq	2c0164 <__end+0x18f164>
  d0:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
  d4:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  d8:	03193f01 	tsteq	r9, #1, 30
  dc:	3b0b3a0e 	blcc	2ce91c <__end+0x19d91c>
  e0:	1119270b 	tstne	r9, fp, lsl #14
  e4:	40061201 	andmi	r1, r6, r1, lsl #4
  e8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  ec:	00001301 	andeq	r1, r0, r1, lsl #6
  f0:	03000506 	movweq	r0, #1286	; 0x506
  f4:	3b0b3a08 	blcc	2ce91c <__end+0x19d91c>
  f8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  fc:	07000017 	smladeq	r0, r7, r0, r0
 100:	08030005 	stmdaeq	r3, {r0, r2}
 104:	0b3b0b3a 	bleq	ec2df4 <__user_program+0xbc2df4>
 108:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 10c:	34080000 	strcc	r0, [r8], #-0
 110:	3a080300 	bcc	200d18 <__end+0xcfd18>
 114:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 118:	00170213 	andseq	r0, r7, r3, lsl r2
 11c:	00340900 	eorseq	r0, r4, r0, lsl #18
 120:	0b3a0e03 	bleq	e83934 <__user_program+0xb83934>
 124:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 128:	00001702 	andeq	r1, r0, r2, lsl #14
 12c:	0300050a 	movweq	r0, #1290	; 0x50a
 130:	3b0b3a0e 	blcc	2ce970 <__end+0x19d970>
 134:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 138:	0b000017 	bleq	19c <__start-0x7e64>
 13c:	01018289 	smlabbeq	r1, r9, r2, r8
 140:	13310111 	teqne	r1, #1073741828	; 0x40000004
 144:	00001301 	andeq	r1, r0, r1, lsl #6
 148:	01828a0c 	orreq	r8, r2, ip, lsl #20
 14c:	91180200 	tstls	r8, r0, lsl #4
 150:	00001842 	andeq	r1, r0, r2, asr #16
 154:	0182890d 	orreq	r8, r2, sp, lsl #18
 158:	31011101 	tstcc	r1, r1, lsl #2
 15c:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 160:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 164:	0b3a0e03 	bleq	e83978 <__user_program+0xb83978>
 168:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 16c:	01111349 	tsteq	r1, r9, asr #6
 170:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 174:	01194297 			; <UNDEFINED> instruction: 0x01194297
 178:	0f000013 	svceq	0x00000013
 17c:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 180:	0b3b0b3a 	bleq	ec2e70 <__user_program+0xbc2e70>
 184:	061c1349 	ldreq	r1, [ip], -r9, asr #6
 188:	26100000 	ldrcs	r0, [r0], -r0
 18c:	00134900 	andseq	r4, r3, r0, lsl #18
 190:	000f1100 	andeq	r1, pc, r0, lsl #2
 194:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 198:	35120000 	ldrcc	r0, [r2, #-0]
 19c:	00134900 	andseq	r4, r3, r0, lsl #18
 1a0:	012e1300 	teqeq	lr, r0, lsl #6
 1a4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 1a8:	0b3b0b3a 	bleq	ec2e98 <__user_program+0xbc2e98>
 1ac:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 1b0:	05140000 	ldreq	r0, [r4, #-0]
 1b4:	00134900 	andseq	r4, r3, r0, lsl #18
 1b8:	11010000 	mrsne	r0, (UNDEF: 1)
 1bc:	130e2501 	movwne	r2, #58625	; 0xe501
 1c0:	1b0e030b 	blne	380df4 <__user_program+0x80df4>
 1c4:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 1c8:	00171006 	andseq	r1, r7, r6
 1cc:	00240200 	eoreq	r0, r4, r0, lsl #4
 1d0:	0b3e0b0b 	bleq	f82e04 <__user_program+0xc82e04>
 1d4:	00000e03 	andeq	r0, r0, r3, lsl #28
 1d8:	0b002403 	bleq	91ec <printnumk+0xb0>
 1dc:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 1e0:	04000008 	streq	r0, [r0], #-8
 1e4:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 1e8:	0b3b0b3a 	bleq	ec2ed8 <__user_program+0xbc2ed8>
 1ec:	00001349 	andeq	r1, r0, r9, asr #6
 1f0:	3f012e05 	svccc	0x00012e05
 1f4:	3a0e0319 	bcc	380e60 <__user_program+0x80e60>
 1f8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 1fc:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 200:	97184006 	ldrls	r4, [r8, -r6]
 204:	13011942 	movwne	r1, #6466	; 0x1942
 208:	89060000 	stmdbhi	r6, {}	; <UNPREDICTABLE>
 20c:	11010182 	smlabbne	r1, r2, r1, r0
 210:	00133101 	andseq	r3, r3, r1, lsl #2
 214:	828a0700 	addhi	r0, sl, #0, 14
 218:	18020001 	stmdane	r2, {r0}
 21c:	00184291 	mulseq	r8, r1, r2
 220:	012e0800 	teqeq	lr, r0, lsl #16
 224:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 228:	0b3b0b3a 	bleq	ec2f18 <__user_program+0xbc2f18>
 22c:	13491927 	movtne	r1, #39207	; 0x9927
 230:	06120111 			; <UNDEFINED> instruction: 0x06120111
 234:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 238:	00130119 	andseq	r0, r3, r9, lsl r1
 23c:	00050900 	andeq	r0, r5, r0, lsl #18
 240:	0b3a0e03 	bleq	e83a54 <__user_program+0xb83a54>
 244:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 248:	00001702 	andeq	r1, r0, r2, lsl #14
 24c:	0300340a 	movweq	r3, #1034	; 0x40a
 250:	3b0b3a0e 	blcc	2cea90 <__end+0x19da90>
 254:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 258:	0b000018 	bleq	2c0 <__start-0x7d40>
 25c:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 260:	0b3b0b3a 	bleq	ec2f50 <__user_program+0xbc2f50>
 264:	00001349 	andeq	r1, r0, r9, asr #6
 268:	11010b0c 	tstne	r1, ip, lsl #22
 26c:	01061201 	tsteq	r6, r1, lsl #4
 270:	0d000013 	stceq	0, cr0, [r0, #-76]	; 0xffffffb4
 274:	01018289 	smlabbeq	r1, r9, r2, r8
 278:	13310111 	teqne	r1, #1073741828	; 0x40000004
 27c:	00001301 	andeq	r1, r0, r1, lsl #6
 280:	4901010e 	stmdbmi	r1, {r1, r2, r3, r8}
 284:	00130113 	andseq	r0, r3, r3, lsl r1
 288:	00210f00 	eoreq	r0, r1, r0, lsl #30
 28c:	0b2f1349 	bleq	bc4fb8 <__user_program+0x8c4fb8>
 290:	2e100000 	cdpcs	0, 1, cr0, cr0, cr0, {0}
 294:	03193f01 	tsteq	r9, #1, 30
 298:	3b0b3a0e 	blcc	2cead8 <__end+0x19dad8>
 29c:	3c19270b 	ldccc	7, cr2, [r9], {11}
 2a0:	00130119 	andseq	r0, r3, r9, lsl r1
 2a4:	00051100 	andeq	r1, r5, r0, lsl #2
 2a8:	00001349 	andeq	r1, r0, r9, asr #6
 2ac:	3f012e12 	svccc	0x00012e12
 2b0:	3a0e0319 	bcc	380f1c <__user_program+0x80f1c>
 2b4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 2b8:	3c134919 	ldccc	9, cr4, [r3], {25}
 2bc:	00130119 	andseq	r0, r3, r9, lsl r1
 2c0:	000f1300 	andeq	r1, pc, r0, lsl #6
 2c4:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 2c8:	2e140000 	cdpcs	0, 1, cr0, cr4, cr0, {0}
 2cc:	03193f01 	tsteq	r9, #1, 30
 2d0:	3b0b3a0e 	blcc	2ceb10 <__end+0x19db10>
 2d4:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 2d8:	00193c13 	andseq	r3, r9, r3, lsl ip
 2dc:	11010000 	mrsne	r0, (UNDEF: 1)
 2e0:	130e2501 	movwne	r2, #58625	; 0xe501
 2e4:	1b0e030b 	blne	380f18 <__user_program+0x80f18>
 2e8:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 2ec:	00171006 	andseq	r1, r7, r6
 2f0:	00240200 	eoreq	r0, r4, r0, lsl #4
 2f4:	0b3e0b0b 	bleq	f82f28 <__user_program+0xc82f28>
 2f8:	00000e03 	andeq	r0, r0, r3, lsl #28
 2fc:	0b002403 	bleq	9310 <printk+0xf4>
 300:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 304:	04000008 	streq	r0, [r0], #-8
 308:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 30c:	0b3b0b3a 	bleq	ec2ffc <__user_program+0xbc2ffc>
 310:	00001349 	andeq	r1, r0, r9, asr #6
 314:	3f012e05 	svccc	0x00012e05
 318:	3a0e0319 	bcc	380f84 <__user_program+0x80f84>
 31c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 320:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 324:	97184006 	ldrls	r4, [r8, -r6]
 328:	13011942 	movwne	r1, #6466	; 0x1942
 32c:	05060000 	streq	r0, [r6, #-0]
 330:	3a080300 	bcc	200f38 <__end+0xcff38>
 334:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 338:	00170213 	andseq	r0, r7, r3, lsl r2
 33c:	82890700 	addhi	r0, r9, #0, 14
 340:	01110101 	tsteq	r1, r1, lsl #2
 344:	13011331 	movwne	r1, #4913	; 0x1331
 348:	8a080000 	bhi	200350 <__end+0xcf350>
 34c:	02000182 	andeq	r0, r0, #-2147483616	; 0x80000020
 350:	18429118 	stmdane	r2, {r3, r4, r8, ip, pc}^
 354:	89090000 	stmdbhi	r9, {}	; <UNPREDICTABLE>
 358:	11010182 	smlabbne	r1, r2, r1, r0
 35c:	00133101 	andseq	r3, r3, r1, lsl #2
 360:	012e0a00 	teqeq	lr, r0, lsl #20
 364:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 368:	0b3b0b3a 	bleq	ec3058 <__user_program+0xbc3058>
 36c:	13491927 	movtne	r1, #39207	; 0x9927
 370:	06120111 			; <UNDEFINED> instruction: 0x06120111
 374:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 378:	00130119 	andseq	r0, r3, r9, lsl r1
 37c:	00050b00 	andeq	r0, r5, r0, lsl #22
 380:	0b3a0e03 	bleq	e83b94 <__user_program+0xb83b94>
 384:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 388:	00001702 	andeq	r1, r0, r2, lsl #14
 38c:	0300340c 	movweq	r3, #1036	; 0x40c
 390:	3b0b3a08 	blcc	2cebb8 <__end+0x19dbb8>
 394:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 398:	0d000017 	stceq	0, cr0, [r0, #-92]	; 0xffffffa4
 39c:	0b0b000f 	bleq	2c03e0 <__end+0x18f3e0>
 3a0:	00001349 	andeq	r1, r0, r9, asr #6
 3a4:	0300050e 	movweq	r0, #1294	; 0x50e
 3a8:	3b0b3a08 	blcc	2cebd0 <__end+0x19dbd0>
 3ac:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 3b0:	0f000018 	svceq	0x00000018
 3b4:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 3b8:	0b3a0e03 	bleq	e83bcc <__user_program+0xb83bcc>
 3bc:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 3c0:	1301193c 	movwne	r1, #6460	; 0x193c
 3c4:	05100000 	ldreq	r0, [r0, #-0]
 3c8:	00134900 	andseq	r4, r3, r0, lsl #18
 3cc:	012e1100 	teqeq	lr, r0, lsl #2
 3d0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 3d4:	0b3b0b3a 	bleq	ec30c4 <__user_program+0xbc30c4>
 3d8:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 3dc:	01000000 	mrseq	r0, (UNDEF: 0)
 3e0:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 3e4:	0e030b13 	vmoveq.32	d3[0], r0
 3e8:	01110e1b 	tsteq	r1, fp, lsl lr
 3ec:	17100612 			; <UNDEFINED> instruction: 0x17100612
 3f0:	16020000 	strne	r0, [r2], -r0
 3f4:	3a0e0300 	bcc	380ffc <__user_program+0x80ffc>
 3f8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3fc:	03000013 	movweq	r0, #19
 400:	0b0b0024 	bleq	2c0498 <__end+0x18f498>
 404:	0e030b3e 	vmoveq.16	d3[0], r0
 408:	24040000 	strcs	r0, [r4], #-0
 40c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 410:	0008030b 	andeq	r0, r8, fp, lsl #6
 414:	01130500 	tsteq	r3, r0, lsl #10
 418:	0b0b0e03 	bleq	2c3c2c <__end+0x192c2c>
 41c:	0b3b0b3a 	bleq	ec310c <__user_program+0xbc310c>
 420:	00001301 	andeq	r1, r0, r1, lsl #6
 424:	03000d06 	movweq	r0, #3334	; 0xd06
 428:	3b0b3a0e 	blcc	2cec68 <__end+0x19dc68>
 42c:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 430:	0700000b 	streq	r0, [r0, -fp]
 434:	13490035 	movtne	r0, #36917	; 0x9035
 438:	0f080000 	svceq	0x00080000
 43c:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 440:	09000013 	stmdbeq	r0, {r0, r1, r4}
 444:	19270015 	stmdbne	r7!, {r0, r2, r4}
 448:	0d0a0000 	stceq	0, cr0, [sl, #-0]
 44c:	3a080300 	bcc	201054 <__end+0xd0054>
 450:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 454:	000b3813 	andeq	r3, fp, r3, lsl r8
 458:	012e0b00 	teqeq	lr, r0, lsl #22
 45c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 460:	0b3b0b3a 	bleq	ec3150 <__user_program+0xbc3150>
 464:	01111927 	tsteq	r1, r7, lsr #18
 468:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 46c:	01194297 			; <UNDEFINED> instruction: 0x01194297
 470:	0c000013 	stceq	0, cr0, [r0], {19}
 474:	00018289 	andeq	r8, r1, r9, lsl #5
 478:	13310111 	teqne	r1, #1073741828	; 0x40000004
 47c:	2e0d0000 	cdpcs	0, 0, cr0, cr13, cr0, {0}
 480:	03193f01 	tsteq	r9, #1, 30
 484:	3b0b3a0e 	blcc	2cecc4 <__end+0x19dcc4>
 488:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 48c:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 490:	97184006 	ldrls	r4, [r8, -r6]
 494:	13011942 	movwne	r1, #6466	; 0x1942
 498:	340e0000 	strcc	r0, [lr], #-0
 49c:	3a080300 	bcc	2010a4 <__end+0xd00a4>
 4a0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 4a4:	00170213 	andseq	r0, r7, r3, lsl r2
 4a8:	00340f00 	eorseq	r0, r4, r0, lsl #30
 4ac:	0b3a0e03 	bleq	e83cc0 <__user_program+0xb83cc0>
 4b0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 4b4:	00001702 	andeq	r1, r0, r2, lsl #14
 4b8:	03000510 	movweq	r0, #1296	; 0x510
 4bc:	3b0b3a0e 	blcc	2cecfc <__end+0x19dcfc>
 4c0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 4c4:	11000017 	tstne	r0, r7, lsl r0
 4c8:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 4cc:	0b3b0b3a 	bleq	ec31bc <__user_program+0xbc31bc>
 4d0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 4d4:	2e120000 	cdpcs	0, 1, cr0, cr2, cr0, {0}
 4d8:	03193f00 	tsteq	r9, #0, 30
 4dc:	3b0b3a0e 	blcc	2ced1c <__end+0x19dd1c>
 4e0:	1119270b 	tstne	r9, fp, lsl #14
 4e4:	40061201 	andmi	r1, r6, r1, lsl #4
 4e8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 4ec:	2e130000 	cdpcs	0, 1, cr0, cr3, cr0, {0}
 4f0:	03193f01 	tsteq	r9, #1, 30
 4f4:	3b0b3a0e 	blcc	2ced34 <__end+0x19dd34>
 4f8:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
 4fc:	97184006 	ldrls	r4, [r8, -r6]
 500:	13011942 	movwne	r1, #6466	; 0x1942
 504:	89140000 	ldmdbhi	r4, {}	; <UNPREDICTABLE>
 508:	11010182 	smlabbne	r1, r2, r1, r0
 50c:	01133101 	tsteq	r3, r1, lsl #2
 510:	15000013 	strne	r0, [r0, #-19]
 514:	0001828a 	andeq	r8, r1, sl, lsl #5
 518:	42911802 	addsmi	r1, r1, #131072	; 0x20000
 51c:	16000018 			; <UNDEFINED> instruction: 0x16000018
 520:	01018289 	smlabbeq	r1, r9, r2, r8
 524:	13310111 	teqne	r1, #1073741828	; 0x40000004
 528:	0f170000 	svceq	0x00170000
 52c:	000b0b00 	andeq	r0, fp, r0, lsl #22
 530:	00341800 	eorseq	r1, r4, r0, lsl #16
 534:	0b3a0e03 	bleq	e83d48 <__user_program+0xb83d48>
 538:	1349053b 	movtne	r0, #38203	; 0x953b
 53c:	00001702 	andeq	r1, r0, r2, lsl #14
 540:	49010119 	stmdbmi	r1, {r0, r3, r4, r8}
 544:	00130113 	andseq	r0, r3, r3, lsl r1
 548:	00211a00 	eoreq	r1, r1, r0, lsl #20
 54c:	0b2f1349 	bleq	bc5278 <__user_program+0x8c5278>
 550:	341b0000 	ldrcc	r0, [fp], #-0
 554:	3a0e0300 	bcc	38115c <__user_program+0x8115c>
 558:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 55c:	02193f13 	andseq	r3, r9, #19, 30	; 0x4c
 560:	1c000018 	stcne	0, cr0, [r0], {24}
 564:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 568:	0b3a0e03 	bleq	e83d7c <__user_program+0xb83d7c>
 56c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 570:	0000193c 	andeq	r1, r0, ip, lsr r9
 574:	3f012e1d 	svccc	0x00012e1d
 578:	3a0e0319 	bcc	3811e4 <__user_program+0x811e4>
 57c:	3c0b3b0b 	stccc	11, cr3, [fp], {11}
 580:	00130119 	andseq	r0, r3, r9, lsl r1
 584:	00181e00 	andseq	r1, r8, r0, lsl #28
 588:	2e1f0000 	cdpcs	0, 1, cr0, cr15, cr0, {0}
 58c:	03193f01 	tsteq	r9, #1, 30
 590:	3b0b3a0e 	blcc	2cedd0 <__end+0x19ddd0>
 594:	3c13490b 	ldccc	9, cr4, [r3], {11}
 598:	00130119 	andseq	r0, r3, r9, lsl r1
 59c:	012e2000 	teqeq	lr, r0
 5a0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 5a4:	0b3b0b3a 	bleq	ec3294 <__user_program+0xbc3294>
 5a8:	13491927 	movtne	r1, #39207	; 0x9927
 5ac:	1301193c 	movwne	r1, #6460	; 0x193c
 5b0:	05210000 	streq	r0, [r1, #-0]!
 5b4:	00134900 	andseq	r4, r3, r0, lsl #18
 5b8:	002e2200 	eoreq	r2, lr, r0, lsl #4
 5bc:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 5c0:	0b3b0b3a 	bleq	ec32b0 <__user_program+0xbc32b0>
 5c4:	13491927 	movtne	r1, #39207	; 0x9927
 5c8:	0000193c 	andeq	r1, r0, ip, lsr r9
 5cc:	3f012e23 	svccc	0x00012e23
 5d0:	3a0e0319 	bcc	38123c <__user_program+0x8123c>
 5d4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 5d8:	01193c19 	tsteq	r9, r9, lsl ip
 5dc:	24000013 	strcs	r0, [r0], #-19
 5e0:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 5e4:	0b3a0e03 	bleq	e83df8 <__user_program+0xb83df8>
 5e8:	1927053b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, sl}
 5ec:	193c1349 	ldmdbne	ip!, {r0, r3, r6, r8, r9, ip}
 5f0:	2e250000 	cdpcs	0, 2, cr0, cr5, cr0, {0}
 5f4:	03193f01 	tsteq	r9, #1, 30
 5f8:	3b0b3a0e 	blcc	2cee38 <__end+0x19de38>
 5fc:	3c192705 	ldccc	7, cr2, [r9], {5}
 600:	00000019 	andeq	r0, r0, r9, lsl r0
 604:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 608:	030b130e 	movweq	r1, #45838	; 0xb30e
 60c:	110e1b0e 	tstne	lr, lr, lsl #22
 610:	10061201 	andne	r1, r6, r1, lsl #4
 614:	02000017 	andeq	r0, r0, #23
 618:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 61c:	0b3b0b3a 	bleq	ec330c <__user_program+0xbc330c>
 620:	00001349 	andeq	r1, r0, r9, asr #6
 624:	0b002403 	bleq	9638 <syscall_read+0x90>
 628:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 62c:	0400000e 	streq	r0, [r0], #-14
 630:	0b0b0024 	bleq	2c06c8 <__end+0x18f6c8>
 634:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 638:	13050000 	movwne	r0, #20480	; 0x5000
 63c:	0b0e0301 	bleq	381248 <__user_program+0x81248>
 640:	3b0b3a0b 	blcc	2cee74 <__end+0x19de74>
 644:	0013010b 	andseq	r0, r3, fp, lsl #2
 648:	000d0600 	andeq	r0, sp, r0, lsl #12
 64c:	13490e03 	movtne	r0, #40451	; 0x9e03
 650:	19340b38 	ldmdbne	r4!, {r3, r4, r5, r8, r9, fp}
 654:	0f070000 	svceq	0x00070000
 658:	000b0b00 	andeq	r0, fp, r0, lsl #22
 65c:	012e0800 	teqeq	lr, r0, lsl #16
 660:	0b3a0e03 	bleq	e83e74 <__user_program+0xb83e74>
 664:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 668:	06120111 			; <UNDEFINED> instruction: 0x06120111
 66c:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 670:	00130119 	andseq	r0, r3, r9, lsl r1
 674:	00050900 	andeq	r0, r5, r0, lsl #18
 678:	0b3a0e03 	bleq	e83e8c <__user_program+0xb83e8c>
 67c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 680:	00001702 	andeq	r1, r0, r2, lsl #14
 684:	0300050a 	movweq	r0, #1290	; 0x50a
 688:	3b0b3a08 	blcc	2ceeb0 <__end+0x19deb0>
 68c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 690:	0b000017 	bleq	6f4 <__start-0x790c>
 694:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 698:	0b3b0b3a 	bleq	ec3388 <__user_program+0xbc3388>
 69c:	17021349 	strne	r1, [r2, -r9, asr #6]
 6a0:	340c0000 	strcc	r0, [ip], #-0
 6a4:	3a080300 	bcc	2012ac <__end+0xd02ac>
 6a8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 6ac:	00180213 	andseq	r0, r8, r3, lsl r2
 6b0:	00340d00 	eorseq	r0, r4, r0, lsl #26
 6b4:	0b3a0803 	bleq	e826c8 <__user_program+0xb826c8>
 6b8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6bc:	00001702 	andeq	r1, r0, r2, lsl #14
 6c0:	0182890e 	orreq	r8, r2, lr, lsl #18
 6c4:	31011100 	mrscc	r1, (UNDEF: 17)
 6c8:	0f000013 	svceq	0x00000013
 6cc:	0b0b000f 	bleq	2c0710 <__end+0x18f710>
 6d0:	00001349 	andeq	r1, r0, r9, asr #6
 6d4:	49010110 	stmdbmi	r1, {r4, r8}
 6d8:	00130113 	andseq	r0, r3, r3, lsl r1
 6dc:	00211100 	eoreq	r1, r1, r0, lsl #2
 6e0:	0b2f1349 	bleq	bc540c <__user_program+0x8c540c>
 6e4:	2e120000 	cdpcs	0, 1, cr0, cr2, cr0, {0}
 6e8:	03193f01 	tsteq	r9, #1, 30
 6ec:	3b0b3a0e 	blcc	2cef2c <__end+0x19df2c>
 6f0:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 6f4:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 6f8:	97184006 	ldrls	r4, [r8, -r6]
 6fc:	13011942 	movwne	r1, #6466	; 0x1942
 700:	18130000 	ldmdane	r3, {}	; <UNPREDICTABLE>
 704:	14000000 	strne	r0, [r0], #-0
 708:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 70c:	0b3b0b3a 	bleq	ec33fc <__user_program+0xbc33fc>
 710:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 714:	0b150000 	bleq	54071c <__user_program+0x24071c>
 718:	01175501 	tsteq	r7, r1, lsl #10
 71c:	16000013 			; <UNDEFINED> instruction: 0x16000013
 720:	01018289 	smlabbeq	r1, r9, r2, r8
 724:	13310111 	teqne	r1, #1073741828	; 0x40000004
 728:	8a170000 	bhi	5c0730 <__user_program+0x2c0730>
 72c:	02000182 	andeq	r0, r0, #-2147483616	; 0x80000020
 730:	18429118 	stmdane	r2, {r3, r4, r8, ip, pc}^
 734:	0b180000 	bleq	60073c <__user_program+0x30073c>
 738:	12011101 	andne	r1, r1, #1073741824	; 0x40000000
 73c:	00130106 	andseq	r0, r3, r6, lsl #2
 740:	82891900 	addhi	r1, r9, #0, 18
 744:	01110101 	tsteq	r1, r1, lsl #2
 748:	13011331 	movwne	r1, #4913	; 0x1331
 74c:	261a0000 	ldrcs	r0, [sl], -r0
 750:	00134900 	andseq	r4, r3, r0, lsl #18
 754:	012e1b00 	teqeq	lr, r0, lsl #22
 758:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 75c:	0b3b0b3a 	bleq	ec344c <__user_program+0xbc344c>
 760:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 764:	051c0000 	ldreq	r0, [ip, #-0]
 768:	00134900 	andseq	r4, r3, r0, lsl #18
 76c:	11010000 	mrsne	r0, (UNDEF: 1)
 770:	130e2501 	movwne	r2, #58625	; 0xe501
 774:	1b0e030b 	blne	3813a8 <__user_program+0x813a8>
 778:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 77c:	00171006 	andseq	r1, r7, r6
 780:	00240200 	eoreq	r0, r4, r0, lsl #4
 784:	0b3e0b0b 	bleq	f833b8 <__user_program+0xc833b8>
 788:	00000e03 	andeq	r0, r0, r3, lsl #28
 78c:	0b002403 	bleq	97a0 <thread_init+0x60>
 790:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 794:	04000008 	streq	r0, [r0], #-8
 798:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 79c:	0b3b0b3a 	bleq	ec348c <__user_program+0xbc348c>
 7a0:	00001349 	andeq	r1, r0, r9, asr #6
 7a4:	3f012e05 	svccc	0x00012e05
 7a8:	3a0e0319 	bcc	381414 <__user_program+0x81414>
 7ac:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 7b0:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 7b4:	97184006 	ldrls	r4, [r8, -r6]
 7b8:	13011942 	movwne	r1, #6466	; 0x1942
 7bc:	05060000 	streq	r0, [r6, #-0]
 7c0:	3a0e0300 	bcc	3813c8 <__user_program+0x813c8>
 7c4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 7c8:	00180213 	andseq	r0, r8, r3, lsl r2
 7cc:	002e0700 	eoreq	r0, lr, r0, lsl #14
 7d0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 7d4:	0b3b0b3a 	bleq	ec34c4 <__user_program+0xbc34c4>
 7d8:	01111927 	tsteq	r1, r7, lsr #18
 7dc:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 7e0:	00194297 	mulseq	r9, r7, r2
 7e4:	002e0800 	eoreq	r0, lr, r0, lsl #16
 7e8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 7ec:	0b3b0b3a 	bleq	ec34dc <__user_program+0xbc34dc>
 7f0:	13491927 	movtne	r1, #39207	; 0x9927
 7f4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 7f8:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 7fc:	00000019 	andeq	r0, r0, r9, lsl r0
 800:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 804:	030b130e 	movweq	r1, #45838	; 0xb30e
 808:	110e1b0e 	tstne	lr, lr, lsl #22
 80c:	10061201 	andne	r1, r6, r1, lsl #4
 810:	02000017 	andeq	r0, r0, #23
 814:	0b0b0024 	bleq	2c08ac <__end+0x18f8ac>
 818:	0e030b3e 	vmoveq.16	d3[0], r0
 81c:	24030000 	strcs	r0, [r3], #-0
 820:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 824:	0008030b 	andeq	r0, r8, fp, lsl #6
 828:	00160400 	andseq	r0, r6, r0, lsl #8
 82c:	0b3a0e03 	bleq	e84040 <__user_program+0xb84040>
 830:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 834:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
 838:	03193f01 	tsteq	r9, #1, 30
 83c:	3b0b3a0e 	blcc	2cf07c <__end+0x19e07c>
 840:	1119270b 	tstne	r9, fp, lsl #14
 844:	40061201 	andmi	r1, r6, r1, lsl #4
 848:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 84c:	00001301 	andeq	r1, r0, r1, lsl #6
 850:	03003406 	movweq	r3, #1030	; 0x406
 854:	3b0b3a0e 	blcc	2cf094 <__end+0x19e094>
 858:	1c13490b 	ldcne	9, cr4, [r3], {11}
 85c:	07000005 	streq	r0, [r0, -r5]
 860:	01018289 	smlabbeq	r1, r9, r2, r8
 864:	13310111 	teqne	r1, #1073741828	; 0x40000004
 868:	00001301 	andeq	r1, r0, r1, lsl #6
 86c:	01828a08 	orreq	r8, r2, r8, lsl #20
 870:	91180200 	tstls	r8, r0, lsl #4
 874:	00001842 	andeq	r1, r0, r2, asr #16
 878:	01828909 	orreq	r8, r2, r9, lsl #18
 87c:	31011101 	tstcc	r1, r1, lsl #2
 880:	0a000013 	beq	8d4 <__start-0x772c>
 884:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 888:	0b3a0e03 	bleq	e8409c <__user_program+0xb8409c>
 88c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 890:	06120111 			; <UNDEFINED> instruction: 0x06120111
 894:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 898:	0b000019 	bleq	904 <__start-0x76fc>
 89c:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 8a0:	0b3b0b3a 	bleq	ec3590 <__user_program+0xbc3590>
 8a4:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 8a8:	2e0c0000 	cdpcs	0, 0, cr0, cr12, cr0, {0}
 8ac:	03193f00 	tsteq	r9, #0, 30
 8b0:	3b0b3a0e 	blcc	2cf0f0 <__end+0x19e0f0>
 8b4:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 8b8:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 8bc:	97184006 	ldrls	r4, [r8, -r6]
 8c0:	00001942 	andeq	r1, r0, r2, asr #18
 8c4:	3f012e0d 	svccc	0x00012e0d
 8c8:	3a0e0319 	bcc	381534 <__user_program+0x81534>
 8cc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 8d0:	01193c19 	tsteq	r9, r9, lsl ip
 8d4:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 8d8:	13490005 	movtne	r0, #36869	; 0x9005
 8dc:	2e0f0000 	cdpcs	0, 0, cr0, cr15, cr0, {0}
 8e0:	03193f01 	tsteq	r9, #1, 30
 8e4:	3b0b3a0e 	blcc	2cf124 <__end+0x19e124>
 8e8:	3c19270b 	ldccc	7, cr2, [r9], {11}
 8ec:	00000019 	andeq	r0, r0, r9, lsl r0
 8f0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 8f4:	030b130e 	movweq	r1, #45838	; 0xb30e
 8f8:	110e1b0e 	tstne	lr, lr, lsl #22
 8fc:	10061201 	andne	r1, r6, r1, lsl #4
 900:	02000017 	andeq	r0, r0, #23
 904:	0b0b0024 	bleq	2c099c <__end+0x18f99c>
 908:	0e030b3e 	vmoveq.16	d3[0], r0
 90c:	24030000 	strcs	r0, [r3], #-0
 910:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 914:	0008030b 	andeq	r0, r8, fp, lsl #6
 918:	00160400 	andseq	r0, r6, r0, lsl #8
 91c:	0b3a0e03 	bleq	e84130 <__user_program+0xb84130>
 920:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 924:	13050000 	movwne	r0, #20480	; 0x5000
 928:	0b0e0301 	bleq	381534 <__user_program+0x81534>
 92c:	3b0b3a0b 	blcc	2cf160 <__end+0x19e160>
 930:	0013010b 	andseq	r0, r3, fp, lsl #2
 934:	000d0600 	andeq	r0, sp, r0, lsl #12
 938:	0b3a0e03 	bleq	e8414c <__user_program+0xb8414c>
 93c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 940:	00000b38 	andeq	r0, r0, r8, lsr fp
 944:	49003507 	stmdbmi	r0, {r0, r1, r2, r8, sl, ip, sp}
 948:	08000013 	stmdaeq	r0, {r0, r1, r4}
 94c:	0b0b000f 	bleq	2c0990 <__end+0x18f990>
 950:	00001349 	andeq	r1, r0, r9, asr #6
 954:	27001509 	strcs	r1, [r0, -r9, lsl #10]
 958:	0a000019 	beq	9c4 <__start-0x763c>
 95c:	0803000d 	stmdaeq	r3, {r0, r2, r3}
 960:	0b3b0b3a 	bleq	ec3650 <__user_program+0xbc3650>
 964:	0b381349 	bleq	e05690 <__user_program+0xb05690>
 968:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
 96c:	03193f01 	tsteq	r9, #1, 30
 970:	3b0b3a0e 	blcc	2cf1b0 <__end+0x19e1b0>
 974:	1119270b 	tstne	r9, fp, lsl #14
 978:	40061201 	andmi	r1, r6, r1, lsl #4
 97c:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 980:	00001301 	andeq	r1, r0, r1, lsl #6
 984:	0300050c 	movweq	r0, #1292	; 0x50c
 988:	3b0b3a0e 	blcc	2cf1c8 <__end+0x19e1c8>
 98c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 990:	0d000017 	stceq	0, cr0, [r0, #-92]	; 0xffffffa4
 994:	00018289 	andeq	r8, r1, r9, lsl #5
 998:	13310111 	teqne	r1, #1073741828	; 0x40000004
 99c:	2e0e0000 	cdpcs	0, 0, cr0, cr14, cr0, {0}
 9a0:	03193f01 	tsteq	r9, #1, 30
 9a4:	3b0b3a0e 	blcc	2cf1e4 <__end+0x19e1e4>
 9a8:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 9ac:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 9b0:	97184006 	ldrls	r4, [r8, -r6]
 9b4:	13011942 	movwne	r1, #6466	; 0x1942
 9b8:	050f0000 	streq	r0, [pc, #-0]	; 9c0 <__start-0x7640>
 9bc:	3a080300 	bcc	2015c4 <__end+0xd05c4>
 9c0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 9c4:	00170213 	andseq	r0, r7, r3, lsl r2
 9c8:	00341000 	eorseq	r1, r4, r0
 9cc:	0b3a0803 	bleq	e829e0 <__user_program+0xb829e0>
 9d0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 9d4:	00001702 	andeq	r1, r0, r2, lsl #14
 9d8:	03003411 	movweq	r3, #1041	; 0x411
 9dc:	3b0b3a0e 	blcc	2cf21c <__end+0x19e21c>
 9e0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 9e4:	12000017 	andne	r0, r0, #23
 9e8:	01018289 	smlabbeq	r1, r9, r2, r8
 9ec:	13310111 	teqne	r1, #1073741828	; 0x40000004
 9f0:	00001301 	andeq	r1, r0, r1, lsl #6
 9f4:	01828a13 	orreq	r8, r2, r3, lsl sl
 9f8:	91180200 	tstls	r8, r0, lsl #4
 9fc:	00001842 	andeq	r1, r0, r2, asr #16
 a00:	03000514 	movweq	r0, #1300	; 0x514
 a04:	3b0b3a08 	blcc	2cf22c <__end+0x19e22c>
 a08:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 a0c:	15000018 	strne	r0, [r0, #-24]
 a10:	01018289 	smlabbeq	r1, r9, r2, r8
 a14:	13310111 	teqne	r1, #1073741828	; 0x40000004
 a18:	34160000 	ldrcc	r0, [r6], #-0
 a1c:	3a0e0300 	bcc	381624 <__user_program+0x81624>
 a20:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 a24:	00180213 	andseq	r0, r8, r3, lsl r2
 a28:	010b1700 	tsteq	fp, r0, lsl #14
 a2c:	13011755 	movwne	r1, #5973	; 0x1755
 a30:	0b180000 	bleq	600a38 <__user_program+0x300a38>
 a34:	00175501 	andseq	r5, r7, r1, lsl #10
 a38:	012e1900 	teqeq	lr, r0, lsl #18
 a3c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 a40:	0b3b0b3a 	bleq	ec3730 <__user_program+0xbc3730>
 a44:	13491927 	movtne	r1, #39207	; 0x9927
 a48:	06120111 			; <UNDEFINED> instruction: 0x06120111
 a4c:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 a50:	00130119 	andseq	r0, r3, r9, lsl r1
 a54:	002e1a00 	eoreq	r1, lr, r0, lsl #20
 a58:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 a5c:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xb3a
 a60:	01111927 	tsteq	r1, r7, lsr #18
 a64:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 a68:	00194297 	mulseq	r9, r7, r2
 a6c:	002e1b00 	eoreq	r1, lr, r0, lsl #22
 a70:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 a74:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xb3a
 a78:	13491927 	movtne	r1, #39207	; 0x9927
 a7c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 a80:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 a84:	1c000019 	stcne	0, cr0, [r0], {25}
 a88:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 a8c:	0b3a0e03 	bleq	e842a0 <__user_program+0xb842a0>
 a90:	1927053b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, sl}
 a94:	06120111 			; <UNDEFINED> instruction: 0x06120111
 a98:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 a9c:	00130119 	andseq	r0, r3, r9, lsl r1
 aa0:	00051d00 	andeq	r1, r5, r0, lsl #26
 aa4:	0b3a0803 	bleq	e82ab8 <__user_program+0xb82ab8>
 aa8:	1349053b 	movtne	r0, #38203	; 0x953b
 aac:	00001702 	andeq	r1, r0, r2, lsl #14
 ab0:	3f012e1e 	svccc	0x00012e1e
 ab4:	3a0e0319 	bcc	381720 <__user_program+0x81720>
 ab8:	27053b0b 	strcs	r3, [r5, -fp, lsl #22]
 abc:	11134919 	tstne	r3, r9, lsl r9
 ac0:	40061201 	andmi	r1, r6, r1, lsl #4
 ac4:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 ac8:	00001301 	andeq	r1, r0, r1, lsl #6
 acc:	0300051f 	movweq	r0, #1311	; 0x51f
 ad0:	3b0b3a0e 	blcc	2cf310 <__end+0x19e310>
 ad4:	02134905 	andseq	r4, r3, #81920	; 0x14000
 ad8:	20000017 	andcs	r0, r0, r7, lsl r0
 adc:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 ae0:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xb3a
 ae4:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 ae8:	0000193c 	andeq	r1, r0, ip, lsr r9
 aec:	03003421 	movweq	r3, #1057	; 0x421
 af0:	3b0b3a0e 	blcc	2cf330 <__end+0x19e330>
 af4:	02134905 	andseq	r4, r3, #81920	; 0x14000
 af8:	22000018 	andcs	r0, r0, #24
 afc:	0b0b000f 	bleq	2c0b40 <__end+0x18fb40>
 b00:	05230000 	streq	r0, [r3, #-0]!
 b04:	3a080300 	bcc	20170c <__end+0xd070c>
 b08:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 b0c:	00180213 	andseq	r0, r8, r3, lsl r2
 b10:	01012400 	tsteq	r1, r0, lsl #8
 b14:	13011349 	movwne	r1, #4937	; 0x1349
 b18:	21250000 	teqcs	r5, r0
 b1c:	2f134900 	svccs	0x00134900
 b20:	2600000b 	strcs	r0, [r0], -fp
 b24:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 b28:	0b3b0b3a 	bleq	ec3818 <__user_program+0xbc3818>
 b2c:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 b30:	00001802 	andeq	r1, r0, r2, lsl #16
 b34:	3f002e27 	svccc	0x00002e27
 b38:	3a0e0319 	bcc	3817a4 <__user_program+0x817a4>
 b3c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 b40:	00193c19 	andseq	r3, r9, r9, lsl ip
 b44:	012e2800 	teqeq	lr, r0, lsl #16
 b48:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 b4c:	0b3b0b3a 	bleq	ec383c <__user_program+0xbc383c>
 b50:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 b54:	00001301 	andeq	r1, r0, r1, lsl #6
 b58:	49000529 	stmdbmi	r0, {r0, r3, r5, r8, sl}
 b5c:	2a000013 	bcs	bb0 <__start-0x7450>
 b60:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 b64:	0b3a0e03 	bleq	e84378 <__user_program+0xb84378>
 b68:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 b6c:	193c1349 	ldmdbne	ip!, {r0, r3, r6, r8, r9, ip}
 b70:	2e2b0000 	cdpcs	0, 2, cr0, cr11, cr0, {0}
 b74:	03193f01 	tsteq	r9, #1, 30
 b78:	3b0b3a0e 	blcc	2cf3b8 <__end+0x19e3b8>
 b7c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 b80:	01193c13 	tsteq	r9, r3, lsl ip
 b84:	2c000013 	stccs	0, cr0, [r0], {19}
 b88:	00000018 	andeq	r0, r0, r8, lsl r0
 b8c:	4900262d 	stmdbmi	r0, {r0, r2, r3, r5, r9, sl, sp}
 b90:	2e000013 	mcrcs	0, 0, r0, cr0, cr3, {0}
 b94:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 b98:	0b3a0e03 	bleq	e843ac <__user_program+0xb843ac>
 b9c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 ba0:	0000193c 	andeq	r1, r0, ip, lsr r9
 ba4:	01110100 	tsteq	r1, r0, lsl #2
 ba8:	0b130e25 	bleq	4c4444 <__user_program+0x1c4444>
 bac:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 bb0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 bb4:	00001710 	andeq	r1, r0, r0, lsl r7
 bb8:	0b002402 	bleq	9bc8 <scheduler_start+0x158>
 bbc:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 bc0:	0300000e 	movweq	r0, #14
 bc4:	0b0b0024 	bleq	2c0c5c <__end+0x18fc5c>
 bc8:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 bcc:	16040000 	strne	r0, [r4], -r0
 bd0:	3a0e0300 	bcc	3817d8 <__user_program+0x817d8>
 bd4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 bd8:	05000013 	streq	r0, [r0, #-19]
 bdc:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 be0:	0b3a0e03 	bleq	e843f4 <__user_program+0xb843f4>
 be4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 be8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 bec:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 bf0:	00130119 	andseq	r0, r3, r9, lsl r1
 bf4:	00050600 	andeq	r0, r5, r0, lsl #12
 bf8:	0b3a0e03 	bleq	e8440c <__user_program+0xb8440c>
 bfc:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 c00:	00001702 	andeq	r1, r0, r2, lsl #14
 c04:	3f012e07 	svccc	0x00012e07
 c08:	3a0e0319 	bcc	381874 <__user_program+0x81874>
 c0c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 c10:	11134919 	tstne	r3, r9, lsl r9
 c14:	40061201 	andmi	r1, r6, r1, lsl #4
 c18:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 c1c:	00001301 	andeq	r1, r0, r1, lsl #6
 c20:	03000508 	movweq	r0, #1288	; 0x508
 c24:	3b0b3a08 	blcc	2cf44c <__end+0x19e44c>
 c28:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 c2c:	09000017 	stmdbeq	r0, {r0, r1, r2, r4}
 c30:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 c34:	0b3b0b3a 	bleq	ec3924 <__user_program+0xbc3924>
 c38:	17021349 	strne	r1, [r2, -r9, asr #6]
 c3c:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 c40:	03193f01 	tsteq	r9, #1, 30
 c44:	3b0b3a0e 	blcc	2cf484 <__end+0x19e484>
 c48:	1113490b 	tstne	r3, fp, lsl #18
 c4c:	40061201 	andmi	r1, r6, r1, lsl #4
 c50:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 c54:	00001301 	andeq	r1, r0, r1, lsl #6
 c58:	0300340b 	movweq	r3, #1035	; 0x40b
 c5c:	3b0b3a08 	blcc	2cf484 <__end+0x19e484>
 c60:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 c64:	0c000017 	stceq	0, cr0, [r0], {23}
 c68:	01018289 	smlabbeq	r1, r9, r2, r8
 c6c:	13310111 	teqne	r1, #1073741828	; 0x40000004
 c70:	00001301 	andeq	r1, r0, r1, lsl #6
 c74:	01828a0d 	orreq	r8, r2, sp, lsl #20
 c78:	91180200 	tstls	r8, r0, lsl #4
 c7c:	00001842 	andeq	r1, r0, r2, asr #16
 c80:	0182890e 	orreq	r8, r2, lr, lsl #18
 c84:	31011100 	mrscc	r1, (UNDEF: 17)
 c88:	0f000013 	svceq	0x00000013
 c8c:	01018289 	smlabbeq	r1, r9, r2, r8
 c90:	13310111 	teqne	r1, #1073741828	; 0x40000004
 c94:	34100000 	ldrcc	r0, [r0], #-0
 c98:	3a080300 	bcc	2018a0 <__end+0xd08a0>
 c9c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 ca0:	00180213 	andseq	r0, r8, r3, lsl r2
 ca4:	00341100 	eorseq	r1, r4, r0, lsl #2
 ca8:	0b3a0803 	bleq	e82cbc <__user_program+0xb82cbc>
 cac:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 cb0:	1802193f 	stmdane	r2, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 cb4:	01120000 	tsteq	r2, r0
 cb8:	01134901 	tsteq	r3, r1, lsl #18
 cbc:	13000013 	movwne	r0, #19
 cc0:	13490021 	movtne	r0, #36897	; 0x9021
 cc4:	0000052f 	andeq	r0, r0, pc, lsr #10
 cc8:	03003414 	movweq	r3, #1044	; 0x414
 ccc:	3b0b3a0e 	blcc	2cf50c <__end+0x19e50c>
 cd0:	3f13490b 	svccc	0x0013490b
 cd4:	00180219 	andseq	r0, r8, r9, lsl r2
 cd8:	012e1500 	teqeq	lr, r0, lsl #10
 cdc:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 ce0:	0b3b0b3a 	bleq	ec39d0 <__user_program+0xbc39d0>
 ce4:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 ce8:	00001301 	andeq	r1, r0, r1, lsl #6
 cec:	49000516 	stmdbmi	r0, {r1, r2, r4, r8, sl}
 cf0:	17000013 	smladne	r0, r3, r0, r0
 cf4:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 cf8:	0b3a0e03 	bleq	e8450c <__user_program+0xb8450c>
 cfc:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 d00:	193c1349 	ldmdbne	ip!, {r0, r3, r6, r8, r9, ip}
 d04:	00001301 	andeq	r1, r0, r1, lsl #6
 d08:	3f002e18 	svccc	0x00002e18
 d0c:	3a0e0319 	bcc	381978 <__user_program+0x81978>
 d10:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 d14:	00193c19 	andseq	r3, r9, r9, lsl ip
 d18:	012e1900 	teqeq	lr, r0, lsl #18
 d1c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 d20:	0b3b0b3a 	bleq	ec3a10 <__user_program+0xbc3a10>
 d24:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 d28:	01000000 	mrseq	r0, (UNDEF: 0)
 d2c:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 d30:	0e030b13 	vmoveq.32	d3[0], r0
 d34:	01110e1b 	tsteq	r1, fp, lsl lr
 d38:	17100612 			; <UNDEFINED> instruction: 0x17100612
 d3c:	24020000 	strcs	r0, [r2], #-0
 d40:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 d44:	000e030b 	andeq	r0, lr, fp, lsl #6
 d48:	00240300 	eoreq	r0, r4, r0, lsl #6
 d4c:	0b3e0b0b 	bleq	f83980 <__user_program+0xc83980>
 d50:	00000803 	andeq	r0, r0, r3, lsl #16
 d54:	03001604 	movweq	r1, #1540	; 0x604
 d58:	3b0b3a0e 	blcc	2cf598 <__end+0x19e598>
 d5c:	0013490b 	andseq	r4, r3, fp, lsl #18
 d60:	012e0500 	teqeq	lr, r0, lsl #10
 d64:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 d68:	0b3b0b3a 	bleq	ec3a58 <__user_program+0xbc3a58>
 d6c:	01111927 	tsteq	r1, r7, lsr #18
 d70:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 d74:	01194297 			; <UNDEFINED> instruction: 0x01194297
 d78:	06000013 			; <UNDEFINED> instruction: 0x06000013
 d7c:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 d80:	0b3b0b3a 	bleq	ec3a70 <__user_program+0xbc3a70>
 d84:	17021349 	strne	r1, [r2, -r9, asr #6]
 d88:	05070000 	streq	r0, [r7, #-0]
 d8c:	3a080300 	bcc	201994 <__end+0xd0994>
 d90:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 d94:	00170213 	andseq	r0, r7, r3, lsl r2
 d98:	00340800 	eorseq	r0, r4, r0, lsl #16
 d9c:	0b3a0803 	bleq	e82db0 <__user_program+0xb82db0>
 da0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 da4:	00001702 	andeq	r1, r0, r2, lsl #14
 da8:	01828909 	orreq	r8, r2, r9, lsl #18
 dac:	31011101 	tstcc	r1, r1, lsl #2
 db0:	00130113 	andseq	r0, r3, r3, lsl r1
 db4:	828a0a00 	addhi	r0, sl, #0, 20
 db8:	18020001 	stmdane	r2, {r0}
 dbc:	00184291 	mulseq	r8, r1, r2
 dc0:	82890b00 	addhi	r0, r9, #0, 22
 dc4:	01110101 	tsteq	r1, r1, lsl #2
 dc8:	00001331 	andeq	r1, r0, r1, lsr r3
 dcc:	0300050c 	movweq	r0, #1292	; 0x50c
 dd0:	3b0b3a0e 	blcc	2cf610 <__end+0x19e610>
 dd4:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 dd8:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 ddc:	08030005 	stmdaeq	r3, {r0, r2}
 de0:	0b3b0b3a 	bleq	ec3ad0 <__user_program+0xbc3ad0>
 de4:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 de8:	2e0e0000 	cdpcs	0, 0, cr0, cr14, cr0, {0}
 dec:	03193f00 	tsteq	r9, #0, 30
 df0:	3b0b3a0e 	blcc	2cf630 <__end+0x19e630>
 df4:	1119270b 	tstne	r9, fp, lsl #14
 df8:	40061201 	andmi	r1, r6, r1, lsl #4
 dfc:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 e00:	2e0f0000 	cdpcs	0, 0, cr0, cr15, cr0, {0}
 e04:	03193f01 	tsteq	r9, #1, 30
 e08:	3b0b3a0e 	blcc	2cf648 <__end+0x19e648>
 e0c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 e10:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 e14:	97184006 	ldrls	r4, [r8, -r6]
 e18:	13011942 	movwne	r1, #6466	; 0x1942
 e1c:	2e100000 	cdpcs	0, 1, cr0, cr0, cr0, {0}
 e20:	03193f01 	tsteq	r9, #1, 30
 e24:	3b0b3a0e 	blcc	2cf664 <__end+0x19e664>
 e28:	3c19270b 	ldccc	7, cr2, [r9], {11}
 e2c:	11000019 	tstne	r0, r9, lsl r0
 e30:	13490005 	movtne	r0, #36869	; 0x9005
 e34:	01000000 	mrseq	r0, (UNDEF: 0)
 e38:	06100011 			; <UNDEFINED> instruction: 0x06100011
 e3c:	01120111 	tsteq	r2, r1, lsl r1
 e40:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 e44:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 e48:	01000000 	mrseq	r0, (UNDEF: 0)
 e4c:	06100011 			; <UNDEFINED> instruction: 0x06100011
 e50:	01120111 	tsteq	r2, r1, lsl r1
 e54:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 e58:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 e5c:	01000000 	mrseq	r0, (UNDEF: 0)
 e60:	06100011 			; <UNDEFINED> instruction: 0x06100011
 e64:	01120111 	tsteq	r2, r1, lsl r1
 e68:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 e6c:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 e70:	Address 0x00000e70 is out of bounds.


Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008054 	andeq	r8, r0, r4, asr r0
  14:	00000060 	andeq	r0, r0, r0, rrx
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01790002 	cmneq	r9, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000080b4 	strheq	r8, [r0], -r4
  34:	00000194 	muleq	r0, r4, r1
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	03710002 	cmneq	r1, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	00008248 	andeq	r8, r0, r8, asr #4
  54:	000000c4 	andeq	r0, r0, r4, asr #1
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	058c0002 	streq	r0, [ip, #2]
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	0000830c 	andeq	r8, r0, ip, lsl #6
  74:	00000194 	muleq	r0, r4, r1
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	07600002 	strbeq	r0, [r0, -r2]!
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000084a0 	andeq	r8, r0, r0, lsr #9
  94:	00000c9c 	muleq	r0, ip, ip
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	10d00002 	sbcsne	r0, r0, r2
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	0000913c 	andeq	r9, r0, ip, lsr r1
  b4:	00000298 	muleq	r0, r8, r2
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	13c40002 	bicne	r0, r4, #2
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	000093d4 	ldrdeq	r9, [r0], -r4
  d4:	000000a8 	andeq	r0, r0, r8, lsr #1
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	14870002 	strne	r0, [r7], #2
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	0000947c 	andeq	r9, r0, ip, ror r4
  f4:	000000d8 	ldrdeq	r0, [r0], -r8
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	15eb0002 	strbne	r0, [fp, #2]!
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	00009554 	andeq	r9, r0, r4, asr r5
 114:	00000a4c 	andeq	r0, r0, ip, asr #20
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	1fe50002 	svcne	0x00e50002
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00009fa0 	andeq	r9, r0, r0, lsr #31
 134:	0000039c 	muleq	r0, ip, r3
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	28030002 	stmdacs	r3, {r1}
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	0000a33c 	andeq	sl, r0, ip, lsr r3
 154:	00000180 	andeq	r0, r0, r0, lsl #3
	...
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	2a1d0002 	bcs	740174 <__user_program+0x440174>
 168:	00040000 	andeq	r0, r4, r0
 16c:	00000000 	andeq	r0, r0, r0
 170:	00008000 	andeq	r8, r0, r0
 174:	00000054 	andeq	r0, r0, r4, asr r0
	...
 180:	0000001c 	andeq	r0, r0, ip, lsl r0
 184:	2a7f0002 	bcs	1fc0194 <__user_program+0x1cc0194>
 188:	00040000 	andeq	r0, r4, r0
 18c:	00000000 	andeq	r0, r0, r0
 190:	0000a4bc 			; <UNDEFINED> instruction: 0x0000a4bc
 194:	00000044 	andeq	r0, r0, r4, asr #32
	...
 1a0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1a4:	2ae00002 	bcs	ff8001b4 <__user_program+0xff5001b4>
 1a8:	00040000 	andeq	r0, r4, r0
 1ac:	00000000 	andeq	r0, r0, r0
 1b0:	0000a500 	andeq	sl, r0, r0, lsl #10
 1b4:	000001c0 	andeq	r0, r0, r0, asr #3
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0000006f 	andeq	r0, r0, pc, rrx
   4:	00500002 	subseq	r0, r0, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	33010000 	movwcc	r0, #4096	; 0x1000
  1c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  20:	732f6b62 	teqvc	pc, #100352	; 0x18800
  24:	33006372 	movwcc	r6, #882	; 0x372
  28:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  2c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
  30:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
  34:	00006564 	andeq	r6, r0, r4, ror #10
  38:	7364656c 	cmnvc	r4, #108, 10	; 0x1b000000
  3c:	0100632e 	tsteq	r0, lr, lsr #6
  40:	70670000 	rsbvc	r0, r7, r0
  44:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
  48:	00000200 	andeq	r0, r0, r0, lsl #4
  4c:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
  50:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
  54:	00020068 	andeq	r0, r2, r8, rrx
  58:	05000000 	streq	r0, [r0, #-0]
  5c:	00805402 	addeq	r5, r0, r2, lsl #8
  60:	01160300 	tsteq	r6, r0, lsl #6
  64:	2f86672f 	svccs	0x0086672f
  68:	2f6a2f6a 	svccs	0x006a2f6a
  6c:	06022f6a 	streq	r2, [r2], -sl, ror #30
  70:	90010100 	andls	r0, r1, r0, lsl #2
  74:	02000000 	andeq	r0, r0, #0
  78:	00004f00 	andeq	r4, r0, r0, lsl #30
  7c:	fb010200 	blx	40886 <__bss_end+0x30886>
  80:	01000d0e 	tsteq	r0, lr, lsl #26
  84:	00010101 	andeq	r0, r1, r1, lsl #2
  88:	00010000 	andeq	r0, r1, r0
  8c:	34330100 	ldrtcc	r0, [r3], #-256	; 0x100
  90:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
  94:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
  98:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
  9c:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
  a0:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
  a4:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
  a8:	67000065 	strvs	r0, [r0, -r5, rrx]
  ac:	2e6f6970 	mcrcs	9, 3, r6, cr15, cr0, {3}
  b0:	00010063 	andeq	r0, r1, r3, rrx
  b4:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
  b8:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
  bc:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
  c0:	72610000 	rsbvc	r0, r1, #0
  c4:	00682e6d 	rsbeq	r2, r8, sp, ror #28
  c8:	00000002 	andeq	r0, r0, r2
  cc:	b4020500 	strlt	r0, [r2], #-1280	; 0x500
  d0:	03000080 	movweq	r0, #128	; 0x80
  d4:	130100d4 	movwne	r0, #4308	; 0x10d4
  d8:	8384a06a 	orrhi	sl, r4, #106	; 0x6a
  dc:	134e2f4b 	movtne	r2, #61259	; 0xef4b
  e0:	bfd84b4d 	svclt	0x00d84b4d
  e4:	d84b4d13 	stmdale	fp, {r0, r1, r4, r8, sl, fp, lr}^
  e8:	4f6513bf 	svcmi	0x006513bf
  ec:	bb4b4b67 	bllt	12d2e90 <__user_program+0xfd2e90>
  f0:	4b9f684b 	blmi	fe7da224 <__user_program+0xfe4da224>
  f4:	2f4b146a 	svccs	0x004b146a
  f8:	302f3067 	eorcc	r3, pc, r7, rrx
  fc:	034a7803 	movteq	r7, #43011	; 0xa803
 100:	02022e09 	andeq	r2, r2, #9, 28	; 0x90
 104:	87010100 	strhi	r0, [r1, -r0, lsl #2]
 108:	02000000 	andeq	r0, r0, #0
 10c:	00006200 	andeq	r6, r0, r0, lsl #4
 110:	fb010200 	blx	4091a <__bss_end+0x3091a>
 114:	01000d0e 	tsteq	r0, lr, lsl #26
 118:	00010101 	andeq	r0, r1, r1, lsl #2
 11c:	00010000 	andeq	r0, r1, r0
 120:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 124:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 128:	72732f2f 	rsbsvc	r2, r3, #47, 30	; 0xbc
 12c:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 130:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 134:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 138:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 13c:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 140:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 144:	6e692f2f 	cdpvs	15, 6, cr2, cr9, cr15, {1}
 148:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 14c:	61000065 	tstvs	r0, r5, rrx
 150:	30317364 	eorscc	r7, r1, r4, ror #6
 154:	632e3531 	teqvs	lr, #205520896	; 0xc400000
 158:	00000100 	andeq	r0, r0, r0, lsl #2
 15c:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 160:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 164:	00020068 	andeq	r0, r2, r8, rrx
 168:	63326900 	teqvs	r2, #0, 18
 16c:	0300682e 	movweq	r6, #2094	; 0x82e
 170:	00000000 	andeq	r0, r0, r0
 174:	82480205 	subhi	r0, r8, #1342177280	; 0x50000000
 178:	20030000 	andcs	r0, r3, r0
 17c:	4c692f01 	stclmi	15, cr2, [r9], #-4
 180:	33a1bb4b 			; <UNDEFINED> instruction: 0x33a1bb4b
 184:	88bb2f29 	ldmhi	fp!, {r0, r3, r5, r8, r9, sl, fp, sp}
 188:	84856a68 	strhi	r6, [r5], #2664	; 0xa68
 18c:	0004022f 	andeq	r0, r4, pc, lsr #4
 190:	00ba0101 	adcseq	r0, sl, r1, lsl #2
 194:	00020000 	andeq	r0, r2, r0
 198:	0000004f 	andeq	r0, r0, pc, asr #32
 19c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 1a0:	0101000d 	tsteq	r1, sp
 1a4:	00000101 	andeq	r0, r0, r1, lsl #2
 1a8:	00000100 	andeq	r0, r0, r0, lsl #2
 1ac:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 1b0:	2f6c656e 	svccs	0x006c656e
 1b4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 1b8:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 1bc:	6b62696c 	blvs	189a774 <__user_program+0x159a774>
 1c0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 1c4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 1c8:	32690000 	rsbcc	r0, r9, #0
 1cc:	00632e63 	rsbeq	r2, r3, r3, ror #28
 1d0:	6b000001 	blvs	1dc <__start-0x7e24>
 1d4:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 1d8:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 1dc:	00000200 	andeq	r0, r0, r0, lsl #4
 1e0:	6f697067 	svcvs	0x00697067
 1e4:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 1e8:	00000000 	andeq	r0, r0, r0
 1ec:	830c0205 	movwhi	r0, #49669	; 0xc205
 1f0:	20030000 	andcs	r0, r3, r0
 1f4:	67673001 	strbvs	r3, [r7, -r1]!
 1f8:	85836967 	strhi	r6, [r3, #2407]	; 0x967
 1fc:	674d4d13 	smlaldvs	r4, sp, r3, sp
 200:	00836830 	addeq	r6, r3, r0, lsr r8
 204:	06030402 	streq	r0, [r3], -r2, lsl #8
 208:	0402004a 	streq	r0, [r2], #-74	; 0x4a
 20c:	4d490603 	stclmi	6, cr0, [r9, #-12]
 210:	04020084 	streq	r0, [r2], #-132	; 0x84
 214:	064a0601 	strbeq	r0, [sl], -r1, lsl #12
 218:	6d039f69 	stcvs	15, cr9, [r3, #-420]	; 0xfffffe5c
 21c:	11034d4a 	tstne	r3, sl, asr #26
 220:	4d13302e 	ldcmi	0, cr3, [r3, #-184]	; 0xffffff48
 224:	6830674e 	ldmdavs	r0!, {r1, r2, r3, r6, r8, r9, sl, sp, lr}
 228:	0402004c 	streq	r0, [r2], #-76	; 0x4c
 22c:	004a0601 	subeq	r0, sl, r1, lsl #12
 230:	06010402 	streq	r0, [r1], -r2, lsl #8
 234:	0200836a 	andeq	r8, r0, #-1476395007	; 0xa8000001
 238:	4a060304 	bmi	180e50 <__end+0x4fe50>
 23c:	03040200 	movweq	r0, #16896	; 0x4200
 240:	a04e4906 	subge	r4, lr, r6, lsl #18
 244:	4d4a6903 	stclmi	9, cr6, [sl, #-12]
 248:	022e1503 	eoreq	r1, lr, #12582912	; 0xc00000
 24c:	01010002 	tsteq	r1, r2
 250:	000001f5 	strdeq	r0, [r0], -r5
 254:	00b30002 	adcseq	r0, r3, r2
 258:	01020000 	mrseq	r0, (UNDEF: 2)
 25c:	000d0efb 	strdeq	r0, [sp], -fp
 260:	01010101 	tsteq	r1, r1, lsl #2
 264:	01000000 	mrseq	r0, (UNDEF: 0)
 268:	6b010000 	blvs	40270 <__bss_end+0x30270>
 26c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 270:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 274:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 278:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 27c:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 280:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 284:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 288:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 28c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 290:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 294:	656b0000 	strbvs	r0, [fp, #-0]!
 298:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 29c:	0100632e 	tsteq	r0, lr, lsr #6
 2a0:	736b0000 	cmnvc	fp, #0
 2a4:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 2a8:	00682e74 	rsbeq	r2, r8, r4, ror lr
 2ac:	6d000002 	stcvs	0, cr0, [r0, #-8]
 2b0:	78657475 	stmdavc	r5!, {r0, r2, r4, r5, r6, sl, ip, sp, lr}^
 2b4:	0300682e 	movweq	r6, #2094	; 0x82e
 2b8:	79730000 	ldmdbvc	r3!, {}^	; <UNPREDICTABLE>
 2bc:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 2c0:	682e736c 	stmdavs	lr!, {r2, r3, r5, r6, r8, r9, ip, sp, lr}
 2c4:	00000300 	andeq	r0, r0, r0, lsl #6
 2c8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 2cc:	00682e72 	rsbeq	r2, r8, r2, ror lr
 2d0:	61000003 	tstvs	r0, r3
 2d4:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
 2d8:	00000200 	andeq	r0, r0, r0, lsl #4
 2dc:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 2e0:	0300682e 	movweq	r6, #2094	; 0x82e
 2e4:	63730000 	cmnvs	r3, #0
 2e8:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 2ec:	0300682e 	movweq	r6, #2094	; 0x82e
 2f0:	75730000 	ldrbvc	r0, [r3, #-0]!
 2f4:	76726570 			; <UNDEFINED> instruction: 0x76726570
 2f8:	726f7369 	rsbvc	r7, pc, #-1543503871	; 0xa4000001
 2fc:	0300682e 	movweq	r6, #2094	; 0x82e
 300:	70670000 	rsbvc	r0, r7, r0
 304:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 308:	00000200 	andeq	r0, r0, r0, lsl #4
 30c:	02050000 	andeq	r0, r5, #0
 310:	000084a0 	andeq	r8, r0, r0, lsr #9
 314:	2f012203 	svccs	0x00012203
 318:	2f302f2f 	svccs	0x00302f2f
 31c:	2f2f842f 	svccs	0x002f842f
 320:	04020030 	streq	r0, [r2], #-48	; 0x30
 324:	31313001 	teqcc	r1, r1
 328:	002f302d 	eoreq	r3, pc, sp, lsr #32
 32c:	06010402 	streq	r0, [r1], -r2, lsl #8
 330:	68067408 	stmdavs	r6, {r3, sl, ip, sp, lr}
 334:	02040200 	andeq	r0, r4, #0, 4
 338:	13306db7 	teqne	r0, #11712	; 0x2dc0
 33c:	5908309d 	stmdbpl	r8, {r0, r2, r3, r4, r7, ip, sp}
 340:	75085a08 	strvc	r5, [r8, #-2568]	; 0xa08
 344:	02bb2108 	adcseq	r2, fp, #8, 2
 348:	3d081424 	cfstrscc	mvf1, [r8, #-144]	; 0xffffff70
 34c:	bbbbbbbb 	bllt	feeef240 <__user_program+0xfebef240>
 350:	bbbbbbbb 	bllt	feeef244 <__user_program+0xfebef244>
 354:	bbbbbbbb 	bllt	feeef248 <__user_program+0xfebef248>
 358:	bbbbbbbb 	bllt	feeef24c <__user_program+0xfebef24c>
 35c:	13d9bbbb 	bicsne	fp, r9, #191488	; 0x2ec00
 360:	3e087508 	cfsh32cc	mvfx7, mvfx8, #8
 364:	d7bb5908 	ldrle	r5, [fp, r8, lsl #18]!
 368:	d7bbd7bb 			; <UNDEFINED> instruction: 0xd7bbd7bb
 36c:	d7bbd7bb 			; <UNDEFINED> instruction: 0xd7bbd7bb
 370:	d7bbd7bb 			; <UNDEFINED> instruction: 0xd7bbd7bb
 374:	d7bbd7bb 			; <UNDEFINED> instruction: 0xd7bbd7bb
 378:	089f13da 	ldmeq	pc, {r1, r3, r4, r6, r7, r8, r9, ip}	; <UNPREDICTABLE>
 37c:	087508ae 	ldmdaeq	r5!, {r1, r2, r3, r5, r7, fp}^
 380:	0875083f 	ldmdaeq	r5!, {r0, r1, r2, r3, r4, r5, fp}^
 384:	d82f30ea 	stmdale	pc!, {r1, r3, r5, r6, r7, ip, sp}	; <UNPREDICTABLE>
 388:	02004630 	andeq	r4, r0, #48, 12	; 0x3000000
 38c:	82060104 	andhi	r0, r6, #4, 2
 390:	2f83d706 	svccs	0x0083d706
 394:	04020067 	streq	r0, [r2], #-103	; 0x67
 398:	336e6102 	cmncc	lr, #-2147483648	; 0x80000000
 39c:	302f832f 	eorcc	r8, pc, pc, lsr #6
 3a0:	0402002f 	streq	r0, [r2], #-47	; 0x2f
 3a4:	00660603 	rsbeq	r0, r6, r3, lsl #12
 3a8:	06030402 	streq	r0, [r3], -r2, lsl #8
 3ac:	30336981 	eorscc	r6, r3, r1, lsl #19
 3b0:	67ae089f 			; <UNDEFINED> instruction: 0x67ae089f
 3b4:	4b842f69 	blmi	fe10c160 <__user_program+0xfde0c160>
 3b8:	040200a0 	streq	r0, [r2], #-160	; 0xa0
 3bc:	064a0601 	strbeq	r0, [sl], -r1, lsl #12
 3c0:	319f839f 			; <UNDEFINED> instruction: 0x319f839f
 3c4:	2f4bd79f 	svccs	0x004bd79f
 3c8:	59089f30 	stmdbpl	r8, {r4, r5, r8, r9, sl, fp, ip, pc}
 3cc:	0402004e 	streq	r0, [r2], #-78	; 0x4e
 3d0:	064a0601 	strbeq	r0, [sl], -r1, lsl #12
 3d4:	08842f9f 	stmeq	r4, {r0, r1, r2, r3, r4, r7, r8, r9, sl, fp, sp}
 3d8:	00686791 	mlseq	r8, r1, r7, r6
 3dc:	06010402 	streq	r0, [r1], -r2, lsl #8
 3e0:	5908069e 	stmdbpl	r8, {r1, r2, r3, r4, r7, r9, sl}
 3e4:	0a03842f 	beq	e14a8 <__bss_end+0xd14a8>
 3e8:	02004b4a 	andeq	r4, r0, #75776	; 0x12800
 3ec:	66060104 	strvs	r0, [r6], -r4, lsl #2
 3f0:	2fa13006 	svccs	0x00a13006
 3f4:	3086304c 	addcc	r3, r6, ip, asr #32
 3f8:	4a0c034c 	bmi	301130 <__user_program+0x1130>
 3fc:	2e023083 	cdpcs	0, 0, cr3, cr2, cr3, {4}
 400:	9f306714 	svcls	0x00306714
 404:	83306730 	teqhi	r0, #48, 14	; 0xc00000
 408:	9f306730 	svcls	0x00306730
 40c:	03309f30 	teqeq	r0, #48, 30	; 0xc0
 410:	19034a68 	stmdbne	r3, {r3, r5, r6, r9, fp, lr}
 414:	3083302e 	addcc	r3, r3, lr, lsr #32
 418:	308330f4 	strdcc	r3, [r3], r4
 41c:	034a5b03 	movteq	r5, #43779	; 0xab03
 420:	03302e26 	teqeq	r0, #608	; 0x260
 424:	29034a58 	stmdbcs	r3, {r3, r4, r6, r9, fp, lr}
 428:	5503302e 	strpl	r3, [r3, #-46]	; 0x2e
 42c:	2e2c032e 	cdpcs	3, 2, cr0, cr12, cr14, {1}
 430:	4b304b30 	blmi	c130f8 <__user_program+0x9130f8>
 434:	03304b30 	teqeq	r0, #48, 22	; 0xc000
 438:	38034a49 	stmdacc	r3, {r0, r3, r6, r9, fp, lr}
 43c:	2e48032e 	cdpcs	3, 4, cr0, cr8, cr14, {1}
 440:	302e3b03 	eorcc	r3, lr, r3, lsl #22
 444:	01000602 	tsteq	r0, r2, lsl #12
 448:	0000e201 	andeq	lr, r0, r1, lsl #4
 44c:	7d000200 	sfmvc	f0, 4, [r0, #-0]
 450:	02000000 	andeq	r0, r0, #0
 454:	0d0efb01 	vstreq	d15, [lr, #-4]
 458:	01010100 	mrseq	r0, (UNDEF: 17)
 45c:	00000001 	andeq	r0, r0, r1
 460:	01000001 	tsteq	r0, r1
 464:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 468:	2f2f6c65 	svccs	0x002f6c65
 46c:	00637273 	rsbeq	r7, r3, r3, ror r2
 470:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 474:	2f6b6269 	svccs	0x006b6269
 478:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 47c:	00656475 	rsbeq	r6, r5, r5, ror r4
 480:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 484:	2f2f6c65 	svccs	0x002f6c65
 488:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 48c:	00656475 	rsbeq	r6, r5, r5, ror r4
 490:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 494:	2e6b746e 	cdpcs	4, 6, cr7, cr11, cr14, {3}
 498:	00010063 	andeq	r0, r1, r3, rrx
 49c:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 4a0:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 4a4:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 4a8:	736b0000 	cmnvc	fp, #0
 4ac:	72616474 	rsbvc	r6, r1, #116, 8	; 0x74000000
 4b0:	00682e67 	rsbeq	r2, r8, r7, ror #28
 4b4:	3c000002 	stccc	0, cr0, [r0], {2}
 4b8:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 4bc:	6e692d74 	mcrvs	13, 3, r2, cr9, cr4, {3}
 4c0:	0000003e 	andeq	r0, r0, lr, lsr r0
 4c4:	72617500 	rsbvc	r7, r1, #0, 10
 4c8:	00682e74 	rsbeq	r2, r8, r4, ror lr
 4cc:	00000003 	andeq	r0, r0, r3
 4d0:	3c020500 	cfstr32cc	mvfx0, [r2], {-0}
 4d4:	03000091 	movweq	r0, #145	; 0x91
 4d8:	4d880120 	stfmis	f0, [r8, #128]	; 0x80
 4dc:	0402009c 	streq	r0, [r2], #-156	; 0x9c
 4e0:	02004c01 	andeq	r4, r0, #256	; 0x100
 4e4:	00330104 	eorseq	r0, r3, r4, lsl #2
 4e8:	08010402 	stmdaeq	r1, {r1, sl}
 4ec:	04020059 	streq	r0, [r2], #-89	; 0x59
 4f0:	4b4dd701 	blmi	13760fc <__user_program+0x10760fc>
 4f4:	872d9b6a 	strhi	r9, [sp, -sl, ror #22]!
 4f8:	854d6949 	strbhi	r6, [sp, #-2377]	; 0x949
 4fc:	514a2003 	cmppl	sl, r3
 500:	302e5c03 	eorcc	r5, lr, r3, lsl #24
 504:	02324b4b 	eorseq	r4, r2, #76800	; 0x12c00
 508:	4b83152c 	blmi	fe0c59c0 <__user_program+0xfddc59c0>
 50c:	67a4a04b 	strvs	sl, [r4, fp, asr #32]!
 510:	83673283 	cmnhi	r7, #805306376	; 0x30000008
 514:	32836733 	addcc	r6, r3, #13369344	; 0xcc0000
 518:	8a2d6783 	bhi	b5a32c <__user_program+0x85a32c>
 51c:	4b324b67 	blmi	c932c0 <__user_program+0x9932c0>
 520:	bf034d33 	svclt	0x00034d33
 524:	c6032e7f 			; <UNDEFINED> instruction: 0xc6032e7f
 528:	08026600 	stmdaeq	r2, {r9, sl, sp, lr}
 52c:	6b010100 	blvs	40934 <__bss_end+0x30934>
 530:	02000000 	andeq	r0, r0, #0
 534:	00004700 	andeq	r4, r0, r0, lsl #14
 538:	fb010200 	blx	40d42 <__bss_end+0x30d42>
 53c:	01000d0e 	tsteq	r0, lr, lsl #26
 540:	00010101 	andeq	r0, r1, r1, lsl #2
 544:	00010000 	andeq	r0, r1, r0
 548:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 54c:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 550:	72732f2f 	rsbsvc	r2, r3, #47, 30	; 0xbc
 554:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 558:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 55c:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 560:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 564:	74000065 	strvc	r0, [r0], #-101	; 0x65
 568:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 56c:	0100632e 	tsteq	r0, lr, lsr #6
 570:	736b0000 	cmnvc	fp, #0
 574:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 578:	00682e74 	rsbeq	r2, r8, r4, ror lr
 57c:	00000002 	andeq	r0, r0, r2
 580:	d4020500 	strle	r0, [r2], #-1280	; 0x500
 584:	03000093 	movweq	r0, #147	; 0x93
 588:	6713010d 	ldrvs	r0, [r3, -sp, lsl #2]
 58c:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 590:	679f1386 	ldrvs	r1, [pc, r6, lsl #7]
 594:	4d681387 	stclmi	3, cr1, [r8, #-540]!	; 0xfffffde4
 598:	000c0213 	andeq	r0, ip, r3, lsl r2
 59c:	00850101 	addeq	r0, r5, r1, lsl #2
 5a0:	00020000 	andeq	r0, r2, r0
 5a4:	00000050 	andeq	r0, r0, r0, asr r0
 5a8:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 5ac:	0101000d 	tsteq	r1, sp
 5b0:	00000101 	andeq	r0, r0, r1, lsl #2
 5b4:	00000100 	andeq	r0, r0, r0, lsl #2
 5b8:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 5bc:	2f6c656e 	svccs	0x006c656e
 5c0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 5c4:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 5c8:	6b62696c 	blvs	189ab80 <__user_program+0x159ab80>
 5cc:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 5d0:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 5d4:	61750000 	cmnvs	r5, r0
 5d8:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 5dc:	00000100 	andeq	r0, r0, r0, lsl #2
 5e0:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 5e4:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 5e8:	00020068 	andeq	r0, r2, r8, rrx
 5ec:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
 5f0:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 5f4:	00000002 	andeq	r0, r0, r2
 5f8:	7c020500 	cfstr32vc	mvfx0, [r2], {-0}
 5fc:	03000094 	movweq	r0, #148	; 0x94
 600:	6730010e 	ldrvs	r0, [r0, -lr, lsl #2]!
 604:	9f686768 	svcls	0x00686768
 608:	6a68674b 	bvs	1a1a33c <__user_program+0x171a33c>
 60c:	0013bd13 	andseq	fp, r3, r3, lsl sp
 610:	06010402 	streq	r0, [r1], -r2, lsl #8
 614:	8567064a 	strbhi	r0, [r7, #-1610]!	; 0x64a
 618:	04020013 	streq	r0, [r2], #-19
 61c:	064a0601 	strbeq	r0, [sl], -r1, lsl #12
 620:	04026767 	streq	r6, [r2], #-1895	; 0x767
 624:	18010100 	stmdane	r1, {r8}
 628:	02000002 	andeq	r0, r0, #2
 62c:	0000a700 	andeq	sl, r0, r0, lsl #14
 630:	fb010200 	blx	40e3a <__bss_end+0x30e3a>
 634:	01000d0e 	tsteq	r0, lr, lsl #26
 638:	00010101 	andeq	r0, r1, r1, lsl #2
 63c:	00010000 	andeq	r0, r1, r0
 640:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 644:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 648:	72732f2f 	rsbsvc	r2, r3, #47, 30	; 0xbc
 64c:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 650:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 654:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 658:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 65c:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 660:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 664:	6e692f2f 	cdpvs	15, 6, cr2, cr9, cr15, {1}
 668:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 66c:	73000065 	movwvc	r0, #101	; 0x65
 670:	61637379 	smcvs	14137	; 0x3739
 674:	2e736c6c 	cdpcs	12, 7, cr6, cr3, cr12, {3}
 678:	00010063 	andeq	r0, r1, r3, rrx
 67c:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 680:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 684:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 688:	756d0000 	strbvc	r0, [sp, #-0]!
 68c:	2e786574 	mrccs	5, 3, r6, cr8, cr4, {3}
 690:	00030068 	andeq	r0, r3, r8, rrx
 694:	73797300 	cmnvc	r9, #0, 6
 698:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 69c:	00682e73 	rsbeq	r2, r8, r3, ror lr
 6a0:	61000003 	tstvs	r0, r3
 6a4:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
 6a8:	00000200 	andeq	r0, r0, r0, lsl #4
 6ac:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 6b0:	0300682e 	movweq	r6, #2094	; 0x82e
 6b4:	70670000 	rsbvc	r0, r7, r0
 6b8:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 6bc:	00000200 	andeq	r0, r0, r0, lsl #4
 6c0:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 6c4:	682e6b74 	stmdavs	lr!, {r2, r4, r5, r6, r8, r9, fp, sp, lr}
 6c8:	00000300 	andeq	r0, r0, r0, lsl #6
 6cc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 6d0:	00682e72 	rsbeq	r2, r8, r2, ror lr
 6d4:	00000003 	andeq	r0, r0, r3
 6d8:	54020500 	strpl	r0, [r2], #-1280	; 0x500
 6dc:	03000095 	movweq	r0, #149	; 0x95
 6e0:	002f0115 	eoreq	r0, pc, r5, lsl r1	; <UNPREDICTABLE>
 6e4:	2f010402 	svccs	0x00010402
 6e8:	02001333 	andeq	r1, r0, #-872415232	; 0xcc000000
 6ec:	474c0104 	strbmi	r0, [ip, -r4, lsl #2]
 6f0:	03040200 	movweq	r0, #16896	; 0x4200
 6f4:	04020086 	streq	r0, [r2], #-134	; 0x86
 6f8:	454d4903 	strbmi	r4, [sp, #-2307]	; 0x903
 6fc:	4a0b034f 	bmi	2c1440 <__end+0x190440>
 700:	09034913 	stmdbeq	r3, {r0, r1, r4, r8, fp, lr}
 704:	4b676382 	blmi	19d9514 <__user_program+0x16d9514>
 708:	0200da2f 	andeq	sp, r0, #192512	; 0x2f000
 70c:	4a060104 	bmi	180b24 <__end+0x4fb24>
 710:	02040200 	andeq	r0, r4, #0, 4
 714:	6767064a 	strbvs	r0, [r7, -sl, asr #12]!
 718:	4b32302d 	blmi	c8c7d4 <__user_program+0x98c7d4>
 71c:	2e700349 	cdpcs	3, 7, cr0, cr0, cr9, {2}
 720:	4b9e1503 	blmi	fe785b34 <__user_program+0xfe485b34>
 724:	034a6703 	movteq	r6, #42755	; 0xa703
 728:	65134a25 	ldrvs	r4, [r3, #-2597]	; 0xa25
 72c:	08a1d968 	stmiaeq	r1!, {r3, r5, r6, r8, fp, ip, lr, pc}
 730:	2f2f4b21 	svccs	0x002f4b21
 734:	4b2f4b4b 	blmi	bd3468 <__user_program+0x8d3468>
 738:	4b2f2f31 	blmi	bcc404 <__user_program+0x8cc404>
 73c:	2e6a0367 	cdpcs	3, 6, cr0, cr10, cr7, {3}
 740:	032e1703 	teqeq	lr, #786432	; 0xc0000
 744:	16032e6a 	strne	r2, [r3], -sl, ror #28
 748:	2e5f032e 	cdpcs	3, 5, cr0, cr15, cr14, {1}
 74c:	83678383 	cmnhi	r7, #201326594	; 0xc000002
 750:	1d03bb83 	vstrne	d11, [r3, #-524]	; 0xfffffdf4
 754:	4ba0134a 	blmi	fe805484 <__user_program+0xfe505484>
 758:	83309f2f 	teqhi	r0, #47, 30	; 0xbc
 75c:	4a770367 	bmi	1dc1500 <__user_program+0x1ac1500>
 760:	312e0a03 	teqcc	lr, r3, lsl #20
 764:	315a084b 	cmpcc	sl, fp, asr #16
 768:	4a19034b 	bmi	64149c <__user_program+0x34149c>
 76c:	2f4a6603 	svccs	0x004a6603
 770:	04020031 	streq	r0, [r2], #-49	; 0x31
 774:	00660601 	rsbeq	r0, r6, r1, lsl #12
 778:	06010402 	streq	r0, [r1], -r2, lsl #8
 77c:	04020067 	streq	r0, [r2], #-103	; 0x67
 780:	00342d01 	eorseq	r2, r4, r1, lsl #26
 784:	06010402 	streq	r0, [r1], -r2, lsl #8
 788:	31670666 	cmncc	r7, r6, ror #12
 78c:	9fd93d08 	svcls	0x00d93d08
 790:	039f502f 	orrseq	r5, pc, #47	; 0x2f
 794:	02002e65 	andeq	r2, r0, #1616	; 0x650
 798:	66060104 	strvs	r0, [r6], -r4, lsl #2
 79c:	661f0306 	ldrvs	r0, [pc], -r6, lsl #6
 7a0:	4d4b832f 	stclmi	3, cr8, [fp, #-188]	; 0xffffff44
 7a4:	084b2f4b 	stmdaeq	fp, {r0, r1, r3, r6, r8, r9, sl, fp, sp}^
 7a8:	2f6bd83e 	svccs	0x006bd83e
 7ac:	4b4a7803 	blmi	129e7c0 <__user_program+0xf9e7c0>
 7b0:	0402002f 	streq	r0, [r2], #-47	; 0x2f
 7b4:	06660601 	strbteq	r0, [r6], -r1, lsl #12
 7b8:	020067a3 	andeq	r6, r0, #42729472	; 0x28c0000
 7bc:	00d30204 	sbcseq	r0, r3, r4, lsl #4
 7c0:	61020402 	tstvs	r2, r2, lsl #8
 7c4:	08820f03 	stmeq	r2, {r0, r1, r8, r9, sl, fp}
 7c8:	674c693d 	smlaldxvs	r6, ip, sp, r9
 7cc:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 7d0:	9f9fbb69 	svcls	0x009fbb69
 7d4:	9f9f9f9f 	svcls	0x009f9f9f
 7d8:	9f9f9f9f 	svcls	0x009f9f9f
 7dc:	9f9f9f9f 	svcls	0x009f9f9f
 7e0:	9f9f9f9f 	svcls	0x009f9f9f
 7e4:	9f9f9f9f 	svcls	0x009f9f9f
 7e8:	9f9f9f9f 	svcls	0x009f9f9f
 7ec:	9f9f9f9f 	svcls	0x009f9f9f
 7f0:	2f3148bf 	svccs	0x003148bf
 7f4:	2f674868 	svccs	0x00674868
 7f8:	f14b2d83 			; <UNDEFINED> instruction: 0xf14b2d83
 7fc:	02040200 	andeq	r0, r4, #0, 4
 800:	24086d9b 	strcs	r6, [r8], #-3483	; 0xd9b
 804:	2f836783 	svccs	0x00836783
 808:	01040200 	mrseq	r0, R12_usr
 80c:	1468304b 	strbtne	r3, [r8], #-75	; 0x4b
 810:	02003d08 	andeq	r3, r0, #8, 26	; 0x200
 814:	66060104 	strvs	r0, [r6], -r4, lsl #2
 818:	1330d706 	teqne	r0, #1572864	; 0x180000
 81c:	08133067 	ldmdaeq	r3, {r0, r1, r2, r5, r6, ip, sp}
 820:	08133021 	ldmdaeq	r3, {r0, r5, ip, sp}
 824:	04020021 	streq	r0, [r2], #-33	; 0x21
 828:	06820601 	streq	r0, [r2], r1, lsl #12
 82c:	841734f3 	ldrhi	r3, [r7], #-1267	; 0x4f3
 830:	678867a1 	strvs	r6, [r8, r1, lsr #15]
 834:	14303429 	ldrtne	r3, [r0], #-1065	; 0x429
 838:	144c144c 	strbne	r1, [ip], #-1100	; 0x44c
 83c:	0402144c 	streq	r1, [r2], #-1100	; 0x44c
 840:	1c010100 	stfnes	f0, [r1], {-0}
 844:	02000001 	andeq	r0, r0, #1
 848:	00006900 	andeq	r6, r0, r0, lsl #18
 84c:	fb010200 	blx	41056 <__bss_end+0x31056>
 850:	01000d0e 	tsteq	r0, lr, lsl #26
 854:	00010101 	andeq	r0, r1, r1, lsl #2
 858:	00010000 	andeq	r0, r1, r0
 85c:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 860:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 864:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 868:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 86c:	6b62696c 	blvs	189ae24 <__user_program+0x159ae24>
 870:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 874:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 878:	72656b00 	rsbvc	r6, r5, #0, 22
 87c:	2f6c656e 	svccs	0x006c656e
 880:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 884:	00656475 	rsbeq	r6, r5, r5, ror r4
 888:	72637300 	rsbvc	r7, r3, #0, 6
 88c:	2e6e6565 	cdpcs	5, 6, cr6, cr14, cr5, {3}
 890:	00010063 	andeq	r0, r1, r3, rrx
 894:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 898:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 89c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 8a0:	70670000 	rsbvc	r0, r7, r0
 8a4:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 8a8:	00000200 	andeq	r0, r0, r0, lsl #4
 8ac:	2e697073 	mcrcs	0, 3, r7, cr9, cr3, {3}
 8b0:	00030068 	andeq	r0, r3, r8, rrx
 8b4:	05000000 	streq	r0, [r0, #-0]
 8b8:	009fa002 	addseq	sl, pc, r2
 8bc:	67131900 	ldrvs	r1, [r3, -r0, lsl #18]
 8c0:	68148a2d 	ldmdavs	r4, {r0, r2, r3, r5, r9, fp, pc}
 8c4:	494c302d 	stmdbmi	ip, {r0, r2, r3, r5, ip, sp}^
 8c8:	7a03832f 	bvc	e158c <__bss_end+0xd158c>
 8cc:	1431352e 	ldrtne	r3, [r1], #-1326	; 0x52e
 8d0:	4c302d68 	ldcmi	13, cr2, [r0], #-416	; 0xfffffe60
 8d4:	03832f49 	orreq	r2, r3, #292	; 0x124
 8d8:	32352e7a 	eorscc	r2, r5, #1952	; 0x7a0
 8dc:	0402004c 	streq	r0, [r2], #-76	; 0x4c
 8e0:	062e0603 	strteq	r0, [lr], -r3, lsl #12
 8e4:	66110368 	ldrvs	r0, [r1], -r8, ror #6
 8e8:	674b4b4c 	strbvs	r4, [fp, -ip, asr #22]
 8ec:	4b4c4e4b 	blmi	1314220 <__user_program+0x1014220>
 8f0:	4d4b674b 	stclmi	7, cr6, [fp, #-300]	; 0xfffffed4
 8f4:	674b672f 	strbvs	r6, [fp, -pc, lsr #14]
 8f8:	19034b4b 	stmdbne	r3, {r0, r1, r3, r6, r8, r9, fp, lr}
 8fc:	672f2f66 	strvs	r2, [pc, -r6, ror #30]!
 900:	4c4b4b67 	mcrrmi	11, 6, r4, fp, cr7
 904:	4b4b4b69 	blmi	12d36b0 <__user_program+0xfd36b0>
 908:	4b4b4b4b 	blmi	12d363c <__user_program+0xfd363c>
 90c:	4b4b4b4b 	blmi	12d3640 <__user_program+0xfd3640>
 910:	4b4b4b4b 	blmi	12d3644 <__user_program+0xfd3644>
 914:	4b4b4b4b 	blmi	12d3648 <__user_program+0xfd3648>
 918:	4b4b4b4b 	blmi	12d364c <__user_program+0xfd364c>
 91c:	4b2f694b 	blmi	bdae50 <__user_program+0x8dae50>
 920:	4b4b4b4b 	blmi	12d3654 <__user_program+0xfd3654>
 924:	667f9403 	ldrbtvs	r9, [pc], -r3, lsl #8
 928:	004b2f31 	subeq	r2, fp, r1, lsr pc
 92c:	a1030402 	tstge	r3, r2, lsl #8
 930:	03040200 	movweq	r0, #16896	; 0x4200
 934:	03304d49 	teqeq	r0, #4672	; 0x1240
 938:	2f31661e 	svccs	0x0031661e
 93c:	0200844b 	andeq	r8, r0, #1258291200	; 0x4b000000
 940:	4a060304 	bmi	181558 <__end+0x50558>
 944:	03040200 	movweq	r0, #16896	; 0x4200
 948:	2f4c9d06 	svccs	0x004c9d06
 94c:	4b2f30bd 	blmi	bccc48 <__user_program+0x8ccc48>
 950:	04020084 	streq	r0, [r2], #-132	; 0x84
 954:	002e0603 	eoreq	r0, lr, r3, lsl #12
 958:	06030402 	streq	r0, [r3], -r2, lsl #8
 95c:	04024c49 	streq	r4, [r2], #-3145	; 0xc49
 960:	93010100 	movwls	r0, #4352	; 0x1100
 964:	02000000 	andeq	r0, r0, #0
 968:	00004e00 	andeq	r4, r0, r0, lsl #28
 96c:	fb010200 	blx	41176 <__bss_end+0x31176>
 970:	01000d0e 	tsteq	r0, lr, lsl #26
 974:	00010101 	andeq	r0, r1, r1, lsl #2
 978:	00010000 	andeq	r0, r1, r0
 97c:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 980:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 984:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 988:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 98c:	6b62696c 	blvs	189af44 <__user_program+0x159af44>
 990:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 994:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 998:	70730000 	rsbsvc	r0, r3, r0
 99c:	00632e69 	rsbeq	r2, r3, r9, ror #28
 9a0:	6b000001 	blvs	9ac <__start-0x7654>
 9a4:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 9a8:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 9ac:	00000200 	andeq	r0, r0, r0, lsl #4
 9b0:	6f697067 	svcvs	0x00697067
 9b4:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 9b8:	00000000 	andeq	r0, r0, r0
 9bc:	a33c0205 	teqge	ip, #1342177280	; 0x50000000
 9c0:	35030000 	strcc	r0, [r3, #-0]
 9c4:	2d671301 	stclcs	3, cr1, [r7, #-4]!
 9c8:	67674e87 	strbvs	r4, [r7, -r7, lsl #29]!
 9cc:	68856a68 	stmvs	r5, {r3, r5, r6, r9, fp, sp, lr}
 9d0:	31303134 	teqcc	r0, r4, lsr r1
 9d4:	0d03692f 	stceq	9, cr6, [r3, #-188]	; 0xffffff44
 9d8:	34688501 	strbtcc	r8, [r8], #-1281	; 0x501
 9dc:	4e313031 	mrcmi	0, 1, r3, cr1, cr1, {1}
 9e0:	6a4ebe14 	bvs	13b0238 <__user_program+0x10b0238>
 9e4:	2d67312f 	stfcse	f3, [r7, #-188]!	; 0xffffff44
 9e8:	696b494b 	stmdbvs	fp!, {r0, r1, r3, r6, r8, fp, lr}^
 9ec:	494b2d67 	stmdbmi	fp, {r0, r1, r2, r5, r6, r8, sl, fp, sp}^
 9f0:	2f2f696b 	svccs	0x002f696b
 9f4:	00040232 	andeq	r0, r4, r2, lsr r2
 9f8:	00540101 	subseq	r0, r4, r1, lsl #2
 9fc:	00020000 	andeq	r0, r2, r0
 a00:	00000029 	andeq	r0, r0, r9, lsr #32
 a04:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 a08:	0101000d 	tsteq	r1, sp
 a0c:	00000101 	andeq	r0, r0, r1, lsl #2
 a10:	00000100 	andeq	r0, r0, r0, lsl #2
 a14:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 a18:	6b62696c 	blvs	189afd0 <__user_program+0x159afd0>
 a1c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 a20:	6f620000 	svcvs	0x00620000
 a24:	532e746f 	teqpl	lr, #1862270976	; 0x6f000000
 a28:	00000100 	andeq	r0, r0, r0, lsl #2
 a2c:	02050000 	andeq	r0, r5, #0
 a30:	00008000 	andeq	r8, r0, r0
 a34:	2f011b03 	svccs	0x00011b03
 a38:	2f302f2f 	svccs	0x00302f2f
 a3c:	2f2f2f2f 	svccs	0x002f2f2f
 a40:	2f2f312f 	svccs	0x002f312f
 a44:	032f3331 	teqeq	pc, #-1006632960	; 0xc4000000
 a48:	2f312e69 	svccs	0x00312e69
 a4c:	0002022f 	andeq	r0, r2, pc, lsr #4
 a50:	004d0101 	subeq	r0, sp, r1, lsl #2
 a54:	00020000 	andeq	r0, r2, r0
 a58:	00000028 	andeq	r0, r0, r8, lsr #32
 a5c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 a60:	0101000d 	tsteq	r1, sp
 a64:	00000101 	andeq	r0, r0, r1, lsl #2
 a68:	00000100 	andeq	r0, r0, r0, lsl #2
 a6c:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 a70:	6b62696c 	blvs	189b028 <__user_program+0x159b028>
 a74:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 a78:	72610000 	rsbvc	r0, r1, #0
 a7c:	00532e6d 	subseq	r2, r3, sp, ror #28
 a80:	00000001 	andeq	r0, r0, r1
 a84:	bc020500 	cfstr32lt	mvfx0, [r2], {-0}
 a88:	030000a4 	movweq	r0, #164	; 0xa4
 a8c:	2f2f0110 	svccs	0x002f0110
 a90:	2f332f33 	svccs	0x00332f33
 a94:	2f2f2f33 	svccs	0x002f2f33
 a98:	2f2f332f 	svccs	0x002f332f
 a9c:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 aa0:	ba010100 	blt	40ea8 <__bss_end+0x30ea8>
 aa4:	02000000 	andeq	r0, r0, #0
 aa8:	00002e00 	andeq	r2, r0, r0, lsl #28
 aac:	fb010200 	blx	412b6 <__bss_end+0x312b6>
 ab0:	01000d0e 	tsteq	r0, lr, lsl #26
 ab4:	00010101 	andeq	r0, r1, r1, lsl #2
 ab8:	00010000 	andeq	r0, r1, r0
 abc:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 ac0:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 ac4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 ac8:	75730000 	ldrbvc	r0, [r3, #-0]!
 acc:	76726570 			; <UNDEFINED> instruction: 0x76726570
 ad0:	726f7369 	rsbvc	r7, pc, #-1543503871	; 0xa4000001
 ad4:	0100532e 	tsteq	r0, lr, lsr #6
 ad8:	00000000 	andeq	r0, r0, r0
 adc:	a5000205 	strge	r0, [r0, #-517]	; 0x205
 ae0:	15030000 	strne	r0, [r3, #-0]
 ae4:	2f2f2f01 	svccs	0x002f2f01
 ae8:	2f2f2f2f 	svccs	0x002f2f2f
 aec:	2ff21503 	svccs	0x00f21503
 af0:	302f302f 	eorcc	r3, pc, pc, lsr #32
 af4:	032f2f2f 	teqeq	pc, #47, 30	; 0xbc
 af8:	2f2f2e0d 	svccs	0x002f2e0d
 afc:	2f2f312f 	svccs	0x002f312f
 b00:	312f2f2f 	teqcc	pc, pc, lsr #30
 b04:	2f2f312f 	svccs	0x002f312f
 b08:	2f312f2f 	svccs	0x00312f2f
 b0c:	2f312f2f 	svccs	0x00312f2f
 b10:	312e1303 	teqcc	lr, r3, lsl #6
 b14:	2f2f312f 	svccs	0x002f312f
 b18:	312f2f2f 	teqcc	pc, pc, lsr #30
 b1c:	30312f2f 	eorscc	r2, r1, pc, lsr #30
 b20:	2f312f33 	svccs	0x00312f33
 b24:	2f2f2f2f 	svccs	0x002f2f2f
 b28:	302f2f31 	eorcc	r2, pc, r1, lsr pc	; <UNPREDICTABLE>
 b2c:	2f2f2f2f 	svccs	0x002f2f2f
 b30:	2f2f2f2f 	svccs	0x002f2f2f
 b34:	2f302f2f 	svccs	0x00302f2f
 b38:	2f313031 	svccs	0x00313031
 b3c:	2f2f2f2f 	svccs	0x002f2f2f
 b40:	2f2f2f2f 	svccs	0x002f2f2f
 b44:	31313632 	teqcc	r1, r2, lsr r6
 b48:	2f313631 	svccs	0x00313631
 b4c:	30302f2f 	eorscc	r2, r0, pc, lsr #30
 b50:	2e7ec703 	cdpcs	7, 7, cr12, cr14, cr3, {0}
 b54:	2e00c903 	cdpcs	9, 0, cr12, cr0, cr3, {0}
 b58:	2e00ee03 	cdpcs	14, 0, cr14, cr0, cr3, {0}
 b5c:	01000202 	tsteq	r0, r2, lsl #4
 b60:	Address 0x00000b60 is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	656c0074 	strbvs	r0, [ip, #-116]!	; 0x74
  10:	6c635f64 	stclvs	15, cr5, [r3], #-400	; 0xfffffe70
  14:	72675f72 	rsbvc	r5, r7, #456	; 0x1c8
  18:	006e6565 	rsbeq	r6, lr, r5, ror #10
  1c:	5f64656c 	svcpl	0x0064656c
  20:	5f746573 	svcpl	0x00746573
  24:	00646572 	rsbeq	r6, r4, r2, ror r5
  28:	6f697067 	svcvs	0x00697067
  2c:	7465735f 	strbtvc	r7, [r5], #-863	; 0x35f
  30:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
  34:	6f6c2067 	svcvs	0x006c2067
  38:	7520676e 	strvc	r6, [r0, #-1902]!	; 0x76e
  3c:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
  40:	2064656e 	rsbcs	r6, r4, lr, ror #10
  44:	00746e69 	rsbseq	r6, r4, r9, ror #28
  48:	6f697067 	svcvs	0x00697067
  4c:	726c635f 	rsbvc	r6, ip, #2080374785	; 0x7c000001
  50:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
  54:	6b62696c 	blvs	189a60c <__user_program+0x159a60c>
  58:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
  5c:	64656c2f 	strbtvs	r6, [r5], #-3119	; 0xc2f
  60:	00632e73 	rsbeq	r2, r3, r3, ror lr
  64:	20554e47 	subscs	r4, r5, r7, asr #28
  68:	2e342043 	cdpcs	0, 3, cr2, cr4, cr3, {2}
  6c:	20332e39 	eorscs	r2, r3, r9, lsr lr
  70:	35313032 	ldrcc	r3, [r1, #-50]!	; 0x32
  74:	39323530 	ldmdbcc	r2!, {r4, r5, r8, sl, ip, sp}
  78:	65722820 	ldrbvs	r2, [r2, #-2080]!	; 0x820
  7c:	7361656c 	cmnvc	r1, #108, 10	; 0x1b000000
  80:	5b202965 	blpl	80a61c <__user_program+0x50a61c>
  84:	2f4d5241 	svccs	0x004d5241
  88:	65626d65 	strbvs	r6, [r2, #-3429]!	; 0xd65
  8c:	64656464 	strbtvs	r6, [r5], #-1124	; 0x464
  90:	395f342d 	ldmdbcc	pc, {r0, r2, r3, r5, sl, ip, sp}^	; <UNPREDICTABLE>
  94:	6172622d 	cmnvs	r2, sp, lsr #4
  98:	2068636e 	rsbcs	r6, r8, lr, ror #6
  9c:	69766572 	ldmdbvs	r6!, {r1, r4, r5, r6, r8, sl, sp, lr}^
  a0:	6e6f6973 	mcrvs	9, 3, r6, cr15, cr3, {3}
  a4:	34323220 	ldrtcc	r3, [r2], #-544	; 0x220
  a8:	5d383832 	ldcpl	8, cr3, [r8, #-200]!	; 0xffffff38
  ac:	666d2d20 	strbtvs	r2, [sp], -r0, lsr #26
  b0:	74616f6c 	strbtvc	r6, [r1], #-3948	; 0xf6c
  b4:	6962612d 	stmdbvs	r2!, {r0, r2, r3, r5, r8, sp, lr}^
  b8:	666f733d 			; <UNDEFINED> instruction: 0x666f733d
  bc:	6d2d2074 	stcvs	0, cr2, [sp, #-464]!	; 0xfffffe30
  c0:	68637261 	stmdavs	r3!, {r0, r5, r6, r9, ip, sp, lr}^
  c4:	6d72613d 	ldfvse	f6, [r2, #-244]!	; 0xffffff0c
  c8:	612d3776 	teqvs	sp, r6, ror r7
  cc:	20672d20 	rsbcs	r2, r7, r0, lsr #26
  d0:	20314f2d 	eorscs	r4, r1, sp, lsr #30
  d4:	7266662d 	rsbvc	r6, r6, #47185920	; 0x2d00000
  d8:	74736565 	ldrbtvc	r6, [r3], #-1381	; 0x565
  dc:	69646e61 	stmdbvs	r4!, {r0, r5, r6, r9, sl, fp, sp, lr}^
  e0:	7500676e 	strvc	r6, [r0, #-1902]	; 0x76e
  e4:	38746e69 	ldmdacc	r4!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
  e8:	7500745f 	strvc	r7, [r0, #-1119]	; 0x45f
  ec:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
  f0:	2064656e 	rsbcs	r6, r4, lr, ror #10
  f4:	72616863 	rsbvc	r6, r1, #6488064	; 0x630000
  f8:	64656c00 	strbtvs	r6, [r5], #-3072	; 0xc00
  fc:	726c635f 	rsbvc	r6, ip, #2080374785	; 0x7c000001
 100:	6465725f 	strbtvs	r7, [r5], #-607	; 0x25f
 104:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 108:	67682f74 			; <UNDEFINED> instruction: 0x67682f74
 10c:	332f7366 	teqcc	pc, #-1744830463	; 0x98000001
 110:	662f3934 			; <UNDEFINED> instruction: 0x662f3934
 114:	6c2d3731 	stcvs	7, cr3, [sp], #-196	; 0xffffff3c
 118:	2d336261 	lfmcs	f6, 4, [r3, #-388]!	; 0xfffffe7c
 11c:	69766164 	ldmdbvs	r6!, {r2, r5, r6, r8, sp, lr}^
 120:	6d616a64 	vstmdbvs	r1!, {s13-s112}
 124:	632f7365 	teqvs	pc, #-1811939327	; 0x94000001
 128:	0065646f 	rsbeq	r6, r5, pc, ror #8
 12c:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
 130:	6e752074 	mrcvs	0, 3, r2, cr5, cr4, {3}
 134:	6e676973 	mcrvs	9, 3, r6, cr7, cr3, {3}
 138:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
 13c:	6c00746e 	cfstrsvs	mvf7, [r0], {110}	; 0x6e
 140:	735f6465 	cmpvc	pc, #1694498816	; 0x65000000
 144:	675f7465 	ldrbvs	r7, [pc, -r5, ror #8]
 148:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 14c:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
 150:	6f635f6f 	svcvs	0x00635f6f
 154:	6769666e 	strbvs	r6, [r9, -lr, ror #12]!
 158:	6f687300 	svcvs	0x00687300
 15c:	69207472 	stmdbvs	r0!, {r1, r4, r5, r6, sl, ip, sp, lr}
 160:	6700746e 	strvs	r7, [r0, -lr, ror #8]
 164:	5f6f6970 	svcpl	0x006f6970
 168:	5f746573 	svcpl	0x00746573
 16c:	6c6c7570 	cfstr64vs	mvdx7, [ip], #-448	; 0xfffffe40
 170:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
 174:	5f323374 	svcpl	0x00323374
 178:	70670074 	rsbvc	r0, r7, r4, ror r0
 17c:	67006f69 	strvs	r6, [r0, -r9, ror #30]
 180:	5f6f6970 	svcpl	0x006f6970
 184:	5f746567 	svcpl	0x00746567
 188:	6576656c 	ldrbvs	r6, [r6, #-1388]!	; 0x56c
 18c:	682f006c 	stmdavs	pc!, {r2, r3, r5, r6}	; <UNPREDICTABLE>
 190:	2f656d6f 	svccs	0x00656d6f
 194:	33656365 	cmncc	r5, #-1811939327	; 0x94000001
 198:	332f3934 	teqcc	pc, #52, 18	; 0xd0000
 19c:	332f3934 	teqcc	pc, #52, 18	; 0xd0000
 1a0:	3731662f 	ldrcc	r6, [r1, -pc, lsr #12]!
 1a4:	62616c2d 	rsbvs	r6, r1, #11520	; 0x2d00
 1a8:	61642d33 	cmnvs	r4, r3, lsr sp
 1ac:	6a646976 	bvs	191a78c <__user_program+0x161a78c>
 1b0:	73656d61 	cmnvc	r5, #6208	; 0x1840
 1b4:	646f632f 	strbtvs	r6, [pc], #-815	; 1bc <__start-0x7e44>
 1b8:	65640065 	strbvs	r0, [r4, #-101]!	; 0x65
 1bc:	5f79616c 	svcpl	0x0079616c
 1c0:	6c637963 	stclvs	9, cr7, [r3], #-396	; 0xfffffe74
 1c4:	73007365 	movwvc	r7, #869	; 0x365
 1c8:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0x174
 1cc:	66666f00 	strbtvs	r6, [r6], -r0, lsl #30
 1d0:	00746573 	rsbseq	r6, r4, r3, ror r5
 1d4:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 1d8:	2f6b6269 	svccs	0x006b6269
 1dc:	2f637273 	svccs	0x00637273
 1e0:	6f697067 	svcvs	0x00697067
 1e4:	6900632e 	stmdbvs	r0, {r1, r2, r3, r5, r8, r9, sp, lr}
 1e8:	6d5f6332 	ldclvs	3, cr6, [pc, #-200]	; 128 <__start-0x7ed8>
 1ec:	65747361 	ldrbvs	r7, [r4, #-865]!	; 0x361
 1f0:	6e695f72 	mcrvs	15, 3, r5, cr9, cr2, {3}
 1f4:	63007469 	movwvs	r7, #1129	; 0x469
 1f8:	69666e6f 	stmdbvs	r6!, {r0, r1, r2, r3, r5, r6, r9, sl, fp, sp, lr}^
 1fc:	61645f67 	cmnvs	r4, r7, ror #30
 200:	61006174 	tstvs	r0, r4, ror r1
 204:	695f6364 	ldmdbvs	pc, {r2, r5, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 208:	0074696e 	rsbseq	r6, r4, lr, ror #18
 20c:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 210:	6c61765f 	stclvs	6, cr7, [r1], #-380	; 0xfffffe84
 214:	6b006575 	blvs	197f0 <__bss_end+0x97f0>
 218:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 21c:	732f2f6c 	teqvc	pc, #108, 30	; 0x1b0
 220:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
 224:	30317364 	eorscc	r7, r1, r4, ror #6
 228:	632e3531 	teqvs	lr, #205520896	; 0xc400000
 22c:	63326900 	teqvs	r2, #0, 18
 230:	73616d5f 	cmnvc	r1, #6080	; 0x17c0
 234:	5f726574 	svcpl	0x00726574
 238:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 23c:	61686300 	cmnvs	r8, r0, lsl #6
 240:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 244:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
 248:	5f363174 	svcpl	0x00363174
 24c:	6f630074 	svcvs	0x00630074
 250:	7265766e 	rsbvc	r7, r5, #115343360	; 0x6e00000
 254:	6e6f6973 	mcrvs	9, 3, r6, cr15, cr3, {3}
 258:	7461645f 	strbtvc	r6, [r1], #-1119	; 0x45f
 25c:	64610061 	strbtvs	r0, [r1], #-97	; 0x61
 260:	65725f63 	ldrbvs	r5, [r2, #-3939]!	; 0xf63
 264:	69006461 	stmdbvs	r0, {r0, r5, r6, sl, sp, lr}
 268:	6d5f6332 	ldclvs	3, cr6, [pc, #-200]	; 1a8 <__start-0x7e58>
 26c:	65747361 	ldrbvs	r7, [r4, #-865]!	; 0x361
 270:	72775f72 	rsbsvc	r5, r7, #456	; 0x1c8
 274:	00657469 	rsbeq	r7, r5, r9, ror #8
 278:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0x973
 27c:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0x974
 280:	64646100 	strbtvs	r6, [r4], #-256	; 0x100
 284:	656b0072 	strbvs	r0, [fp, #-114]!	; 0x72
 288:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 28c:	72732f2f 	rsbsvc	r2, r3, #47, 30	; 0xbc
 290:	32692f63 	rsbcc	r2, r9, #396	; 0x18c
 294:	00632e63 	rsbeq	r2, r3, r3, ror #28
 298:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 29c:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 2a0:	756d0074 	strbvc	r0, [sp, #-116]!	; 0x74
 2a4:	5f786574 	svcpl	0x00786574
 2a8:	63004449 	movwvs	r4, #1097	; 0x449
 2ac:	6d756c6f 	ldclvs	12, cr6, [r5, #-444]!	; 0xfffffe44
 2b0:	6c6f006e 	stclvs	0, cr0, [pc], #-440	; 100 <__start-0x7f00>
 2b4:	625f6465 	subsvs	r6, pc, #1694498816	; 0x65000000
 2b8:	635f6675 	cmpvs	pc, #122683392	; 0x7500000
 2bc:	7300726c 	movwvc	r7, #620	; 0x26c
 2c0:	61637379 	smcvs	14137	; 0x3739
 2c4:	735f6c6c 	cmpvc	pc, #108, 24	; 0x6c00
 2c8:	006b7262 	rsbeq	r7, fp, r2, ror #4
 2cc:	76657270 			; <UNDEFINED> instruction: 0x76657270
 2d0:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0x552
 2d4:	65670074 	strbvs	r0, [r7, #-116]!	; 0x74
 2d8:	6f745f74 	svcvs	0x00745f74
 2dc:	72705f70 	rsbsvc	r5, r0, #112, 30	; 0x1c0
 2e0:	69726f69 	ldmdbvs	r2!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
 2e4:	76007974 			; <UNDEFINED> instruction: 0x76007974
 2e8:	61757369 	cmnvs	r5, r9, ror #6
 2ec:	657a696c 	ldrbvs	r6, [sl, #-2412]!	; 0x96c
 2f0:	6c620072 	stclvs	0, cr0, [r2], #-456	; 0xfffffe38
 2f4:	696b636f 	stmdbvs	fp!, {r0, r1, r2, r3, r5, r6, r8, r9, sp, lr}^
 2f8:	425f676e 	subsmi	r6, pc, #28835840	; 0x1b80000
 2fc:	656b0056 	strbvs	r0, [fp, #-86]!	; 0x56
 300:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 304:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
 308:	6e65006e 	cdpvs	0, 6, cr0, cr5, cr14, {3}
 30c:	63726f66 	cmnvs	r2, #408	; 0x198
 310:	79730065 	ldmdbvc	r3!, {r0, r2, r5, r6}^
 314:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 318:	736c5f6c 	cmnvc	ip, #108, 30	; 0x1b0
 31c:	006b6565 	rsbeq	r6, fp, r5, ror #10
 320:	5f717269 	svcpl	0x00717269
 324:	72737073 	rsbsvc	r7, r3, #115	; 0x73
 328:	73797300 	cmnvc	r9, #0, 6
 32c:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 330:	7473665f 	ldrbtvc	r6, [r3], #-1631	; 0x65f
 334:	69007461 	stmdbvs	r0, {r0, r5, r6, sl, ip, sp, lr}
 338:	635f7172 	cmpvs	pc, #-2147483620	; 0x8000001c
 33c:	6e61685f 	mcrvs	8, 3, r6, cr1, cr15, {2}
 340:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
 344:	72656b00 	rsbvc	r6, r5, #0, 22
 348:	2f6c656e 	svccs	0x006c656e
 34c:	2f637273 	svccs	0x00637273
 350:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 354:	632e6c65 	teqvs	lr, #25856	; 0x6500
 358:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 35c:	635f7265 	cmpvs	pc, #1342177286	; 0x50000006
 360:	7261656c 	rsbvc	r6, r1, #108, 10	; 0x1b000000
 364:	6e65705f 	mcrvs	0, 3, r7, cr5, cr15, {2}
 368:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
 36c:	42435400 	submi	r5, r3, #0, 8
 370:	7300745f 	movwvc	r7, #1119	; 0x45f
 374:	64656863 	strbtvs	r6, [r5], #-2147	; 0x863
 378:	72656c75 	rsbvc	r6, r5, #29952	; 0x7500
 37c:	6174735f 	cmnvs	r4, pc, asr r3
 380:	74007472 	strvc	r7, [r0], #-1138	; 0x472
 384:	61657268 	cmnvs	r5, r8, ror #4
 388:	72635f64 	rsbvc	r5, r3, #100, 30	; 0x190
 38c:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0x165
 390:	65786500 	ldrbvs	r6, [r8, #-1280]!	; 0x500
 394:	69747563 	ldmdbvs	r4!, {r0, r1, r5, r6, r8, sl, ip, sp, lr}^
 398:	745f6e6f 	ldrbvc	r6, [pc], #-3695	; 3a0 <__start-0x7c60>
 39c:	00656d69 	rsbeq	r6, r5, r9, ror #26
 3a0:	6e6e7572 	mcrvs	5, 3, r7, cr14, cr2, {3}
 3a4:	5f676e69 	svcpl	0x00676e69
 3a8:	65646e69 	strbvs	r6, [r4, #-3689]!	; 0xe69
 3ac:	756d0078 	strbvc	r0, [sp, #-120]!	; 0x78
 3b0:	65786574 	ldrbvs	r6, [r8, #-1396]!	; 0x574
 3b4:	69740073 	ldmdbvs	r4!, {r0, r1, r4, r5, r6}^
 3b8:	5f72656d 	svcpl	0x0072656d
 3bc:	705f7369 	subsvc	r7, pc, r9, ror #6
 3c0:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
 3c4:	7200676e 	andvc	r6, r0, #28835840	; 0x1b80000
 3c8:	69546e75 	ldmdbvs	r4, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 3cc:	7200656d 	andvc	r6, r0, #457179136	; 0x1b400000
 3d0:	74657365 	strbtvc	r7, [r5], #-869	; 0x365
 3d4:	74747542 	ldrbtvc	r7, [r4], #-1346	; 0x542
 3d8:	6d006e6f 	stcvs	14, cr6, [r0, #-444]	; 0xfffffe44
 3dc:	78657475 	stmdavc	r5!, {r0, r2, r4, r5, r6, sl, ip, sp, lr}^
 3e0:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 3e4:	68740074 	ldmdavs	r4!, {r2, r4, r5, r6}^
 3e8:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 3ec:	006e665f 	rsbeq	r6, lr, pc, asr r6
 3f0:	67676f74 			; <UNDEFINED> instruction: 0x67676f74
 3f4:	7542656c 	strbvc	r6, [r2, #-1388]	; 0x56c
 3f8:	6e6f7474 	mcrvs	4, 3, r7, cr15, cr4, {3}
 3fc:	616e6500 	cmnvs	lr, r0, lsl #10
 400:	5f656c62 	svcpl	0x00656c62
 404:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xe69
 408:	70757272 	rsbsvc	r7, r5, r2, ror r2
 40c:	55007374 	strpl	r7, [r0, #-884]	; 0x374
 410:	73655442 	cmnvc	r5, #1107296256	; 0x42000000
 414:	63730074 	cmnvs	r3, #116	; 0x74
 418:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 41c:	65646f4d 	strbvs	r6, [r4, #-3917]!	; 0xf4d
 420:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 424:	6e695f64 	cdpvs	15, 6, cr5, cr9, cr4, {3}
 428:	64007469 	strvs	r7, [r0], #-1129	; 0x469
 42c:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
 430:	695f656c 	ldmdbvs	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 434:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 438:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0x572
 43c:	75720073 	ldrbvc	r0, [r2, #-115]!	; 0x73
 440:	62616e6e 	rsbvs	r6, r1, #1760	; 0x6e0
 444:	425f656c 	subsmi	r6, pc, #108, 10	; 0x1b000000
 448:	76730056 			; <UNDEFINED> instruction: 0x76730056
 44c:	70735f63 	rsbsvc	r5, r3, r3, ror #30
 450:	74007273 	strvc	r7, [r0], #-627	; 0x273
 454:	61657268 	cmnvs	r5, r8, ror #4
 458:	6e695f64 	cdpvs	15, 6, cr5, cr9, cr4, {3}
 45c:	68007469 	stmdavs	r0, {r0, r3, r5, r6, sl, ip, sp, lr}
 460:	65646c6f 	strbvs	r6, [r4, #-3183]!	; 0xc6f
 464:	756d0072 	strbvc	r0, [sp, #-114]!	; 0x72
 468:	5f786574 	svcpl	0x00786574
 46c:	6b636f6c 	blvs	18dc224 <__user_program+0x15dc224>
 470:	73657200 	cmnvc	r5, #0, 4
 474:	63537465 	cmpvs	r3, #1694498816	; 0x65000000
 478:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 47c:	73657200 	cmnvc	r5, #0, 4
 480:	00746c75 	rsbseq	r6, r4, r5, ror ip
 484:	65726874 	ldrbvs	r6, [r2, #-2164]!	; 0x874
 488:	635f6461 	cmpvs	pc, #1627389952	; 0x61000000
 48c:	72746e6f 	rsbsvc	r6, r4, #1776	; 0x6f0
 490:	625f6c6f 	subsvs	r6, pc, #28416	; 0x6f00
 494:	6b636f6c 	blvs	18dc24c <__user_program+0x15dc24c>
 498:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 49c:	75625f64 	strbvc	r5, [r2, #-3940]!	; 0xf64
 4a0:	72645f66 	rsbvc	r5, r4, #408	; 0x198
 4a4:	67007761 	strvs	r7, [r0, -r1, ror #14]
 4a8:	705f7465 	subsvc	r7, pc, r5, ror #8
 4ac:	726f6972 	rsbvc	r6, pc, #1867776	; 0x1c8000
 4b0:	00797469 	rsbseq	r7, r9, r9, ror #8
 4b4:	74696177 	strbtvc	r6, [r9], #-375	; 0x177
 4b8:	746e755f 	strbtvc	r7, [lr], #-1375	; 0x55f
 4bc:	6e5f6c69 	cdpvs	12, 5, cr6, cr15, cr9, {3}
 4c0:	5f747865 	svcpl	0x00747865
 4c4:	69726570 	ldmdbvs	r2!, {r4, r5, r6, r8, sl, sp, lr}^
 4c8:	7300646f 	movwvc	r6, #1135	; 0x46f
 4cc:	6e5f6977 	mrcvs	9, 2, r6, cr15, cr7, {3}
 4d0:	77006d75 	smlsdxvc	r0, r5, sp, r6
 4d4:	69746961 	ldmdbvs	r4!, {r0, r5, r6, r8, fp, sp, lr}^
 4d8:	425f676e 	subsmi	r6, pc, #28835840	; 0x1b80000
 4dc:	616d0056 	qdsubvs	r0, r6, sp
 4e0:	72705f78 	rsbsvc	r5, r0, #120, 30	; 0x1e0
 4e4:	73006f69 	movwvc	r6, #3945	; 0xf69
 4e8:	61637379 	smcvs	14137	; 0x3739
 4ec:	655f6c6c 	ldrbvs	r6, [pc, #-3180]	; fffff888 <__user_program+0xffcff888>
 4f0:	00746978 	rsbseq	r6, r4, r8, ror r9
 4f4:	73677261 	cmnvc	r7, #268435462	; 0x10000006
 4f8:	746e6500 	strbtvc	r6, [lr], #-1280	; 0x500
 4fc:	755f7265 	ldrbvc	r7, [pc, #-613]	; 29f <__start-0x7d61>
 500:	5f726573 	svcpl	0x00726573
 504:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xf6d
 508:	78656e00 	stmdavc	r5!, {r9, sl, fp, sp, lr}^
 50c:	6c735f74 	ldclvs	15, cr5, [r3], #-464	; 0xfffffe30
 510:	00706565 	rsbseq	r6, r0, r5, ror #10
 514:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 518:	5f6c6c61 	svcpl	0x006c6c61
 51c:	74697277 	strbtvc	r7, [r9], #-631	; 0x277
 520:	74730065 	ldrbtvc	r0, [r3], #-101	; 0x65
 524:	73757461 	cmnvc	r5, #1627389952	; 0x61000000
 528:	636f6c00 	cmnvs	pc, #0, 24
 52c:	0064656b 	rsbeq	r6, r4, fp, ror #10
 530:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0x56d
 534:	00745f78 	rsbseq	r5, r4, r8, ror pc
 538:	5f717269 	svcpl	0x00717269
 53c:	7400726c 	strvc	r7, [r0], #-620	; 0x26c
 540:	43656d69 	cmnmi	r5, #6720	; 0x1a40
 544:	75736e6f 	ldrbvc	r6, [r3, #-3695]!	; 0xe6f
 548:	6974706d 	ldmdbvs	r4!, {r0, r2, r3, r5, r6, ip, sp, lr}^
 54c:	6f006e6f 	svcvs	0x00006e6f
 550:	5f64656c 	svcpl	0x0064656c
 554:	5f667562 	svcpl	0x00667562
 558:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0x970
 55c:	65735f6c 	ldrbvs	r5, [r3, #-3948]!	; 0xf6c
 560:	74730074 	ldrbtvc	r0, [r3], #-116	; 0x74
 564:	5f65726f 	svcpl	0x0065726f
 568:	72727563 	rsbsvc	r7, r2, #415236096	; 0x18c00000
 56c:	5f746e65 	svcpl	0x00746e65
 570:	6b736174 	blvs	1cd8b48 <__user_program+0x19d8b48>
 574:	74756d00 	ldrbtvc	r6, [r5], #-3328	; 0xd00
 578:	635f7865 	cmpvs	pc, #6619136	; 0x650000
 57c:	746e756f 	strbtvc	r7, [lr], #-1391	; 0x56f
 580:	63767300 	cmnvs	r6, #0, 6
 584:	0070735f 	rsbseq	r7, r0, pc, asr r3
 588:	74736e69 	ldrbtvc	r6, [r3], #-3689	; 0xe69
 58c:	5f6c6c61 	svcpl	0x006c6c61
 590:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xe69
 594:	70757272 	rsbsvc	r7, r5, r2, ror r2
 598:	61745f74 	cmnvs	r4, r4, ror pc
 59c:	00656c62 	rsbeq	r6, r5, r2, ror #24
 5a0:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0x56e
 5a4:	6b61775f 	blvs	185e328 <__user_program+0x155e328>
 5a8:	00707565 	rsbseq	r7, r0, r5, ror #10
 5ac:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0x56d
 5b0:	79745f78 	ldmdbvc	r4!, {r3, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 5b4:	73006570 	movwvc	r6, #1392	; 0x570
 5b8:	61637379 	smcvs	14137	; 0x3739
 5bc:	635f6c6c 	cmpvs	pc, #108, 24	; 0x6c00
 5c0:	65736f6c 	ldrbvs	r6, [r3, #-3948]!	; 0xf6c
 5c4:	42435400 	submi	r5, r3, #0, 8
 5c8:	6f640073 	svcvs	0x00640073
 5cc:	656c6275 	strbvs	r6, [ip, #-629]!	; 0x275
 5d0:	69777300 	ldmdbvs	r7!, {r8, r9, ip, sp, lr}^
 5d4:	685f635f 	ldmdavs	pc, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 5d8:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
 5dc:	6d007265 	sfmvs	f7, 4, [r0, #-404]	; 0xfffffe6c
 5e0:	78657475 	stmdavc	r5!, {r0, r2, r4, r5, r6, sl, ip, sp, lr}^
 5e4:	6c6e755f 	cfstr64vs	mvdx7, [lr], #-380	; 0xfffffe84
 5e8:	006b636f 	rsbeq	r6, fp, pc, ror #6
 5ec:	5f746567 	svcpl	0x00746567
 5f0:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 5f4:	65737500 	ldrbvs	r7, [r3, #-1280]!	; 0x500
 5f8:	70735f72 	rsbsvc	r5, r3, r2, ror pc
 5fc:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 600:	6c635f64 	stclvs	15, cr5, [r3], #-400	; 0xfffffe70
 604:	5f726165 	svcpl	0x00726165
 608:	65726373 	ldrbvs	r6, [r2, #-883]!	; 0x373
 60c:	72006e65 	andvc	r6, r0, #1616	; 0x650
 610:	6f747365 	svcvs	0x00747365
 614:	6e5f6572 	mrcvs	5, 2, r6, cr15, cr2, {3}
 618:	5f747865 	svcpl	0x00747865
 61c:	6b736174 	blvs	1cd8bf4 <__user_program+0x19d8bf4>
 620:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 624:	735f7265 	cmpvc	pc, #1342177286	; 0x50000006
 628:	00706f74 	rsbseq	r6, r0, r4, ror pc
 62c:	6e697073 	mcrvs	0, 3, r7, cr9, cr3, {3}
 630:	6961775f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
 634:	69745f74 	ldmdbvs	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 638:	7300656d 	movwvc	r6, #1389	; 0x56d
 63c:	6c5f6376 	mrrcvs	3, 7, r6, pc, cr6	; <UNPREDICTABLE>
 640:	70730072 	rsbsvc	r0, r3, r2, ror r0
 644:	775f6e69 	ldrbvc	r6, [pc, -r9, ror #28]
 648:	00746961 	rsbseq	r6, r4, r1, ror #18
 64c:	72727563 	rsbsvc	r7, r2, #415236096	; 0x18c00000
 650:	5f746e65 	svcpl	0x00746e65
 654:	6f697270 	svcvs	0x00697270
 658:	79746972 	ldmdbvc	r4!, {r1, r4, r5, r6, r8, fp, sp, lr}^
 65c:	65727000 	ldrbvs	r7, [r2, #-0]!
 660:	676f5476 			; <UNDEFINED> instruction: 0x676f5476
 664:	00656c67 	rsbeq	r6, r5, r7, ror #24
 668:	74737973 	ldrbtvc	r7, [r3], #-2419	; 0x973
 66c:	745f6d65 	ldrbvc	r6, [pc], #-3429	; 674 <__start-0x798c>
 670:	00656d69 	rsbeq	r6, r5, r9, ror #26
 674:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 678:	5f6c6c61 	svcpl	0x006c6c61
 67c:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 680:	65737500 	ldrbvs	r7, [r3, #-1280]!	; 0x500
 684:	726c5f72 	rsbvc	r5, ip, #456	; 0x1c8
 688:	73797300 	cmnvc	r9, #0, 6
 68c:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 690:	6173695f 	cmnvs	r3, pc, asr r9
 694:	00797474 	rsbseq	r7, r9, r4, ror r4
 698:	5f706f74 	svcpl	0x00706f74
 69c:	65646e69 	strbvs	r6, [r4, #-3689]!	; 0xe69
 6a0:	79620078 	stmdbvc	r2!, {r3, r4, r5, r6}^
 6a4:	705f6574 	subsvc	r6, pc, r4, ror r5	; <UNPREDICTABLE>
 6a8:	75007274 	strvc	r7, [r0, #-628]	; 0x274
 6ac:	36746e69 	ldrbtcc	r6, [r4], -r9, ror #28
 6b0:	00745f34 	rsbseq	r5, r4, r4, lsr pc
 6b4:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 6b8:	6d756e74 	ldclvs	14, cr6, [r5, #-464]!	; 0xfffffe30
 6bc:	5f5f006b 	svcpl	0x005f006b
 6c0:	6c5f6176 	ldfvse	f6, [pc], {118}	; 0x76
 6c4:	00747369 	rsbseq	r7, r4, r9, ror #6
 6c8:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 6cc:	7475705f 	ldrbtvc	r7, [r5], #-95	; 0x5f
 6d0:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0x25f
 6d4:	69640065 	stmdbvs	r4!, {r0, r2, r5, r6}^
 6d8:	73746967 	cmnvc	r4, #1687552	; 0x19c000
 6dc:	65727000 	ldrbvs	r7, [r2, #-0]!
 6e0:	00786966 	rsbseq	r6, r8, r6, ror #18
 6e4:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0x162
 6e8:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 6ec:	006b746e 	rsbeq	r7, fp, lr, ror #8
 6f0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 6f4:	2f2f6c65 	svccs	0x002f6c65
 6f8:	2f637273 	svccs	0x00637273
 6fc:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 700:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 704:	615f5f00 	cmpvs	pc, r0, lsl #30
 708:	72660070 	rsbvc	r0, r6, #112	; 0x70
 70c:	74007165 	strvc	r7, [r0], #-357	; 0x165
 710:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 714:	6174735f 	cmnvs	r4, pc, asr r3
 718:	6b007472 	blvs	1d8e8 <__bss_end+0xd8e8>
 71c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 720:	732f2f6c 	teqvc	pc, #108, 30	; 0x1b0
 724:	742f6372 	strtvc	r6, [pc], #-882	; 72c <__start-0x78d4>
 728:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 72c:	7500632e 	strvc	r6, [r0, #-814]	; 0x32e
 730:	5f747261 	svcpl	0x00747261
 734:	5f746567 	svcpl	0x00746567
 738:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0x962
 73c:	75616200 	strbvc	r6, [r1, #-512]!	; 0x200
 740:	74617264 	strbtvc	r7, [r1], #-612	; 0x264
 744:	65725f65 	ldrbvs	r5, [r2, #-3941]!	; 0xf65
 748:	656b0067 	strbvs	r0, [fp, #-103]!	; 0x67
 74c:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 750:	72732f2f 	rsbsvc	r2, r3, #47, 30	; 0xbc
 754:	61752f63 	cmnvs	r5, r3, ror #30
 758:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 75c:	72617500 	rsbvc	r7, r1, #0, 10
 760:	6c635f74 	stclvs	15, cr5, [r3], #-464	; 0xfffffe30
 764:	0065736f 	rsbeq	r7, r5, pc, ror #6
 768:	436e7572 	cmnmi	lr, #478150656	; 0x1c800000
 76c:	6e00746e 	cdpvs	4, 0, cr7, cr0, cr14, {3}
 770:	725f6d75 	subsvc	r6, pc, #7488	; 0x1d40
 774:	00646165 	rsbeq	r6, r4, r5, ror #2
 778:	656c6966 	strbvs	r6, [ip, #-2406]!	; 0x966
 77c:	77656e00 	strbvc	r6, [r5, -r0, lsl #28]!
 780:	6168635f 	cmnvs	r8, pc, asr r3
 784:	6d2f0072 	stcvs	0, cr0, [pc, #-456]!	; 5c4 <__start-0x7a3c>
 788:	682f746e 	stmdavs	pc!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}	; <UNPREDICTABLE>
 78c:	2f736667 	svccs	0x00736667
 790:	2f393433 	svccs	0x00393433
 794:	3362614c 	cmncc	r2, #76, 2
 798:	3731662f 	ldrcc	r6, [r1, -pc, lsr #12]!
 79c:	62616c2d 	rsbvs	r6, r1, #11520	; 0x2d00
 7a0:	61642d33 	cmnvs	r4, r3, lsr sp
 7a4:	6a646976 	bvs	191ad84 <__user_program+0x161ad84>
 7a8:	73656d61 	cmnvc	r5, #6208	; 0x1840
 7ac:	646f632f 	strbtvs	r6, [pc], #-815	; 7b4 <__start-0x784c>
 7b0:	72700065 	rsbsvc	r0, r0, #101	; 0x65
 7b4:	685f7665 	ldmdavs	pc, {r0, r2, r5, r6, r9, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 7b8:	5f706165 	svcpl	0x00706165
 7bc:	00646e65 	rsbeq	r6, r4, r5, ror #28
 7c0:	72636e69 	rsbvc	r6, r3, #1680	; 0x690
 7c4:	72656b00 	rsbvc	r6, r5, #0, 22
 7c8:	2f6c656e 	svccs	0x006c656e
 7cc:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 7d0:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 7d4:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 7d8:	00632e73 	rsbeq	r2, r3, r3, ror lr
 7dc:	55757063 	ldrbpl	r7, [r5, #-99]!	; 0x63
 7e0:	006c6974 	rsbeq	r6, ip, r4, ror r9
 7e4:	706d6574 	rsbvc	r6, sp, r4, ror r5
 7e8:	74756d5f 	ldrbtvc	r6, [r5], #-3423	; 0xd5f
 7ec:	74007865 	strvc	r7, [r0], #-2149	; 0x865
 7f0:	61657268 	cmnvs	r5, r8, ror #4
 7f4:	68740064 	ldmdavs	r4!, {r2, r5, r6}^
 7f8:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 7fc:	6972705f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, ip, sp, lr}^
 800:	7469726f 	strbtvc	r7, [r9], #-623	; 0x26f
 804:	5f5f0079 	svcpl	0x005f0079
 808:	70616568 	rsbvc	r6, r1, r8, ror #10
 80c:	776f6c5f 			; <UNDEFINED> instruction: 0x776f6c5f
 810:	6c646900 	stclvs	9, cr6, [r4], #-0
 814:	6e665f65 	cdpvs	15, 6, cr5, cr6, cr5, {3}
 818:	685f5f00 	ldmdavs	pc, {r8, r9, sl, fp, ip, lr}^	; <UNPREDICTABLE>
 81c:	5f706165 	svcpl	0x00706165
 820:	00706f74 	rsbseq	r6, r0, r4, ror pc
 824:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0x56e
 828:	6769685f 			; <UNDEFINED> instruction: 0x6769685f
 82c:	74736568 	ldrbtvc	r6, [r3], #-1384	; 0x568
 830:	6972705f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, ip, sp, lr}^
 834:	7469726f 	strbtvc	r7, [r9], #-623	; 0x26f
 838:	64690079 	strbtvs	r0, [r9], #-121	; 0x79
 83c:	735f656c 	cmpvc	pc, #108, 10	; 0x1b000000
 840:	6b636174 	blvs	18d8e18 <__user_program+0x15d8e18>
 844:	6174735f 	cmnvs	r4, pc, asr r3
 848:	74007472 	strvc	r7, [r0], #-1138	; 0x472
 84c:	74696177 	strbtvc	r6, [r9], #-375	; 0x177
 850:	6c656400 	cfstrdvs	mvd6, [r5], #-0
 854:	73007961 	movwvc	r7, #2401	; 0x961
 858:	655f6970 	ldrbvs	r6, [pc, #-2416]	; fffffef0 <__user_program+0xffcffef0>
 85c:	6f00646e 	svcvs	0x0000646e
 860:	5f64656c 	svcpl	0x0064656c
 864:	74697277 	strbtvc	r7, [r9], #-631	; 0x277
 868:	61645f65 	cmnvs	r4, r5, ror #30
 86c:	6b006174 	blvs	18e44 <__bss_end+0x8e44>
 870:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 874:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 878:	63732f63 	cmnvs	r3, #396	; 0x18c
 87c:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 880:	6f00632e 	svcvs	0x0000632e
 884:	5f64656c 	svcpl	0x0064656c
 888:	6f726373 	svcvs	0x00726373
 88c:	745f6c6c 	ldrbvc	r6, [pc], #-3180	; 894 <__start-0x776c>
 890:	00747365 	rsbseq	r7, r4, r5, ror #6
 894:	5f697073 	svcpl	0x00697073
 898:	6e617274 	mcrvs	2, 3, r7, cr1, cr4, {3}
 89c:	72656673 	rsbvc	r6, r5, #120586240	; 0x7300000
 8a0:	69707300 	ldmdbvs	r0!, {r8, r9, ip, sp, lr}^
 8a4:	73616d5f 	cmnvc	r1, #6080	; 0x17c0
 8a8:	5f726574 	svcpl	0x00726574
 8ac:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 8b0:	6c6f5f00 	stclvs	15, cr5, [pc], #-0	; 8b8 <__start-0x7748>
 8b4:	665f6465 	ldrbvs	r6, [pc], -r5, ror #8
 8b8:	656d6172 	strbvs	r6, [sp, #-370]!	; 0x172
 8bc:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 8c0:	00726566 	rsbseq	r6, r2, r6, ror #10
 8c4:	5f697073 	svcpl	0x00697073
 8c8:	69676562 	stmdbvs	r7!, {r1, r5, r6, r8, sl, sp, lr}^
 8cc:	6c6f006e 	stclvs	0, cr0, [pc], #-440	; 71c <__start-0x78e4>
 8d0:	625f6465 	subsvs	r6, pc, #1694498816	; 0x65000000
 8d4:	705f6675 	subsvc	r6, pc, r5, ror r6	; <UNPREDICTABLE>
 8d8:	6c657869 	stclvs	8, cr7, [r5], #-420	; 0xfffffe5c
 8dc:	726c635f 	rsbvc	r6, ip, #2080374785	; 0x7c000001
 8e0:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 8e4:	74735f64 	ldrbtvc	r5, [r3], #-3940	; 0xf64
 8e8:	5f747261 	svcpl	0x00747261
 8ec:	75716573 	ldrbvc	r6, [r1, #-1395]!	; 0x573
 8f0:	65636e65 	strbvs	r6, [r3, #-3685]!	; 0xe65
 8f4:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 8f8:	72775f64 	rsbsvc	r5, r7, #100, 30	; 0x190
 8fc:	5f657469 	svcpl	0x00657469
 900:	6d6d6f63 	stclvs	15, cr6, [sp, #-396]!	; 0xfffffe74
 904:	00646e61 	rsbeq	r6, r4, r1, ror #28
 908:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 90c:	7365725f 	cmnvc	r5, #-268435451	; 0xf0000005
 910:	6b007465 	blvs	1daac <__bss_end+0xdaac>
 914:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 918:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 91c:	70732f63 	rsbsvc	r2, r3, r3, ror #30
 920:	00632e69 	rsbeq	r2, r3, r9, ror #28
 924:	4d646d63 	stclmi	13, cr6, [r4, #-396]!	; 0xfffffe74
 928:	0065646f 	rsbeq	r6, r5, pc, ror #8

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <__user_program+0xdd0d24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	204d5241 	subcs	r5, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xd45
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0x464
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2973726f 	ldmdbcs	r3!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}^
  2c:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  30:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  34:	30353130 	eorscc	r3, r5, r0, lsr r1
  38:	20393235 	eorscs	r3, r9, r5, lsr r2
  3c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  40:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  44:	415b2029 	cmpmi	fp, r9, lsr #32
  48:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff2fe <__user_program+0xffcff2fe>
  4c:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  50:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  54:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  58:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  5c:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  60:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  64:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  68:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  6c:	005d3838 	subseq	r3, sp, r8, lsr r8

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002c41 	andeq	r2, r0, r1, asr #24
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000022 	andeq	r0, r0, r2, lsr #32
  10:	412d3705 	teqmi	sp, r5, lsl #14
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	14041202 	strne	r1, [r4], #-514	; 0x202
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end+0x36038>
  28:	22011e01 	andcs	r1, r1, #1, 28
  2c:	Address 0x0000002c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	00000014 	andeq	r0, r0, r4, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000020 	andeq	r0, r0, r0, lsr #32
  20:	83080e42 	movwhi	r0, #36418	; 0x8e42
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	00000014 	andeq	r0, r0, r4, lsl r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008074 	andeq	r8, r0, r4, ror r0
  34:	00000010 	andeq	r0, r0, r0, lsl r0
  38:	83080e42 	movwhi	r0, #36418	; 0x8e42
  3c:	00018e02 	andeq	r8, r1, r2, lsl #28
  40:	00000014 	andeq	r0, r0, r4, lsl r0
  44:	00000000 	andeq	r0, r0, r0
  48:	00008084 	andeq	r8, r0, r4, lsl #1
  4c:	00000010 	andeq	r0, r0, r0, lsl r0
  50:	83080e42 	movwhi	r0, #36418	; 0x8e42
  54:	00018e02 	andeq	r8, r1, r2, lsl #28
  58:	00000014 	andeq	r0, r0, r4, lsl r0
  5c:	00000000 	andeq	r0, r0, r0
  60:	00008094 	muleq	r0, r4, r0
  64:	00000010 	andeq	r0, r0, r0, lsl r0
  68:	83080e42 	movwhi	r0, #36418	; 0x8e42
  6c:	00018e02 	andeq	r8, r1, r2, lsl #28
  70:	00000014 	andeq	r0, r0, r4, lsl r0
  74:	00000000 	andeq	r0, r0, r0
  78:	000080a4 	andeq	r8, r0, r4, lsr #1
  7c:	00000010 	andeq	r0, r0, r0, lsl r0
  80:	83080e42 	movwhi	r0, #36418	; 0x8e42
  84:	00018e02 	andeq	r8, r1, r2, lsl #28
  88:	0000000c 	andeq	r0, r0, ip
  8c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  90:	7c020001 	stcvc	0, cr0, [r2], {1}
  94:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  98:	0000000c 	andeq	r0, r0, ip
  9c:	00000088 	andeq	r0, r0, r8, lsl #1
  a0:	000080b4 	strheq	r8, [r0], -r4
  a4:	00000054 	andeq	r0, r0, r4, asr r0
  a8:	0000000c 	andeq	r0, r0, ip
  ac:	00000088 	andeq	r0, r0, r8, lsl #1
  b0:	00008108 	andeq	r8, r0, r8, lsl #2
  b4:	00000044 	andeq	r0, r0, r4, asr #32
  b8:	0000000c 	andeq	r0, r0, ip
  bc:	00000088 	andeq	r0, r0, r8, lsl #1
  c0:	0000814c 	andeq	r8, r0, ip, asr #2
  c4:	00000044 	andeq	r0, r0, r4, asr #32
  c8:	00000018 	andeq	r0, r0, r8, lsl r0
  cc:	00000088 	andeq	r0, r0, r8, lsl #1
  d0:	00008190 	muleq	r0, r0, r1
  d4:	00000084 	andeq	r0, r0, r4, lsl #1
  d8:	83100e48 	tsthi	r0, #72, 28	; 0x480
  dc:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
  e0:	00018e02 	andeq	r8, r1, r2, lsl #28
  e4:	0000000c 	andeq	r0, r0, ip
  e8:	00000088 	andeq	r0, r0, r8, lsl #1
  ec:	00008214 	andeq	r8, r0, r4, lsl r2
  f0:	00000034 	andeq	r0, r0, r4, lsr r0
  f4:	0000000c 	andeq	r0, r0, ip
  f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  fc:	7c020001 	stcvc	0, cr0, [r2], {1}
 100:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 104:	00000014 	andeq	r0, r0, r4, lsl r0
 108:	000000f4 	strdeq	r0, [r0], -r4
 10c:	00008248 	andeq	r8, r0, r8, asr #4
 110:	00000010 	andeq	r0, r0, r0, lsl r0
 114:	83080e42 	movwhi	r0, #36418	; 0x8e42
 118:	00018e02 	andeq	r8, r1, r2, lsl #28
 11c:	00000018 	andeq	r0, r0, r8, lsl r0
 120:	000000f4 	strdeq	r0, [r0], -r4
 124:	00008258 	andeq	r8, r0, r8, asr r2
 128:	000000b4 	strheq	r0, [r0], -r4
 12c:	8e040e42 	cdphi	14, 0, cr0, cr4, cr2, {2}
 130:	180e4201 	stmdane	lr, {r0, r9, lr}
 134:	040e5402 	streq	r5, [lr], #-1026	; 0x402
 138:	0000000c 	andeq	r0, r0, ip
 13c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 140:	7c020001 	stcvc	0, cr0, [r2], {1}
 144:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 148:	00000014 	andeq	r0, r0, r4, lsl r0
 14c:	00000138 	andeq	r0, r0, r8, lsr r1
 150:	0000830c 	andeq	r8, r0, ip, lsl #6
 154:	00000054 	andeq	r0, r0, r4, asr r0
 158:	83080e42 	movwhi	r0, #36418	; 0x8e42
 15c:	00018e02 	andeq	r8, r1, r2, lsl #28
 160:	0000000c 	andeq	r0, r0, ip
 164:	00000138 	andeq	r0, r0, r8, lsr r1
 168:	00008360 	andeq	r8, r0, r0, ror #6
 16c:	000000a4 	andeq	r0, r0, r4, lsr #1
 170:	0000000c 	andeq	r0, r0, ip
 174:	00000138 	andeq	r0, r0, r8, lsr r1
 178:	00008404 	andeq	r8, r0, r4, lsl #8
 17c:	0000009c 	muleq	r0, ip, r0
 180:	0000000c 	andeq	r0, r0, ip
 184:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 188:	7c020001 	stcvc	0, cr0, [r2], {1}
 18c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 190:	00000014 	andeq	r0, r0, r4, lsl r0
 194:	00000180 	andeq	r0, r0, r0, lsl #3
 198:	000084a0 	andeq	r8, r0, r0, lsr #9
 19c:	0000003c 	andeq	r0, r0, ip, lsr r0
 1a0:	83080e42 	movwhi	r0, #36418	; 0x8e42
 1a4:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a8:	00000014 	andeq	r0, r0, r4, lsl r0
 1ac:	00000180 	andeq	r0, r0, r0, lsl #3
 1b0:	000084dc 	ldrdeq	r8, [r0], -ip
 1b4:	00000074 	andeq	r0, r0, r4, ror r0
 1b8:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 1bc:	00018e02 	andeq	r8, r1, r2, lsl #28
 1c0:	00000014 	andeq	r0, r0, r4, lsl r0
 1c4:	00000180 	andeq	r0, r0, r0, lsl #3
 1c8:	00008550 	andeq	r8, r0, r0, asr r5
 1cc:	00000318 	andeq	r0, r0, r8, lsl r3
 1d0:	8e040e4c 	cdphi	14, 0, cr0, cr4, cr12, {2}
 1d4:	00000001 	andeq	r0, r0, r1
 1d8:	0000000c 	andeq	r0, r0, ip
 1dc:	00000180 	andeq	r0, r0, r0, lsl #3
 1e0:	00008868 	andeq	r8, r0, r8, ror #16
 1e4:	00000274 	andeq	r0, r0, r4, ror r2
 1e8:	0000000c 	andeq	r0, r0, ip
 1ec:	00000180 	andeq	r0, r0, r0, lsl #3
 1f0:	00008adc 	ldrdeq	r8, [r0], -ip
 1f4:	00000114 	andeq	r0, r0, r4, lsl r1
 1f8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1fc:	00000180 	andeq	r0, r0, r0, lsl #3
 200:	00008bf0 	strdeq	r8, [r0], -r0
 204:	00000098 	muleq	r0, r8, r0
 208:	84140e42 	ldrhi	r0, [r4], #-3650	; 0xe42
 20c:	86048505 	strhi	r8, [r4], -r5, lsl #10
 210:	8e028703 	cdphi	7, 0, cr8, cr2, cr3, {0}
 214:	00000001 	andeq	r0, r0, r1
 218:	00000014 	andeq	r0, r0, r4, lsl r0
 21c:	00000180 	andeq	r0, r0, r0, lsl #3
 220:	00008c88 	andeq	r8, r0, r8, lsl #25
 224:	0000004c 	andeq	r0, r0, ip, asr #32
 228:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	00000018 	andeq	r0, r0, r8, lsl r0
 234:	00000180 	andeq	r0, r0, r0, lsl #3
 238:	00008cd4 	ldrdeq	r8, [r0], -r4
 23c:	0000023c 	andeq	r0, r0, ip, lsr r2
 240:	83100e42 	tsthi	r0, #1056	; 0x420
 244:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 248:	00018e02 	andeq	r8, r1, r2, lsl #28
 24c:	00000014 	andeq	r0, r0, r4, lsl r0
 250:	00000180 	andeq	r0, r0, r0, lsl #3
 254:	00008f10 	andeq	r8, r0, r0, lsl pc
 258:	00000060 	andeq	r0, r0, r0, rrx
 25c:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 260:	00018e02 	andeq	r8, r1, r2, lsl #28
 264:	0000001c 	andeq	r0, r0, ip, lsl r0
 268:	00000180 	andeq	r0, r0, r0, lsl #3
 26c:	00008f70 	andeq	r8, r0, r0, ror pc
 270:	000001cc 	andeq	r0, r0, ip, asr #3
 274:	840c0e42 	strhi	r0, [ip], #-3650	; 0xe42
 278:	8e028503 	cfsh32hi	mvfx8, mvfx2, #3
 27c:	180e4201 	stmdane	lr, {r0, r9, lr}
 280:	0c0ee002 	stceq	0, cr14, [lr], {2}
 284:	0000000c 	andeq	r0, r0, ip
 288:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 28c:	7c020001 	stcvc	0, cr0, [r2], {1}
 290:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 294:	00000028 	andeq	r0, r0, r8, lsr #32
 298:	00000284 	andeq	r0, r0, r4, lsl #5
 29c:	0000913c 	andeq	r9, r0, ip, lsr r1
 2a0:	000000e0 	andeq	r0, r0, r0, ror #1
 2a4:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 2a8:	86078508 	strhi	r8, [r7], -r8, lsl #10
 2ac:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 2b0:	8a038904 	bhi	e26c8 <__bss_end+0xd26c8>
 2b4:	42018e02 	andmi	r8, r1, #2, 28
 2b8:	6a02280e 	bvs	8a2f8 <__bss_end+0x7a2f8>
 2bc:	0000200e 	andeq	r2, r0, lr
 2c0:	00000040 	andeq	r0, r0, r0, asr #32
 2c4:	00000284 	andeq	r0, r0, r4, lsl #5
 2c8:	0000921c 	andeq	r9, r0, ip, lsl r2
 2cc:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 2d0:	80100e42 	andshi	r0, r0, r2, asr #28
 2d4:	82038104 	andhi	r8, r3, #4, 2
 2d8:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
 2dc:	0a84280e 	beq	fe10a31c <__user_program+0xfde0a31c>
 2e0:	08860985 	stmeq	r6, {r0, r2, r7, r8, fp}
 2e4:	06880787 	streq	r0, [r8], r7, lsl #15
 2e8:	0e42058e 	cdpeq	5, 4, cr0, cr2, cr14, {4}
 2ec:	0ed00230 	mrceq	2, 6, r0, cr0, cr0, {1}
 2f0:	c8ce4228 	stmiagt	lr, {r3, r5, r9, lr}^
 2f4:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 2f8:	c342100e 	movtgt	r1, #8206	; 0x200e
 2fc:	0ec0c1c2 	acseqdm	f4, f2
 300:	00000000 	andeq	r0, r0, r0
 304:	0000000c 	andeq	r0, r0, ip
 308:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 30c:	7c020001 	stcvc	0, cr0, [r2], {1}
 310:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 314:	0000000c 	andeq	r0, r0, ip
 318:	00000304 	andeq	r0, r0, r4, lsl #6
 31c:	000093d4 	ldrdeq	r9, [r0], -r4
 320:	0000004c 	andeq	r0, r0, ip, asr #32
 324:	0000000c 	andeq	r0, r0, ip
 328:	00000304 	andeq	r0, r0, r4, lsl #6
 32c:	00009420 	andeq	r9, r0, r0, lsr #8
 330:	00000030 	andeq	r0, r0, r0, lsr r0
 334:	0000000c 	andeq	r0, r0, ip
 338:	00000304 	andeq	r0, r0, r4, lsl #6
 33c:	00009450 	andeq	r9, r0, r0, asr r4
 340:	00000014 	andeq	r0, r0, r4, lsl r0
 344:	0000000c 	andeq	r0, r0, ip
 348:	00000304 	andeq	r0, r0, r4, lsl #6
 34c:	00009464 	andeq	r9, r0, r4, ror #8
 350:	00000018 	andeq	r0, r0, r8, lsl r0
 354:	0000000c 	andeq	r0, r0, ip
 358:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 35c:	7c020001 	stcvc	0, cr0, [r2], {1}
 360:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 364:	00000014 	andeq	r0, r0, r4, lsl r0
 368:	00000354 	andeq	r0, r0, r4, asr r3
 36c:	0000947c 	andeq	r9, r0, ip, ror r4
 370:	00000074 	andeq	r0, r0, r4, ror r0
 374:	83080e42 	movwhi	r0, #36418	; 0x8e42
 378:	00018e02 	andeq	r8, r1, r2, lsl #28
 37c:	0000000c 	andeq	r0, r0, ip
 380:	00000354 	andeq	r0, r0, r4, asr r3
 384:	000094f0 	strdeq	r9, [r0], -r0
 388:	00000018 	andeq	r0, r0, r8, lsl r0
 38c:	0000000c 	andeq	r0, r0, ip
 390:	00000354 	andeq	r0, r0, r4, asr r3
 394:	00009508 	andeq	r9, r0, r8, lsl #10
 398:	00000024 	andeq	r0, r0, r4, lsr #32
 39c:	0000000c 	andeq	r0, r0, ip
 3a0:	00000354 	andeq	r0, r0, r4, asr r3
 3a4:	0000952c 	andeq	r9, r0, ip, lsr #10
 3a8:	00000028 	andeq	r0, r0, r8, lsr #32
 3ac:	0000000c 	andeq	r0, r0, ip
 3b0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3b4:	7c020001 	stcvc	0, cr0, [r2], {1}
 3b8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3bc:	00000014 	andeq	r0, r0, r4, lsl r0
 3c0:	000003ac 	andeq	r0, r0, ip, lsr #7
 3c4:	00009554 	andeq	r9, r0, r4, asr r5
 3c8:	0000000c 	andeq	r0, r0, ip
 3cc:	83080e42 	movwhi	r0, #36418	; 0x8e42
 3d0:	00018e02 	andeq	r8, r1, r2, lsl #28
 3d4:	00000020 	andeq	r0, r0, r0, lsr #32
 3d8:	000003ac 	andeq	r0, r0, ip, lsr #7
 3dc:	00009560 	andeq	r9, r0, r0, ror #10
 3e0:	00000048 	andeq	r0, r0, r8, asr #32
 3e4:	84100e4a 	ldrhi	r0, [r0], #-3658	; 0xe4a
 3e8:	86038504 	strhi	r8, [r3], -r4, lsl #10
 3ec:	52018e02 	andpl	r8, r1, #2, 28
 3f0:	c5c4000e 	strbgt	r0, [r4, #14]
 3f4:	0000cec6 	andeq	ip, r0, r6, asr #29
 3f8:	0000002c 	andeq	r0, r0, ip, lsr #32
 3fc:	000003ac 	andeq	r0, r0, ip, lsr #7
 400:	000095a8 	andeq	r9, r0, r8, lsr #11
 404:	000000cc 	andeq	r0, r0, ip, asr #1
 408:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 40c:	86078508 	strhi	r8, [r7], -r8, lsl #10
 410:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 414:	8a038904 	bhi	e282c <__bss_end+0xd282c>
 418:	02018e02 	andeq	r8, r1, #2, 28
 41c:	c4000e5c 	strgt	r0, [r0], #-3676	; 0xe5c
 420:	c8c7c6c5 	stmiagt	r7, {r0, r2, r6, r7, r9, sl, lr, pc}^
 424:	00cecac9 	sbceq	ip, lr, r9, asr #21
 428:	0000002c 	andeq	r0, r0, ip, lsr #32
 42c:	000003ac 	andeq	r0, r0, ip, lsr #7
 430:	00009674 	andeq	r9, r0, r4, ror r6
 434:	000000cc 	andeq	r0, r0, ip, asr #1
 438:	84100e48 	ldrhi	r0, [r0], #-3656	; 0xe48
 43c:	86038504 	strhi	r8, [r3], -r4, lsl #10
 440:	02018e02 	andeq	r8, r1, #2, 28
 444:	c4000e56 	strgt	r0, [r0], #-3670	; 0xe56
 448:	44cec6c5 	strbmi	ip, [lr], #1733	; 0x6c5
 44c:	0484100e 	streq	r1, [r4], #14
 450:	02860385 	addeq	r0, r6, #335544322	; 0x14000002
 454:	0000018e 	andeq	r0, r0, lr, lsl #3
 458:	00000020 	andeq	r0, r0, r0, lsr #32
 45c:	000003ac 	andeq	r0, r0, ip, lsr #7
 460:	00009740 	andeq	r9, r0, r0, asr #14
 464:	0000006c 	andeq	r0, r0, ip, rrx
 468:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xe42
 46c:	86038504 	strhi	r8, [r3], -r4, lsl #10
 470:	42018e02 	andmi	r8, r1, #2, 28
 474:	0e70180e 	cdpeq	8, 7, cr1, cr0, cr14, {0}
 478:	00000010 	andeq	r0, r0, r0, lsl r0
 47c:	0000000c 	andeq	r0, r0, ip
 480:	000003ac 	andeq	r0, r0, ip, lsr #7
 484:	000097ac 	andeq	r9, r0, ip, lsr #15
 488:	00000064 	andeq	r0, r0, r4, rrx
 48c:	00000020 	andeq	r0, r0, r0, lsr #32
 490:	000003ac 	andeq	r0, r0, ip, lsr #7
 494:	00009810 	andeq	r9, r0, r0, lsl r8
 498:	0000014c 	andeq	r0, r0, ip, asr #2
 49c:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 4a0:	86078508 	strhi	r8, [r7], -r8, lsl #10
 4a4:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 4a8:	8a038904 	bhi	e28c0 <__bss_end+0xd28c0>
 4ac:	00018e02 	andeq	r8, r1, r2, lsl #28
 4b0:	0000001c 	andeq	r0, r0, ip, lsl r0
 4b4:	000003ac 	andeq	r0, r0, ip, lsr #7
 4b8:	0000995c 	andeq	r9, r0, ip, asr r9
 4bc:	00000114 	andeq	r0, r0, r4, lsl r1
 4c0:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 4c4:	86058506 	strhi	r8, [r5], -r6, lsl #10
 4c8:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 4cc:	00018e02 	andeq	r8, r1, r2, lsl #28
 4d0:	0000002c 	andeq	r0, r0, ip, lsr #32
 4d4:	000003ac 	andeq	r0, r0, ip, lsr #7
 4d8:	00009a70 	andeq	r9, r0, r0, ror sl
 4dc:	000003d4 	ldrdeq	r0, [r0], -r4
 4e0:	84240e42 	strthi	r0, [r4], #-3650	; 0xe42
 4e4:	86088509 	strhi	r8, [r8], -r9, lsl #10
 4e8:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
 4ec:	8a048905 	bhi	122908 <__svc_stack_top+0x2908>
 4f0:	8e028b03 	vmlahi.f64	d8, d2, d3
 4f4:	300e4201 	andcc	r4, lr, r1, lsl #4
 4f8:	0e01e403 	cdpeq	4, 0, cr14, cr1, cr3, {0}
 4fc:	00000024 	andeq	r0, r0, r4, lsr #32
 500:	0000000c 	andeq	r0, r0, ip
 504:	000003ac 	andeq	r0, r0, ip, lsr #7
 508:	00009e44 	andeq	r9, r0, r4, asr #28
 50c:	00000054 	andeq	r0, r0, r4, asr r0
 510:	0000000c 	andeq	r0, r0, ip
 514:	000003ac 	andeq	r0, r0, ip, lsr #7
 518:	00009e98 	muleq	r0, r8, lr
 51c:	00000010 	andeq	r0, r0, r0, lsl r0
 520:	0000000c 	andeq	r0, r0, ip
 524:	000003ac 	andeq	r0, r0, ip, lsr #7
 528:	00009ea8 	andeq	r9, r0, r8, lsr #29
 52c:	00000028 	andeq	r0, r0, r8, lsr #32
 530:	0000000c 	andeq	r0, r0, ip
 534:	000003ac 	andeq	r0, r0, ip, lsr #7
 538:	00009ed0 	ldrdeq	r9, [r0], -r0
 53c:	00000058 	andeq	r0, r0, r8, asr r0
 540:	0000000c 	andeq	r0, r0, ip
 544:	000003ac 	andeq	r0, r0, ip, lsr #7
 548:	00009f28 	andeq	r9, r0, r8, lsr #30
 54c:	00000058 	andeq	r0, r0, r8, asr r0
 550:	0000000c 	andeq	r0, r0, ip
 554:	000003ac 	andeq	r0, r0, ip, lsr #7
 558:	00009f80 	andeq	r9, r0, r0, lsl #31
 55c:	00000008 	andeq	r0, r0, r8
 560:	0000000c 	andeq	r0, r0, ip
 564:	000003ac 	andeq	r0, r0, ip, lsr #7
 568:	00009f88 	andeq	r9, r0, r8, lsl #31
 56c:	00000008 	andeq	r0, r0, r8
 570:	0000000c 	andeq	r0, r0, ip
 574:	000003ac 	andeq	r0, r0, ip, lsr #7
 578:	00009f90 	muleq	r0, r0, pc	; <UNPREDICTABLE>
 57c:	00000008 	andeq	r0, r0, r8
 580:	0000000c 	andeq	r0, r0, ip
 584:	000003ac 	andeq	r0, r0, ip, lsr #7
 588:	00009f98 	muleq	r0, r8, pc	; <UNPREDICTABLE>
 58c:	00000008 	andeq	r0, r0, r8
 590:	0000000c 	andeq	r0, r0, ip
 594:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 598:	7c020001 	stcvc	0, cr0, [r2], {1}
 59c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 5a0:	0000000c 	andeq	r0, r0, ip
 5a4:	00000590 	muleq	r0, r0, r5
 5a8:	00009fa0 	andeq	r9, r0, r0, lsr #31
 5ac:	00000020 	andeq	r0, r0, r0, lsr #32
 5b0:	0000000c 	andeq	r0, r0, ip
 5b4:	00000590 	muleq	r0, r0, r5
 5b8:	00009fc0 	andeq	r9, r0, r0, asr #31
 5bc:	00000044 	andeq	r0, r0, r4, asr #32
 5c0:	0000000c 	andeq	r0, r0, ip
 5c4:	00000590 	muleq	r0, r0, r5
 5c8:	0000a004 	andeq	sl, r0, r4
 5cc:	00000044 	andeq	r0, r0, r4, asr #32
 5d0:	0000000c 	andeq	r0, r0, ip
 5d4:	00000590 	muleq	r0, r0, r5
 5d8:	0000a048 	andeq	sl, r0, r8, asr #32
 5dc:	00000024 	andeq	r0, r0, r4, lsr #32
 5e0:	00000014 	andeq	r0, r0, r4, lsl r0
 5e4:	00000590 	muleq	r0, r0, r5
 5e8:	0000a06c 	andeq	sl, r0, ip, rrx
 5ec:	00000034 	andeq	r0, r0, r4, lsr r0
 5f0:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 5f4:	00018e02 	andeq	r8, r1, r2, lsl #28
 5f8:	00000014 	andeq	r0, r0, r4, lsl r0
 5fc:	00000590 	muleq	r0, r0, r5
 600:	0000a0a0 	andeq	sl, r0, r0, lsr #1
 604:	00000034 	andeq	r0, r0, r4, lsr r0
 608:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 60c:	00018e02 	andeq	r8, r1, r2, lsl #28
 610:	00000014 	andeq	r0, r0, r4, lsl r0
 614:	00000590 	muleq	r0, r0, r5
 618:	0000a0d4 	ldrdeq	sl, [r0], -r4
 61c:	00000040 	andeq	r0, r0, r0, asr #32
 620:	83080e42 	movwhi	r0, #36418	; 0x8e42
 624:	00018e02 	andeq	r8, r1, r2, lsl #28
 628:	00000014 	andeq	r0, r0, r4, lsl r0
 62c:	00000590 	muleq	r0, r0, r5
 630:	0000a114 	andeq	sl, r0, r4, lsl r1
 634:	00000110 	andeq	r0, r0, r0, lsl r1
 638:	83080e42 	movwhi	r0, #36418	; 0x8e42
 63c:	00018e02 	andeq	r8, r1, r2, lsl #28
 640:	00000014 	andeq	r0, r0, r4, lsl r0
 644:	00000590 	muleq	r0, r0, r5
 648:	0000a224 	andeq	sl, r0, r4, lsr #4
 64c:	00000038 	andeq	r0, r0, r8, lsr r0
 650:	83080e42 	movwhi	r0, #36418	; 0x8e42
 654:	00018e02 	andeq	r8, r1, r2, lsl #28
 658:	00000018 	andeq	r0, r0, r8, lsl r0
 65c:	00000590 	muleq	r0, r0, r5
 660:	0000a25c 	andeq	sl, r0, ip, asr r2
 664:	00000044 	andeq	r0, r0, r4, asr #32
 668:	83100e42 	tsthi	r0, #1056	; 0x420
 66c:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 670:	00018e02 	andeq	r8, r1, r2, lsl #28
 674:	00000018 	andeq	r0, r0, r8, lsl r0
 678:	00000590 	muleq	r0, r0, r5
 67c:	0000a2a0 	andeq	sl, r0, r0, lsr #5
 680:	00000060 	andeq	r0, r0, r0, rrx
 684:	83100e42 	tsthi	r0, #1056	; 0x420
 688:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 68c:	00018e02 	andeq	r8, r1, r2, lsl #28
 690:	00000018 	andeq	r0, r0, r8, lsl r0
 694:	00000590 	muleq	r0, r0, r5
 698:	0000a300 	andeq	sl, r0, r0, lsl #6
 69c:	0000003c 	andeq	r0, r0, ip, lsr r0
 6a0:	83100e42 	tsthi	r0, #1056	; 0x420
 6a4:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 6a8:	00018e02 	andeq	r8, r1, r2, lsl #28
 6ac:	0000000c 	andeq	r0, r0, ip
 6b0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 6b4:	7c020001 	stcvc	0, cr0, [r2], {1}
 6b8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 6bc:	0000000c 	andeq	r0, r0, ip
 6c0:	000006ac 	andeq	r0, r0, ip, lsr #13
 6c4:	0000a33c 	andeq	sl, r0, ip, lsr r3
 6c8:	00000020 	andeq	r0, r0, r0, lsr #32
 6cc:	00000014 	andeq	r0, r0, r4, lsl r0
 6d0:	000006ac 	andeq	r0, r0, ip, lsr #13
 6d4:	0000a35c 	andeq	sl, r0, ip, asr r3
 6d8:	00000074 	andeq	r0, r0, r4, ror r0
 6dc:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 6e0:	00018e02 	andeq	r8, r1, r2, lsl #28
 6e4:	0000000c 	andeq	r0, r0, ip
 6e8:	000006ac 	andeq	r0, r0, ip, lsr #13
 6ec:	0000a3d0 	ldrdeq	sl, [r0], -r0
 6f0:	00000034 	andeq	r0, r0, r4, lsr r0
 6f4:	0000000c 	andeq	r0, r0, ip
 6f8:	000006ac 	andeq	r0, r0, ip, lsr #13
 6fc:	0000a404 	andeq	sl, r0, r4, lsl #8
 700:	00000018 	andeq	r0, r0, r8, lsl r0
 704:	00000018 	andeq	r0, r0, r8, lsl r0
 708:	000006ac 	andeq	r0, r0, ip, lsr #13
 70c:	0000a41c 	andeq	sl, r0, ip, lsl r4
 710:	000000a0 	andeq	r0, r0, r0, lsr #1
 714:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xe42
 718:	86038504 	strhi	r8, [r3], -r4, lsl #10
 71c:	00018e02 	andeq	r8, r1, r2, lsl #28
 720:	0000000c 	andeq	r0, r0, ip
 724:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 728:	7c010001 	stcvc	0, cr0, [r1], {1}
 72c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 730:	00000014 	andeq	r0, r0, r4, lsl r0
 734:	00000720 	andeq	r0, r0, r0, lsr #14
 738:	0000b0bc 	strheq	fp, [r0], -ip
 73c:	0000003c 	andeq	r0, r0, ip, lsr r0
 740:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 744:	00000010 	andeq	r0, r0, r0, lsl r0
 748:	0000000c 	andeq	r0, r0, ip
 74c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 750:	7c020001 	stcvc	0, cr0, [r2], {1}
 754:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 758:	0000002c 	andeq	r0, r0, ip, lsr #32
 75c:	00000748 	andeq	r0, r0, r8, asr #14
 760:	0000b0f8 	strdeq	fp, [r0], -r8
 764:	00000044 	andeq	r0, r0, r4, asr #32
 768:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 76c:	86078508 	strhi	r8, [r7], -r8, lsl #10
 770:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 774:	8a038904 	bhi	e2b8c <__bss_end+0xd2b8c>
 778:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 77c:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 780:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 784:	0000000e 	andeq	r0, r0, lr
 788:	00000024 	andeq	r0, r0, r4, lsr #32
 78c:	00000748 	andeq	r0, r0, r8, asr #14
 790:	0000b13c 	andeq	fp, r0, ip, lsr r1
 794:	00000040 	andeq	r0, r0, r0, asr #32
 798:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 79c:	86058506 	strhi	r8, [r5], -r6, lsl #10
 7a0:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 7a4:	5c018e02 	stcpl	14, cr8, [r1], {2}
 7a8:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 7ac:	000ec4c5 	andeq	ip, lr, r5, asr #9
 7b0:	0000000c 	andeq	r0, r0, ip
 7b4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 7b8:	7c020001 	stcvc	0, cr0, [r2], {1}
 7bc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 7c0:	00000034 	andeq	r0, r0, r4, lsr r0
 7c4:	000007b0 			; <UNDEFINED> instruction: 0x000007b0
 7c8:	0000b180 	andeq	fp, r0, r0, lsl #3
 7cc:	00000178 	andeq	r0, r0, r8, ror r1
 7d0:	83280e44 	teqhi	r8, #68, 28	; 0x440
 7d4:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 7d8:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 7dc:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 7e0:	8b038a04 	blhi	e2ff8 <__bss_end+0xd2ff8>
 7e4:	02018e02 	andeq	r8, r1, #2, 28
 7e8:	cbce0aa6 	blgt	ff383288 <__user_program+0xff083288>
 7ec:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 7f0:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 7f4:	0b42000e 	bleq	1080834 <__user_program+0xd80834>
 7f8:	0000000c 	andeq	r0, r0, ip
 7fc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 800:	7c020001 	stcvc	0, cr0, [r2], {1}
 804:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 808:	0000002c 	andeq	r0, r0, ip, lsr #32
 80c:	000007f8 	strdeq	r0, [r0], -r8
 810:	0000b2f8 	strdeq	fp, [r0], -r8
 814:	00000120 	andeq	r0, r0, r0, lsr #2
 818:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 81c:	86078508 	strhi	r8, [r7], -r8, lsl #10
 820:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 824:	8a038904 	bhi	e2c3c <__bss_end+0xd2c3c>
 828:	02018e02 	andeq	r8, r1, #2, 28
 82c:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 830:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 834:	00000ec4 	andeq	r0, r0, r4, asr #29

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
       0:	00000000 	andeq	r0, r0, r0
       4:	00000038 	andeq	r0, r0, r8, lsr r0
       8:	38500001 	ldmdacc	r0, {r0}^
       c:	54000000 	strpl	r0, [r0], #-0
      10:	04000000 	streq	r0, [r0], #-0
      14:	5001f300 	andpl	pc, r1, r0, lsl #6
      18:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
      1c:	00000000 	andeq	r0, r0, r0
      20:	00000c00 	andeq	r0, r0, r0, lsl #24
      24:	00003800 	andeq	r3, r0, r0, lsl #16
      28:	70000e00 	andvc	r0, r0, r0, lsl #28
      2c:	3a25f700 	bcc	97dc34 <__user_program+0x67dc34>
      30:	f71b25f7 			; <UNDEFINED> instruction: 0xf71b25f7
      34:	1aff0800 	bne	fffc203c <__user_program+0xffcc203c>
      38:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
      3c:	00005400 	andeq	r5, r0, r0, lsl #8
      40:	f3000f00 	vpmax.f32	d0, d0, d0
      44:	25f75001 	ldrbcs	r5, [r7, #1]!
      48:	1b25f73a 	blne	97dd38 <__user_program+0x67dd38>
      4c:	ff0800f7 			; <UNDEFINED> instruction: 0xff0800f7
      50:	00009f1a 	andeq	r9, r0, sl, lsl pc
      54:	00000000 	andeq	r0, r0, r0
      58:	00300000 	eorseq	r0, r0, r0
      5c:	004c0000 	subeq	r0, ip, r0
      60:	00010000 	andeq	r0, r1, r0
      64:	00004c52 	andeq	r4, r0, r2, asr ip
      68:	00005400 	andeq	r5, r0, r0, lsl #8
      6c:	50000100 	andpl	r0, r0, r0, lsl #2
	...
      78:	00000040 	andeq	r0, r0, r0, asr #32
      7c:	0000004c 	andeq	r0, r0, ip, asr #32
      80:	00500001 	subseq	r0, r0, r1
      84:	00000000 	andeq	r0, r0, r0
      88:	54000000 	strpl	r0, [r0], #-0
      8c:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
      90:	01000000 	mrseq	r0, (UNDEF: 0)
      94:	00685000 	rsbeq	r5, r8, r0
      98:	00800000 	addeq	r0, r0, r0
      9c:	00040000 	andeq	r0, r4, r0
      a0:	9f5001f3 	svcls	0x005001f3
      a4:	00000080 	andeq	r0, r0, r0, lsl #1
      a8:	00000088 	andeq	r0, r0, r8, lsl #1
      ac:	88500001 	ldmdahi	r0, {r0}^
      b0:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
      b4:	04000000 	streq	r0, [r0], #-0
      b8:	5001f300 	andpl	pc, r1, r0, lsl #6
      bc:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
      c0:	00000000 	andeq	r0, r0, r0
      c4:	00009800 	andeq	r9, r0, r0, lsl #16
      c8:	0000ac00 	andeq	sl, r0, r0, lsl #24
      cc:	50000100 	andpl	r0, r0, r0, lsl #2
      d0:	000000ac 	andeq	r0, r0, ip, lsr #1
      d4:	000000c4 	andeq	r0, r0, r4, asr #1
      d8:	01f30004 	mvnseq	r0, r4
      dc:	00c49f50 	sbceq	r9, r4, r0, asr pc
      e0:	00cc0000 	sbceq	r0, ip, r0
      e4:	00010000 	andeq	r0, r1, r0
      e8:	0000cc50 	andeq	ip, r0, r0, asr ip
      ec:	0000dc00 	andeq	sp, r0, r0, lsl #24
      f0:	f3000400 	vshl.u8	d0, d0, d0
      f4:	009f5001 	addseq	r5, pc, r1
      f8:	00000000 	andeq	r0, r0, r0
      fc:	dc000000 	stcle	0, cr0, [r0], {-0}
     100:	00000000 	andeq	r0, r0, r0
     104:	01000001 	tsteq	r0, r1
     108:	01005000 	mrseq	r5, (UNDEF: 0)
     10c:	01600000 	cmneq	r0, r0
     110:	00040000 	andeq	r0, r4, r0
     114:	9f5001f3 	svcls	0x005001f3
	...
     120:	000000dc 	ldrdeq	r0, [r0], -ip
     124:	00000103 	andeq	r0, r0, r3, lsl #2
     128:	03510001 	cmpeq	r1, #1
     12c:	60000001 	andvs	r0, r0, r1
     130:	04000001 	streq	r0, [r0], #-1
     134:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
     138:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     13c:	00000000 	andeq	r0, r0, r0
     140:	00016000 	andeq	r6, r1, r0
     144:	00017c00 	andeq	r7, r1, r0, lsl #24
     148:	50000100 	andpl	r0, r0, r0, lsl #2
     14c:	0000017c 	andeq	r0, r0, ip, ror r1
     150:	0000018c 	andeq	r0, r0, ip, lsl #3
     154:	01f30004 	mvnseq	r0, r4
     158:	018c9f50 	orreq	r9, ip, r0, asr pc
     15c:	01900000 	orrseq	r0, r0, r0
     160:	00010000 	andeq	r0, r1, r0
     164:	00019050 	andeq	r9, r1, r0, asr r0
     168:	00019400 	andeq	r9, r1, r0, lsl #8
     16c:	f3000400 	vshl.u8	d0, d0, d0
     170:	009f5001 	addseq	r5, pc, r1
     174:	00000000 	andeq	r0, r0, r0
     178:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
     17c:	84000001 	strhi	r0, [r0], #-1
     180:	01000001 	tsteq	r0, r1
     184:	01845300 	orreq	r5, r4, r0, lsl #6
     188:	01880000 	orreq	r0, r8, r0
     18c:	00010000 	andeq	r0, r1, r0
     190:	00000050 	andeq	r0, r0, r0, asr r0
     194:	00000000 	andeq	r0, r0, r0
     198:	00001000 	andeq	r1, r0, r0
     19c:	00001c00 	andeq	r1, r0, r0, lsl #24
     1a0:	50000100 	andpl	r0, r0, r0, lsl #2
     1a4:	0000001c 	andeq	r0, r0, ip, lsl r0
     1a8:	000000c4 	andeq	r0, r0, r4, asr #1
     1ac:	01f30004 	mvnseq	r0, r4
     1b0:	00009f50 	andeq	r9, r0, r0, asr pc
	...
     1bc:	00080000 	andeq	r0, r8, r0
     1c0:	00010000 	andeq	r0, r1, r0
     1c4:	00000850 	andeq	r0, r0, r0, asr r8
     1c8:	00005400 	andeq	r5, r0, r0, lsl #8
     1cc:	f3000400 	vshl.u8	d0, d0, d0
     1d0:	009f5001 	addseq	r5, pc, r1
     1d4:	00000000 	andeq	r0, r0, r0
     1d8:	54000000 	strpl	r0, [r0], #-0
     1dc:	90000000 	andls	r0, r0, r0
     1e0:	01000000 	mrseq	r0, (UNDEF: 0)
     1e4:	00905000 	addseq	r5, r0, r0
     1e8:	00980000 	addseq	r0, r8, r0
     1ec:	00010000 	andeq	r0, r1, r0
     1f0:	00009853 	andeq	r9, r0, r3, asr r8
     1f4:	0000e800 	andeq	lr, r0, r0, lsl #16
     1f8:	f3000400 	vshl.u8	d0, d0, d0
     1fc:	e89f5001 	ldm	pc, {r0, ip, lr}	; <UNPREDICTABLE>
     200:	ec000000 	stc	0, cr0, [r0], {-0}
     204:	01000000 	mrseq	r0, (UNDEF: 0)
     208:	00ec5000 	rsceq	r5, ip, r0
     20c:	00f00000 	rscseq	r0, r0, r0
     210:	00040000 	andeq	r0, r4, r0
     214:	9f5001f3 	svcls	0x005001f3
     218:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     21c:	000000f4 	strdeq	r0, [r0], -r4
     220:	f4500001 			; <UNDEFINED> instruction: 0xf4500001
     224:	f8000000 			; <UNDEFINED> instruction: 0xf8000000
     228:	04000000 	streq	r0, [r0], #-0
     22c:	5001f300 	andpl	pc, r1, r0, lsl #6
     230:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     234:	00000000 	andeq	r0, r0, r0
     238:	00005400 	andeq	r5, r0, r0, lsl #8
     23c:	00009400 	andeq	r9, r0, r0, lsl #8
     240:	51000100 	mrspl	r0, (UNDEF: 16)
     244:	00000094 	muleq	r0, r4, r0
     248:	000000e8 	andeq	r0, r0, r8, ror #1
     24c:	01f30004 	mvnseq	r0, r4
     250:	00e89f51 	rsceq	r9, r8, r1, asr pc
     254:	00f80000 	rscseq	r0, r8, r0
     258:	00010000 	andeq	r0, r1, r0
     25c:	00000051 	andeq	r0, r0, r1, asr r0
     260:	00000000 	andeq	r0, r0, r0
     264:	00005400 	andeq	r5, r0, r0, lsl #8
     268:	00007800 	andeq	r7, r0, r0, lsl #16
     26c:	52000100 	andpl	r0, r0, #0, 2
     270:	00000078 	andeq	r0, r0, r8, ror r0
     274:	000000e8 	andeq	r0, r0, r8, ror #1
     278:	01f30004 	mvnseq	r0, r4
     27c:	00e89f52 	rsceq	r9, r8, r2, asr pc
     280:	00f80000 	rscseq	r0, r8, r0
     284:	00010000 	andeq	r0, r1, r0
     288:	00000052 	andeq	r0, r0, r2, asr r0
     28c:	00000000 	andeq	r0, r0, r0
     290:	00008000 	andeq	r8, r0, r0
     294:	00009800 	andeq	r9, r0, r0, lsl #16
     298:	30000200 	andcc	r0, r0, r0, lsl #4
     29c:	0000989f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
     2a0:	00009c00 	andeq	r9, r0, r0, lsl #24
     2a4:	73000700 	movwvc	r0, #1792	; 0x700
     2a8:	5001f300 	andpl	pc, r1, r0, lsl #6
     2ac:	009c9f1c 	addseq	r9, ip, ip, lsl pc
     2b0:	00a00000 	adceq	r0, r0, r0
     2b4:	00080000 	andeq	r0, r8, r0
     2b8:	205001f3 	ldrshcs	r0, [r0], #-19	; 0xffffffed
     2bc:	9f220073 	svcls	0x00220073
     2c0:	000000a0 	andeq	r0, r0, r0, lsr #1
     2c4:	000000a8 	andeq	r0, r0, r8, lsr #1
     2c8:	00730007 	rsbseq	r0, r3, r7
     2cc:	1c5001f3 	ldfnee	f0, [r0], {243}	; 0xf3
     2d0:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     2d4:	00000000 	andeq	r0, r0, r0
     2d8:	0000f800 	andeq	pc, r0, r0, lsl #16
     2dc:	00015000 	andeq	r5, r1, r0
     2e0:	50000100 	andpl	r0, r0, r0, lsl #2
     2e4:	00000150 	andeq	r0, r0, r0, asr r1
     2e8:	00000158 	andeq	r0, r0, r8, asr r1
     2ec:	58530001 	ldmdapl	r3, {r0}^
     2f0:	84000001 	strhi	r0, [r0], #-1
     2f4:	04000001 	streq	r0, [r0], #-1
     2f8:	5001f300 	andpl	pc, r1, r0, lsl #6
     2fc:	0001849f 	muleq	r1, pc, r4	; <UNPREDICTABLE>
     300:	00018800 	andeq	r8, r1, r0, lsl #16
     304:	50000100 	andpl	r0, r0, r0, lsl #2
     308:	00000188 	andeq	r0, r0, r8, lsl #3
     30c:	0000018c 	andeq	r0, r0, ip, lsl #3
     310:	01f30004 	mvnseq	r0, r4
     314:	018c9f50 	orreq	r9, ip, r0, asr pc
     318:	01900000 	orrseq	r0, r0, r0
     31c:	00010000 	andeq	r0, r1, r0
     320:	00019050 	andeq	r9, r1, r0, asr r0
     324:	00019400 	andeq	r9, r1, r0, lsl #8
     328:	f3000400 	vshl.u8	d0, d0, d0
     32c:	009f5001 	addseq	r5, pc, r1
     330:	00000000 	andeq	r0, r0, r0
     334:	f8000000 			; <UNDEFINED> instruction: 0xf8000000
     338:	1c000000 	stcne	0, cr0, [r0], {-0}
     33c:	01000001 	tsteq	r0, r1
     340:	011c5200 	tsteq	ip, r0, lsl #4
     344:	01840000 	orreq	r0, r4, r0
     348:	00040000 	andeq	r0, r4, r0
     34c:	9f5201f3 	svcls	0x005201f3
     350:	00000184 	andeq	r0, r0, r4, lsl #3
     354:	00000194 	muleq	r0, r4, r1
     358:	00520001 	subseq	r0, r2, r1
     35c:	00000000 	andeq	r0, r0, r0
     360:	40000000 	andmi	r0, r0, r0
     364:	58000001 	stmdapl	r0, {r0}
     368:	02000001 	andeq	r0, r0, #1
     36c:	589f3000 	ldmpl	pc, {ip, sp}	; <UNPREDICTABLE>
     370:	68000001 	stmdavs	r0, {r0}
     374:	07000001 	streq	r0, [r0, -r1]
     378:	f3007300 	vcgt.u8	d7, d0, d0
     37c:	9f1c5001 	svcls	0x001c5001
	...
     388:	00000040 	andeq	r0, r0, r0, asr #32
     38c:	00000060 	andeq	r0, r0, r0, rrx
     390:	9f300002 	svcls	0x00300002
     394:	00000060 	andeq	r0, r0, r0, rrx
     398:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
     39c:	00530001 	subseq	r0, r3, r1
     3a0:	00000000 	andeq	r0, r0, r0
     3a4:	40000000 	andmi	r0, r0, r0
     3a8:	60000000 	andvs	r0, r0, r0
     3ac:	03000000 	movweq	r0, #0
     3b0:	9f200800 	svcls	0x00200800
     3b4:	00000088 	andeq	r0, r0, r8, lsl #1
     3b8:	000000a0 	andeq	r0, r0, r0, lsr #1
     3bc:	00530001 	subseq	r0, r3, r1
     3c0:	00000000 	andeq	r0, r0, r0
     3c4:	40000000 	andmi	r0, r0, r0
     3c8:	60000000 	andvs	r0, r0, r0
     3cc:	03000000 	movweq	r0, #0
     3d0:	9f200800 	svcls	0x00200800
     3d4:	00000060 	andeq	r0, r0, r0, rrx
     3d8:	00000098 	muleq	r0, r8, r0
     3dc:	9c510001 	mrrcls	0, 0, r0, r1, cr1
     3e0:	b0000000 	andlt	r0, r0, r0
     3e4:	01000000 	mrseq	r0, (UNDEF: 0)
     3e8:	00005100 	andeq	r5, r0, r0, lsl #2
     3ec:	00000000 	andeq	r0, r0, r0
     3f0:	00b00000 	adcseq	r0, r0, r0
     3f4:	03b80000 			; <UNDEFINED> instruction: 0x03b80000
     3f8:	00010000 	andeq	r0, r1, r0
     3fc:	0003b850 	andeq	fp, r3, r0, asr r8
     400:	0003c800 	andeq	ip, r3, r0, lsl #16
     404:	f3000400 	vshl.u8	d0, d0, d0
     408:	009f5001 	addseq	r5, pc, r1
     40c:	00000000 	andeq	r0, r0, r0
     410:	54000000 	strpl	r0, [r0], #-0
     414:	80000007 	andhi	r0, r0, r7
     418:	02000007 	andeq	r0, r0, #7
     41c:	809f3000 	addshi	r3, pc, r0
     420:	e8000007 	stmda	r0, {r0, r1, r2}
     424:	01000007 	tsteq	r0, r7
     428:	00005300 	andeq	r5, r0, r0, lsl #6
     42c:	00000000 	andeq	r0, r0, r0
     430:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
     434:	08140000 	ldmdaeq	r4, {}	; <UNPREDICTABLE>
     438:	00020000 	andeq	r0, r2, r0
     43c:	08149f30 	ldmdaeq	r4, {r4, r5, r8, r9, sl, fp, ip, pc}
     440:	08340000 	ldmdaeq	r4!, {}	; <UNPREDICTABLE>
     444:	00010000 	andeq	r0, r1, r0
     448:	00000053 	andeq	r0, r0, r3, asr r0
     44c:	00000000 	andeq	r0, r0, r0
     450:	00089000 	andeq	r9, r8, r0
     454:	00094000 	andeq	r4, r9, r0
     458:	54000100 	strpl	r0, [r0], #-256	; 0x100
     45c:	00000998 	muleq	r0, r8, r9
     460:	000009fc 	strdeq	r0, [r0], -ip
     464:	00540001 	subseq	r0, r4, r1
     468:	00000000 	andeq	r0, r0, r0
     46c:	9c000000 	stcls	0, cr0, [r0], {-0}
     470:	0f000008 	svceq	0x00000008
     474:	01000009 	tsteq	r0, r9
     478:	00005000 	andeq	r5, r0, r0
     47c:	00000000 	andeq	r0, r0, r0
     480:	09100000 	ldmdbeq	r0, {}	; <UNPREDICTABLE>
     484:	09400000 	stmdbeq	r0, {}^	; <UNPREDICTABLE>
     488:	00020000 	andeq	r0, r2, r0
     48c:	09409f30 	stmdbeq	r0, {r4, r5, r8, r9, sl, fp, ip, pc}^
     490:	09980000 	ldmibeq	r8, {}	; <UNPREDICTABLE>
     494:	00010000 	andeq	r0, r1, r0
     498:	00099854 	andeq	r9, r9, r4, asr r8
     49c:	0009fc00 	andeq	pc, r9, r0, lsl #24
     4a0:	30000200 	andcc	r0, r0, r0, lsl #4
     4a4:	0009fc9f 	muleq	r9, pc, ip	; <UNPREDICTABLE>
     4a8:	000a7000 	andeq	r7, sl, r0
     4ac:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
     4b8:	00000a70 	andeq	r0, r0, r0, ror sl
     4bc:	00000a7b 	andeq	r0, r0, fp, ror sl
     4c0:	7b500001 	blvc	14004cc <__user_program+0x11004cc>
     4c4:	d000000a 	andle	r0, r0, sl
     4c8:	0100000a 	tsteq	r0, sl
     4cc:	00005400 	andeq	r5, r0, r0, lsl #8
     4d0:	00000000 	andeq	r0, r0, r0
     4d4:	0ad00000 	beq	ff4004dc <__user_program+0xff1004dc>
     4d8:	0ae30000 	beq	ff8c04e0 <__user_program+0xff5c04e0>
     4dc:	00010000 	andeq	r0, r1, r0
     4e0:	000ae350 	andeq	lr, sl, r0, asr r3
     4e4:	000b4c00 	andeq	r4, fp, r0, lsl #24
     4e8:	54000100 	strpl	r0, [r0], #-256	; 0x100
     4ec:	00000b4c 	andeq	r0, r0, ip, asr #22
     4f0:	00000b50 	andeq	r0, r0, r0, asr fp
     4f4:	01f30004 	mvnseq	r0, r4
     4f8:	0b509f50 	bleq	1428240 <__user_program+0x1128240>
     4fc:	0b640000 	bleq	1900504 <__user_program+0x1600504>
     500:	00010000 	andeq	r0, r1, r0
     504:	000b6454 	andeq	r6, fp, r4, asr r4
     508:	000b6800 	andeq	r6, fp, r0, lsl #16
     50c:	f3000400 	vshl.u8	d0, d0, d0
     510:	689f5001 	ldmvs	pc, {r0, ip, lr}	; <UNPREDICTABLE>
     514:	7400000b 	strvc	r0, [r0], #-11
     518:	0100000b 	tsteq	r0, fp
     51c:	0b745400 	bleq	1d15524 <__user_program+0x1a15524>
     520:	0b780000 	bleq	1e00528 <__user_program+0x1b00528>
     524:	00040000 	andeq	r0, r4, r0
     528:	9f5001f3 	svcls	0x005001f3
     52c:	00000b78 	andeq	r0, r0, r8, ror fp
     530:	00000b88 	andeq	r0, r0, r8, lsl #23
     534:	88540001 	ldmdahi	r4, {r0}^
     538:	8c00000b 	stchi	0, cr0, [r0], {11}
     53c:	0400000b 	streq	r0, [r0], #-11
     540:	5001f300 	andpl	pc, r1, r0, lsl #6
     544:	000b8c9f 	muleq	fp, pc, ip	; <UNPREDICTABLE>
     548:	000b9800 	andeq	r9, fp, r0, lsl #16
     54c:	54000100 	strpl	r0, [r0], #-256	; 0x100
     550:	00000b98 	muleq	r0, r8, fp
     554:	00000b9c 	muleq	r0, ip, fp
     558:	01f30004 	mvnseq	r0, r4
     55c:	0b9c9f50 	bleq	fe7282a4 <__user_program+0xfe4282a4>
     560:	0bb00000 	bleq	fec00568 <__user_program+0xfe900568>
     564:	00010000 	andeq	r0, r1, r0
     568:	000bb054 	andeq	fp, fp, r4, asr r0
     56c:	000bb400 	andeq	fp, fp, r0, lsl #8
     570:	f3000400 	vshl.u8	d0, d0, d0
     574:	b49f5001 	ldrlt	r5, [pc], #1	; 57c <__start-0x7a84>
     578:	c800000b 	stmdagt	r0, {r0, r1, r3}
     57c:	0100000b 	tsteq	r0, fp
     580:	0bc85400 	bleq	ff215588 <__user_program+0xfef15588>
     584:	0bcc0000 	bleq	ff30058c <__user_program+0xff00058c>
     588:	00040000 	andeq	r0, r4, r0
     58c:	9f5001f3 	svcls	0x005001f3
     590:	00000bcc 	andeq	r0, r0, ip, asr #23
     594:	00000bd8 	ldrdeq	r0, [r0], -r8
     598:	d8540001 	ldmdale	r4, {r0}^
     59c:	dc00000b 	stcle	0, cr0, [r0], {11}
     5a0:	0400000b 	streq	r0, [r0], #-11
     5a4:	5001f300 	andpl	pc, r1, r0, lsl #6
     5a8:	000bdc9f 	muleq	fp, pc, ip	; <UNPREDICTABLE>
     5ac:	000bec00 	andeq	lr, fp, r0, lsl #24
     5b0:	54000100 	strpl	r0, [r0], #-256	; 0x100
     5b4:	00000bec 	andeq	r0, r0, ip, ror #23
     5b8:	00000bf0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     5bc:	01f30004 	mvnseq	r0, r4
     5c0:	0bf09f50 	bleq	ffc28308 <__user_program+0xff928308>
     5c4:	0c100000 	ldceq	0, cr0, [r0], {-0}
     5c8:	00010000 	andeq	r0, r1, r0
     5cc:	000c1054 	andeq	r1, ip, r4, asr r0
     5d0:	000c1400 	andeq	r1, ip, r0, lsl #8
     5d4:	f3000400 	vshl.u8	d0, d0, d0
     5d8:	149f5001 	ldrne	r5, [pc], #1	; 5e0 <__start-0x7a20>
     5dc:	2400000c 	strcs	r0, [r0], #-12
     5e0:	0100000c 	tsteq	r0, ip
     5e4:	0c245400 	cfstrseq	mvf5, [r4], #-0
     5e8:	0c280000 	stceq	0, cr0, [r8], #-0
     5ec:	00040000 	andeq	r0, r4, r0
     5f0:	9f5001f3 	svcls	0x005001f3
     5f4:	00000c28 	andeq	r0, r0, r8, lsr #24
     5f8:	00000c34 	andeq	r0, r0, r4, lsr ip
     5fc:	34540001 	ldrbcc	r0, [r4], #-1
     600:	3800000c 	stmdacc	r0, {r2, r3}
     604:	0400000c 	streq	r0, [r0], #-12
     608:	5001f300 	andpl	pc, r1, r0, lsl #6
     60c:	000c389f 	muleq	ip, pc, r8	; <UNPREDICTABLE>
     610:	000c4400 	andeq	r4, ip, r0, lsl #8
     614:	54000100 	strpl	r0, [r0], #-256	; 0x100
     618:	00000c44 	andeq	r0, r0, r4, asr #24
     61c:	00000c48 	andeq	r0, r0, r8, asr #24
     620:	01f30004 	mvnseq	r0, r4
     624:	0c489f50 	mcrreq	15, 5, r9, r8, cr0
     628:	0c500000 	mraeq	r0, r0, acc0
     62c:	00010000 	andeq	r0, r1, r0
     630:	000c5054 	andeq	r5, ip, r4, asr r0
     634:	000c5400 	andeq	r5, ip, r0, lsl #8
     638:	f3000400 	vshl.u8	d0, d0, d0
     63c:	549f5001 	ldrpl	r5, [pc], #1	; 644 <__start-0x79bc>
     640:	5c00000c 	stcpl	0, cr0, [r0], {12}
     644:	0100000c 	tsteq	r0, ip
     648:	0c5c5400 	cfldrdeq	mvd5, [ip], {-0}
     64c:	0c600000 	stcleq	0, cr0, [r0], #-0
     650:	00040000 	andeq	r0, r4, r0
     654:	9f5001f3 	svcls	0x005001f3
     658:	00000c60 	andeq	r0, r0, r0, ror #24
     65c:	00000c68 	andeq	r0, r0, r8, ror #24
     660:	68540001 	ldmdavs	r4, {r0}^
     664:	6c00000c 	stcvs	0, cr0, [r0], {12}
     668:	0400000c 	streq	r0, [r0], #-12
     66c:	5001f300 	andpl	pc, r1, r0, lsl #6
     670:	000c6c9f 	muleq	ip, pc, ip	; <UNPREDICTABLE>
     674:	000c7400 	andeq	r7, ip, r0, lsl #8
     678:	54000100 	strpl	r0, [r0], #-256	; 0x100
     67c:	00000c74 	andeq	r0, r0, r4, ror ip
     680:	00000c78 	andeq	r0, r0, r8, ror ip
     684:	01f30004 	mvnseq	r0, r4
     688:	0c789f50 	ldcleq	15, cr9, [r8], #-320	; 0xfffffec0
     68c:	0c840000 	stceq	0, cr0, [r4], {0}
     690:	00010000 	andeq	r0, r1, r0
     694:	000c8454 	andeq	r8, ip, r4, asr r4
     698:	000c8800 	andeq	r8, ip, r0, lsl #16
     69c:	f3000400 	vshl.u8	d0, d0, d0
     6a0:	889f5001 	ldmhi	pc, {r0, ip, lr}	; <UNPREDICTABLE>
     6a4:	8c00000c 	stchi	0, cr0, [r0], {12}
     6a8:	0100000c 	tsteq	r0, ip
     6ac:	0c8c5400 	cfstrseq	mvf5, [ip], {0}
     6b0:	0c9c0000 	ldceq	0, cr0, [ip], {0}
     6b4:	00040000 	andeq	r0, r4, r0
     6b8:	9f5001f3 	svcls	0x005001f3
	...
     6c4:	00000ad0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     6c8:	00000ae3 	andeq	r0, r0, r3, ror #21
     6cc:	e3510001 	cmp	r1, #1
     6d0:	9c00000a 	stcls	0, cr0, [r0], {10}
     6d4:	0100000c 	tsteq	r0, ip
     6d8:	00005500 	andeq	r5, r0, r0, lsl #10
     6dc:	00000000 	andeq	r0, r0, r0
     6e0:	0ae40000 	beq	ff9006e8 <__user_program+0xff6006e8>
     6e4:	0b4c0000 	bleq	13006ec <__user_program+0x10006ec>
     6e8:	00020000 	andeq	r0, r2, r0
     6ec:	0b4c9f30 	bleq	13283b4 <__user_program+0x10283b4>
     6f0:	0b500000 	bleq	14006f8 <__user_program+0x11006f8>
     6f4:	00010000 	andeq	r0, r1, r0
     6f8:	000b5050 	andeq	r5, fp, r0, asr r0
     6fc:	000b6400 	andeq	r6, fp, r0, lsl #8
     700:	30000200 	andcc	r0, r0, r0, lsl #4
     704:	000b649f 	muleq	fp, pc, r4	; <UNPREDICTABLE>
     708:	000b6800 	andeq	r6, fp, r0, lsl #16
     70c:	50000100 	andpl	r0, r0, r0, lsl #2
     710:	00000b68 	andeq	r0, r0, r8, ror #22
     714:	00000b74 	andeq	r0, r0, r4, ror fp
     718:	9f300002 	svcls	0x00300002
     71c:	00000b74 	andeq	r0, r0, r4, ror fp
     720:	00000b78 	andeq	r0, r0, r8, ror fp
     724:	78500001 	ldmdavc	r0, {r0}^
     728:	8800000b 	stmdahi	r0, {r0, r1, r3}
     72c:	0200000b 	andeq	r0, r0, #11
     730:	889f3000 	ldmhi	pc, {ip, sp}	; <UNPREDICTABLE>
     734:	8c00000b 	stchi	0, cr0, [r0], {11}
     738:	0100000b 	tsteq	r0, fp
     73c:	0b8c5000 	bleq	fe314744 <__user_program+0xfe014744>
     740:	0b980000 	bleq	fe600748 <__user_program+0xfe300748>
     744:	00020000 	andeq	r0, r2, r0
     748:	0b989f30 	bleq	fe628410 <__user_program+0xfe328410>
     74c:	0b9c0000 	bleq	fe700754 <__user_program+0xfe400754>
     750:	00010000 	andeq	r0, r1, r0
     754:	000b9c50 	andeq	r9, fp, r0, asr ip
     758:	000bb000 	andeq	fp, fp, r0
     75c:	30000200 	andcc	r0, r0, r0, lsl #4
     760:	000bb09f 	muleq	fp, pc, r0	; <UNPREDICTABLE>
     764:	000bb400 	andeq	fp, fp, r0, lsl #8
     768:	50000100 	andpl	r0, r0, r0, lsl #2
     76c:	00000bb4 			; <UNDEFINED> instruction: 0x00000bb4
     770:	00000bc8 	andeq	r0, r0, r8, asr #23
     774:	9f300002 	svcls	0x00300002
     778:	00000bc8 	andeq	r0, r0, r8, asr #23
     77c:	00000bcc 	andeq	r0, r0, ip, asr #23
     780:	cc500001 	mrrcgt	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
     784:	ec00000b 	stc	0, cr0, [r0], {11}
     788:	0200000b 	andeq	r0, r0, #11
     78c:	ec9f3000 	ldc	0, cr3, [pc], {0}
     790:	f000000b 			; <UNDEFINED> instruction: 0xf000000b
     794:	0100000b 	tsteq	r0, fp
     798:	0bf05000 	bleq	ffc147a0 <__user_program+0xff9147a0>
     79c:	0c100000 	ldceq	0, cr0, [r0], {-0}
     7a0:	00020000 	andeq	r0, r2, r0
     7a4:	0c109f30 	ldceq	15, cr9, [r0], {48}	; 0x30
     7a8:	0c140000 	ldceq	0, cr0, [r4], {-0}
     7ac:	00010000 	andeq	r0, r1, r0
     7b0:	000c1450 	andeq	r1, ip, r0, asr r4
     7b4:	000c2400 	andeq	r2, ip, r0, lsl #8
     7b8:	30000200 	andcc	r0, r0, r0, lsl #4
     7bc:	000c249f 	muleq	ip, pc, r4	; <UNPREDICTABLE>
     7c0:	000c2800 	andeq	r2, ip, r0, lsl #16
     7c4:	50000100 	andpl	r0, r0, r0, lsl #2
     7c8:	00000c28 	andeq	r0, r0, r8, lsr #24
     7cc:	00000c5c 	andeq	r0, r0, ip, asr ip
     7d0:	9f300002 	svcls	0x00300002
     7d4:	00000c5c 	andeq	r0, r0, ip, asr ip
     7d8:	00000c60 	andeq	r0, r0, r0, ror #24
     7dc:	60500001 	subsvs	r0, r0, r1
     7e0:	6800000c 	stmdavs	r0, {r2, r3}
     7e4:	0200000c 	andeq	r0, r0, #12
     7e8:	689f3000 	ldmvs	pc, {ip, sp}	; <UNPREDICTABLE>
     7ec:	6c00000c 	stcvs	0, cr0, [r0], {12}
     7f0:	0100000c 	tsteq	r0, ip
     7f4:	0c6c5000 	stcleq	0, cr5, [ip], #-0
     7f8:	0c740000 	ldcleq	0, cr0, [r4], #-0
     7fc:	00020000 	andeq	r0, r2, r0
     800:	0c749f30 	ldcleq	15, cr9, [r4], #-192	; 0xffffff40
     804:	0c780000 	ldcleq	0, cr0, [r8], #-0
     808:	00010000 	andeq	r0, r1, r0
     80c:	000c7850 	andeq	r7, ip, r0, asr r8
     810:	000c8c00 	andeq	r8, ip, r0, lsl #24
     814:	30000200 	andcc	r0, r0, r0, lsl #4
     818:	000c8c9f 	muleq	ip, pc, ip	; <UNPREDICTABLE>
     81c:	000c9c00 	andeq	r9, ip, r0, lsl #24
     820:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
     830:	00000048 	andeq	r0, r0, r8, asr #32
     834:	48500001 	ldmdami	r0, {r0}^
     838:	e0000000 	and	r0, r0, r0
     83c:	04000000 	streq	r0, [r0], #-0
     840:	5001f300 	andpl	pc, r1, r0, lsl #6
     844:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
	...
     850:	00004800 	andeq	r4, r0, r0, lsl #16
     854:	52000600 	andpl	r0, r0, #0, 12
     858:	93530493 	cmpls	r3, #-1828716544	; 0x93000000
     85c:	00004804 	andeq	r4, r0, r4, lsl #16
     860:	00007c00 	andeq	r7, r0, r0, lsl #24
     864:	56000600 	strpl	r0, [r0], -r0, lsl #12
     868:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
     86c:	00008004 	andeq	r8, r0, r4
     870:	0000e000 	andeq	lr, r0, r0
     874:	56000600 	strpl	r0, [r0], -r0, lsl #12
     878:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
     87c:	00000004 	andeq	r0, r0, r4
     880:	00000000 	andeq	r0, r0, r0
     884:	00001000 	andeq	r1, r0, r0
     888:	00004800 	andeq	r4, r0, r0, lsl #16
     88c:	30000200 	andcc	r0, r0, r0, lsl #4
     890:	0000909f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     894:	00009c00 	andeq	r9, r0, r0, lsl #24
     898:	58000100 	stmdapl	r0, {r8}
     89c:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
     8a0:	000000b8 	strheq	r0, [r0], -r8
     8a4:	b8580001 	ldmdalt	r8, {r0}^
     8a8:	c4000000 	strgt	r0, [r0], #-0
     8ac:	03000000 	movweq	r0, #0
     8b0:	9f7f7800 	svcls	0x007f7800
	...
     8bc:	00000010 	andeq	r0, r0, r0, lsl r0
     8c0:	00000038 	andeq	r0, r0, r8, lsr r0
     8c4:	57910003 	ldrpl	r0, [r1, r3]
     8c8:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
     8cc:	00006400 	andeq	r6, r0, r0, lsl #8
     8d0:	54000100 	strpl	r0, [r0], #-256	; 0x100
     8d4:	00000064 	andeq	r0, r0, r4, rrx
     8d8:	0000009c 	muleq	r0, ip, r0
     8dc:	01740003 	cmneq	r4, r3
     8e0:	00009c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
     8e4:	0000b000 	andeq	fp, r0, r0
     8e8:	54000100 	strpl	r0, [r0], #-256	; 0x100
     8ec:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
     8f0:	000000c4 	andeq	r0, r0, r4, asr #1
     8f4:	01740003 	cmneq	r4, r3
     8f8:	0000c49f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
     8fc:	0000c800 	andeq	ip, r0, r0, lsl #16
     900:	54000100 	strpl	r0, [r0], #-256	; 0x100
     904:	000000c8 	andeq	r0, r0, r8, asr #1
     908:	000000cc 	andeq	r0, r0, ip, asr #1
     90c:	7f740003 	svcvc	0x00740003
     910:	0000cc9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
     914:	0000e000 	andeq	lr, r0, r0
     918:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
     924:	000000e0 	andeq	r0, r0, r0, ror #1
     928:	00000108 	andeq	r0, r0, r8, lsl #2
     92c:	70910002 	addsvc	r0, r1, r2
     930:	00000108 	andeq	r0, r0, r8, lsl #2
     934:	0000011c 	andeq	r0, r0, ip, lsl r1
     938:	1c540001 	mrrcne	0, 0, r0, r4, cr1
     93c:	7c000001 	stcvc	0, cr0, [r0], {1}
     940:	03000002 	movweq	r0, #2
     944:	9f017400 	svcls	0x00017400
     948:	0000027c 	andeq	r0, r0, ip, ror r2
     94c:	00000288 	andeq	r0, r0, r8, lsl #5
     950:	00540001 	subseq	r0, r4, r1
     954:	00000000 	andeq	r0, r0, r0
     958:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
     95c:	f4000001 	vst4.8	{d0-d3}, [r0], r1
     960:	02000001 	andeq	r0, r0, #1
     964:	f4007300 	vst2.8	{d7-d10}, [r0], r0
     968:	f7000001 			; <UNDEFINED> instruction: 0xf7000001
     96c:	01000001 	tsteq	r0, r1
     970:	00005200 	andeq	r5, r0, r0, lsl #4
     974:	00000000 	andeq	r0, r0, r0
     978:	02080000 	andeq	r0, r8, #0
     97c:	02140000 	andseq	r0, r4, #0
     980:	00020000 	andeq	r0, r2, r0
     984:	02140073 	andseq	r0, r4, #115	; 0x73
     988:	02170000 	andseq	r0, r7, #0
     98c:	00010000 	andeq	r0, r1, r0
     990:	00000052 	andeq	r0, r0, r2, asr r0
     994:	00000000 	andeq	r0, r0, r0
     998:	00018400 	andeq	r8, r1, r0, lsl #8
     99c:	0001bc00 	andeq	fp, r1, r0, lsl #24
     9a0:	55000100 	strpl	r0, [r0, #-256]	; 0x100
	...
     9ac:	000001c8 	andeq	r0, r0, r8, asr #3
     9b0:	000001d4 	ldrdeq	r0, [r0], -r4
     9b4:	00730002 	rsbseq	r0, r3, r2
     9b8:	000001d4 	ldrdeq	r0, [r0], -r4
     9bc:	000001d7 	ldrdeq	r0, [r0], -r7
     9c0:	00520001 	subseq	r0, r2, r1
     9c4:	00000000 	andeq	r0, r0, r0
     9c8:	2c000000 	stccs	0, cr0, [r0], {-0}
     9cc:	40000002 	andmi	r0, r0, r2
     9d0:	01000002 	tsteq	r0, r2
     9d4:	02405500 	subeq	r5, r0, #0, 10
     9d8:	024c0000 	subeq	r0, ip, #0
     9dc:	00030000 	andeq	r0, r3, r0
     9e0:	009f7f75 	addseq	r7, pc, r5, ror pc	; <UNPREDICTABLE>
     9e4:	00000000 	andeq	r0, r0, r0
     9e8:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
     9ec:	5f000002 	svcpl	0x00000002
     9f0:	02000002 	andeq	r0, r0, #2
     9f4:	00007300 	andeq	r7, r0, r0, lsl #6
	...
     a00:	07000000 	streq	r0, [r0, -r0]
     a04:	01000000 	mrseq	r0, (UNDEF: 0)
     a08:	00075000 	andeq	r5, r7, r0
     a0c:	000c0000 	andeq	r0, ip, r0
     a10:	00040000 	andeq	r0, r4, r0
     a14:	9f5001f3 	svcls	0x005001f3
	...
     a20:	0000000c 	andeq	r0, r0, ip
     a24:	0000002c 	andeq	r0, r0, ip, lsr #32
     a28:	2c500001 	mrrccs	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
     a2c:	44000000 	strmi	r0, [r0], #-0
     a30:	04000000 	streq	r0, [r0], #-0
     a34:	5001f300 	andpl	pc, r1, r0, lsl #6
     a38:	0000449f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
     a3c:	00004800 	andeq	r4, r0, r0, lsl #16
     a40:	50000100 	andpl	r0, r0, r0, lsl #2
     a44:	00000048 	andeq	r0, r0, r8, asr #32
     a48:	0000004c 	andeq	r0, r0, ip, asr #32
     a4c:	01f30004 	mvnseq	r0, r4
     a50:	004c9f50 	subeq	r9, ip, r0, asr pc
     a54:	00500000 	subseq	r0, r0, r0
     a58:	00010000 	andeq	r0, r1, r0
     a5c:	00005050 	andeq	r5, r0, r0, asr r0
     a60:	00005400 	andeq	r5, r0, r0, lsl #8
     a64:	f3000400 	vshl.u8	d0, d0, d0
     a68:	009f5001 	addseq	r5, pc, r1
     a6c:	00000000 	andeq	r0, r0, r0
     a70:	0c000000 	stceq	0, cr0, [r0], {-0}
     a74:	2c000000 	stccs	0, cr0, [r0], {-0}
     a78:	01000000 	mrseq	r0, (UNDEF: 0)
     a7c:	002c5100 	eoreq	r5, ip, r0, lsl #2
     a80:	00440000 	subeq	r0, r4, r0
     a84:	00040000 	andeq	r0, r4, r0
     a88:	9f5101f3 	svcls	0x005101f3
     a8c:	00000044 	andeq	r0, r0, r4, asr #32
     a90:	00000054 	andeq	r0, r0, r4, asr r0
     a94:	00510001 	subseq	r0, r1, r1
     a98:	00000000 	andeq	r0, r0, r0
     a9c:	0c000000 	stceq	0, cr0, [r0], {-0}
     aa0:	2c000000 	stccs	0, cr0, [r0], {-0}
     aa4:	01000000 	mrseq	r0, (UNDEF: 0)
     aa8:	002c5200 	eoreq	r5, ip, r0, lsl #4
     aac:	00440000 	subeq	r0, r4, r0
     ab0:	00010000 	andeq	r0, r1, r0
     ab4:	00004456 	andeq	r4, r0, r6, asr r4
     ab8:	00005400 	andeq	r5, r0, r0, lsl #8
     abc:	52000100 	andpl	r0, r0, #0, 2
	...
     ac8:	00000014 	andeq	r0, r0, r4, lsl r0
     acc:	0000002c 	andeq	r0, r0, ip, lsr #32
     ad0:	9f300002 	svcls	0x00300002
     ad4:	0000002c 	andeq	r0, r0, ip, lsr #32
     ad8:	00000030 	andeq	r0, r0, r0, lsr r0
     adc:	00740007 	rsbseq	r0, r4, r7
     ae0:	1c5101f3 	ldfnee	f0, [r1], {243}	; 0xf3
     ae4:	0000309f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     ae8:	00003400 	andeq	r3, r0, r0, lsl #8
     aec:	f3000800 	vsub.i8	d0, d0, d0
     af0:	74205101 	strtvc	r5, [r0], #-257	; 0x101
     af4:	349f2200 	ldrcc	r2, [pc], #512	; afc <__start-0x7504>
     af8:	44000000 	strmi	r0, [r0], #-0
     afc:	07000000 	streq	r0, [r0, -r0]
     b00:	f3007400 	vshl.u8	d7, d0, d0
     b04:	9f1c5101 	svcls	0x001c5101
     b08:	0000004c 	andeq	r0, r0, ip, asr #32
     b0c:	00000054 	andeq	r0, r0, r4, asr r0
     b10:	9f300002 	svcls	0x00300002
	...
     b1c:	00000054 	andeq	r0, r0, r4, asr r0
     b20:	00000078 	andeq	r0, r0, r8, ror r0
     b24:	78500001 	ldmdavc	r0, {r0}^
     b28:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     b2c:	04000001 	streq	r0, [r0], #-1
     b30:	5001f300 	andpl	pc, r1, r0, lsl #6
     b34:	0001189f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
     b38:	00011c00 	andeq	r1, r1, r0, lsl #24
     b3c:	50000100 	andpl	r0, r0, r0, lsl #2
     b40:	0000011c 	andeq	r0, r0, ip, lsl r1
     b44:	00000120 	andeq	r0, r0, r0, lsr #2
     b48:	01f30004 	mvnseq	r0, r4
     b4c:	00009f50 	andeq	r9, r0, r0, asr pc
     b50:	00000000 	andeq	r0, r0, r0
     b54:	00540000 	subseq	r0, r4, r0
     b58:	00780000 	rsbseq	r0, r8, r0
     b5c:	00010000 	andeq	r0, r1, r0
     b60:	00007851 	andeq	r7, r0, r1, asr r8
     b64:	00011800 	andeq	r1, r1, r0, lsl #16
     b68:	58000100 	stmdapl	r0, {r8}
     b6c:	00000118 	andeq	r0, r0, r8, lsl r1
     b70:	00000120 	andeq	r0, r0, r0, lsr #2
     b74:	00510001 	subseq	r0, r1, r1
     b78:	00000000 	andeq	r0, r0, r0
     b7c:	54000000 	strpl	r0, [r0], #-0
     b80:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
     b84:	01000000 	mrseq	r0, (UNDEF: 0)
     b88:	00785200 	rsbseq	r5, r8, r0, lsl #4
     b8c:	01180000 	tsteq	r8, r0
     b90:	00010000 	andeq	r0, r1, r0
     b94:	00011856 	andeq	r1, r1, r6, asr r8
     b98:	00012000 	andeq	r2, r1, r0
     b9c:	52000100 	andpl	r0, r0, #0, 2
	...
     ba8:	00000078 	andeq	r0, r0, r8, ror r0
     bac:	000000cc 	andeq	r0, r0, ip, asr #1
     bb0:	cc550001 	mrrcgt	0, 0, r0, r5, cr1
     bb4:	e0000000 	and	r0, r0, r0
     bb8:	01000000 	mrseq	r0, (UNDEF: 0)
     bbc:	00e05400 	rsceq	r5, r0, r0, lsl #8
     bc0:	00e40000 	rsceq	r0, r4, r0
     bc4:	00010000 	andeq	r0, r1, r0
     bc8:	0000e455 	andeq	lr, r0, r5, asr r4
     bcc:	0000f400 	andeq	pc, r0, r0, lsl #8
     bd0:	57000100 	strpl	r0, [r0, -r0, lsl #2]
     bd4:	000000f4 	strdeq	r0, [r0], -r4
     bd8:	00000118 	andeq	r0, r0, r8, lsl r1
     bdc:	00550001 	subseq	r0, r5, r1
     be0:	00000000 	andeq	r0, r0, r0
     be4:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
     be8:	94000000 	strls	r0, [r0], #-0
     bec:	01000000 	mrseq	r0, (UNDEF: 0)
     bf0:	00ac5000 	adceq	r5, ip, r0
     bf4:	00bf0000 	adcseq	r0, pc, r0
     bf8:	00010000 	andeq	r0, r1, r0
     bfc:	0000fc50 	andeq	pc, r0, r0, asr ip	; <UNPREDICTABLE>
     c00:	00010800 	andeq	r0, r1, r0, lsl #16
     c04:	50000100 	andpl	r0, r0, r0, lsl #2
	...
     c10:	00000120 	andeq	r0, r0, r0, lsr #2
     c14:	00000144 	andeq	r0, r0, r4, asr #2
     c18:	44500001 	ldrbmi	r0, [r0], #-1
     c1c:	dc000001 	stcle	0, cr0, [r0], {1}
     c20:	01000001 	tsteq	r0, r1
     c24:	01dc5500 	bicseq	r5, ip, r0, lsl #10
     c28:	01e00000 	mvneq	r0, r0
     c2c:	00010000 	andeq	r0, r1, r0
     c30:	0001e050 	andeq	lr, r1, r0, asr r0
     c34:	0001e400 	andeq	lr, r1, r0, lsl #8
     c38:	f3000400 	vshl.u8	d0, d0, d0
     c3c:	e49f5001 	ldr	r5, [pc], #1	; c44 <__start-0x73bc>
     c40:	ec000001 	stc	0, cr0, [r0], {1}
     c44:	01000001 	tsteq	r0, r1
     c48:	00005500 	andeq	r5, r0, r0, lsl #10
     c4c:	00000000 	andeq	r0, r0, r0
     c50:	01200000 	teqeq	r0, r0
     c54:	013c0000 	teqeq	ip, r0
     c58:	00010000 	andeq	r0, r1, r0
     c5c:	00013c51 	andeq	r3, r1, r1, asr ip
     c60:	0001dc00 	andeq	sp, r1, r0, lsl #24
     c64:	54000100 	strpl	r0, [r0], #-256	; 0x100
     c68:	000001dc 	ldrdeq	r0, [r0], -ip
     c6c:	000001e4 	andeq	r0, r0, r4, ror #3
     c70:	e4510001 	ldrb	r0, [r1], #-1
     c74:	ec000001 	stc	0, cr0, [r0], {1}
     c78:	01000001 	tsteq	r0, r1
     c7c:	00005400 	andeq	r5, r0, r0, lsl #8
     c80:	00000000 	andeq	r0, r0, r0
     c84:	01200000 	teqeq	r0, r0
     c88:	01d00000 	bicseq	r0, r0, r0
     c8c:	00010000 	andeq	r0, r1, r0
     c90:	0001d052 	andeq	sp, r1, r2, asr r0
     c94:	0001dc00 	andeq	sp, r1, r0, lsl #24
     c98:	f3000400 	vshl.u8	d0, d0, d0
     c9c:	dc9f5201 	lfmle	f5, 4, [pc], {1}
     ca0:	ec000001 	stc	0, cr0, [r0], {1}
     ca4:	01000001 	tsteq	r0, r1
     ca8:	00005200 	andeq	r5, r0, r0, lsl #4
     cac:	00000000 	andeq	r0, r0, r0
     cb0:	01200000 	teqeq	r0, r0
     cb4:	01c80000 	biceq	r0, r8, r0
     cb8:	00010000 	andeq	r0, r1, r0
     cbc:	0001c853 	andeq	ip, r1, r3, asr r8
     cc0:	0001dc00 	andeq	sp, r1, r0, lsl #24
     cc4:	f3000400 	vshl.u8	d0, d0, d0
     cc8:	dc9f5301 	ldcle	3, cr5, [pc], {1}
     ccc:	ec000001 	stc	0, cr0, [r0], {1}
     cd0:	01000001 	tsteq	r0, r1
     cd4:	00005300 	andeq	r5, r0, r0, lsl #6
     cd8:	00000000 	andeq	r0, r0, r0
     cdc:	01ec0000 	mvneq	r0, r0
     ce0:	02300000 	eorseq	r0, r0, #0
     ce4:	00010000 	andeq	r0, r1, r0
     ce8:	00023050 	andeq	r3, r2, r0, asr r0
     cec:	00025800 	andeq	r5, r2, r0, lsl #16
     cf0:	56000100 	strpl	r0, [r0], -r0, lsl #2
	...
     cfc:	000001ec 	andeq	r0, r0, ip, ror #3
     d00:	0000022c 	andeq	r0, r0, ip, lsr #4
     d04:	2c510001 	mrrccs	0, 0, r0, r1, cr1
     d08:	58000002 	stmdapl	r0, {r1}
     d0c:	01000002 	tsteq	r0, r2
     d10:	00005500 	andeq	r5, r0, r0, lsl #10
     d14:	00000000 	andeq	r0, r0, r0
     d18:	02580000 	subseq	r0, r8, #0
     d1c:	02b00000 	adcseq	r0, r0, #0
     d20:	00010000 	andeq	r0, r1, r0
     d24:	0002b050 	andeq	fp, r2, r0, asr r0
     d28:	0002b400 	andeq	fp, r2, r0, lsl #8
     d2c:	7c000a00 	stcvc	10, cr0, [r0], {-0}
     d30:	03243200 	teqeq	r4, #0, 4
     d34:	0000efa8 	andeq	lr, r0, r8, lsr #31
     d38:	0002b422 	andeq	fp, r2, r2, lsr #8
     d3c:	0002b800 	andeq	fp, r2, r0, lsl #16
     d40:	50000100 	andpl	r0, r0, r0, lsl #2
     d44:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
     d48:	000002bc 			; <UNDEFINED> instruction: 0x000002bc
     d4c:	01f30004 	mvnseq	r0, r4
     d50:	00009f50 	andeq	r9, r0, r0, asr pc
     d54:	00000000 	andeq	r0, r0, r0
     d58:	02580000 	subseq	r0, r8, #0
     d5c:	02840000 	addeq	r0, r4, #0
     d60:	00010000 	andeq	r0, r1, r0
     d64:	00028451 	andeq	r8, r2, r1, asr r4
     d68:	00028c00 	andeq	r8, r2, r0, lsl #24
     d6c:	70000200 	andvc	r0, r0, r0, lsl #4
     d70:	00028c04 	andeq	r8, r2, r4, lsl #24
     d74:	0002b400 	andeq	fp, r2, r0, lsl #8
     d78:	f3000400 	vshl.u8	d0, d0, d0
     d7c:	b49f5101 	ldrlt	r5, [pc], #257	; d84 <__start-0x727c>
     d80:	bc000002 	stclt	0, cr0, [r0], {2}
     d84:	01000002 	tsteq	r0, r2
     d88:	00005100 	andeq	r5, r0, r0, lsl #2
     d8c:	00000000 	andeq	r0, r0, r0
     d90:	02bc0000 	adcseq	r0, ip, #0
     d94:	03100000 	tsteq	r0, #0
     d98:	00010000 	andeq	r0, r1, r0
     d9c:	00031050 	andeq	r1, r3, r0, asr r0
     da0:	00040800 	andeq	r0, r4, r0, lsl #16
     da4:	58000100 	stmdapl	r0, {r8}
	...
     db0:	000002f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     db4:	00000310 	andeq	r0, r0, r0, lsl r3
     db8:	9f300002 	svcls	0x00300002
     dbc:	00000310 	andeq	r0, r0, r0, lsl r3
     dc0:	00000330 	andeq	r0, r0, r0, lsr r3
     dc4:	ac530001 	mrrcge	0, 0, r0, r3, cr1
     dc8:	b4000003 	strlt	r0, [r0], #-3
     dcc:	02000003 	andeq	r0, r0, #3
     dd0:	cc9f3000 	ldcgt	0, cr3, [pc], {0}
     dd4:	e7000003 	str	r0, [r0, -r3]
     dd8:	01000003 	tsteq	r0, r3
     ddc:	00005300 	andeq	r5, r0, r0, lsl #6
     de0:	00000000 	andeq	r0, r0, r0
     de4:	03140000 	tsteq	r4, #0
     de8:	03cc0000 	biceq	r0, ip, #0
     dec:	00010000 	andeq	r0, r1, r0
     df0:	00000054 	andeq	r0, r0, r4, asr r0
     df4:	00000000 	andeq	r0, r0, r0
     df8:	00040800 	andeq	r0, r4, r0, lsl #16
     dfc:	00041300 	andeq	r1, r4, r0, lsl #6
     e00:	50000100 	andpl	r0, r0, r0, lsl #2
     e04:	00000413 	andeq	r0, r0, r3, lsl r4
     e08:	00000474 	andeq	r0, r0, r4, ror r4
     e0c:	74540001 	ldrbvc	r0, [r4], #-1
     e10:	1c000004 	stcne	0, cr0, [r0], {4}
     e14:	04000005 	streq	r0, [r0], #-5
     e18:	5001f300 	andpl	pc, r1, r0, lsl #6
     e1c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     e20:	00000000 	andeq	r0, r0, r0
     e24:	00044400 	andeq	r4, r4, r0, lsl #8
     e28:	0004f800 	andeq	pc, r4, r0, lsl #16
     e2c:	50000100 	andpl	r0, r0, r0, lsl #2
	...
     e38:	00000444 	andeq	r0, r0, r4, asr #8
     e3c:	00000480 	andeq	r0, r0, r0, lsl #9
     e40:	9f300002 	svcls	0x00300002
     e44:	00000480 	andeq	r0, r0, r0, lsl #9
     e48:	000004e8 	andeq	r0, r0, r8, ror #9
     e4c:	005e0001 	subseq	r0, lr, r1
     e50:	00000000 	andeq	r0, r0, r0
     e54:	84000000 	strhi	r0, [r0], #-0
     e58:	e8000004 	stmda	r0, {r2}
     e5c:	01000004 	tsteq	r0, r4
     e60:	00005100 	andeq	r5, r0, r0, lsl #2
     e64:	00000000 	andeq	r0, r0, r0
     e68:	04a40000 	strteq	r0, [r4], #0
     e6c:	04d80000 	ldrbeq	r0, [r8], #0
     e70:	00010000 	andeq	r0, r1, r0
     e74:	00000053 	andeq	r0, r0, r3, asr r0
     e78:	00000000 	andeq	r0, r0, r0
     e7c:	0004c400 	andeq	ip, r4, r0, lsl #8
     e80:	0004cc00 	andeq	ip, r4, r0, lsl #24
     e84:	52000100 	andpl	r0, r0, #0, 2
	...
     e90:	000007f4 	strdeq	r0, [r0], -r4
     e94:	00000818 	andeq	r0, r0, r8, lsl r8
     e98:	9f300002 	svcls	0x00300002
     e9c:	00000818 	andeq	r0, r0, r8, lsl r8
     ea0:	000008f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     ea4:	00540001 	subseq	r0, r4, r1
     ea8:	00000000 	andeq	r0, r0, r0
     eac:	f4000000 	vst4.8	{d0-d3}, [r0], r0
     eb0:	18000007 	stmdane	r0, {r0, r1, r2}
     eb4:	02000008 	andeq	r0, r0, #8
     eb8:	189f3000 	ldmne	pc, {ip, sp}	; <UNPREDICTABLE>
     ebc:	90000008 	andls	r0, r0, r8
     ec0:	01000008 	tsteq	r0, r8
     ec4:	00005500 	andeq	r5, r0, r0, lsl #10
     ec8:	00000000 	andeq	r0, r0, r0
     ecc:	07f40000 	ldrbeq	r0, [r4, r0]!
     ed0:	08180000 	ldmdaeq	r8, {}	; <UNPREDICTABLE>
     ed4:	000a0000 	andeq	r0, sl, r0
     ed8:	0000089e 	muleq	r0, lr, r8
     edc:	00000000 	andeq	r0, r0, r0
     ee0:	08180000 	ldmdaeq	r8, {}	; <UNPREDICTABLE>
     ee4:	08740000 	ldmdaeq	r4!, {}^	; <UNPREDICTABLE>
     ee8:	00060000 	andeq	r0, r6, r0
     eec:	57049356 	smlsdpl	r4, r6, r3, r9
     ef0:	08780493 	ldmdaeq	r8!, {r0, r1, r4, r7, sl}^
     ef4:	08f00000 	ldmeq	r0!, {}^	; <UNPREDICTABLE>
     ef8:	00060000 	andeq	r0, r6, r0
     efc:	57049356 	smlsdpl	r4, r6, r3, r9
     f00:	00000493 	muleq	r0, r3, r4
     f04:	00000000 	andeq	r0, r0, r0
     f08:	097c0000 	ldmdbeq	ip!, {}^	; <UNPREDICTABLE>
     f0c:	09a40000 	stmibeq	r4!, {}	; <UNPREDICTABLE>
     f10:	00010000 	andeq	r0, r1, r0
     f14:	0009a450 	andeq	sl, r9, r0, asr r4
     f18:	0009b000 	andeq	fp, r9, r0
     f1c:	73000200 	movwvc	r0, #512	; 0x200
     f20:	0009b01c 	andeq	fp, r9, ip, lsl r0
     f24:	0009d400 	andeq	sp, r9, r0, lsl #8
     f28:	f3000400 	vshl.u8	d0, d0, d0
     f2c:	009f5001 	addseq	r5, pc, r1
     f30:	00000000 	andeq	r0, r0, r0
     f34:	d4000000 	strle	r0, [r0], #-0
     f38:	08000009 	stmdaeq	r0, {r0, r3}
     f3c:	0100000a 	tsteq	r0, sl
     f40:	0a085000 	beq	214f48 <__end+0xe3f48>
     f44:	0a2c0000 	beq	b00f4c <__user_program+0x800f4c>
     f48:	00040000 	andeq	r0, r4, r0
     f4c:	9f5001f3 	svcls	0x005001f3
	...
     f58:	00000a2c 	andeq	r0, r0, ip, lsr #20
     f5c:	00000a30 	andeq	r0, r0, r0, lsr sl
     f60:	30500001 	subscc	r0, r0, r1
     f64:	3400000a 	strcc	r0, [r0], #-10
     f68:	0400000a 	streq	r0, [r0], #-10
     f6c:	5001f300 	andpl	pc, r1, r0, lsl #6
     f70:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     f74:	00000000 	andeq	r0, r0, r0
     f78:	000a3400 	andeq	r3, sl, r0, lsl #8
     f7c:	000a3800 	andeq	r3, sl, r0, lsl #16
     f80:	50000100 	andpl	r0, r0, r0, lsl #2
     f84:	00000a38 	andeq	r0, r0, r8, lsr sl
     f88:	00000a3c 	andeq	r0, r0, ip, lsr sl
     f8c:	01f30004 	mvnseq	r0, r4
     f90:	00009f50 	andeq	r9, r0, r0, asr pc
     f94:	00000000 	andeq	r0, r0, r0
     f98:	0a3c0000 	beq	f00fa0 <__user_program+0xc00fa0>
     f9c:	0a400000 	beq	1000fa4 <__user_program+0xd00fa4>
     fa0:	00010000 	andeq	r0, r1, r0
     fa4:	000a4050 	andeq	r4, sl, r0, asr r0
     fa8:	000a4400 	andeq	r4, sl, r0, lsl #8
     fac:	f3000400 	vshl.u8	d0, d0, d0
     fb0:	009f5001 	addseq	r5, pc, r1
     fb4:	00000000 	andeq	r0, r0, r0
     fb8:	44000000 	strmi	r0, [r0], #-0
     fbc:	4800000a 	stmdami	r0, {r1, r3}
     fc0:	0100000a 	tsteq	r0, sl
     fc4:	0a485000 	beq	1214fcc <__user_program+0xf14fcc>
     fc8:	0a4c0000 	beq	1300fd0 <__user_program+0x1000fd0>
     fcc:	00040000 	andeq	r0, r4, r0
     fd0:	9f5001f3 	svcls	0x005001f3
	...
     fe0:	00000004 	andeq	r0, r0, r4
     fe4:	04500001 	ldrbeq	r0, [r0], #-1
     fe8:	20000000 	andcs	r0, r0, r0
     fec:	01000000 	mrseq	r0, (UNDEF: 0)
     ff0:	00005300 	andeq	r5, r0, r0, lsl #6
     ff4:	00000000 	andeq	r0, r0, r0
     ff8:	00200000 	eoreq	r0, r0, r0
     ffc:	00300000 	eorseq	r0, r0, r0
    1000:	00010000 	andeq	r0, r1, r0
    1004:	00003050 	andeq	r3, r0, r0, asr r0
    1008:	00004c00 	andeq	r4, r0, r0, lsl #24
    100c:	50000100 	andpl	r0, r0, r0, lsl #2
    1010:	0000004c 	andeq	r0, r0, ip, asr #32
    1014:	0000005c 	andeq	r0, r0, ip, asr r0
    1018:	f34f0006 	vhadd.u8	d16, d15, d6
    101c:	9f1c5001 	svcls	0x001c5001
    1020:	0000005c 	andeq	r0, r0, ip, asr r0
    1024:	00000060 	andeq	r0, r0, r0, rrx
    1028:	60500001 	subsvs	r0, r0, r1
    102c:	64000000 	strvs	r0, [r0], #-0
    1030:	04000000 	streq	r0, [r0], #-0
    1034:	5001f300 	andpl	pc, r1, r0, lsl #6
    1038:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    103c:	00000000 	andeq	r0, r0, r0
    1040:	00002000 	andeq	r2, r0, r0
    1044:	00002c00 	andeq	r2, r0, r0, lsl #24
    1048:	51000100 	mrspl	r0, (UNDEF: 16)
    104c:	0000002c 	andeq	r0, r0, ip, lsr #32
    1050:	00000034 	andeq	r0, r0, r4, lsr r0
    1054:	7f080006 	svcvc	0x00080006
    1058:	9f1c0071 	svcls	0x001c0071
    105c:	00000034 	andeq	r0, r0, r4, lsr r0
    1060:	0000003c 	andeq	r0, r0, ip, lsr r0
    1064:	3c510001 	mrrccc	0, 0, r0, r1, cr1
    1068:	5c000000 	stcpl	0, cr0, [r0], {-0}
    106c:	07000000 	streq	r0, [r0, -r0]
    1070:	f37f0800 	vsub.i64	d16, d15, d0
    1074:	9f1c5101 	svcls	0x001c5101
    1078:	0000005c 	andeq	r0, r0, ip, asr r0
    107c:	00000064 	andeq	r0, r0, r4, rrx
    1080:	00510001 	subseq	r0, r1, r1
    1084:	00000000 	andeq	r0, r0, r0
    1088:	3c000000 	stccc	0, cr0, [r0], {-0}
    108c:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
    1090:	05000000 	streq	r0, [r0, #-0]
    1094:	37007000 	strcc	r7, [r0, -r0]
    1098:	00489f1a 	subeq	r9, r8, sl, lsl pc
    109c:	00540000 	subseq	r0, r4, r0
    10a0:	00010000 	andeq	r0, r1, r0
    10a4:	00005453 	andeq	r5, r0, r3, asr r4
    10a8:	00005c00 	andeq	r5, r0, r0, lsl #24
    10ac:	4f000800 	svcmi	0x00000800
    10b0:	1c5001f3 	ldfnee	f0, [r0], {243}	; 0xf3
    10b4:	009f1a37 	addseq	r1, pc, r7, lsr sl	; <UNPREDICTABLE>
    10b8:	00000000 	andeq	r0, r0, r0
    10bc:	3c000000 	stccc	0, cr0, [r0], {-0}
    10c0:	5c000000 	stcpl	0, cr0, [r0], {-0}
    10c4:	01000000 	mrseq	r0, (UNDEF: 0)
    10c8:	00005100 	andeq	r5, r0, r0, lsl #2
    10cc:	00000000 	andeq	r0, r0, r0
    10d0:	00640000 	rsbeq	r0, r4, r0
    10d4:	00740000 	rsbseq	r0, r4, r0
    10d8:	00010000 	andeq	r0, r1, r0
    10dc:	00007450 	andeq	r7, r0, r0, asr r4
    10e0:	00009000 	andeq	r9, r0, r0
    10e4:	50000100 	andpl	r0, r0, r0, lsl #2
    10e8:	00000090 	muleq	r0, r0, r0
    10ec:	000000a0 	andeq	r0, r0, r0, lsr #1
    10f0:	f34f0006 	vhadd.u8	d16, d15, d6
    10f4:	9f1c5001 	svcls	0x001c5001
    10f8:	000000a0 	andeq	r0, r0, r0, lsr #1
    10fc:	000000a4 	andeq	r0, r0, r4, lsr #1
    1100:	a4500001 	ldrbge	r0, [r0], #-1
    1104:	a8000000 	stmdage	r0, {}	; <UNPREDICTABLE>
    1108:	04000000 	streq	r0, [r0], #-0
    110c:	5001f300 	andpl	pc, r1, r0, lsl #6
    1110:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    1114:	00000000 	andeq	r0, r0, r0
    1118:	00006400 	andeq	r6, r0, r0, lsl #8
    111c:	00007000 	andeq	r7, r0, r0
    1120:	51000100 	mrspl	r0, (UNDEF: 16)
    1124:	00000070 	andeq	r0, r0, r0, ror r0
    1128:	00000078 	andeq	r0, r0, r8, ror r0
    112c:	7f080006 	svcvc	0x00080006
    1130:	9f1c0071 	svcls	0x001c0071
    1134:	00000078 	andeq	r0, r0, r8, ror r0
    1138:	00000080 	andeq	r0, r0, r0, lsl #1
    113c:	80510001 	subshi	r0, r1, r1
    1140:	a0000000 	andge	r0, r0, r0
    1144:	07000000 	streq	r0, [r0, -r0]
    1148:	f37f0800 	vsub.i64	d16, d15, d0
    114c:	9f1c5101 	svcls	0x001c5101
    1150:	000000a0 	andeq	r0, r0, r0, lsr #1
    1154:	000000a8 	andeq	r0, r0, r8, lsr #1
    1158:	00510001 	subseq	r0, r1, r1
    115c:	00000000 	andeq	r0, r0, r0
    1160:	80000000 	andhi	r0, r0, r0
    1164:	8c000000 	stchi	0, cr0, [r0], {-0}
    1168:	05000000 	streq	r0, [r0, #-0]
    116c:	37007000 	strcc	r7, [r0, -r0]
    1170:	008c9f1a 	addeq	r9, ip, sl, lsl pc
    1174:	00980000 	addseq	r0, r8, r0
    1178:	00010000 	andeq	r0, r1, r0
    117c:	00009853 	andeq	r9, r0, r3, asr r8
    1180:	0000a000 	andeq	sl, r0, r0
    1184:	4f000800 	svcmi	0x00000800
    1188:	1c5001f3 	ldfnee	f0, [r0], {243}	; 0xf3
    118c:	009f1a37 	addseq	r1, pc, r7, lsr sl	; <UNPREDICTABLE>
    1190:	00000000 	andeq	r0, r0, r0
    1194:	80000000 	andhi	r0, r0, r0
    1198:	a0000000 	andge	r0, r0, r0
    119c:	01000000 	mrseq	r0, (UNDEF: 0)
    11a0:	00005100 	andeq	r5, r0, r0, lsl #2
    11a4:	00000000 	andeq	r0, r0, r0
    11a8:	00a80000 	adceq	r0, r8, r0
    11ac:	00b40000 	adcseq	r0, r4, r0
    11b0:	00020000 	andeq	r0, r2, r0
    11b4:	00b49f30 	adcseq	r9, r4, r0, lsr pc
    11b8:	00cc0000 	sbceq	r0, ip, r0
    11bc:	00090000 	andeq	r0, r9, r0
    11c0:	2b030073 	blcs	c1394 <__bss_end+0xb1394>
    11c4:	1c0000f0 	stcne	0, cr0, [r0], {240}	; 0xf0
    11c8:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    11cc:	00000000 	andeq	r0, r0, r0
    11d0:	0000cc00 	andeq	ip, r0, r0, lsl #24
    11d4:	0000d800 	andeq	sp, r0, r0, lsl #16
    11d8:	50000100 	andpl	r0, r0, r0, lsl #2
    11dc:	000000d8 	ldrdeq	r0, [r0], -r8
    11e0:	00000100 	andeq	r0, r0, r0, lsl #2
    11e4:	01f30004 	mvnseq	r0, r4
    11e8:	00009f50 	andeq	r9, r0, r0, asr pc
    11ec:	00000000 	andeq	r0, r0, r0
    11f0:	01000000 	mrseq	r0, (UNDEF: 0)
    11f4:	010c0000 	mrseq	r0, (UNDEF: 12)
    11f8:	00010000 	andeq	r0, r1, r0
    11fc:	00010c50 	andeq	r0, r1, r0, asr ip
    1200:	00013400 	andeq	r3, r1, r0, lsl #8
    1204:	f3000400 	vshl.u8	d0, d0, d0
    1208:	009f5001 	addseq	r5, pc, r1
    120c:	00000000 	andeq	r0, r0, r0
    1210:	d8000000 	stmdale	r0, {}	; <UNPREDICTABLE>
    1214:	e0000002 	and	r0, r0, r2
    1218:	02000002 	andeq	r0, r0, #2
    121c:	e09f3000 	adds	r3, pc, r0
    1220:	e4000002 	str	r0, [r0], #-2
    1224:	09000002 	stmdbeq	r0, {r1}
    1228:	03007400 	movweq	r7, #1024	; 0x400
    122c:	0000f02b 	andeq	pc, r0, fp, lsr #32
    1230:	02e49f1c 	rsceq	r9, r4, #28, 30	; 0x70
    1234:	02e80000 	rsceq	r0, r8, #0
    1238:	00090000 	andeq	r0, r9, r0
    123c:	2c030074 	stccs	0, cr0, [r3], {116}	; 0x74
    1240:	1c0000f0 	stcne	0, cr0, [r0], {240}	; 0xf0
    1244:	0002e89f 	muleq	r2, pc, r8	; <UNPREDICTABLE>
    1248:	00030000 	andeq	r0, r3, r0
    124c:	74000900 	strvc	r0, [r0], #-2304	; 0x900
    1250:	f02b0300 			; <UNDEFINED> instruction: 0xf02b0300
    1254:	9f1c0000 	svcls	0x001c0000
	...
    1260:	0000031c 	andeq	r0, r0, ip, lsl r3
    1264:	00000328 	andeq	r0, r0, r8, lsr #6
    1268:	9f300002 	svcls	0x00300002
    126c:	00000328 	andeq	r0, r0, r8, lsr #6
    1270:	0000033c 	andeq	r0, r0, ip, lsr r3
    1274:	000a0007 	andeq	r0, sl, r7
    1278:	1c007402 	cfstrsne	mvf7, [r0], {2}
    127c:	00033c9f 	muleq	r3, pc, ip	; <UNPREDICTABLE>
    1280:	00034000 	andeq	r4, r3, r0
    1284:	0a000700 	beq	2e8c <__start-0x5174>
    1288:	00740201 	rsbseq	r0, r4, r1, lsl #4
    128c:	03409f1c 	movteq	r9, #3868	; 0xf1c
    1290:	03600000 	cmneq	r0, #0
    1294:	00070000 	andeq	r0, r7, r0
    1298:	7402000a 	strvc	r0, [r2], #-10
    129c:	009f1c00 	addseq	r1, pc, r0, lsl #24
    12a0:	00000000 	andeq	r0, r0, r0
    12a4:	7c000000 	stcvc	0, cr0, [r0], {-0}
    12a8:	84000003 	strhi	r0, [r0], #-3
    12ac:	02000003 	andeq	r0, r0, #3
    12b0:	849f3000 	ldrhi	r3, [pc], #0	; 12b8 <__start-0x6d48>
    12b4:	8c000003 	stchi	0, cr0, [r0], {3}
    12b8:	07000003 	streq	r0, [r0, -r3]
    12bc:	02000a00 	andeq	r0, r0, #0, 20
    12c0:	9f1c0074 	svcls	0x001c0074
    12c4:	0000038c 	andeq	r0, r0, ip, lsl #7
    12c8:	00000390 	muleq	r0, r0, r3
    12cc:	010a0007 	tsteq	sl, r7
    12d0:	1c007402 	cfstrsne	mvf7, [r0], {2}
    12d4:	0003909f 	muleq	r3, pc, r0	; <UNPREDICTABLE>
    12d8:	00039c00 	andeq	r9, r3, r0, lsl #24
    12dc:	0a000700 	beq	2ee4 <__start-0x511c>
    12e0:	00740200 	rsbseq	r0, r4, r0, lsl #4
    12e4:	00009f1c 	andeq	r9, r0, ip, lsl pc
	...
    12f0:	00040000 	andeq	r0, r4, r0
    12f4:	00010000 	andeq	r0, r1, r0
    12f8:	00000450 	andeq	r0, r0, r0, asr r4
    12fc:	00002000 	andeq	r2, r0, r0
    1300:	53000100 	movwpl	r0, #256	; 0x100
	...
    130c:	00000020 	andeq	r0, r0, r0, lsr #32
    1310:	0000002c 	andeq	r0, r0, ip, lsr #32
    1314:	2c500001 	mrrccs	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
    1318:	94000000 	strls	r0, [r0], #-0
    131c:	04000000 	streq	r0, [r0], #-0
    1320:	5001f300 	andpl	pc, r1, r0, lsl #6
    1324:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    1328:	00000000 	andeq	r0, r0, r0
    132c:	00002000 	andeq	r2, r0, r0
    1330:	00003000 	andeq	r3, r0, r0
    1334:	51000100 	mrspl	r0, (UNDEF: 16)
    1338:	00000030 	andeq	r0, r0, r0, lsr r0
    133c:	00000094 	muleq	r0, r4, r0
    1340:	00540001 	subseq	r0, r4, r1
    1344:	00000000 	andeq	r0, r0, r0
    1348:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
    134c:	7c000000 	stcvc	0, cr0, [r0], {-0}
    1350:	06000000 	streq	r0, [r0], -r0
    1354:	09007200 	stmdbeq	r0, {r9, ip, sp, lr}
    1358:	7c9f1af3 	vldmiavc	pc, {s2-s244}
    135c:	8f000000 	svchi	0x00000000
    1360:	01000000 	mrseq	r0, (UNDEF: 0)
    1364:	00005200 	andeq	r5, r0, r0, lsl #4
    1368:	00000000 	andeq	r0, r0, r0
    136c:	00b40000 	adcseq	r0, r4, r0
    1370:	00b80000 	adcseq	r0, r8, r0
    1374:	00060000 	andeq	r0, r6, r0
    1378:	f3090072 	vqadd.u8	q0, <illegal reg q4.5>, q9
    137c:	00b89f1a 	adcseq	r9, r8, sl, lsl pc
    1380:	00c80000 	sbceq	r0, r8, r0
    1384:	00010000 	andeq	r0, r1, r0
    1388:	00000052 	andeq	r0, r0, r2, asr r0
    138c:	00000000 	andeq	r0, r0, r0
    1390:	0000e000 	andeq	lr, r0, r0
    1394:	00011400 	andeq	r1, r1, r0, lsl #8
    1398:	50000100 	andpl	r0, r0, r0, lsl #2
    139c:	00000114 	andeq	r0, r0, r4, lsl r1
    13a0:	00000180 	andeq	r0, r0, r0, lsl #3
    13a4:	01f30004 	mvnseq	r0, r4
    13a8:	00009f50 	andeq	r9, r0, r0, asr pc
    13ac:	00000000 	andeq	r0, r0, r0
    13b0:	00e80000 	rsceq	r0, r8, r0
    13b4:	00f40000 	rscseq	r0, r4, r0
    13b8:	00020000 	andeq	r0, r2, r0
    13bc:	00f49f30 	rscseq	r9, r4, r0, lsr pc
    13c0:	00f80000 	rscseq	r0, r8, r0
    13c4:	00060000 	andeq	r0, r6, r0
    13c8:	30080072 	andcc	r0, r8, r2, ror r0
    13cc:	00f89f21 	rscseq	r9, r8, r1, lsr #30
    13d0:	01140000 	tsteq	r4, r0
    13d4:	00010000 	andeq	r0, r1, r0
    13d8:	00017052 	andeq	r7, r1, r2, asr r0
    13dc:	00018000 	andeq	r8, r1, r0
    13e0:	52000100 	andpl	r0, r0, #0, 2
	...
    13ec:	000000e8 	andeq	r0, r0, r8, ror #1
    13f0:	0000016c 	andeq	r0, r0, ip, ror #2
    13f4:	9f300002 	svcls	0x00300002
    13f8:	0000016c 	andeq	r0, r0, ip, ror #2
    13fc:	0000017c 	andeq	r0, r0, ip, ror r1
    1400:	00500001 	subseq	r0, r0, r1
    1404:	00000000 	andeq	r0, r0, r0
    1408:	Address 0x00001408 is out of bounds.


Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	000000f8 	strdeq	r0, [r0], -r8
   4:	00000100 	andeq	r0, r0, r0, lsl #2
   8:	000001dc 	ldrdeq	r0, [r0], -ip
   c:	000001fc 	strdeq	r0, [r0], -ip
	...
  18:	00000100 	andeq	r0, r0, r0, lsl #2
  1c:	00000104 	andeq	r0, r0, r4, lsl #2
  20:	000001fc 	strdeq	r0, [r0], -ip
  24:	0000021c 	andeq	r0, r0, ip, lsl r2
	...
  30:	000002fc 	strdeq	r0, [r0], -ip
  34:	0000030c 	andeq	r0, r0, ip, lsl #6
  38:	00000310 	andeq	r0, r0, r0, lsl r3
  3c:	000003cc 	andeq	r0, r0, ip, asr #7
	...
  48:	00000460 	andeq	r0, r0, r0, ror #8
  4c:	00000478 	andeq	r0, r0, r8, ror r4
  50:	00000480 	andeq	r0, r0, r0, lsl #9
  54:	000004d8 	ldrdeq	r0, [r0], -r8
	...
  60:	0000046c 	andeq	r0, r0, ip, ror #8
  64:	00000478 	andeq	r0, r0, r8, ror r4
  68:	000004a4 	andeq	r0, r0, r4, lsr #9
  6c:	000004d8 	ldrdeq	r0, [r0], -r8
	...
  78:	00000470 	andeq	r0, r0, r0, ror r4
  7c:	00000478 	andeq	r0, r0, r8, ror r4
  80:	000004b0 			; <UNDEFINED> instruction: 0x000004b0
  84:	000004cc 	andeq	r0, r0, ip, asr #9
	...
