
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
    8044:	0012e000 	andseq	lr, r2, r0
    8048:	0011d000 	andseq	sp, r1, r0
    804c:	0000c000 	andeq	ip, r0, r0
    8050:	0000d000 	andeq	sp, r0, r0

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
    81b4:	eb000644 	bl	9acc <delay_cycles>
    81b8:	e354001f 	cmp	r4, #31
    81bc:	9a00000a 	bls	81ec <gpio_set_pull+0x5c>
    81c0:	e2440020 	sub	r0, r4, #32
    81c4:	e3a04001 	mov	r4, #1
    81c8:	e1a00014 	lsl	r0, r4, r0
    81cc:	e3a05000 	mov	r5, #0
    81d0:	e3435f20 	movt	r5, #16160	; 0x3f20
    81d4:	e585009c 	str	r0, [r5, #156]	; 0x9c
    81d8:	e3a00096 	mov	r0, #150	; 0x96
    81dc:	eb00063a 	bl	9acc <delay_cycles>
    81e0:	e3a03000 	mov	r3, #0
    81e4:	e585309c 	str	r3, [r5, #156]	; 0x9c
    81e8:	e8bd8038 	pop	{r3, r4, r5, pc}
    81ec:	e3a00001 	mov	r0, #1
    81f0:	e1a00410 	lsl	r0, r0, r4
    81f4:	e3a05000 	mov	r5, #0
    81f8:	e3435f20 	movt	r5, #16160	; 0x3f20
    81fc:	e5850098 	str	r0, [r5, #152]	; 0x98
    8200:	e3a00096 	mov	r0, #150	; 0x96
    8204:	eb000630 	bl	9acc <delay_cycles>
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
    8268:	e30b3000 	movw	r3, #45056	; 0xb000
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
    82a0:	e30b3000 	movw	r3, #45056	; 0xb000
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
    84a4:	eb0002e3 	bl	9038 <timer_stop>
    84a8:	eb00058e 	bl	9ae8 <disable_interrupts>
    84ac:	eb0002f2 	bl	907c <timer_clear_pending>
    84b0:	eb0005a5 	bl	9b4c <install_interrupt_table>
    84b4:	eb0002f6 	bl	9094 <uart_init>
    84b8:	eb0005fa 	bl	9ca8 <enter_user_mode>
    84bc:	eafffffe 	b	84bc <kernel_main+0x1c>

000084c0 <get_top_priority>:
    84c0:	e92d4010 	push	{r4, lr}
    84c4:	e3a01020 	mov	r1, #32
    84c8:	e1a00001 	mov	r0, r1
    84cc:	e3a03000 	mov	r3, #0
    84d0:	e30cc018 	movw	ip, #49176	; 0xc018
    84d4:	e340c000 	movt	ip, #0
    84d8:	e30ce010 	movw	lr, #49168	; 0xc010
    84dc:	e340e000 	movt	lr, #0
    84e0:	e3a04001 	mov	r4, #1
    84e4:	e0632183 	rsb	r2, r3, r3, lsl #3
    84e8:	e08c2202 	add	r2, ip, r2, lsl #4
    84ec:	e5d22002 	ldrb	r2, [r2, #2]
    84f0:	e6ef2072 	uxtb	r2, r2
    84f4:	e1520001 	cmp	r2, r1
    84f8:	8a000006 	bhi	8518 <get_top_priority+0x58>
    84fc:	e59e2000 	ldr	r2, [lr]
    8500:	e0122314 	ands	r2, r2, r4, lsl r3
    8504:	10632183 	rsbne	r2, r3, r3, lsl #3
    8508:	108c2202 	addne	r2, ip, r2, lsl #4
    850c:	15d21002 	ldrbne	r1, [r2, #2]
    8510:	16ef1071 	uxtbne	r1, r1
    8514:	11a00003 	movne	r0, r3
    8518:	e2833001 	add	r3, r3, #1
    851c:	e3530020 	cmp	r3, #32
    8520:	1affffef 	bne	84e4 <get_top_priority+0x24>
    8524:	e8bd8010 	pop	{r4, pc}

00008528 <store_current_task>:
    8528:	e30c3008 	movw	r3, #49160	; 0xc008
    852c:	e3403000 	movt	r3, #0
    8530:	e5933000 	ldr	r3, [r3]
    8534:	e3730001 	cmn	r3, #1
    8538:	012fff1e 	bxeq	lr
    853c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8540:	e30c3008 	movw	r3, #49160	; 0xc008
    8544:	e3403000 	movt	r3, #0
    8548:	e5933000 	ldr	r3, [r3]
    854c:	e30c2018 	movw	r2, #49176	; 0xc018
    8550:	e3402000 	movt	r2, #0
    8554:	e0633183 	rsb	r3, r3, r3, lsl #3
    8558:	e1a03203 	lsl	r3, r3, #4
    855c:	e7d23003 	ldrb	r3, [r2, r3]
    8560:	e31300ff 	tst	r3, #255	; 0xff
    8564:	1a000009 	bne	8590 <store_current_task+0x68>
    8568:	e30c3008 	movw	r3, #49160	; 0xc008
    856c:	e3403000 	movt	r3, #0
    8570:	e5933000 	ldr	r3, [r3]
    8574:	e30c2018 	movw	r2, #49176	; 0xc018
    8578:	e3402000 	movt	r2, #0
    857c:	e0633183 	rsb	r3, r3, r3, lsl #3
    8580:	e1a03203 	lsl	r3, r3, #4
    8584:	e3a01001 	mov	r1, #1
    8588:	e7c21003 	strb	r1, [r2, r3]
    858c:	ea000029 	b	8638 <store_current_task+0x110>
    8590:	e30c3008 	movw	r3, #49160	; 0xc008
    8594:	e3403000 	movt	r3, #0
    8598:	e5933000 	ldr	r3, [r3]
    859c:	e30c2018 	movw	r2, #49176	; 0xc018
    85a0:	e3402000 	movt	r2, #0
    85a4:	e0633183 	rsb	r3, r3, r3, lsl #3
    85a8:	e1a03203 	lsl	r3, r3, #4
    85ac:	e7d23003 	ldrb	r3, [r2, r3]
    85b0:	e6ef3073 	uxtb	r3, r3
    85b4:	e3530002 	cmp	r3, #2
    85b8:	1a00001e 	bne	8638 <store_current_task+0x110>
    85bc:	e30c2008 	movw	r2, #49160	; 0xc008
    85c0:	e3402000 	movt	r2, #0
    85c4:	e592e000 	ldr	lr, [r2]
    85c8:	e30c3010 	movw	r3, #49168	; 0xc010
    85cc:	e3403000 	movt	r3, #0
    85d0:	e593c000 	ldr	ip, [r3]
    85d4:	e3a01001 	mov	r1, #1
    85d8:	e1ccce11 	bic	ip, ip, r1, lsl lr
    85dc:	e583c000 	str	ip, [r3]
    85e0:	e592e000 	ldr	lr, [r2]
    85e4:	e30c3fa0 	movw	r3, #53152	; 0xcfa0
    85e8:	e3403000 	movt	r3, #0
    85ec:	e593c000 	ldr	ip, [r3]
    85f0:	e18c1e11 	orr	r1, ip, r1, lsl lr
    85f4:	e5831000 	str	r1, [r3]
    85f8:	e5921000 	ldr	r1, [r2]
    85fc:	e30c3018 	movw	r3, #49176	; 0xc018
    8600:	e3403000 	movt	r3, #0
    8604:	e0611181 	rsb	r1, r1, r1, lsl #3
    8608:	e0831201 	add	r1, r3, r1, lsl #4
    860c:	e591e008 	ldr	lr, [r1, #8]
    8610:	e592c000 	ldr	ip, [r2]
    8614:	e1a0118c 	lsl	r1, ip, #3
    8618:	e06c2001 	rsb	r2, ip, r1
    861c:	e0832202 	add	r2, r3, r2, lsl #4
    8620:	e2822008 	add	r2, r2, #8
    8624:	e5922004 	ldr	r2, [r2, #4]
    8628:	e082200e 	add	r2, r2, lr
    862c:	e06c1001 	rsb	r1, ip, r1
    8630:	e0833201 	add	r3, r3, r1, lsl #4
    8634:	e583200c 	str	r2, [r3, #12]
    8638:	e30c2008 	movw	r2, #49160	; 0xc008
    863c:	e3402000 	movt	r2, #0
    8640:	e5921000 	ldr	r1, [r2]
    8644:	e590c04c 	ldr	ip, [r0, #76]	; 0x4c
    8648:	e30c3018 	movw	r3, #49176	; 0xc018
    864c:	e3403000 	movt	r3, #0
    8650:	e0611181 	rsb	r1, r1, r1, lsl #3
    8654:	e0831201 	add	r1, r3, r1, lsl #4
    8658:	e581c020 	str	ip, [r1, #32]
    865c:	e5921000 	ldr	r1, [r2]
    8660:	e590c048 	ldr	ip, [r0, #72]	; 0x48
    8664:	e0611181 	rsb	r1, r1, r1, lsl #3
    8668:	e0831201 	add	r1, r3, r1, lsl #4
    866c:	e581c024 	str	ip, [r1, #36]	; 0x24
    8670:	e5921000 	ldr	r1, [r2]
    8674:	e590c044 	ldr	ip, [r0, #68]	; 0x44
    8678:	e0611181 	rsb	r1, r1, r1, lsl #3
    867c:	e0831201 	add	r1, r3, r1, lsl #4
    8680:	e581c028 	str	ip, [r1, #40]	; 0x28
    8684:	e5921000 	ldr	r1, [r2]
    8688:	e590c040 	ldr	ip, [r0, #64]	; 0x40
    868c:	e0611181 	rsb	r1, r1, r1, lsl #3
    8690:	e0831201 	add	r1, r3, r1, lsl #4
    8694:	e581c02c 	str	ip, [r1, #44]	; 0x2c
    8698:	e5921000 	ldr	r1, [r2]
    869c:	e590c03c 	ldr	ip, [r0, #60]	; 0x3c
    86a0:	e0611181 	rsb	r1, r1, r1, lsl #3
    86a4:	e0831201 	add	r1, r3, r1, lsl #4
    86a8:	e581c030 	str	ip, [r1, #48]	; 0x30
    86ac:	e5921000 	ldr	r1, [r2]
    86b0:	e590c038 	ldr	ip, [r0, #56]	; 0x38
    86b4:	e0611181 	rsb	r1, r1, r1, lsl #3
    86b8:	e0831201 	add	r1, r3, r1, lsl #4
    86bc:	e581c034 	str	ip, [r1, #52]	; 0x34
    86c0:	e5921000 	ldr	r1, [r2]
    86c4:	e590c034 	ldr	ip, [r0, #52]	; 0x34
    86c8:	e0611181 	rsb	r1, r1, r1, lsl #3
    86cc:	e0831201 	add	r1, r3, r1, lsl #4
    86d0:	e581c038 	str	ip, [r1, #56]	; 0x38
    86d4:	e5921000 	ldr	r1, [r2]
    86d8:	e590c030 	ldr	ip, [r0, #48]	; 0x30
    86dc:	e0611181 	rsb	r1, r1, r1, lsl #3
    86e0:	e0831201 	add	r1, r3, r1, lsl #4
    86e4:	e581c03c 	str	ip, [r1, #60]	; 0x3c
    86e8:	e5921000 	ldr	r1, [r2]
    86ec:	e590c02c 	ldr	ip, [r0, #44]	; 0x2c
    86f0:	e0611181 	rsb	r1, r1, r1, lsl #3
    86f4:	e0831201 	add	r1, r3, r1, lsl #4
    86f8:	e581c040 	str	ip, [r1, #64]	; 0x40
    86fc:	e5921000 	ldr	r1, [r2]
    8700:	e590c028 	ldr	ip, [r0, #40]	; 0x28
    8704:	e0611181 	rsb	r1, r1, r1, lsl #3
    8708:	e0831201 	add	r1, r3, r1, lsl #4
    870c:	e581c044 	str	ip, [r1, #68]	; 0x44
    8710:	e5921000 	ldr	r1, [r2]
    8714:	e590c024 	ldr	ip, [r0, #36]	; 0x24
    8718:	e0611181 	rsb	r1, r1, r1, lsl #3
    871c:	e0831201 	add	r1, r3, r1, lsl #4
    8720:	e581c048 	str	ip, [r1, #72]	; 0x48
    8724:	e5921000 	ldr	r1, [r2]
    8728:	e590c020 	ldr	ip, [r0, #32]
    872c:	e0611181 	rsb	r1, r1, r1, lsl #3
    8730:	e0831201 	add	r1, r3, r1, lsl #4
    8734:	e581c04c 	str	ip, [r1, #76]	; 0x4c
    8738:	e5921000 	ldr	r1, [r2]
    873c:	e590c01c 	ldr	ip, [r0, #28]
    8740:	e0611181 	rsb	r1, r1, r1, lsl #3
    8744:	e0831201 	add	r1, r3, r1, lsl #4
    8748:	e581c050 	str	ip, [r1, #80]	; 0x50
    874c:	e5921000 	ldr	r1, [r2]
    8750:	e590c018 	ldr	ip, [r0, #24]
    8754:	e0611181 	rsb	r1, r1, r1, lsl #3
    8758:	e0831201 	add	r1, r3, r1, lsl #4
    875c:	e581c054 	str	ip, [r1, #84]	; 0x54
    8760:	e5921000 	ldr	r1, [r2]
    8764:	e590c014 	ldr	ip, [r0, #20]
    8768:	e0611181 	rsb	r1, r1, r1, lsl #3
    876c:	e0831201 	add	r1, r3, r1, lsl #4
    8770:	e581c058 	str	ip, [r1, #88]	; 0x58
    8774:	e5921000 	ldr	r1, [r2]
    8778:	e590c010 	ldr	ip, [r0, #16]
    877c:	e0611181 	rsb	r1, r1, r1, lsl #3
    8780:	e0831201 	add	r1, r3, r1, lsl #4
    8784:	e581c05c 	str	ip, [r1, #92]	; 0x5c
    8788:	e5921000 	ldr	r1, [r2]
    878c:	e590c00c 	ldr	ip, [r0, #12]
    8790:	e0611181 	rsb	r1, r1, r1, lsl #3
    8794:	e0831201 	add	r1, r3, r1, lsl #4
    8798:	e581c060 	str	ip, [r1, #96]	; 0x60
    879c:	e5921000 	ldr	r1, [r2]
    87a0:	e590c004 	ldr	ip, [r0, #4]
    87a4:	e0611181 	rsb	r1, r1, r1, lsl #3
    87a8:	e0831201 	add	r1, r3, r1, lsl #4
    87ac:	e581c068 	str	ip, [r1, #104]	; 0x68
    87b0:	e5922000 	ldr	r2, [r2]
    87b4:	e5901000 	ldr	r1, [r0]
    87b8:	e0622182 	rsb	r2, r2, r2, lsl #3
    87bc:	e0833202 	add	r3, r3, r2, lsl #4
    87c0:	e583106c 	str	r1, [r3, #108]	; 0x6c
    87c4:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

000087c8 <restore_next_task>:
    87c8:	e30c3008 	movw	r3, #49160	; 0xc008
    87cc:	e3403000 	movt	r3, #0
    87d0:	e5933000 	ldr	r3, [r3]
    87d4:	e30c2018 	movw	r2, #49176	; 0xc018
    87d8:	e3402000 	movt	r2, #0
    87dc:	e0633183 	rsb	r3, r3, r3, lsl #3
    87e0:	e1a03203 	lsl	r3, r3, #4
    87e4:	e7d23003 	ldrb	r3, [r2, r3]
    87e8:	e6ef3073 	uxtb	r3, r3
    87ec:	e3530001 	cmp	r3, #1
    87f0:	1a000008 	bne	8818 <restore_next_task+0x50>
    87f4:	e30c3008 	movw	r3, #49160	; 0xc008
    87f8:	e3403000 	movt	r3, #0
    87fc:	e5933000 	ldr	r3, [r3]
    8800:	e30c2018 	movw	r2, #49176	; 0xc018
    8804:	e3402000 	movt	r2, #0
    8808:	e0633183 	rsb	r3, r3, r3, lsl #3
    880c:	e1a03203 	lsl	r3, r3, #4
    8810:	e3a01000 	mov	r1, #0
    8814:	e7c21003 	strb	r1, [r2, r3]
    8818:	e30c2008 	movw	r2, #49160	; 0xc008
    881c:	e3402000 	movt	r2, #0
    8820:	e5921000 	ldr	r1, [r2]
    8824:	e30c3018 	movw	r3, #49176	; 0xc018
    8828:	e3403000 	movt	r3, #0
    882c:	e0611181 	rsb	r1, r1, r1, lsl #3
    8830:	e0831201 	add	r1, r3, r1, lsl #4
    8834:	e2811020 	add	r1, r1, #32
    8838:	e5911004 	ldr	r1, [r1, #4]
    883c:	e5801048 	str	r1, [r0, #72]	; 0x48
    8840:	e5921000 	ldr	r1, [r2]
    8844:	e0611181 	rsb	r1, r1, r1, lsl #3
    8848:	e0831201 	add	r1, r3, r1, lsl #4
    884c:	e5911028 	ldr	r1, [r1, #40]	; 0x28
    8850:	e5801044 	str	r1, [r0, #68]	; 0x44
    8854:	e5921000 	ldr	r1, [r2]
    8858:	e0611181 	rsb	r1, r1, r1, lsl #3
    885c:	e0831201 	add	r1, r3, r1, lsl #4
    8860:	e2811028 	add	r1, r1, #40	; 0x28
    8864:	e5911004 	ldr	r1, [r1, #4]
    8868:	e5801040 	str	r1, [r0, #64]	; 0x40
    886c:	e5921000 	ldr	r1, [r2]
    8870:	e0611181 	rsb	r1, r1, r1, lsl #3
    8874:	e0831201 	add	r1, r3, r1, lsl #4
    8878:	e5911030 	ldr	r1, [r1, #48]	; 0x30
    887c:	e580103c 	str	r1, [r0, #60]	; 0x3c
    8880:	e5921000 	ldr	r1, [r2]
    8884:	e0611181 	rsb	r1, r1, r1, lsl #3
    8888:	e0831201 	add	r1, r3, r1, lsl #4
    888c:	e2811030 	add	r1, r1, #48	; 0x30
    8890:	e5911004 	ldr	r1, [r1, #4]
    8894:	e5801038 	str	r1, [r0, #56]	; 0x38
    8898:	e5921000 	ldr	r1, [r2]
    889c:	e0611181 	rsb	r1, r1, r1, lsl #3
    88a0:	e0831201 	add	r1, r3, r1, lsl #4
    88a4:	e5911038 	ldr	r1, [r1, #56]	; 0x38
    88a8:	e5801034 	str	r1, [r0, #52]	; 0x34
    88ac:	e5921000 	ldr	r1, [r2]
    88b0:	e0611181 	rsb	r1, r1, r1, lsl #3
    88b4:	e0831201 	add	r1, r3, r1, lsl #4
    88b8:	e2811038 	add	r1, r1, #56	; 0x38
    88bc:	e5911004 	ldr	r1, [r1, #4]
    88c0:	e5801030 	str	r1, [r0, #48]	; 0x30
    88c4:	e5921000 	ldr	r1, [r2]
    88c8:	e0611181 	rsb	r1, r1, r1, lsl #3
    88cc:	e0831201 	add	r1, r3, r1, lsl #4
    88d0:	e5911040 	ldr	r1, [r1, #64]	; 0x40
    88d4:	e580102c 	str	r1, [r0, #44]	; 0x2c
    88d8:	e5921000 	ldr	r1, [r2]
    88dc:	e0611181 	rsb	r1, r1, r1, lsl #3
    88e0:	e0831201 	add	r1, r3, r1, lsl #4
    88e4:	e2811040 	add	r1, r1, #64	; 0x40
    88e8:	e5911004 	ldr	r1, [r1, #4]
    88ec:	e5801028 	str	r1, [r0, #40]	; 0x28
    88f0:	e5921000 	ldr	r1, [r2]
    88f4:	e0611181 	rsb	r1, r1, r1, lsl #3
    88f8:	e0831201 	add	r1, r3, r1, lsl #4
    88fc:	e5911048 	ldr	r1, [r1, #72]	; 0x48
    8900:	e5801024 	str	r1, [r0, #36]	; 0x24
    8904:	e5921000 	ldr	r1, [r2]
    8908:	e0611181 	rsb	r1, r1, r1, lsl #3
    890c:	e0831201 	add	r1, r3, r1, lsl #4
    8910:	e2811048 	add	r1, r1, #72	; 0x48
    8914:	e5911004 	ldr	r1, [r1, #4]
    8918:	e5801020 	str	r1, [r0, #32]
    891c:	e5921000 	ldr	r1, [r2]
    8920:	e0611181 	rsb	r1, r1, r1, lsl #3
    8924:	e0831201 	add	r1, r3, r1, lsl #4
    8928:	e5911050 	ldr	r1, [r1, #80]	; 0x50
    892c:	e580101c 	str	r1, [r0, #28]
    8930:	e5921000 	ldr	r1, [r2]
    8934:	e0611181 	rsb	r1, r1, r1, lsl #3
    8938:	e0831201 	add	r1, r3, r1, lsl #4
    893c:	e2811050 	add	r1, r1, #80	; 0x50
    8940:	e5911004 	ldr	r1, [r1, #4]
    8944:	e5801018 	str	r1, [r0, #24]
    8948:	e5921000 	ldr	r1, [r2]
    894c:	e0611181 	rsb	r1, r1, r1, lsl #3
    8950:	e0831201 	add	r1, r3, r1, lsl #4
    8954:	e5911058 	ldr	r1, [r1, #88]	; 0x58
    8958:	e5801014 	str	r1, [r0, #20]
    895c:	e5921000 	ldr	r1, [r2]
    8960:	e0611181 	rsb	r1, r1, r1, lsl #3
    8964:	e0831201 	add	r1, r3, r1, lsl #4
    8968:	e2811058 	add	r1, r1, #88	; 0x58
    896c:	e5911004 	ldr	r1, [r1, #4]
    8970:	e5801010 	str	r1, [r0, #16]
    8974:	e5921000 	ldr	r1, [r2]
    8978:	e0611181 	rsb	r1, r1, r1, lsl #3
    897c:	e0831201 	add	r1, r3, r1, lsl #4
    8980:	e5911060 	ldr	r1, [r1, #96]	; 0x60
    8984:	e580100c 	str	r1, [r0, #12]
    8988:	e5921000 	ldr	r1, [r2]
    898c:	e0611181 	rsb	r1, r1, r1, lsl #3
    8990:	e0831201 	add	r1, r3, r1, lsl #4
    8994:	e5911068 	ldr	r1, [r1, #104]	; 0x68
    8998:	e5801004 	str	r1, [r0, #4]
    899c:	e5922000 	ldr	r2, [r2]
    89a0:	e0622182 	rsb	r2, r2, r2, lsl #3
    89a4:	e0833202 	add	r3, r3, r2, lsl #4
    89a8:	e2833068 	add	r3, r3, #104	; 0x68
    89ac:	e5933004 	ldr	r3, [r3, #4]
    89b0:	e5803000 	str	r3, [r0]
    89b4:	e12fff1e 	bx	lr

000089b8 <enforce>:
    89b8:	e30c3008 	movw	r3, #49160	; 0xc008
    89bc:	e3403000 	movt	r3, #0
    89c0:	e5933000 	ldr	r3, [r3]
    89c4:	e353001f 	cmp	r3, #31
    89c8:	012fff1e 	bxeq	lr
    89cc:	e30c1008 	movw	r1, #49160	; 0xc008
    89d0:	e3401000 	movt	r1, #0
    89d4:	e591c000 	ldr	ip, [r1]
    89d8:	e30c3018 	movw	r3, #49176	; 0xc018
    89dc:	e3403000 	movt	r3, #0
    89e0:	e1a0218c 	lsl	r2, ip, #3
    89e4:	e06c0002 	rsb	r0, ip, r2
    89e8:	e0830200 	add	r0, r3, r0, lsl #4
    89ec:	e5900018 	ldr	r0, [r0, #24]
    89f0:	e2800001 	add	r0, r0, #1
    89f4:	e06c2002 	rsb	r2, ip, r2
    89f8:	e0832202 	add	r2, r3, r2, lsl #4
    89fc:	e5820018 	str	r0, [r2, #24]
    8a00:	e5912000 	ldr	r2, [r1]
    8a04:	e0622182 	rsb	r2, r2, r2, lsl #3
    8a08:	e0832202 	add	r2, r3, r2, lsl #4
    8a0c:	e5920018 	ldr	r0, [r2, #24]
    8a10:	e5912000 	ldr	r2, [r1]
    8a14:	e0622182 	rsb	r2, r2, r2, lsl #3
    8a18:	e0833202 	add	r3, r3, r2, lsl #4
    8a1c:	e5933004 	ldr	r3, [r3, #4]
    8a20:	e1500003 	cmp	r0, r3
    8a24:	9a000006 	bls	8a44 <enforce+0x8c>
    8a28:	e5913000 	ldr	r3, [r1]
    8a2c:	e30c2018 	movw	r2, #49176	; 0xc018
    8a30:	e3402000 	movt	r2, #0
    8a34:	e0633183 	rsb	r3, r3, r3, lsl #3
    8a38:	e1a03203 	lsl	r3, r3, #4
    8a3c:	e3a01002 	mov	r1, #2
    8a40:	e7c21003 	strb	r1, [r2, r3]
    8a44:	e30c3008 	movw	r3, #49160	; 0xc008
    8a48:	e3403000 	movt	r3, #0
    8a4c:	e5932000 	ldr	r2, [r3]
    8a50:	e30c3018 	movw	r3, #49176	; 0xc018
    8a54:	e3403000 	movt	r3, #0
    8a58:	e0622182 	rsb	r2, r2, r2, lsl #3
    8a5c:	e0833202 	add	r3, r3, r2, lsl #4
    8a60:	e2833018 	add	r3, r3, #24
    8a64:	e5933004 	ldr	r3, [r3, #4]
    8a68:	e3530000 	cmp	r3, #0
    8a6c:	012fff1e 	bxeq	lr
    8a70:	e30c3008 	movw	r3, #49160	; 0xc008
    8a74:	e3403000 	movt	r3, #0
    8a78:	e5930000 	ldr	r0, [r3]
    8a7c:	e30c3018 	movw	r3, #49176	; 0xc018
    8a80:	e3403000 	movt	r3, #0
    8a84:	e1a01180 	lsl	r1, r0, #3
    8a88:	e0602001 	rsb	r2, r0, r1
    8a8c:	e0832202 	add	r2, r3, r2, lsl #4
    8a90:	e2822018 	add	r2, r2, #24
    8a94:	e5922004 	ldr	r2, [r2, #4]
    8a98:	e2422001 	sub	r2, r2, #1
    8a9c:	e0601001 	rsb	r1, r0, r1
    8aa0:	e0833201 	add	r3, r3, r1, lsl #4
    8aa4:	e583201c 	str	r2, [r3, #28]
    8aa8:	e12fff1e 	bx	lr

00008aac <wakeup>:
    8aac:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    8ab0:	e3a03000 	mov	r3, #0
    8ab4:	e3a0c001 	mov	ip, #1
    8ab8:	e30c0fa0 	movw	r0, #53152	; 0xcfa0
    8abc:	e3400000 	movt	r0, #0
    8ac0:	e30ce018 	movw	lr, #49176	; 0xc018
    8ac4:	e340e000 	movt	lr, #0
    8ac8:	e30c5014 	movw	r5, #49172	; 0xc014
    8acc:	e3405000 	movt	r5, #0
    8ad0:	e1a06003 	mov	r6, r3
    8ad4:	e30c4010 	movw	r4, #49168	; 0xc010
    8ad8:	e3404000 	movt	r4, #0
    8adc:	e1a0131c 	lsl	r1, ip, r3
    8ae0:	e5902000 	ldr	r2, [r0]
    8ae4:	e1110002 	tst	r1, r2
    8ae8:	0a00000f 	beq	8b2c <wakeup+0x80>
    8aec:	e0632183 	rsb	r2, r3, r3, lsl #3
    8af0:	e08e2202 	add	r2, lr, r2, lsl #4
    8af4:	e592700c 	ldr	r7, [r2, #12]
    8af8:	e5952000 	ldr	r2, [r5]
    8afc:	e1570002 	cmp	r7, r2
    8b00:	2a000009 	bcs	8b2c <wakeup+0x80>
    8b04:	e0632183 	rsb	r2, r3, r3, lsl #3
    8b08:	e08e7202 	add	r7, lr, r2, lsl #4
    8b0c:	e7cec202 	strb	ip, [lr, r2, lsl #4]
    8b10:	e5876018 	str	r6, [r7, #24]
    8b14:	e5902000 	ldr	r2, [r0]
    8b18:	e1c22001 	bic	r2, r2, r1
    8b1c:	e5802000 	str	r2, [r0]
    8b20:	e5942000 	ldr	r2, [r4]
    8b24:	e1811002 	orr	r1, r1, r2
    8b28:	e5841000 	str	r1, [r4]
    8b2c:	e2833001 	add	r3, r3, #1
    8b30:	e3530020 	cmp	r3, #32
    8b34:	1affffe8 	bne	8adc <wakeup+0x30>
    8b38:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}

00008b3c <irq_c_handler>:
    8b3c:	e92d4010 	push	{r4, lr}
    8b40:	e1a04000 	mov	r4, r0
    8b44:	eb000147 	bl	9068 <timer_is_pending>
    8b48:	e3500000 	cmp	r0, #0
    8b4c:	0a000000 	beq	8b54 <irq_c_handler+0x18>
    8b50:	eb000149 	bl	907c <timer_clear_pending>
    8b54:	e30c3014 	movw	r3, #49172	; 0xc014
    8b58:	e3403000 	movt	r3, #0
    8b5c:	e5932000 	ldr	r2, [r3]
    8b60:	e2822001 	add	r2, r2, #1
    8b64:	e5832000 	str	r2, [r3]
    8b68:	ebffff92 	bl	89b8 <enforce>
    8b6c:	e1a00004 	mov	r0, r4
    8b70:	ebfffe6c 	bl	8528 <store_current_task>
    8b74:	ebffffcc 	bl	8aac <wakeup>
    8b78:	ebfffe50 	bl	84c0 <get_top_priority>
    8b7c:	e30c3008 	movw	r3, #49160	; 0xc008
    8b80:	e3403000 	movt	r3, #0
    8b84:	e5830000 	str	r0, [r3]
    8b88:	e1a00004 	mov	r0, r4
    8b8c:	ebffff0d 	bl	87c8 <restore_next_task>
    8b90:	e8bd8010 	pop	{r4, pc}

00008b94 <swi_c_handler>:
    8b94:	e92d4030 	push	{r4, r5, lr}
    8b98:	e24dd00c 	sub	sp, sp, #12
    8b9c:	e1a04000 	mov	r4, r0
    8ba0:	e1a05001 	mov	r5, r1
    8ba4:	eb0003d4 	bl	9afc <enable_interrupts>
    8ba8:	e3540013 	cmp	r4, #19
    8bac:	979ff104 	ldrls	pc, [pc, r4, lsl #2]
    8bb0:	ea000062 	b	8d40 <swi_c_handler+0x1ac>
    8bb4:	00008c04 	andeq	r8, r0, r4, lsl #24
    8bb8:	00008c14 	andeq	r8, r0, r4, lsl ip
    8bbc:	00008c2c 	andeq	r8, r0, ip, lsr #24
    8bc0:	00008c3c 	andeq	r8, r0, ip, lsr ip
    8bc4:	00008c50 	andeq	r8, r0, r0, asr ip
    8bc8:	00008c60 	andeq	r8, r0, r0, ror #24
    8bcc:	00008c78 	andeq	r8, r0, r8, ror ip
    8bd0:	00008c90 	muleq	r0, r0, ip
    8bd4:	00008d40 	andeq	r8, r0, r0, asr #26
    8bd8:	00008d40 	andeq	r8, r0, r0, asr #26
    8bdc:	00008ca0 	andeq	r8, r0, r0, lsr #25
    8be0:	00008cb4 			; <UNDEFINED> instruction: 0x00008cb4
    8be4:	00008cd8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
    8be8:	00008cec 	andeq	r8, r0, ip, ror #25
    8bec:	00008cfc 	strdeq	r8, [r0], -ip
    8bf0:	00008d0c 	andeq	r8, r0, ip, lsl #26
    8bf4:	00008d18 	andeq	r8, r0, r8, lsl sp
    8bf8:	00008d24 	andeq	r8, r0, r4, lsr #26
    8bfc:	00008d40 	andeq	r8, r0, r0, asr #26
    8c00:	00008d30 	andeq	r8, r0, r0, lsr sp
    8c04:	e5950000 	ldr	r0, [r5]
    8c08:	eb000391 	bl	9a54 <syscall_sbrk>
    8c0c:	e1a04000 	mov	r4, r0
    8c10:	ea00004b 	b	8d44 <swi_c_handler+0x1b0>
    8c14:	e5950000 	ldr	r0, [r5]
    8c18:	e5951004 	ldr	r1, [r5, #4]
    8c1c:	e5952008 	ldr	r2, [r5, #8]
    8c20:	eb000159 	bl	918c <syscall_write>
    8c24:	e1a04000 	mov	r4, r0
    8c28:	ea000045 	b	8d44 <swi_c_handler+0x1b0>
    8c2c:	e5950000 	ldr	r0, [r5]
    8c30:	eb00039d 	bl	9aac <syscall_close>
    8c34:	e1a04000 	mov	r4, r0
    8c38:	ea000041 	b	8d44 <swi_c_handler+0x1b0>
    8c3c:	e5950000 	ldr	r0, [r5]
    8c40:	e5951004 	ldr	r1, [r5, #4]
    8c44:	eb00039a 	bl	9ab4 <syscall_fstat>
    8c48:	e1a04000 	mov	r4, r0
    8c4c:	ea00003c 	b	8d44 <swi_c_handler+0x1b0>
    8c50:	e5950000 	ldr	r0, [r5]
    8c54:	eb000398 	bl	9abc <syscall_isatty>
    8c58:	e1a04000 	mov	r4, r0
    8c5c:	ea000038 	b	8d44 <swi_c_handler+0x1b0>
    8c60:	e5950000 	ldr	r0, [r5]
    8c64:	e5951004 	ldr	r1, [r5, #4]
    8c68:	e5952008 	ldr	r2, [r5, #8]
    8c6c:	eb000394 	bl	9ac4 <syscall_lseek>
    8c70:	e1a04000 	mov	r4, r0
    8c74:	ea000032 	b	8d44 <swi_c_handler+0x1b0>
    8c78:	e5950000 	ldr	r0, [r5]
    8c7c:	e5951004 	ldr	r1, [r5, #4]
    8c80:	e5952008 	ldr	r2, [r5, #8]
    8c84:	eb000152 	bl	91d4 <syscall_read>
    8c88:	e1a04000 	mov	r4, r0
    8c8c:	ea00002c 	b	8d44 <swi_c_handler+0x1b0>
    8c90:	e5950000 	ldr	r0, [r5]
    8c94:	eb000134 	bl	916c <syscall_exit>
    8c98:	e3a04000 	mov	r4, #0
    8c9c:	ea000028 	b	8d44 <swi_c_handler+0x1b0>
    8ca0:	e5950000 	ldr	r0, [r5]
    8ca4:	e5951004 	ldr	r1, [r5, #4]
    8ca8:	eb0001af 	bl	936c <thread_init>
    8cac:	e1a04000 	mov	r4, r0
    8cb0:	ea000023 	b	8d44 <swi_c_handler+0x1b0>
    8cb4:	e5950000 	ldr	r0, [r5]
    8cb8:	e5951004 	ldr	r1, [r5, #4]
    8cbc:	e5952008 	ldr	r2, [r5, #8]
    8cc0:	e595300c 	ldr	r3, [r5, #12]
    8cc4:	e595c040 	ldr	ip, [r5, #64]	; 0x40
    8cc8:	e58dc000 	str	ip, [sp]
    8ccc:	eb000173 	bl	92a0 <thread_create>
    8cd0:	e1a04000 	mov	r4, r0
    8cd4:	ea00001a 	b	8d44 <swi_c_handler+0x1b0>
    8cd8:	e5950000 	ldr	r0, [r5]
    8cdc:	e5951004 	ldr	r1, [r5, #4]
    8ce0:	eb0001bc 	bl	93d8 <mutex_init>
    8ce4:	e1a04000 	mov	r4, r0
    8ce8:	ea000015 	b	8d44 <swi_c_handler+0x1b0>
    8cec:	e5950000 	ldr	r0, [r5]
    8cf0:	eb0001f0 	bl	94b8 <mutex_lock>
    8cf4:	e3a04000 	mov	r4, #0
    8cf8:	ea000011 	b	8d44 <swi_c_handler+0x1b0>
    8cfc:	e5950000 	ldr	r0, [r5]
    8d00:	eb000230 	bl	95c8 <mutex_unlock>
    8d04:	e3a04000 	mov	r4, #0
    8d08:	ea00000d 	b	8d44 <swi_c_handler+0x1b0>
    8d0c:	eb000324 	bl	99a4 <wait_until_next_period>
    8d10:	e3a04000 	mov	r4, #0
    8d14:	ea00000a 	b	8d44 <swi_c_handler+0x1b0>
    8d18:	eb000335 	bl	99f4 <get_time>
    8d1c:	e1a04000 	mov	r4, r0
    8d20:	ea000007 	b	8d44 <swi_c_handler+0x1b0>
    8d24:	eb000239 	bl	9610 <scheduler_start>
    8d28:	e1a04000 	mov	r4, r0
    8d2c:	ea000004 	b	8d44 <swi_c_handler+0x1b0>
    8d30:	e5950000 	ldr	r0, [r5]
    8d34:	eb000332 	bl	9a04 <spin_wait>
    8d38:	e3a04000 	mov	r4, #0
    8d3c:	ea000000 	b	8d44 <swi_c_handler+0x1b0>
    8d40:	e3a04000 	mov	r4, #0
    8d44:	eb000367 	bl	9ae8 <disable_interrupts>
    8d48:	e1a00004 	mov	r0, r4
    8d4c:	e28dd00c 	add	sp, sp, #12
    8d50:	e8bd8030 	pop	{r4, r5, pc}

00008d54 <printnumk>:
    8d54:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8d58:	e24dd008 	sub	sp, sp, #8
    8d5c:	e1a06002 	mov	r6, r2
    8d60:	e1a07003 	mov	r7, r3
    8d64:	e3500008 	cmp	r0, #8
    8d68:	0a000004 	beq	8d80 <printnumk+0x2c>
    8d6c:	e30b8020 	movw	r8, #45088	; 0xb020
    8d70:	e3408000 	movt	r8, #0
    8d74:	e3500010 	cmp	r0, #16
    8d78:	13a08000 	movne	r8, #0
    8d7c:	ea000001 	b	8d88 <printnumk+0x34>
    8d80:	e30b801c 	movw	r8, #45084	; 0xb01c
    8d84:	e3408000 	movt	r8, #0
    8d88:	e28d4007 	add	r4, sp, #7
    8d8c:	e1a05000 	mov	r5, r0
    8d90:	e3a09000 	mov	r9, #0
    8d94:	e30ba008 	movw	sl, #45064	; 0xb008
    8d98:	e340a000 	movt	sl, #0
    8d9c:	e1a00006 	mov	r0, r6
    8da0:	e1a01007 	mov	r1, r7
    8da4:	e1a02005 	mov	r2, r5
    8da8:	e1a03009 	mov	r3, r9
    8dac:	eb000646 	bl	a6cc <__aeabi_uldivmod>
    8db0:	e7da3002 	ldrb	r3, [sl, r2]
    8db4:	e4443001 	strb	r3, [r4], #-1
    8db8:	e1a00006 	mov	r0, r6
    8dbc:	e1a01007 	mov	r1, r7
    8dc0:	e1a02005 	mov	r2, r5
    8dc4:	e1a03009 	mov	r3, r9
    8dc8:	eb00063f 	bl	a6cc <__aeabi_uldivmod>
    8dcc:	e1a06000 	mov	r6, r0
    8dd0:	e1a07001 	mov	r7, r1
    8dd4:	e1963007 	orrs	r3, r6, r7
    8dd8:	1affffef 	bne	8d9c <printnumk+0x48>
    8ddc:	e3580000 	cmp	r8, #0
    8de0:	0a000002 	beq	8df0 <printnumk+0x9c>
    8de4:	e5d80000 	ldrb	r0, [r8]
    8de8:	e3500000 	cmp	r0, #0
    8dec:	1a000004 	bne	8e04 <printnumk+0xb0>
    8df0:	e2844001 	add	r4, r4, #1
    8df4:	e28d3008 	add	r3, sp, #8
    8df8:	e1540003 	cmp	r4, r3
    8dfc:	1a000005 	bne	8e18 <printnumk+0xc4>
    8e00:	ea000009 	b	8e2c <printnumk+0xd8>
    8e04:	eb0000c5 	bl	9120 <uart_put_byte>
    8e08:	e5f80001 	ldrb	r0, [r8, #1]!
    8e0c:	e3500000 	cmp	r0, #0
    8e10:	1afffffb 	bne	8e04 <printnumk+0xb0>
    8e14:	eafffff5 	b	8df0 <printnumk+0x9c>
    8e18:	e4d40001 	ldrb	r0, [r4], #1
    8e1c:	eb0000bf 	bl	9120 <uart_put_byte>
    8e20:	e28d3008 	add	r3, sp, #8
    8e24:	e1540003 	cmp	r4, r3
    8e28:	1afffffa 	bne	8e18 <printnumk+0xc4>
    8e2c:	e28dd008 	add	sp, sp, #8
    8e30:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}

00008e34 <printk>:
    8e34:	e92d000f 	push	{r0, r1, r2, r3}
    8e38:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8e3c:	e24dd008 	sub	sp, sp, #8
    8e40:	e59d4020 	ldr	r4, [sp, #32]
    8e44:	e28d3024 	add	r3, sp, #36	; 0x24
    8e48:	e58d3004 	str	r3, [sp, #4]
    8e4c:	e3a06000 	mov	r6, #0
    8e50:	e3a08008 	mov	r8, #8
    8e54:	e3a07010 	mov	r7, #16
    8e58:	ea00005c 	b	8fd0 <printk+0x19c>
    8e5c:	e3500025 	cmp	r0, #37	; 0x25
    8e60:	0a000002 	beq	8e70 <printk+0x3c>
    8e64:	e2844001 	add	r4, r4, #1
    8e68:	eb0000ac 	bl	9120 <uart_put_byte>
    8e6c:	ea000057 	b	8fd0 <printk+0x19c>
    8e70:	e5d43001 	ldrb	r3, [r4, #1]
    8e74:	e353006f 	cmp	r3, #111	; 0x6f
    8e78:	0a00002c 	beq	8f30 <printk+0xfc>
    8e7c:	8a000006 	bhi	8e9c <printk+0x68>
    8e80:	e3530063 	cmp	r3, #99	; 0x63
    8e84:	0a000045 	beq	8fa0 <printk+0x16c>
    8e88:	e3530064 	cmp	r3, #100	; 0x64
    8e8c:	0a00000d 	beq	8ec8 <printk+0x94>
    8e90:	e3530025 	cmp	r3, #37	; 0x25
    8e94:	1a00004a 	bne	8fc4 <printk+0x190>
    8e98:	ea000046 	b	8fb8 <printk+0x184>
    8e9c:	e3530073 	cmp	r3, #115	; 0x73
    8ea0:	0a000032 	beq	8f70 <printk+0x13c>
    8ea4:	8a000002 	bhi	8eb4 <printk+0x80>
    8ea8:	e3530070 	cmp	r3, #112	; 0x70
    8eac:	0a000027 	beq	8f50 <printk+0x11c>
    8eb0:	ea000043 	b	8fc4 <printk+0x190>
    8eb4:	e3530075 	cmp	r3, #117	; 0x75
    8eb8:	0a000014 	beq	8f10 <printk+0xdc>
    8ebc:	e3530078 	cmp	r3, #120	; 0x78
    8ec0:	0a000022 	beq	8f50 <printk+0x11c>
    8ec4:	ea00003e 	b	8fc4 <printk+0x190>
    8ec8:	e59d3004 	ldr	r3, [sp, #4]
    8ecc:	e2832004 	add	r2, r3, #4
    8ed0:	e58d2004 	str	r2, [sp, #4]
    8ed4:	e5935000 	ldr	r5, [r3]
    8ed8:	e3550000 	cmp	r5, #0
    8edc:	aa000006 	bge	8efc <printk+0xc8>
    8ee0:	e3a0002d 	mov	r0, #45	; 0x2d
    8ee4:	eb00008d 	bl	9120 <uart_put_byte>
    8ee8:	e2652000 	rsb	r2, r5, #0
    8eec:	e3a0000a 	mov	r0, #10
    8ef0:	e1a03fc2 	asr	r3, r2, #31
    8ef4:	ebffff96 	bl	8d54 <printnumk>
    8ef8:	ea000033 	b	8fcc <printk+0x198>
    8efc:	e3a0000a 	mov	r0, #10
    8f00:	e1a02005 	mov	r2, r5
    8f04:	e1a03fc5 	asr	r3, r5, #31
    8f08:	ebffff91 	bl	8d54 <printnumk>
    8f0c:	ea00002e 	b	8fcc <printk+0x198>
    8f10:	e59d3004 	ldr	r3, [sp, #4]
    8f14:	e2832004 	add	r2, r3, #4
    8f18:	e58d2004 	str	r2, [sp, #4]
    8f1c:	e3a0000a 	mov	r0, #10
    8f20:	e5932000 	ldr	r2, [r3]
    8f24:	e1a03006 	mov	r3, r6
    8f28:	ebffff89 	bl	8d54 <printnumk>
    8f2c:	ea000026 	b	8fcc <printk+0x198>
    8f30:	e59d3004 	ldr	r3, [sp, #4]
    8f34:	e2832004 	add	r2, r3, #4
    8f38:	e58d2004 	str	r2, [sp, #4]
    8f3c:	e1a00008 	mov	r0, r8
    8f40:	e5932000 	ldr	r2, [r3]
    8f44:	e1a03006 	mov	r3, r6
    8f48:	ebffff81 	bl	8d54 <printnumk>
    8f4c:	ea00001e 	b	8fcc <printk+0x198>
    8f50:	e59d3004 	ldr	r3, [sp, #4]
    8f54:	e2832004 	add	r2, r3, #4
    8f58:	e58d2004 	str	r2, [sp, #4]
    8f5c:	e1a00007 	mov	r0, r7
    8f60:	e5932000 	ldr	r2, [r3]
    8f64:	e1a03006 	mov	r3, r6
    8f68:	ebffff79 	bl	8d54 <printnumk>
    8f6c:	ea000016 	b	8fcc <printk+0x198>
    8f70:	e59d3004 	ldr	r3, [sp, #4]
    8f74:	e2832004 	add	r2, r3, #4
    8f78:	e58d2004 	str	r2, [sp, #4]
    8f7c:	e5935000 	ldr	r5, [r3]
    8f80:	e5d50000 	ldrb	r0, [r5]
    8f84:	e3500000 	cmp	r0, #0
    8f88:	0a00000f 	beq	8fcc <printk+0x198>
    8f8c:	eb000063 	bl	9120 <uart_put_byte>
    8f90:	e5f50001 	ldrb	r0, [r5, #1]!
    8f94:	e3500000 	cmp	r0, #0
    8f98:	1afffffb 	bne	8f8c <printk+0x158>
    8f9c:	ea00000a 	b	8fcc <printk+0x198>
    8fa0:	e59d3004 	ldr	r3, [sp, #4]
    8fa4:	e2832004 	add	r2, r3, #4
    8fa8:	e58d2004 	str	r2, [sp, #4]
    8fac:	e5d30000 	ldrb	r0, [r3]
    8fb0:	eb00005a 	bl	9120 <uart_put_byte>
    8fb4:	ea000004 	b	8fcc <printk+0x198>
    8fb8:	e3a00025 	mov	r0, #37	; 0x25
    8fbc:	eb000057 	bl	9120 <uart_put_byte>
    8fc0:	ea000001 	b	8fcc <printk+0x198>
    8fc4:	e3e00000 	mvn	r0, #0
    8fc8:	ea000003 	b	8fdc <printk+0x1a8>
    8fcc:	e2844002 	add	r4, r4, #2
    8fd0:	e5d40000 	ldrb	r0, [r4]
    8fd4:	e3500000 	cmp	r0, #0
    8fd8:	1affff9f 	bne	8e5c <printk+0x28>
    8fdc:	e28dd008 	add	sp, sp, #8
    8fe0:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8fe4:	e28dd010 	add	sp, sp, #16
    8fe8:	e12fff1e 	bx	lr

00008fec <timer_start>:
    8fec:	e3a03a0b 	mov	r3, #45056	; 0xb000
    8ff0:	e3433f00 	movt	r3, #16128	; 0x3f00
    8ff4:	e5830400 	str	r0, [r3, #1024]	; 0x400
    8ff8:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    8ffc:	e3822002 	orr	r2, r2, #2
    9000:	e5832408 	str	r2, [r3, #1032]	; 0x408
    9004:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    9008:	e3c2200c 	bic	r2, r2, #12
    900c:	e5832408 	str	r2, [r3, #1032]	; 0x408
    9010:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    9014:	e3822020 	orr	r2, r2, #32
    9018:	e5832408 	str	r2, [r3, #1032]	; 0x408
    901c:	e5932218 	ldr	r2, [r3, #536]	; 0x218
    9020:	e3822001 	orr	r2, r2, #1
    9024:	e5832218 	str	r2, [r3, #536]	; 0x218
    9028:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    902c:	e3822080 	orr	r2, r2, #128	; 0x80
    9030:	e5832408 	str	r2, [r3, #1032]	; 0x408
    9034:	e12fff1e 	bx	lr

00009038 <timer_stop>:
    9038:	e3a03a0b 	mov	r3, #45056	; 0xb000
    903c:	e3433f00 	movt	r3, #16128	; 0x3f00
    9040:	e5932224 	ldr	r2, [r3, #548]	; 0x224
    9044:	e3822001 	orr	r2, r2, #1
    9048:	e5832224 	str	r2, [r3, #548]	; 0x224
    904c:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    9050:	e3c22020 	bic	r2, r2, #32
    9054:	e5832408 	str	r2, [r3, #1032]	; 0x408
    9058:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    905c:	e3c22080 	bic	r2, r2, #128	; 0x80
    9060:	e5832408 	str	r2, [r3, #1032]	; 0x408
    9064:	e12fff1e 	bx	lr

00009068 <timer_is_pending>:
    9068:	e3a03a0b 	mov	r3, #45056	; 0xb000
    906c:	e3433f00 	movt	r3, #16128	; 0x3f00
    9070:	e5930200 	ldr	r0, [r3, #512]	; 0x200
    9074:	e2000001 	and	r0, r0, #1
    9078:	e12fff1e 	bx	lr

0000907c <timer_clear_pending>:
    907c:	e3a03a0b 	mov	r3, #45056	; 0xb000
    9080:	e3433f00 	movt	r3, #16128	; 0x3f00
    9084:	e593240c 	ldr	r2, [r3, #1036]	; 0x40c
    9088:	e3822001 	orr	r2, r2, #1
    908c:	e583240c 	str	r2, [r3, #1036]	; 0x40c
    9090:	e12fff1e 	bx	lr

00009094 <uart_init>:
    9094:	e92d4008 	push	{r3, lr}
    9098:	e3a0000f 	mov	r0, #15
    909c:	e3a01000 	mov	r1, #0
    90a0:	ebfffc3a 	bl	8190 <gpio_set_pull>
    90a4:	e3a0000e 	mov	r0, #14
    90a8:	e3a01000 	mov	r1, #0
    90ac:	ebfffc37 	bl	8190 <gpio_set_pull>
    90b0:	e3a0000f 	mov	r0, #15
    90b4:	e3a01002 	mov	r1, #2
    90b8:	ebfffbfd 	bl	80b4 <gpio_config>
    90bc:	e3a0000e 	mov	r0, #14
    90c0:	e3a01002 	mov	r1, #2
    90c4:	ebfffbfa 	bl	80b4 <gpio_config>
    90c8:	e3a03a05 	mov	r3, #20480	; 0x5000
    90cc:	e3433f21 	movt	r3, #16161	; 0x3f21
    90d0:	e5932004 	ldr	r2, [r3, #4]
    90d4:	e3822001 	orr	r2, r2, #1
    90d8:	e5832004 	str	r2, [r3, #4]
    90dc:	e3a02000 	mov	r2, #0
    90e0:	e5832044 	str	r2, [r3, #68]	; 0x44
    90e4:	e5932048 	ldr	r2, [r3, #72]	; 0x48
    90e8:	e3822006 	orr	r2, r2, #6
    90ec:	e5832048 	str	r2, [r3, #72]	; 0x48
    90f0:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
    90f4:	e3822003 	orr	r2, r2, #3
    90f8:	e583204c 	str	r2, [r3, #76]	; 0x4c
    90fc:	e300210e 	movw	r2, #270	; 0x10e
    9100:	e5832068 	str	r2, [r3, #104]	; 0x68
    9104:	e8bd8008 	pop	{r3, pc}

00009108 <uart_close>:
    9108:	e3a03a05 	mov	r3, #20480	; 0x5000
    910c:	e3433f21 	movt	r3, #16161	; 0x3f21
    9110:	e5932004 	ldr	r2, [r3, #4]
    9114:	e3c22001 	bic	r2, r2, #1
    9118:	e5832004 	str	r2, [r3, #4]
    911c:	e12fff1e 	bx	lr

00009120 <uart_put_byte>:
    9120:	e3a02a05 	mov	r2, #20480	; 0x5000
    9124:	e3432f21 	movt	r2, #16161	; 0x3f21
    9128:	e5923054 	ldr	r3, [r2, #84]	; 0x54
    912c:	e3130040 	tst	r3, #64	; 0x40
    9130:	0afffffc 	beq	9128 <uart_put_byte+0x8>
    9134:	e3a03a05 	mov	r3, #20480	; 0x5000
    9138:	e3433f21 	movt	r3, #16161	; 0x3f21
    913c:	e5830040 	str	r0, [r3, #64]	; 0x40
    9140:	e12fff1e 	bx	lr

00009144 <uart_get_byte>:
    9144:	e3a02a05 	mov	r2, #20480	; 0x5000
    9148:	e3432f21 	movt	r2, #16161	; 0x3f21
    914c:	e5923054 	ldr	r3, [r2, #84]	; 0x54
    9150:	e3130001 	tst	r3, #1
    9154:	0afffffc 	beq	914c <uart_get_byte+0x8>
    9158:	e3a03a05 	mov	r3, #20480	; 0x5000
    915c:	e3433f21 	movt	r3, #16161	; 0x3f21
    9160:	e5930040 	ldr	r0, [r3, #64]	; 0x40
    9164:	e6ef0070 	uxtb	r0, r0
    9168:	e12fff1e 	bx	lr

0000916c <syscall_exit>:
    916c:	e92d4008 	push	{r3, lr}
    9170:	e1a04000 	mov	r4, r0
    9174:	eb00025b 	bl	9ae8 <disable_interrupts>
    9178:	e30b0024 	movw	r0, #45092	; 0xb024
    917c:	e3400000 	movt	r0, #0
    9180:	e1a01004 	mov	r1, r4
    9184:	ebffff2a 	bl	8e34 <printk>
    9188:	eafffffe 	b	9188 <syscall_exit+0x1c>

0000918c <syscall_write>:
    918c:	e3500001 	cmp	r0, #1
    9190:	1a00000b 	bne	91c4 <syscall_write+0x38>
    9194:	e3520000 	cmp	r2, #0
    9198:	da00000b 	ble	91cc <syscall_write+0x40>
    919c:	e92d4070 	push	{r4, r5, r6, lr}
    91a0:	e1a06002 	mov	r6, r2
    91a4:	e1a04001 	mov	r4, r1
    91a8:	e0815002 	add	r5, r1, r2
    91ac:	e4d40001 	ldrb	r0, [r4], #1
    91b0:	ebffffda 	bl	9120 <uart_put_byte>
    91b4:	e1540005 	cmp	r4, r5
    91b8:	1afffffb 	bne	91ac <syscall_write+0x20>
    91bc:	e1a00006 	mov	r0, r6
    91c0:	e8bd8070 	pop	{r4, r5, r6, pc}
    91c4:	e3e00000 	mvn	r0, #0
    91c8:	e12fff1e 	bx	lr
    91cc:	e1a00002 	mov	r0, r2
    91d0:	e12fff1e 	bx	lr

000091d4 <syscall_read>:
    91d4:	e3500000 	cmp	r0, #0
    91d8:	1a00002e 	bne	9298 <syscall_read+0xc4>
    91dc:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    91e0:	e1a06002 	mov	r6, r2
    91e4:	e1a08001 	mov	r8, r1
    91e8:	e3a05000 	mov	r5, #0
    91ec:	e3a09008 	mov	r9, #8
    91f0:	e3a0a020 	mov	sl, #32
    91f4:	ea00001e 	b	9274 <syscall_read+0xa0>
    91f8:	e3540008 	cmp	r4, #8
    91fc:	1354007f 	cmpne	r4, #127	; 0x7f
    9200:	1a000009 	bne	922c <syscall_read+0x58>
    9204:	e3550000 	cmp	r5, #0
    9208:	da000019 	ble	9274 <syscall_read+0xa0>
    920c:	e2455001 	sub	r5, r5, #1
    9210:	e1a00009 	mov	r0, r9
    9214:	ebffffc1 	bl	9120 <uart_put_byte>
    9218:	e1a0000a 	mov	r0, sl
    921c:	ebffffbf 	bl	9120 <uart_put_byte>
    9220:	e1a00009 	mov	r0, r9
    9224:	ebffffbd 	bl	9120 <uart_put_byte>
    9228:	ea000011 	b	9274 <syscall_read+0xa0>
    922c:	e354000a 	cmp	r4, #10
    9230:	0a000004 	beq	9248 <syscall_read+0x74>
    9234:	e354000d 	cmp	r4, #13
    9238:	1a000008 	bne	9260 <syscall_read+0x8c>
    923c:	ebffffc0 	bl	9144 <uart_get_byte>
    9240:	e350000a 	cmp	r0, #10
    9244:	1a000005 	bne	9260 <syscall_read+0x8c>
    9248:	e2854001 	add	r4, r5, #1
    924c:	e3a0000a 	mov	r0, #10
    9250:	e7c80005 	strb	r0, [r8, r5]
    9254:	ebffffb1 	bl	9120 <uart_put_byte>
    9258:	e1a05004 	mov	r5, r4
    925c:	ea000009 	b	9288 <syscall_read+0xb4>
    9260:	e2857001 	add	r7, r5, #1
    9264:	e7c84005 	strb	r4, [r8, r5]
    9268:	e1a00004 	mov	r0, r4
    926c:	ebffffab 	bl	9120 <uart_put_byte>
    9270:	e1a05007 	mov	r5, r7
    9274:	ebffffb2 	bl	9144 <uart_get_byte>
    9278:	e1a04000 	mov	r4, r0
    927c:	e3500004 	cmp	r0, #4
    9280:	11550006 	cmpne	r5, r6
    9284:	baffffdb 	blt	91f8 <syscall_read+0x24>
    9288:	e3a03000 	mov	r3, #0
    928c:	e7c83005 	strb	r3, [r8, r5]
    9290:	e1a00005 	mov	r0, r5
    9294:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    9298:	e3e00000 	mvn	r0, #0
    929c:	e12fff1e 	bx	lr

000092a0 <thread_create>:
    92a0:	e3510000 	cmp	r1, #0
    92a4:	13500000 	cmpne	r0, #0
    92a8:	0a00002b 	beq	935c <thread_create+0xbc>
    92ac:	e92d4070 	push	{r4, r5, r6, lr}
    92b0:	e1a05000 	mov	r5, r0
    92b4:	e1a04001 	mov	r4, r1
    92b8:	e3a01001 	mov	r1, #1
    92bc:	e1a01211 	lsl	r1, r1, r2
    92c0:	e30c0010 	movw	r0, #49168	; 0xc010
    92c4:	e3400000 	movt	r0, #0
    92c8:	e5900000 	ldr	r0, [r0]
    92cc:	e1110000 	tst	r1, r0
    92d0:	1a000023 	bne	9364 <thread_create+0xc4>
    92d4:	e30c0010 	movw	r0, #49168	; 0xc010
    92d8:	e3400000 	movt	r0, #0
    92dc:	e590c000 	ldr	ip, [r0]
    92e0:	e181100c 	orr	r1, r1, ip
    92e4:	e5801000 	str	r1, [r0]
    92e8:	e30cc018 	movw	ip, #49176	; 0xc018
    92ec:	e340c000 	movt	ip, #0
    92f0:	e1a0e182 	lsl	lr, r2, #3
    92f4:	e062000e 	rsb	r0, r2, lr
    92f8:	e1a00200 	lsl	r0, r0, #4
    92fc:	e08c1000 	add	r1, ip, r0
    9300:	e3a06001 	mov	r6, #1
    9304:	e7cc6000 	strb	r6, [ip, r0]
    9308:	e6ef0072 	uxtb	r0, r2
    930c:	e5c10001 	strb	r0, [r1, #1]
    9310:	e5c10002 	strb	r0, [r1, #2]
    9314:	e5813004 	str	r3, [r1, #4]
    9318:	e59d0010 	ldr	r0, [sp, #16]
    931c:	e5810008 	str	r0, [r1, #8]
    9320:	e3a00000 	mov	r0, #0
    9324:	e581000c 	str	r0, [r1, #12]
    9328:	e5916010 	ldr	r6, [r1, #16]
    932c:	e2816018 	add	r6, r1, #24
    9330:	e5810018 	str	r0, [r1, #24]
    9334:	e581001c 	str	r0, [r1, #28]
    9338:	e5815014 	str	r5, [r1, #20]
    933c:	e2813068 	add	r3, r1, #104	; 0x68
    9340:	e5815068 	str	r5, [r1, #104]	; 0x68
    9344:	e3a01010 	mov	r1, #16
    9348:	e5831004 	str	r1, [r3, #4]
    934c:	e062200e 	rsb	r2, r2, lr
    9350:	e08cc202 	add	ip, ip, r2, lsl #4
    9354:	e58c4024 	str	r4, [ip, #36]	; 0x24
    9358:	e8bd8070 	pop	{r4, r5, r6, pc}
    935c:	e3e00000 	mvn	r0, #0
    9360:	e12fff1e 	bx	lr
    9364:	e3e00000 	mvn	r0, #0
    9368:	e8bd8070 	pop	{r4, r5, r6, pc}

0000936c <thread_init>:
    936c:	e92d4070 	push	{r4, r5, r6, lr}
    9370:	e24dd008 	sub	sp, sp, #8
    9374:	e1a06000 	mov	r6, r0
    9378:	e1a05001 	mov	r5, r1
    937c:	e30c3010 	movw	r3, #49168	; 0xc010
    9380:	e3403000 	movt	r3, #0
    9384:	e3a02000 	mov	r2, #0
    9388:	e5832000 	str	r2, [r3]
    938c:	e30c3fa0 	movw	r3, #53152	; 0xcfa0
    9390:	e3403000 	movt	r3, #0
    9394:	e5832000 	str	r2, [r3]
    9398:	e30c3008 	movw	r3, #49160	; 0xc008
    939c:	e3403000 	movt	r3, #0
    93a0:	e3e04000 	mvn	r4, #0
    93a4:	e5834000 	str	r4, [r3]
    93a8:	e5931000 	ldr	r1, [r3]
    93ac:	e30b0034 	movw	r0, #45108	; 0xb034
    93b0:	e3400000 	movt	r0, #0
    93b4:	ebfffe9e 	bl	8e34 <printk>
    93b8:	e58d4000 	str	r4, [sp]
    93bc:	e1a00006 	mov	r0, r6
    93c0:	e1a01005 	mov	r1, r5
    93c4:	e3a0201f 	mov	r2, #31
    93c8:	e1a03004 	mov	r3, r4
    93cc:	ebffffb3 	bl	92a0 <thread_create>
    93d0:	e28dd008 	add	sp, sp, #8
    93d4:	e8bd8070 	pop	{r4, r5, r6, pc}

000093d8 <mutex_init>:
    93d8:	e30c300c 	movw	r3, #49164	; 0xc00c
    93dc:	e3403000 	movt	r3, #0
    93e0:	e5933000 	ldr	r3, [r3]
    93e4:	e353001f 	cmp	r3, #31
    93e8:	8a000016 	bhi	9448 <mutex_init+0x70>
    93ec:	e92d4010 	push	{r4, lr}
    93f0:	e30c300c 	movw	r3, #49164	; 0xc00c
    93f4:	e3403000 	movt	r3, #0
    93f8:	e593c000 	ldr	ip, [r3]
    93fc:	e30c2f20 	movw	r2, #53024	; 0xcf20
    9400:	e3402000 	movt	r2, #0
    9404:	e782010c 	str	r0, [r2, ip, lsl #2]
    9408:	e5930000 	ldr	r0, [r3]
    940c:	e7920100 	ldr	r0, [r2, r0, lsl #2]
    9410:	e3a04000 	mov	r4, #0
    9414:	e5c04000 	strb	r4, [r0]
    9418:	e5930000 	ldr	r0, [r3]
    941c:	e7922100 	ldr	r2, [r2, r0, lsl #2]
    9420:	e5821004 	str	r1, [r2, #4]
    9424:	e5932000 	ldr	r2, [r3]
    9428:	e2822001 	add	r2, r2, #1
    942c:	e5832000 	str	r2, [r3]
    9430:	e5931000 	ldr	r1, [r3]
    9434:	e30b0048 	movw	r0, #45128	; 0xb048
    9438:	e3400000 	movt	r0, #0
    943c:	ebfffe7c 	bl	8e34 <printk>
    9440:	e1a00004 	mov	r0, r4
    9444:	e8bd8010 	pop	{r4, pc}
    9448:	e3e00000 	mvn	r0, #0
    944c:	e12fff1e 	bx	lr

00009450 <get_top_priority_1>:
    9450:	e92d4010 	push	{r4, lr}
    9454:	e3a01020 	mov	r1, #32
    9458:	e1a00001 	mov	r0, r1
    945c:	e3a03000 	mov	r3, #0
    9460:	e30cc018 	movw	ip, #49176	; 0xc018
    9464:	e340c000 	movt	ip, #0
    9468:	e30ce010 	movw	lr, #49168	; 0xc010
    946c:	e340e000 	movt	lr, #0
    9470:	e3a04001 	mov	r4, #1
    9474:	e0632183 	rsb	r2, r3, r3, lsl #3
    9478:	e08c2202 	add	r2, ip, r2, lsl #4
    947c:	e5d22002 	ldrb	r2, [r2, #2]
    9480:	e6ef2072 	uxtb	r2, r2
    9484:	e1520001 	cmp	r2, r1
    9488:	8a000006 	bhi	94a8 <get_top_priority_1+0x58>
    948c:	e59e2000 	ldr	r2, [lr]
    9490:	e0122314 	ands	r2, r2, r4, lsl r3
    9494:	10632183 	rsbne	r2, r3, r3, lsl #3
    9498:	108c2202 	addne	r2, ip, r2, lsl #4
    949c:	15d21002 	ldrbne	r1, [r2, #2]
    94a0:	16ef1071 	uxtbne	r1, r1
    94a4:	11a00003 	movne	r0, r3
    94a8:	e2833001 	add	r3, r3, #1
    94ac:	e3530020 	cmp	r3, #32
    94b0:	1affffef 	bne	9474 <get_top_priority_1+0x24>
    94b4:	e8bd8010 	pop	{r4, pc}

000094b8 <mutex_lock>:
    94b8:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    94bc:	e1a0a000 	mov	sl, r0
    94c0:	eb000188 	bl	9ae8 <disable_interrupts>
    94c4:	e30c3008 	movw	r3, #49160	; 0xc008
    94c8:	e3403000 	movt	r3, #0
    94cc:	e5932000 	ldr	r2, [r3]
    94d0:	e30c3018 	movw	r3, #49176	; 0xc018
    94d4:	e3403000 	movt	r3, #0
    94d8:	e0622182 	rsb	r2, r2, r2, lsl #3
    94dc:	e0833202 	add	r3, r3, r2, lsl #4
    94e0:	e5d38002 	ldrb	r8, [r3, #2]
    94e4:	e6ef8078 	uxtb	r8, r8
    94e8:	e1a07008 	mov	r7, r8
    94ec:	e3a04000 	mov	r4, #0
    94f0:	e30c5f20 	movw	r5, #53024	; 0xcf20
    94f4:	e3405000 	movt	r5, #0
    94f8:	e30b905c 	movw	r9, #45148	; 0xb05c
    94fc:	e3409000 	movt	r9, #0
    9500:	e30c6018 	movw	r6, #49176	; 0xc018
    9504:	e3406000 	movt	r6, #0
    9508:	e7953104 	ldr	r3, [r5, r4, lsl #2]
    950c:	e5d32000 	ldrb	r2, [r3]
    9510:	e31200ff 	tst	r2, #255	; 0xff
    9514:	0a00001f 	beq	9598 <mutex_lock+0xe0>
    9518:	e5932004 	ldr	r2, [r3, #4]
    951c:	e1570002 	cmp	r7, r2
    9520:	3a00001c 	bcc	9598 <mutex_lock+0xe0>
    9524:	e593b008 	ldr	fp, [r3, #8]
    9528:	e1a00009 	mov	r0, r9
    952c:	e1a01004 	mov	r1, r4
    9530:	e1a0200b 	mov	r2, fp
    9534:	ebfffe3e 	bl	8e34 <printk>
    9538:	e06bb18b 	rsb	fp, fp, fp, lsl #3
    953c:	e086b20b 	add	fp, r6, fp, lsl #4
    9540:	e5cb8002 	strb	r8, [fp, #2]
    9544:	e30c3008 	movw	r3, #49160	; 0xc008
    9548:	e3403000 	movt	r3, #0
    954c:	e5931000 	ldr	r1, [r3]
    9550:	e5d62072 	ldrb	r2, [r6, #114]	; 0x72
    9554:	e5d63152 	ldrb	r3, [r6, #338]	; 0x152
    9558:	e30b0078 	movw	r0, #45176	; 0xb078
    955c:	e3400000 	movt	r0, #0
    9560:	ebfffe33 	bl	8e34 <printk>
    9564:	ebffffb9 	bl	9450 <get_top_priority_1>
    9568:	e1a01000 	mov	r1, r0
    956c:	e30b0098 	movw	r0, #45208	; 0xb098
    9570:	e3400000 	movt	r0, #0
    9574:	ebfffe2e 	bl	8e34 <printk>
    9578:	eb00015f 	bl	9afc <enable_interrupts>
    957c:	e7952104 	ldr	r2, [r5, r4, lsl #2]
    9580:	e5d23000 	ldrb	r3, [r2]
    9584:	e31300ff 	tst	r3, #255	; 0xff
    9588:	1afffffc 	bne	9580 <mutex_lock+0xc8>
    958c:	eb000155 	bl	9ae8 <disable_interrupts>
    9590:	e3a04001 	mov	r4, #1
    9594:	eaffffdb 	b	9508 <mutex_lock+0x50>
    9598:	e2844001 	add	r4, r4, #1
    959c:	e354001f 	cmp	r4, #31
    95a0:	9affffd8 	bls	9508 <mutex_lock+0x50>
    95a4:	eb00014f 	bl	9ae8 <disable_interrupts>
    95a8:	e3a03001 	mov	r3, #1
    95ac:	e5ca3000 	strb	r3, [sl]
    95b0:	e30c3008 	movw	r3, #49160	; 0xc008
    95b4:	e3403000 	movt	r3, #0
    95b8:	e5933000 	ldr	r3, [r3]
    95bc:	e58a3008 	str	r3, [sl, #8]
    95c0:	eb00014d 	bl	9afc <enable_interrupts>
    95c4:	e8bd8ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}

000095c8 <mutex_unlock>:
    95c8:	e92d4010 	push	{r4, lr}
    95cc:	e1a04000 	mov	r4, r0
    95d0:	eb000144 	bl	9ae8 <disable_interrupts>
    95d4:	e3a03000 	mov	r3, #0
    95d8:	e5c43000 	strb	r3, [r4]
    95dc:	e5940008 	ldr	r0, [r4, #8]
    95e0:	e30c3018 	movw	r3, #49176	; 0xc018
    95e4:	e3403000 	movt	r3, #0
    95e8:	e1a02180 	lsl	r2, r0, #3
    95ec:	e0601002 	rsb	r1, r0, r2
    95f0:	e0831201 	add	r1, r3, r1, lsl #4
    95f4:	e5d11001 	ldrb	r1, [r1, #1]
    95f8:	e6ef1071 	uxtb	r1, r1
    95fc:	e0602002 	rsb	r2, r0, r2
    9600:	e0833202 	add	r3, r3, r2, lsl #4
    9604:	e5c31002 	strb	r1, [r3, #2]
    9608:	eb00013b 	bl	9afc <enable_interrupts>
    960c:	e8bd8010 	pop	{r4, pc}

00009610 <scheduler_start>:
    9610:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9614:	e24dd00c 	sub	sp, sp, #12
    9618:	e30c3e18 	movw	r3, #52760	; 0xce18
    961c:	e3403000 	movt	r3, #0
    9620:	e3a00000 	mov	r0, #0
    9624:	e3a01000 	mov	r1, #0
    9628:	e3431ff0 	movt	r1, #16368	; 0x3ff0
    962c:	e1c300f8 	strd	r0, [r3, #8]
    9630:	e3040635 	movw	r0, #17973	; 0x4635
    9634:	e34a08eb 	movt	r0, #43243	; 0xa8eb
    9638:	e308126a 	movw	r1, #33386	; 0x826a
    963c:	e3431fea 	movt	r1, #16362	; 0x3fea
    9640:	e1c301f0 	strd	r0, [r3, #16]
    9644:	e30503a4 	movw	r0, #21412	; 0x53a4
    9648:	e3430e57 	movt	r0, #15959	; 0x3e57
    964c:	e30f13cb 	movw	r1, #62411	; 0xf3cb
    9650:	e3431fe8 	movt	r1, #16360	; 0x3fe8
    9654:	e1c301f8 	strd	r0, [r3, #24]
    9658:	e30a0dd6 	movw	r0, #44502	; 0xadd6
    965c:	e349039e 	movt	r0, #37790	; 0x939e
    9660:	e30317de 	movw	r1, #14302	; 0x37de
    9664:	e3431fe8 	movt	r1, #16360	; 0x3fe8
    9668:	e1c302f0 	strd	r0, [r3, #32]
    966c:	e30e05b4 	movw	r0, #58804	; 0xe5b4
    9670:	e3480a5c 	movt	r0, #35420	; 0x8a5c
    9674:	e30c1aab 	movw	r1, #51883	; 0xcaab
    9678:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    967c:	e1c302f8 	strd	r0, [r3, #40]	; 0x28
    9680:	e3090f17 	movw	r0, #40727	; 0x9f17
    9684:	e3460002 	movt	r0, #24578	; 0x6002
    9688:	e308133c 	movw	r1, #33596	; 0x833c
    968c:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    9690:	e1c303f0 	strd	r0, [r3, #48]	; 0x30
    9694:	e30c04c6 	movw	r0, #50374	; 0xc4c6
    9698:	e34e03e6 	movt	r0, #58342	; 0xe3e6
    969c:	e30510da 	movw	r1, #20698	; 0x50da
    96a0:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    96a4:	e1c303f8 	strd	r0, [r3, #56]	; 0x38
    96a8:	e30e0fb3 	movw	r0, #61363	; 0xefb3
    96ac:	e34e008a 	movt	r0, #57482	; 0xe08a
    96b0:	e3021b7f 	movw	r1, #11135	; 0x2b7f
    96b4:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    96b8:	e1c304f0 	strd	r0, [r3, #64]	; 0x40
    96bc:	e3020e1f 	movw	r0, #11807	; 0x2e1f
    96c0:	e34e0e39 	movt	r0, #60985	; 0xee39
    96c4:	e3001e94 	movw	r1, #3732	; 0xe94
    96c8:	e3431fe7 	movt	r1, #16359	; 0x3fe7
    96cc:	e1c304f8 	strd	r0, [r3, #72]	; 0x48
    96d0:	e3070564 	movw	r0, #30052	; 0x7564
    96d4:	e34e07ab 	movt	r0, #59307	; 0xe7ab
    96d8:	e30f17a4 	movw	r1, #63396	; 0xf7a4
    96dc:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    96e0:	e1c305f0 	strd	r0, [r3, #80]	; 0x50
    96e4:	e3080adb 	movw	r0, #35547	; 0x8adb
    96e8:	e34605fd 	movt	r0, #26109	; 0x65fd
    96ec:	e30e14f7 	movw	r1, #58615	; 0xe4f7
    96f0:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    96f4:	e1c305f8 	strd	r0, [r3, #88]	; 0x58
    96f8:	e30f0213 	movw	r0, #61971	; 0xf213
    96fc:	e34c0f41 	movt	r0, #53057	; 0xcf41
    9700:	e30d1566 	movw	r1, #54630	; 0xd566
    9704:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9708:	e1c306f0 	strd	r0, [r3, #96]	; 0x60
    970c:	e30603f1 	movw	r0, #25585	; 0x63f1
    9710:	e3450dcc 	movt	r0, #24012	; 0x5dcc
    9714:	e30c184b 	movw	r1, #51275	; 0xc84b
    9718:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    971c:	e1c306f8 	strd	r0, [r3, #104]	; 0x68
    9720:	e30a0b22 	movw	r0, #43810	; 0xab22
    9724:	e3430d5b 	movt	r0, #15707	; 0x3d5b
    9728:	e30b1d27 	movw	r1, #48423	; 0xbd27
    972c:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9730:	e1c307f0 	strd	r0, [r3, #112]	; 0x70
    9734:	e309024f 	movw	r0, #37455	; 0x924f
    9738:	e34909ae 	movt	r0, #39342	; 0x99ae
    973c:	e30b137c 	movw	r1, #45948	; 0xb37c
    9740:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9744:	e1c307f8 	strd	r0, [r3, #120]	; 0x78
    9748:	e3070ed0 	movw	r0, #32464	; 0x7ed0
    974c:	e34808a4 	movt	r0, #34980	; 0x88a4
    9750:	e30a1b0c 	movw	r1, #43788	; 0xab0c
    9754:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9758:	e1c308f0 	strd	r0, [r3, #128]	; 0x80
    975c:	e30d05fa 	movw	r0, #54778	; 0xd5fa
    9760:	e342001c 	movt	r0, #8220	; 0x201c
    9764:	e30a1398 	movw	r1, #41880	; 0xa398
    9768:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    976c:	e1c308f8 	strd	r0, [r3, #136]	; 0x88
    9770:	e3080605 	movw	r0, #34309	; 0x8605
    9774:	e3460eac 	movt	r0, #28332	; 0x6eac
    9778:	e3091cf5 	movw	r1, #40181	; 0x9cf5
    977c:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9780:	e1c309f0 	strd	r0, [r3, #144]	; 0x90
    9784:	e3a00e61 	mov	r0, #1552	; 0x610
    9788:	e3470b9e 	movt	r0, #31646	; 0x7b9e
    978c:	e309170f 	movw	r1, #38671	; 0x970f
    9790:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9794:	e1c309f8 	strd	r0, [r3, #152]	; 0x98
    9798:	e3040452 	movw	r0, #17490	; 0x4452
    979c:	e3450586 	movt	r0, #21894	; 0x5586
    97a0:	e30911bc 	movw	r1, #37308	; 0x91bc
    97a4:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    97a8:	e1c30af0 	strd	r0, [r3, #160]	; 0xa0
    97ac:	e30400cc 	movw	r0, #16588	; 0x40cc
    97b0:	e34f0c65 	movt	r0, #64613	; 0xfc65
    97b4:	e3081cfb 	movw	r1, #36091	; 0x8cfb
    97b8:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    97bc:	e1c30af8 	strd	r0, [r3, #168]	; 0xa8
    97c0:	e30e09b8 	movw	r0, #59832	; 0xe9b8
    97c4:	e3470ecf 	movt	r0, #32463	; 0x7ecf
    97c8:	e30818a4 	movw	r1, #34980	; 0x88a4
    97cc:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    97d0:	e1c30bf0 	strd	r0, [r3, #176]	; 0xb0
    97d4:	e30b0631 	movw	r0, #46641	; 0xb631
    97d8:	e34e0410 	movt	r0, #58384	; 0xe410
    97dc:	e30814a0 	movw	r1, #33952	; 0x84a0
    97e0:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    97e4:	e1c30bf8 	strd	r0, [r3, #184]	; 0xb8
    97e8:	e3020f1b 	movw	r0, #12059	; 0x2f1b
    97ec:	e34204dd 	movt	r0, #9437	; 0x24dd
    97f0:	e3081106 	movw	r1, #33030	; 0x8106
    97f4:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    97f8:	e1c30cf0 	strd	r0, [r3, #192]	; 0xc0
    97fc:	e30402af 	movw	r0, #17071	; 0x42af
    9800:	e3440fca 	movt	r0, #20426	; 0x4fca
    9804:	e3071daa 	movw	r1, #32170	; 0x7daa
    9808:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    980c:	e1c30cf8 	strd	r0, [r3, #200]	; 0xc8
    9810:	e30f00ed 	movw	r0, #61677	; 0xf0ed
    9814:	e34604d7 	movt	r0, #25815	; 0x64d7
    9818:	e3071a8d 	movw	r1, #31373	; 0x7a8d
    981c:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9820:	e1c30df0 	strd	r0, [r3, #208]	; 0xd0
    9824:	e30c02b9 	movw	r0, #49849	; 0xc2b9
    9828:	e3450cbb 	movt	r0, #23739	; 0x5cbb
    982c:	e30717c4 	movw	r1, #30660	; 0x77c4
    9830:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9834:	e1c30df8 	strd	r0, [r3, #216]	; 0xd8
    9838:	e3010d69 	movw	r0, #7529	; 0x1d69
    983c:	e3440d55 	movt	r0, #19797	; 0x4d55
    9840:	e3071510 	movw	r1, #29968	; 0x7510
    9844:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9848:	e1c30ef0 	strd	r0, [r3, #224]	; 0xe0
    984c:	e30102c2 	movw	r0, #4802	; 0x12c2
    9850:	e342080f 	movt	r0, #10255	; 0x280f
    9854:	e307129b 	movw	r1, #29339	; 0x729b
    9858:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    985c:	e1c30ef8 	strd	r0, [r3, #232]	; 0xe8
    9860:	e30109e3 	movw	r0, #6627	; 0x19e3
    9864:	e34f0434 	movt	r0, #62516	; 0xf434
    9868:	e307104f 	movw	r1, #28751	; 0x704f
    986c:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9870:	e1c30ff0 	strd	r0, [r3, #240]	; 0xf0
    9874:	e30302ca 	movw	r0, #13002	; 0x32ca
    9878:	e34b01c4 	movt	r0, #45508	; 0xb1c4
    987c:	e3061e2e 	movw	r1, #28206	; 0x6e2e
    9880:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    9884:	e1c30ff8 	strd	r0, [r3, #248]	; 0xf8
    9888:	e2833c01 	add	r3, r3, #256	; 0x100
    988c:	e30d0495 	movw	r0, #54421	; 0xd495
    9890:	e3460809 	movt	r0, #26633	; 0x6809
    9894:	e3061c22 	movw	r1, #27682	; 0x6c22
    9898:	e3431fe6 	movt	r1, #16358	; 0x3fe6
    989c:	e1c300f0 	strd	r0, [r3]
    98a0:	e3a06000 	mov	r6, #0
    98a4:	e3a07000 	mov	r7, #0
    98a8:	e3a05000 	mov	r5, #0
    98ac:	e1a04005 	mov	r4, r5
    98b0:	e30c8010 	movw	r8, #49168	; 0xc010
    98b4:	e3408000 	movt	r8, #0
    98b8:	e3a09001 	mov	r9, #1
    98bc:	e30cb018 	movw	fp, #49176	; 0xc018
    98c0:	e340b000 	movt	fp, #0
    98c4:	e5983000 	ldr	r3, [r8]
    98c8:	e0133419 	ands	r3, r3, r9, lsl r4
    98cc:	0a000013 	beq	9920 <scheduler_start+0x310>
    98d0:	e2855001 	add	r5, r5, #1
    98d4:	e0653185 	rsb	r3, r5, r5, lsl #3
    98d8:	e08b3203 	add	r3, fp, r3, lsl #4
    98dc:	e5930004 	ldr	r0, [r3, #4]
    98e0:	e593a008 	ldr	sl, [r3, #8]
    98e4:	eb0001c0 	bl	9fec <__aeabi_ui2d>
    98e8:	e1cd00f0 	strd	r0, [sp]
    98ec:	e1a0000a 	mov	r0, sl
    98f0:	eb0001bd 	bl	9fec <__aeabi_ui2d>
    98f4:	e1a02000 	mov	r2, r0
    98f8:	e1a03001 	mov	r3, r1
    98fc:	e1cd00d0 	ldrd	r0, [sp]
    9900:	eb00029d 	bl	a37c <__aeabi_ddiv>
    9904:	e1a02000 	mov	r2, r0
    9908:	e1a03001 	mov	r3, r1
    990c:	e1a00006 	mov	r0, r6
    9910:	e1a01007 	mov	r1, r7
    9914:	eb0000f0 	bl	9cdc <__adddf3>
    9918:	e1a06000 	mov	r6, r0
    991c:	e1a07001 	mov	r7, r1
    9920:	e2844001 	add	r4, r4, #1
    9924:	e354001f 	cmp	r4, #31
    9928:	1affffe5 	bne	98c4 <scheduler_start+0x2b4>
    992c:	e30c3e18 	movw	r3, #52760	; 0xce18
    9930:	e3403000 	movt	r3, #0
    9934:	e1a05185 	lsl	r5, r5, #3
    9938:	e1a00006 	mov	r0, r6
    993c:	e1a01007 	mov	r1, r7
    9940:	e18320d5 	ldrd	r2, [r3, r5]
    9944:	eb00035a 	bl	a6b4 <__aeabi_dcmpgt>
    9948:	e3500000 	cmp	r0, #0
    994c:	1a000011 	bne	9998 <scheduler_start+0x388>
    9950:	e30c3014 	movw	r3, #49172	; 0xc014
    9954:	e3403000 	movt	r3, #0
    9958:	e3a02000 	mov	r2, #0
    995c:	e5832000 	str	r2, [r3]
    9960:	e30c300c 	movw	r3, #49164	; 0xc00c
    9964:	e3403000 	movt	r3, #0
    9968:	e5832000 	str	r2, [r3]
    996c:	e30c3018 	movw	r3, #49176	; 0xc018
    9970:	e3403000 	movt	r3, #0
    9974:	e5c32d90 	strb	r2, [r3, #3472]	; 0xd90
    9978:	e30c3008 	movw	r3, #49160	; 0xc008
    997c:	e3403000 	movt	r3, #0
    9980:	e3a0201f 	mov	r2, #31
    9984:	e5832000 	str	r2, [r3]
    9988:	eb00005b 	bl	9afc <enable_interrupts>
    998c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    9990:	ebfffd95 	bl	8fec <timer_start>
    9994:	eafffffe 	b	9994 <scheduler_start+0x384>
    9998:	e3e00000 	mvn	r0, #0
    999c:	e28dd00c 	add	sp, sp, #12
    99a0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000099a4 <wait_until_next_period>:
    99a4:	e30c3008 	movw	r3, #49160	; 0xc008
    99a8:	e3403000 	movt	r3, #0
    99ac:	e5933000 	ldr	r3, [r3]
    99b0:	e30c2018 	movw	r2, #49176	; 0xc018
    99b4:	e3402000 	movt	r2, #0
    99b8:	e0633183 	rsb	r3, r3, r3, lsl #3
    99bc:	e1a03203 	lsl	r3, r3, #4
    99c0:	e3a01002 	mov	r1, #2
    99c4:	e7c21003 	strb	r1, [r2, r3]
    99c8:	e30c1008 	movw	r1, #49160	; 0xc008
    99cc:	e3401000 	movt	r1, #0
    99d0:	e30c2018 	movw	r2, #49176	; 0xc018
    99d4:	e3402000 	movt	r2, #0
    99d8:	e5913000 	ldr	r3, [r1]
    99dc:	e0633183 	rsb	r3, r3, r3, lsl #3
    99e0:	e7d23203 	ldrb	r3, [r2, r3, lsl #4]
    99e4:	e6ef3073 	uxtb	r3, r3
    99e8:	e3530002 	cmp	r3, #2
    99ec:	0afffff9 	beq	99d8 <wait_until_next_period+0x34>
    99f0:	e12fff1e 	bx	lr

000099f4 <get_time>:
    99f4:	e30c3014 	movw	r3, #49172	; 0xc014
    99f8:	e3403000 	movt	r3, #0
    99fc:	e5930000 	ldr	r0, [r3]
    9a00:	e12fff1e 	bx	lr

00009a04 <spin_wait>:
    9a04:	e30c3008 	movw	r3, #49160	; 0xc008
    9a08:	e3403000 	movt	r3, #0
    9a0c:	e5932000 	ldr	r2, [r3]
    9a10:	e30c3018 	movw	r3, #49176	; 0xc018
    9a14:	e3403000 	movt	r3, #0
    9a18:	e0622182 	rsb	r2, r2, r2, lsl #3
    9a1c:	e0833202 	add	r3, r3, r2, lsl #4
    9a20:	e583001c 	str	r0, [r3, #28]
    9a24:	e30c1008 	movw	r1, #49160	; 0xc008
    9a28:	e3401000 	movt	r1, #0
    9a2c:	e30c2018 	movw	r2, #49176	; 0xc018
    9a30:	e3402000 	movt	r2, #0
    9a34:	e5913000 	ldr	r3, [r1]
    9a38:	e0633183 	rsb	r3, r3, r3, lsl #3
    9a3c:	e0823203 	add	r3, r2, r3, lsl #4
    9a40:	e2833018 	add	r3, r3, #24
    9a44:	e5933004 	ldr	r3, [r3, #4]
    9a48:	e3530000 	cmp	r3, #0
    9a4c:	1afffff8 	bne	9a34 <spin_wait+0x30>
    9a50:	e12fff1e 	bx	lr

00009a54 <syscall_sbrk>:
    9a54:	e30c3000 	movw	r3, #49152	; 0xc000
    9a58:	e3403000 	movt	r3, #0
    9a5c:	e5933000 	ldr	r3, [r3]
    9a60:	e3530000 	cmp	r3, #0
    9a64:	030c3000 	movweq	r3, #49152	; 0xc000
    9a68:	03403000 	movteq	r3, #0
    9a6c:	030d2000 	movweq	r2, #53248	; 0xd000
    9a70:	03402000 	movteq	r2, #0
    9a74:	05832000 	streq	r2, [r3]
    9a78:	e30c3000 	movw	r3, #49152	; 0xc000
    9a7c:	e3403000 	movt	r3, #0
    9a80:	e5933000 	ldr	r3, [r3]
    9a84:	e0830000 	add	r0, r3, r0
    9a88:	e30d2000 	movw	r2, #53248	; 0xd000
    9a8c:	e3402010 	movt	r2, #16
    9a90:	e1500002 	cmp	r0, r2
    9a94:	930c2000 	movwls	r2, #49152	; 0xc000
    9a98:	93402000 	movtls	r2, #0
    9a9c:	95820000 	strls	r0, [r2]
    9aa0:	91a00003 	movls	r0, r3
    9aa4:	83e00000 	mvnhi	r0, #0
    9aa8:	e12fff1e 	bx	lr

00009aac <syscall_close>:
    9aac:	e3e00000 	mvn	r0, #0
    9ab0:	e12fff1e 	bx	lr

00009ab4 <syscall_fstat>:
    9ab4:	e3a00000 	mov	r0, #0
    9ab8:	e12fff1e 	bx	lr

00009abc <syscall_isatty>:
    9abc:	e3a00001 	mov	r0, #1
    9ac0:	e12fff1e 	bx	lr

00009ac4 <syscall_lseek>:
    9ac4:	e3a00000 	mov	r0, #0
    9ac8:	e12fff1e 	bx	lr

00009acc <delay_cycles>:
    9acc:	e2500001 	subs	r0, r0, #1
    9ad0:	1afffffd 	bne	9acc <delay_cycles>
    9ad4:	e1a0f00e 	mov	pc, lr

00009ad8 <read_cpsr>:
    9ad8:	e10f0000 	mrs	r0, CPSR
    9adc:	e1a0f00e 	mov	pc, lr

00009ae0 <write_cpsr>:
    9ae0:	e129f000 	msr	CPSR_fc, r0
    9ae4:	e1a0f00e 	mov	pc, lr

00009ae8 <disable_interrupts>:
    9ae8:	e10f0000 	mrs	r0, CPSR
    9aec:	e3a01d07 	mov	r1, #448	; 0x1c0
    9af0:	e1800001 	orr	r0, r0, r1
    9af4:	e129f000 	msr	CPSR_fc, r0
    9af8:	e1a0f00e 	mov	pc, lr

00009afc <enable_interrupts>:
    9afc:	e10f0000 	mrs	r0, CPSR
    9b00:	e3a01d07 	mov	r1, #448	; 0x1c0
    9b04:	e1c00001 	bic	r0, r0, r1
    9b08:	e129f000 	msr	CPSR_fc, r0
    9b0c:	e1a0f00e 	mov	pc, lr

00009b10 <interrupt_vector_table>:
    9b10:	e59ff018 	ldr	pc, [pc, #24]	; 9b30 <_reset_asm_handler>
    9b14:	e59ff018 	ldr	pc, [pc, #24]	; 9b34 <_undefined_instruction_asm_handler>
    9b18:	e59ff018 	ldr	pc, [pc, #24]	; 9b38 <_swi_asm_handler>
    9b1c:	e59ff018 	ldr	pc, [pc, #24]	; 9b3c <_prefetch_abort_asm_handler>
    9b20:	e59ff018 	ldr	pc, [pc, #24]	; 9b40 <_data_abort_asm_handler>
    9b24:	e59ff004 	ldr	pc, [pc, #4]	; 9b30 <_reset_asm_handler>
    9b28:	e59ff014 	ldr	pc, [pc, #20]	; 9b44 <_irq_asm_handler>
    9b2c:	e59ff014 	ldr	pc, [pc, #20]	; 9b48 <_fiq_asm_handler>

00009b30 <_reset_asm_handler>:
    9b30:	00009c94 	muleq	r0, r4, ip

00009b34 <_undefined_instruction_asm_handler>:
    9b34:	00009c98 	muleq	r0, r8, ip

00009b38 <_swi_asm_handler>:
    9b38:	00009b70 	andeq	r9, r0, r0, ror fp

00009b3c <_prefetch_abort_asm_handler>:
    9b3c:	00009c9c 	muleq	r0, ip, ip

00009b40 <_data_abort_asm_handler>:
    9b40:	00009ca0 	andeq	r9, r0, r0, lsr #25

00009b44 <_irq_asm_handler>:
    9b44:	00009bcc 	andeq	r9, r0, ip, asr #23

00009b48 <_fiq_asm_handler>:
    9b48:	00009ca4 	andeq	r9, r0, r4, lsr #25

00009b4c <install_interrupt_table>:
    9b4c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    9b50:	e59f016c 	ldr	r0, [pc, #364]	; 9cc4 <enter_user_mode+0x1c>
    9b54:	e3a01000 	mov	r1, #0
    9b58:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    9b5c:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    9b60:	e8b001fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8}
    9b64:	e8a101fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8}
    9b68:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    9b6c:	e12fff1e 	bx	lr

00009b70 <swi_asm_handler>:
    9b70:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    9b74:	e24dd008 	sub	sp, sp, #8
    9b78:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    9b7c:	e1a0100d 	mov	r1, sp
    9b80:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    9b84:	e14f2000 	mrs	r2, SPSR
    9b88:	e5812038 	str	r2, [r1, #56]	; 0x38
    9b8c:	e581e03c 	str	lr, [r1, #60]	; 0x3c
    9b90:	e51e0004 	ldr	r0, [lr, #-4]
    9b94:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    9b98:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    9b9c:	ebfffbfc 	bl	8b94 <swi_c_handler>
    9ba0:	e1a0100d 	mov	r1, sp
    9ba4:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    9ba8:	e591e03c 	ldr	lr, [r1, #60]	; 0x3c
    9bac:	e5912038 	ldr	r2, [r1, #56]	; 0x38
    9bb0:	e169f002 	msr	SPSR_fc, r2
    9bb4:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    9bb8:	e28dd004 	add	sp, sp, #4
    9bbc:	e8bd5ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    9bc0:	e28dd008 	add	sp, sp, #8
    9bc4:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    9bc8:	e1b0f00e 	movs	pc, lr

00009bcc <irq_asm_handler>:
    9bcc:	e59fd0f4 	ldr	sp, [pc, #244]	; 9cc8 <enter_user_mode+0x20>
    9bd0:	e94d7fff 	stmdb	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    9bd4:	e24dd03c 	sub	sp, sp, #60	; 0x3c
    9bd8:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    9bdc:	e14f0000 	mrs	r0, SPSR
    9be0:	e1a0100d 	mov	r1, sp
    9be4:	e1a0200e 	mov	r2, lr
    9be8:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    9bec:	e92d0007 	push	{r0, r1, r2}
    9bf0:	e14f0000 	mrs	r0, SPSR
    9bf4:	e24ee004 	sub	lr, lr, #4
    9bf8:	e92d4001 	push	{r0, lr}
    9bfc:	e1a0000d 	mov	r0, sp
    9c00:	ebfffbcd 	bl	8b3c <irq_c_handler>
    9c04:	e8bd4001 	pop	{r0, lr}
    9c08:	e169f000 	msr	SPSR_fc, r0
    9c0c:	e8bd0007 	pop	{r0, r1, r2}
    9c10:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    9c14:	e169f000 	msr	SPSR_fc, r0
    9c18:	e1a0d001 	mov	sp, r1
    9c1c:	e1a0e002 	mov	lr, r2
    9c20:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    9c24:	e8dd7fff 	ldm	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    9c28:	e28dd03c 	add	sp, sp, #60	; 0x3c
    9c2c:	e1b0f00e 	movs	pc, lr
    9c30:	e59fd090 	ldr	sp, [pc, #144]	; 9cc8 <enter_user_mode+0x20>
    9c34:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    9c38:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    9c3c:	e1a0000d 	mov	r0, sp
    9c40:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    9c44:	e14f1000 	mrs	r1, SPSR
    9c48:	e9204002 	stmdb	r0!, {r1, lr}
    9c4c:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    9c50:	e24ee004 	sub	lr, lr, #4
    9c54:	e14f1000 	mrs	r1, SPSR
    9c58:	e9200002 	stmdb	r0!, {r1}
    9c5c:	e92d4000 	stmfd	sp!, {lr}
    9c60:	e1a0100d 	mov	r1, sp
    9c64:	ebfffbb4 	bl	8b3c <irq_c_handler>
    9c68:	e8bd4000 	ldmfd	sp!, {lr}
    9c6c:	e8b00002 	ldm	r0!, {r1}
    9c70:	e169f001 	msr	SPSR_fc, r1
    9c74:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    9c78:	e8b04002 	ldm	r0!, {r1, lr}
    9c7c:	e169f001 	msr	SPSR_fc, r1
    9c80:	e321f0df 	msr	CPSR_c, #223	; 0xdf
    9c84:	e1a0d000 	mov	sp, r0
    9c88:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    9c8c:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    9c90:	e1b0f00e 	movs	pc, lr

00009c94 <reset_asm_handler>:
    9c94:	eafff8d9 	b	8000 <__start>

00009c98 <undefined_instruction_asm_handler>:
    9c98:	e1200070 	bkpt	0x0000

00009c9c <prefetch_abort_asm_handler>:
    9c9c:	e1200070 	bkpt	0x0000

00009ca0 <data_abort_asm_handler>:
    9ca0:	e1200070 	bkpt	0x0000

00009ca4 <fiq_asm_handler>:
    9ca4:	e1200070 	bkpt	0x0000

00009ca8 <enter_user_mode>:
    9ca8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    9cac:	e10f0000 	mrs	r0, CPSR
    9cb0:	e3c000ff 	bic	r0, r0, #255	; 0xff
    9cb4:	e38000d0 	orr	r0, r0, #208	; 0xd0
    9cb8:	e121f000 	msr	CPSR_c, r0
    9cbc:	e59fd008 	ldr	sp, [pc, #8]	; 9ccc <enter_user_mode+0x24>
    9cc0:	ea0bd8ce 	b	300000 <__user_program>
    9cc4:	00009b10 	andeq	r9, r0, r0, lsl fp
    9cc8:	0012e000 	andseq	lr, r2, r0
    9ccc:	0012d000 	andseq	sp, r2, r0

00009cd0 <__aeabi_drsub>:
    9cd0:	e2211102 	eor	r1, r1, #-2147483648	; 0x80000000
    9cd4:	ea000000 	b	9cdc <__adddf3>

00009cd8 <__aeabi_dsub>:
    9cd8:	e2233102 	eor	r3, r3, #-2147483648	; 0x80000000

00009cdc <__adddf3>:
    9cdc:	e92d4030 	push	{r4, r5, lr}
    9ce0:	e1a04081 	lsl	r4, r1, #1
    9ce4:	e1a05083 	lsl	r5, r3, #1
    9ce8:	e1340005 	teq	r4, r5
    9cec:	01300002 	teqeq	r0, r2
    9cf0:	1194c000 	orrsne	ip, r4, r0
    9cf4:	1195c002 	orrsne	ip, r5, r2
    9cf8:	11f0cac4 	mvnsne	ip, r4, asr #21
    9cfc:	11f0cac5 	mvnsne	ip, r5, asr #21
    9d00:	0a00008c 	beq	9f38 <__adddf3+0x25c>
    9d04:	e1a04aa4 	lsr	r4, r4, #21
    9d08:	e0745aa5 	rsbs	r5, r4, r5, lsr #21
    9d0c:	b2655000 	rsblt	r5, r5, #0
    9d10:	da000006 	ble	9d30 <__adddf3+0x54>
    9d14:	e0844005 	add	r4, r4, r5
    9d18:	e0202002 	eor	r2, r0, r2
    9d1c:	e0213003 	eor	r3, r1, r3
    9d20:	e0220000 	eor	r0, r2, r0
    9d24:	e0231001 	eor	r1, r3, r1
    9d28:	e0202002 	eor	r2, r0, r2
    9d2c:	e0213003 	eor	r3, r1, r3
    9d30:	e3550036 	cmp	r5, #54	; 0x36
    9d34:	88bd4030 	pophi	{r4, r5, lr}
    9d38:	812fff1e 	bxhi	lr
    9d3c:	e3110102 	tst	r1, #-2147483648	; 0x80000000
    9d40:	e1a01601 	lsl	r1, r1, #12
    9d44:	e3a0c601 	mov	ip, #1048576	; 0x100000
    9d48:	e18c1621 	orr	r1, ip, r1, lsr #12
    9d4c:	0a000001 	beq	9d58 <__adddf3+0x7c>
    9d50:	e2700000 	rsbs	r0, r0, #0
    9d54:	e2e11000 	rsc	r1, r1, #0
    9d58:	e3130102 	tst	r3, #-2147483648	; 0x80000000
    9d5c:	e1a03603 	lsl	r3, r3, #12
    9d60:	e18c3623 	orr	r3, ip, r3, lsr #12
    9d64:	0a000001 	beq	9d70 <__adddf3+0x94>
    9d68:	e2722000 	rsbs	r2, r2, #0
    9d6c:	e2e33000 	rsc	r3, r3, #0
    9d70:	e1340005 	teq	r4, r5
    9d74:	0a000069 	beq	9f20 <__adddf3+0x244>
    9d78:	e2444001 	sub	r4, r4, #1
    9d7c:	e275e020 	rsbs	lr, r5, #32
    9d80:	ba000005 	blt	9d9c <__adddf3+0xc0>
    9d84:	e1a0ce12 	lsl	ip, r2, lr
    9d88:	e0900532 	adds	r0, r0, r2, lsr r5
    9d8c:	e2a11000 	adc	r1, r1, #0
    9d90:	e0900e13 	adds	r0, r0, r3, lsl lr
    9d94:	e0b11553 	adcs	r1, r1, r3, asr r5
    9d98:	ea000006 	b	9db8 <__adddf3+0xdc>
    9d9c:	e2455020 	sub	r5, r5, #32
    9da0:	e28ee020 	add	lr, lr, #32
    9da4:	e3520001 	cmp	r2, #1
    9da8:	e1a0ce13 	lsl	ip, r3, lr
    9dac:	238cc002 	orrcs	ip, ip, #2
    9db0:	e0900553 	adds	r0, r0, r3, asr r5
    9db4:	e0b11fc3 	adcs	r1, r1, r3, asr #31
    9db8:	e2015102 	and	r5, r1, #-2147483648	; 0x80000000
    9dbc:	5a000002 	bpl	9dcc <__adddf3+0xf0>
    9dc0:	e27cc000 	rsbs	ip, ip, #0
    9dc4:	e2f00000 	rscs	r0, r0, #0
    9dc8:	e2e11000 	rsc	r1, r1, #0
    9dcc:	e3510601 	cmp	r1, #1048576	; 0x100000
    9dd0:	3a00000f 	bcc	9e14 <__adddf3+0x138>
    9dd4:	e3510602 	cmp	r1, #2097152	; 0x200000
    9dd8:	3a000006 	bcc	9df8 <__adddf3+0x11c>
    9ddc:	e1b010a1 	lsrs	r1, r1, #1
    9de0:	e1b00060 	rrxs	r0, r0
    9de4:	e1a0c06c 	rrx	ip, ip
    9de8:	e2844001 	add	r4, r4, #1
    9dec:	e1a02a84 	lsl	r2, r4, #21
    9df0:	e3720501 	cmn	r2, #4194304	; 0x400000
    9df4:	2a00006b 	bcs	9fa8 <__adddf3+0x2cc>
    9df8:	e35c0102 	cmp	ip, #-2147483648	; 0x80000000
    9dfc:	01b0c0a0 	lsrseq	ip, r0, #1
    9e00:	e2b00000 	adcs	r0, r0, #0
    9e04:	e0a11a04 	adc	r1, r1, r4, lsl #20
    9e08:	e1811005 	orr	r1, r1, r5
    9e0c:	e8bd4030 	pop	{r4, r5, lr}
    9e10:	e12fff1e 	bx	lr
    9e14:	e1b0c08c 	lsls	ip, ip, #1
    9e18:	e0b00000 	adcs	r0, r0, r0
    9e1c:	e0a11001 	adc	r1, r1, r1
    9e20:	e3110601 	tst	r1, #1048576	; 0x100000
    9e24:	e2444001 	sub	r4, r4, #1
    9e28:	1afffff2 	bne	9df8 <__adddf3+0x11c>
    9e2c:	e3310000 	teq	r1, #0
    9e30:	13a03014 	movne	r3, #20
    9e34:	03a03034 	moveq	r3, #52	; 0x34
    9e38:	01a01000 	moveq	r1, r0
    9e3c:	03a00000 	moveq	r0, #0
    9e40:	e1a02001 	mov	r2, r1
    9e44:	e3520801 	cmp	r2, #65536	; 0x10000
    9e48:	21a02822 	lsrcs	r2, r2, #16
    9e4c:	22433010 	subcs	r3, r3, #16
    9e50:	e3520c01 	cmp	r2, #256	; 0x100
    9e54:	21a02422 	lsrcs	r2, r2, #8
    9e58:	22433008 	subcs	r3, r3, #8
    9e5c:	e3520010 	cmp	r2, #16
    9e60:	21a02222 	lsrcs	r2, r2, #4
    9e64:	22433004 	subcs	r3, r3, #4
    9e68:	e3520004 	cmp	r2, #4
    9e6c:	22433002 	subcs	r3, r3, #2
    9e70:	304330a2 	subcc	r3, r3, r2, lsr #1
    9e74:	e04331a2 	sub	r3, r3, r2, lsr #3
    9e78:	e2532020 	subs	r2, r3, #32
    9e7c:	aa000007 	bge	9ea0 <__adddf3+0x1c4>
    9e80:	e292200c 	adds	r2, r2, #12
    9e84:	da000004 	ble	9e9c <__adddf3+0x1c0>
    9e88:	e282c014 	add	ip, r2, #20
    9e8c:	e262200c 	rsb	r2, r2, #12
    9e90:	e1a00c11 	lsl	r0, r1, ip
    9e94:	e1a01231 	lsr	r1, r1, r2
    9e98:	ea000004 	b	9eb0 <__adddf3+0x1d4>
    9e9c:	e2822014 	add	r2, r2, #20
    9ea0:	d262c020 	rsble	ip, r2, #32
    9ea4:	e1a01211 	lsl	r1, r1, r2
    9ea8:	d1811c30 	orrle	r1, r1, r0, lsr ip
    9eac:	d1a00210 	lslle	r0, r0, r2
    9eb0:	e0544003 	subs	r4, r4, r3
    9eb4:	a0811a04 	addge	r1, r1, r4, lsl #20
    9eb8:	a1811005 	orrge	r1, r1, r5
    9ebc:	a8bd4030 	popge	{r4, r5, lr}
    9ec0:	a12fff1e 	bxge	lr
    9ec4:	e1e04004 	mvn	r4, r4
    9ec8:	e254401f 	subs	r4, r4, #31
    9ecc:	aa00000f 	bge	9f10 <__adddf3+0x234>
    9ed0:	e294400c 	adds	r4, r4, #12
    9ed4:	ca000006 	bgt	9ef4 <__adddf3+0x218>
    9ed8:	e2844014 	add	r4, r4, #20
    9edc:	e2642020 	rsb	r2, r4, #32
    9ee0:	e1a00430 	lsr	r0, r0, r4
    9ee4:	e1800211 	orr	r0, r0, r1, lsl r2
    9ee8:	e1851431 	orr	r1, r5, r1, lsr r4
    9eec:	e8bd4030 	pop	{r4, r5, lr}
    9ef0:	e12fff1e 	bx	lr
    9ef4:	e264400c 	rsb	r4, r4, #12
    9ef8:	e2642020 	rsb	r2, r4, #32
    9efc:	e1a00230 	lsr	r0, r0, r2
    9f00:	e1800411 	orr	r0, r0, r1, lsl r4
    9f04:	e1a01005 	mov	r1, r5
    9f08:	e8bd4030 	pop	{r4, r5, lr}
    9f0c:	e12fff1e 	bx	lr
    9f10:	e1a00431 	lsr	r0, r1, r4
    9f14:	e1a01005 	mov	r1, r5
    9f18:	e8bd4030 	pop	{r4, r5, lr}
    9f1c:	e12fff1e 	bx	lr
    9f20:	e3340000 	teq	r4, #0
    9f24:	e2233601 	eor	r3, r3, #1048576	; 0x100000
    9f28:	02211601 	eoreq	r1, r1, #1048576	; 0x100000
    9f2c:	02844001 	addeq	r4, r4, #1
    9f30:	12455001 	subne	r5, r5, #1
    9f34:	eaffff8f 	b	9d78 <__adddf3+0x9c>
    9f38:	e1f0cac4 	mvns	ip, r4, asr #21
    9f3c:	11f0cac5 	mvnsne	ip, r5, asr #21
    9f40:	0a00001d 	beq	9fbc <__adddf3+0x2e0>
    9f44:	e1340005 	teq	r4, r5
    9f48:	01300002 	teqeq	r0, r2
    9f4c:	0a000004 	beq	9f64 <__adddf3+0x288>
    9f50:	e194c000 	orrs	ip, r4, r0
    9f54:	01a01003 	moveq	r1, r3
    9f58:	01a00002 	moveq	r0, r2
    9f5c:	e8bd4030 	pop	{r4, r5, lr}
    9f60:	e12fff1e 	bx	lr
    9f64:	e1310003 	teq	r1, r3
    9f68:	13a01000 	movne	r1, #0
    9f6c:	13a00000 	movne	r0, #0
    9f70:	18bd4030 	popne	{r4, r5, lr}
    9f74:	112fff1e 	bxne	lr
    9f78:	e1b0caa4 	lsrs	ip, r4, #21
    9f7c:	1a000004 	bne	9f94 <__adddf3+0x2b8>
    9f80:	e1b00080 	lsls	r0, r0, #1
    9f84:	e0b11001 	adcs	r1, r1, r1
    9f88:	23811102 	orrcs	r1, r1, #-2147483648	; 0x80000000
    9f8c:	e8bd4030 	pop	{r4, r5, lr}
    9f90:	e12fff1e 	bx	lr
    9f94:	e2944501 	adds	r4, r4, #4194304	; 0x400000
    9f98:	32811601 	addcc	r1, r1, #1048576	; 0x100000
    9f9c:	38bd4030 	popcc	{r4, r5, lr}
    9fa0:	312fff1e 	bxcc	lr
    9fa4:	e2015102 	and	r5, r1, #-2147483648	; 0x80000000
    9fa8:	e385147f 	orr	r1, r5, #2130706432	; 0x7f000000
    9fac:	e381160f 	orr	r1, r1, #15728640	; 0xf00000
    9fb0:	e3a00000 	mov	r0, #0
    9fb4:	e8bd4030 	pop	{r4, r5, lr}
    9fb8:	e12fff1e 	bx	lr
    9fbc:	e1f0cac4 	mvns	ip, r4, asr #21
    9fc0:	11a01003 	movne	r1, r3
    9fc4:	11a00002 	movne	r0, r2
    9fc8:	01f0cac5 	mvnseq	ip, r5, asr #21
    9fcc:	11a03001 	movne	r3, r1
    9fd0:	11a02000 	movne	r2, r0
    9fd4:	e1904601 	orrs	r4, r0, r1, lsl #12
    9fd8:	01925603 	orrseq	r5, r2, r3, lsl #12
    9fdc:	01310003 	teqeq	r1, r3
    9fe0:	13811702 	orrne	r1, r1, #524288	; 0x80000
    9fe4:	e8bd4030 	pop	{r4, r5, lr}
    9fe8:	e12fff1e 	bx	lr

00009fec <__aeabi_ui2d>:
    9fec:	e3300000 	teq	r0, #0
    9ff0:	03a01000 	moveq	r1, #0
    9ff4:	012fff1e 	bxeq	lr
    9ff8:	e92d4030 	push	{r4, r5, lr}
    9ffc:	e3a04b01 	mov	r4, #1024	; 0x400
    a000:	e2844032 	add	r4, r4, #50	; 0x32
    a004:	e3a05000 	mov	r5, #0
    a008:	e3a01000 	mov	r1, #0
    a00c:	eaffff86 	b	9e2c <__adddf3+0x150>

0000a010 <__aeabi_i2d>:
    a010:	e3300000 	teq	r0, #0
    a014:	03a01000 	moveq	r1, #0
    a018:	012fff1e 	bxeq	lr
    a01c:	e92d4030 	push	{r4, r5, lr}
    a020:	e3a04b01 	mov	r4, #1024	; 0x400
    a024:	e2844032 	add	r4, r4, #50	; 0x32
    a028:	e2105102 	ands	r5, r0, #-2147483648	; 0x80000000
    a02c:	42600000 	rsbmi	r0, r0, #0
    a030:	e3a01000 	mov	r1, #0
    a034:	eaffff7c 	b	9e2c <__adddf3+0x150>

0000a038 <__aeabi_f2d>:
    a038:	e1b02080 	lsls	r2, r0, #1
    a03c:	e1a011c2 	asr	r1, r2, #3
    a040:	e1a01061 	rrx	r1, r1
    a044:	e1a00e02 	lsl	r0, r2, #28
    a048:	121234ff 	andsne	r3, r2, #-16777216	; 0xff000000
    a04c:	133304ff 	teqne	r3, #-16777216	; 0xff000000
    a050:	1221130e 	eorne	r1, r1, #939524096	; 0x38000000
    a054:	112fff1e 	bxne	lr
    a058:	e3320000 	teq	r2, #0
    a05c:	133304ff 	teqne	r3, #-16777216	; 0xff000000
    a060:	012fff1e 	bxeq	lr
    a064:	e92d4030 	push	{r4, r5, lr}
    a068:	e3a04d0e 	mov	r4, #896	; 0x380
    a06c:	e2015102 	and	r5, r1, #-2147483648	; 0x80000000
    a070:	e3c11102 	bic	r1, r1, #-2147483648	; 0x80000000
    a074:	eaffff6c 	b	9e2c <__adddf3+0x150>

0000a078 <__aeabi_ul2d>:
    a078:	e1902001 	orrs	r2, r0, r1
    a07c:	012fff1e 	bxeq	lr
    a080:	e92d4030 	push	{r4, r5, lr}
    a084:	e3a05000 	mov	r5, #0
    a088:	ea000006 	b	a0a8 <__aeabi_l2d+0x1c>

0000a08c <__aeabi_l2d>:
    a08c:	e1902001 	orrs	r2, r0, r1
    a090:	012fff1e 	bxeq	lr
    a094:	e92d4030 	push	{r4, r5, lr}
    a098:	e2115102 	ands	r5, r1, #-2147483648	; 0x80000000
    a09c:	5a000001 	bpl	a0a8 <__aeabi_l2d+0x1c>
    a0a0:	e2700000 	rsbs	r0, r0, #0
    a0a4:	e2e11000 	rsc	r1, r1, #0
    a0a8:	e3a04b01 	mov	r4, #1024	; 0x400
    a0ac:	e2844032 	add	r4, r4, #50	; 0x32
    a0b0:	e1b0cb21 	lsrs	ip, r1, #22
    a0b4:	0affff44 	beq	9dcc <__adddf3+0xf0>
    a0b8:	e3a02003 	mov	r2, #3
    a0bc:	e1b0c1ac 	lsrs	ip, ip, #3
    a0c0:	12822003 	addne	r2, r2, #3
    a0c4:	e1b0c1ac 	lsrs	ip, ip, #3
    a0c8:	12822003 	addne	r2, r2, #3
    a0cc:	e08221ac 	add	r2, r2, ip, lsr #3
    a0d0:	e2623020 	rsb	r3, r2, #32
    a0d4:	e1a0c310 	lsl	ip, r0, r3
    a0d8:	e1a00230 	lsr	r0, r0, r2
    a0dc:	e1800311 	orr	r0, r0, r1, lsl r3
    a0e0:	e1a01231 	lsr	r1, r1, r2
    a0e4:	e0844002 	add	r4, r4, r2
    a0e8:	eaffff37 	b	9dcc <__adddf3+0xf0>

0000a0ec <__aeabi_dmul>:
    a0ec:	e92d4070 	push	{r4, r5, r6, lr}
    a0f0:	e3a0c0ff 	mov	ip, #255	; 0xff
    a0f4:	e38ccc07 	orr	ip, ip, #1792	; 0x700
    a0f8:	e01c4a21 	ands	r4, ip, r1, lsr #20
    a0fc:	101c5a23 	andsne	r5, ip, r3, lsr #20
    a100:	1134000c 	teqne	r4, ip
    a104:	1135000c 	teqne	r5, ip
    a108:	0b000075 	bleq	a2e4 <__aeabi_dmul+0x1f8>
    a10c:	e0844005 	add	r4, r4, r5
    a110:	e0216003 	eor	r6, r1, r3
    a114:	e1c11a8c 	bic	r1, r1, ip, lsl #21
    a118:	e1c33a8c 	bic	r3, r3, ip, lsl #21
    a11c:	e1905601 	orrs	r5, r0, r1, lsl #12
    a120:	11925603 	orrsne	r5, r2, r3, lsl #12
    a124:	e3811601 	orr	r1, r1, #1048576	; 0x100000
    a128:	e3833601 	orr	r3, r3, #1048576	; 0x100000
    a12c:	0a00001d 	beq	a1a8 <__aeabi_dmul+0xbc>
    a130:	e08ec290 	umull	ip, lr, r0, r2
    a134:	e3a05000 	mov	r5, #0
    a138:	e0a5e291 	umlal	lr, r5, r1, r2
    a13c:	e2062102 	and	r2, r6, #-2147483648	; 0x80000000
    a140:	e0a5e390 	umlal	lr, r5, r0, r3
    a144:	e3a06000 	mov	r6, #0
    a148:	e0a65391 	umlal	r5, r6, r1, r3
    a14c:	e33c0000 	teq	ip, #0
    a150:	138ee001 	orrne	lr, lr, #1
    a154:	e24440ff 	sub	r4, r4, #255	; 0xff
    a158:	e3560c02 	cmp	r6, #512	; 0x200
    a15c:	e2c44c03 	sbc	r4, r4, #768	; 0x300
    a160:	2a000002 	bcs	a170 <__aeabi_dmul+0x84>
    a164:	e1b0e08e 	lsls	lr, lr, #1
    a168:	e0b55005 	adcs	r5, r5, r5
    a16c:	e0a66006 	adc	r6, r6, r6
    a170:	e1821586 	orr	r1, r2, r6, lsl #11
    a174:	e1811aa5 	orr	r1, r1, r5, lsr #21
    a178:	e1a00585 	lsl	r0, r5, #11
    a17c:	e1800aae 	orr	r0, r0, lr, lsr #21
    a180:	e1a0e58e 	lsl	lr, lr, #11
    a184:	e254c0fd 	subs	ip, r4, #253	; 0xfd
    a188:	835c0c07 	cmphi	ip, #1792	; 0x700
    a18c:	8a000011 	bhi	a1d8 <__aeabi_dmul+0xec>
    a190:	e35e0102 	cmp	lr, #-2147483648	; 0x80000000
    a194:	01b0e0a0 	lsrseq	lr, r0, #1
    a198:	e2b00000 	adcs	r0, r0, #0
    a19c:	e0a11a04 	adc	r1, r1, r4, lsl #20
    a1a0:	e8bd4070 	pop	{r4, r5, r6, lr}
    a1a4:	e12fff1e 	bx	lr
    a1a8:	e2066102 	and	r6, r6, #-2147483648	; 0x80000000
    a1ac:	e1861001 	orr	r1, r6, r1
    a1b0:	e1800002 	orr	r0, r0, r2
    a1b4:	e0211003 	eor	r1, r1, r3
    a1b8:	e05440ac 	subs	r4, r4, ip, lsr #1
    a1bc:	c074500c 	rsbsgt	r5, r4, ip
    a1c0:	c1811a04 	orrgt	r1, r1, r4, lsl #20
    a1c4:	c8bd4070 	popgt	{r4, r5, r6, lr}
    a1c8:	c12fff1e 	bxgt	lr
    a1cc:	e3811601 	orr	r1, r1, #1048576	; 0x100000
    a1d0:	e3a0e000 	mov	lr, #0
    a1d4:	e2544001 	subs	r4, r4, #1
    a1d8:	ca00005d 	bgt	a354 <__aeabi_dmul+0x268>
    a1dc:	e3740036 	cmn	r4, #54	; 0x36
    a1e0:	d3a00000 	movle	r0, #0
    a1e4:	d2011102 	andle	r1, r1, #-2147483648	; 0x80000000
    a1e8:	d8bd4070 	pople	{r4, r5, r6, lr}
    a1ec:	d12fff1e 	bxle	lr
    a1f0:	e2644000 	rsb	r4, r4, #0
    a1f4:	e2544020 	subs	r4, r4, #32
    a1f8:	aa00001a 	bge	a268 <__aeabi_dmul+0x17c>
    a1fc:	e294400c 	adds	r4, r4, #12
    a200:	ca00000c 	bgt	a238 <__aeabi_dmul+0x14c>
    a204:	e2844014 	add	r4, r4, #20
    a208:	e2645020 	rsb	r5, r4, #32
    a20c:	e1a03510 	lsl	r3, r0, r5
    a210:	e1a00430 	lsr	r0, r0, r4
    a214:	e1800511 	orr	r0, r0, r1, lsl r5
    a218:	e2012102 	and	r2, r1, #-2147483648	; 0x80000000
    a21c:	e3c11102 	bic	r1, r1, #-2147483648	; 0x80000000
    a220:	e0900fa3 	adds	r0, r0, r3, lsr #31
    a224:	e0a21431 	adc	r1, r2, r1, lsr r4
    a228:	e19ee083 	orrs	lr, lr, r3, lsl #1
    a22c:	01c00fa3 	biceq	r0, r0, r3, lsr #31
    a230:	e8bd4070 	pop	{r4, r5, r6, lr}
    a234:	e12fff1e 	bx	lr
    a238:	e264400c 	rsb	r4, r4, #12
    a23c:	e2645020 	rsb	r5, r4, #32
    a240:	e1a03410 	lsl	r3, r0, r4
    a244:	e1a00530 	lsr	r0, r0, r5
    a248:	e1800411 	orr	r0, r0, r1, lsl r4
    a24c:	e2011102 	and	r1, r1, #-2147483648	; 0x80000000
    a250:	e0900fa3 	adds	r0, r0, r3, lsr #31
    a254:	e2a11000 	adc	r1, r1, #0
    a258:	e19ee083 	orrs	lr, lr, r3, lsl #1
    a25c:	01c00fa3 	biceq	r0, r0, r3, lsr #31
    a260:	e8bd4070 	pop	{r4, r5, r6, lr}
    a264:	e12fff1e 	bx	lr
    a268:	e2645020 	rsb	r5, r4, #32
    a26c:	e18ee510 	orr	lr, lr, r0, lsl r5
    a270:	e1a03430 	lsr	r3, r0, r4
    a274:	e1833511 	orr	r3, r3, r1, lsl r5
    a278:	e1a00431 	lsr	r0, r1, r4
    a27c:	e2011102 	and	r1, r1, #-2147483648	; 0x80000000
    a280:	e1c00431 	bic	r0, r0, r1, lsr r4
    a284:	e0800fa3 	add	r0, r0, r3, lsr #31
    a288:	e19ee083 	orrs	lr, lr, r3, lsl #1
    a28c:	01c00fa3 	biceq	r0, r0, r3, lsr #31
    a290:	e8bd4070 	pop	{r4, r5, r6, lr}
    a294:	e12fff1e 	bx	lr
    a298:	e3340000 	teq	r4, #0
    a29c:	1a000008 	bne	a2c4 <__aeabi_dmul+0x1d8>
    a2a0:	e2016102 	and	r6, r1, #-2147483648	; 0x80000000
    a2a4:	e1b00080 	lsls	r0, r0, #1
    a2a8:	e0a11001 	adc	r1, r1, r1
    a2ac:	e3110601 	tst	r1, #1048576	; 0x100000
    a2b0:	02444001 	subeq	r4, r4, #1
    a2b4:	0afffffa 	beq	a2a4 <__aeabi_dmul+0x1b8>
    a2b8:	e1811006 	orr	r1, r1, r6
    a2bc:	e3350000 	teq	r5, #0
    a2c0:	112fff1e 	bxne	lr
    a2c4:	e2036102 	and	r6, r3, #-2147483648	; 0x80000000
    a2c8:	e1b02082 	lsls	r2, r2, #1
    a2cc:	e0a33003 	adc	r3, r3, r3
    a2d0:	e3130601 	tst	r3, #1048576	; 0x100000
    a2d4:	02455001 	subeq	r5, r5, #1
    a2d8:	0afffffa 	beq	a2c8 <__aeabi_dmul+0x1dc>
    a2dc:	e1833006 	orr	r3, r3, r6
    a2e0:	e12fff1e 	bx	lr
    a2e4:	e134000c 	teq	r4, ip
    a2e8:	e00c5a23 	and	r5, ip, r3, lsr #20
    a2ec:	1135000c 	teqne	r5, ip
    a2f0:	0a000007 	beq	a314 <__aeabi_dmul+0x228>
    a2f4:	e1906081 	orrs	r6, r0, r1, lsl #1
    a2f8:	11926083 	orrsne	r6, r2, r3, lsl #1
    a2fc:	1affffe5 	bne	a298 <__aeabi_dmul+0x1ac>
    a300:	e0211003 	eor	r1, r1, r3
    a304:	e2011102 	and	r1, r1, #-2147483648	; 0x80000000
    a308:	e3a00000 	mov	r0, #0
    a30c:	e8bd4070 	pop	{r4, r5, r6, lr}
    a310:	e12fff1e 	bx	lr
    a314:	e1906081 	orrs	r6, r0, r1, lsl #1
    a318:	01a00002 	moveq	r0, r2
    a31c:	01a01003 	moveq	r1, r3
    a320:	11926083 	orrsne	r6, r2, r3, lsl #1
    a324:	0a000010 	beq	a36c <__aeabi_dmul+0x280>
    a328:	e134000c 	teq	r4, ip
    a32c:	1a000001 	bne	a338 <__aeabi_dmul+0x24c>
    a330:	e1906601 	orrs	r6, r0, r1, lsl #12
    a334:	1a00000c 	bne	a36c <__aeabi_dmul+0x280>
    a338:	e135000c 	teq	r5, ip
    a33c:	1a000003 	bne	a350 <__aeabi_dmul+0x264>
    a340:	e1926603 	orrs	r6, r2, r3, lsl #12
    a344:	11a00002 	movne	r0, r2
    a348:	11a01003 	movne	r1, r3
    a34c:	1a000006 	bne	a36c <__aeabi_dmul+0x280>
    a350:	e0211003 	eor	r1, r1, r3
    a354:	e2011102 	and	r1, r1, #-2147483648	; 0x80000000
    a358:	e381147f 	orr	r1, r1, #2130706432	; 0x7f000000
    a35c:	e381160f 	orr	r1, r1, #15728640	; 0xf00000
    a360:	e3a00000 	mov	r0, #0
    a364:	e8bd4070 	pop	{r4, r5, r6, lr}
    a368:	e12fff1e 	bx	lr
    a36c:	e381147f 	orr	r1, r1, #2130706432	; 0x7f000000
    a370:	e381173e 	orr	r1, r1, #16252928	; 0xf80000
    a374:	e8bd4070 	pop	{r4, r5, r6, lr}
    a378:	e12fff1e 	bx	lr

0000a37c <__aeabi_ddiv>:
    a37c:	e92d4070 	push	{r4, r5, r6, lr}
    a380:	e3a0c0ff 	mov	ip, #255	; 0xff
    a384:	e38ccc07 	orr	ip, ip, #1792	; 0x700
    a388:	e01c4a21 	ands	r4, ip, r1, lsr #20
    a38c:	101c5a23 	andsne	r5, ip, r3, lsr #20
    a390:	1134000c 	teqne	r4, ip
    a394:	1135000c 	teqne	r5, ip
    a398:	0b00005e 	bleq	a518 <__aeabi_ddiv+0x19c>
    a39c:	e0444005 	sub	r4, r4, r5
    a3a0:	e021e003 	eor	lr, r1, r3
    a3a4:	e1925603 	orrs	r5, r2, r3, lsl #12
    a3a8:	e1a01601 	lsl	r1, r1, #12
    a3ac:	0a00004c 	beq	a4e4 <__aeabi_ddiv+0x168>
    a3b0:	e1a03603 	lsl	r3, r3, #12
    a3b4:	e3a05201 	mov	r5, #268435456	; 0x10000000
    a3b8:	e1853223 	orr	r3, r5, r3, lsr #4
    a3bc:	e1833c22 	orr	r3, r3, r2, lsr #24
    a3c0:	e1a02402 	lsl	r2, r2, #8
    a3c4:	e1855221 	orr	r5, r5, r1, lsr #4
    a3c8:	e1855c20 	orr	r5, r5, r0, lsr #24
    a3cc:	e1a06400 	lsl	r6, r0, #8
    a3d0:	e20e1102 	and	r1, lr, #-2147483648	; 0x80000000
    a3d4:	e1550003 	cmp	r5, r3
    a3d8:	01560002 	cmpeq	r6, r2
    a3dc:	e2a440fd 	adc	r4, r4, #253	; 0xfd
    a3e0:	e2844c03 	add	r4, r4, #768	; 0x300
    a3e4:	2a000001 	bcs	a3f0 <__aeabi_ddiv+0x74>
    a3e8:	e1b030a3 	lsrs	r3, r3, #1
    a3ec:	e1a02062 	rrx	r2, r2
    a3f0:	e0566002 	subs	r6, r6, r2
    a3f4:	e0c55003 	sbc	r5, r5, r3
    a3f8:	e1b030a3 	lsrs	r3, r3, #1
    a3fc:	e1a02062 	rrx	r2, r2
    a400:	e3a00601 	mov	r0, #1048576	; 0x100000
    a404:	e3a0c702 	mov	ip, #524288	; 0x80000
    a408:	e056e002 	subs	lr, r6, r2
    a40c:	e0d5e003 	sbcs	lr, r5, r3
    a410:	20466002 	subcs	r6, r6, r2
    a414:	21a0500e 	movcs	r5, lr
    a418:	2180000c 	orrcs	r0, r0, ip
    a41c:	e1b030a3 	lsrs	r3, r3, #1
    a420:	e1a02062 	rrx	r2, r2
    a424:	e056e002 	subs	lr, r6, r2
    a428:	e0d5e003 	sbcs	lr, r5, r3
    a42c:	20466002 	subcs	r6, r6, r2
    a430:	21a0500e 	movcs	r5, lr
    a434:	218000ac 	orrcs	r0, r0, ip, lsr #1
    a438:	e1b030a3 	lsrs	r3, r3, #1
    a43c:	e1a02062 	rrx	r2, r2
    a440:	e056e002 	subs	lr, r6, r2
    a444:	e0d5e003 	sbcs	lr, r5, r3
    a448:	20466002 	subcs	r6, r6, r2
    a44c:	21a0500e 	movcs	r5, lr
    a450:	2180012c 	orrcs	r0, r0, ip, lsr #2
    a454:	e1b030a3 	lsrs	r3, r3, #1
    a458:	e1a02062 	rrx	r2, r2
    a45c:	e056e002 	subs	lr, r6, r2
    a460:	e0d5e003 	sbcs	lr, r5, r3
    a464:	20466002 	subcs	r6, r6, r2
    a468:	21a0500e 	movcs	r5, lr
    a46c:	218001ac 	orrcs	r0, r0, ip, lsr #3
    a470:	e195e006 	orrs	lr, r5, r6
    a474:	0a00000d 	beq	a4b0 <__aeabi_ddiv+0x134>
    a478:	e1a05205 	lsl	r5, r5, #4
    a47c:	e1855e26 	orr	r5, r5, r6, lsr #28
    a480:	e1a06206 	lsl	r6, r6, #4
    a484:	e1a03183 	lsl	r3, r3, #3
    a488:	e1833ea2 	orr	r3, r3, r2, lsr #29
    a48c:	e1a02182 	lsl	r2, r2, #3
    a490:	e1b0c22c 	lsrs	ip, ip, #4
    a494:	1affffdb 	bne	a408 <__aeabi_ddiv+0x8c>
    a498:	e3110601 	tst	r1, #1048576	; 0x100000
    a49c:	1a000006 	bne	a4bc <__aeabi_ddiv+0x140>
    a4a0:	e1811000 	orr	r1, r1, r0
    a4a4:	e3a00000 	mov	r0, #0
    a4a8:	e3a0c102 	mov	ip, #-2147483648	; 0x80000000
    a4ac:	eaffffd5 	b	a408 <__aeabi_ddiv+0x8c>
    a4b0:	e3110601 	tst	r1, #1048576	; 0x100000
    a4b4:	01811000 	orreq	r1, r1, r0
    a4b8:	03a00000 	moveq	r0, #0
    a4bc:	e254c0fd 	subs	ip, r4, #253	; 0xfd
    a4c0:	835c0c07 	cmphi	ip, #1792	; 0x700
    a4c4:	8affff43 	bhi	a1d8 <__aeabi_dmul+0xec>
    a4c8:	e055c003 	subs	ip, r5, r3
    a4cc:	0056c002 	subseq	ip, r6, r2
    a4d0:	01b0c0a0 	lsrseq	ip, r0, #1
    a4d4:	e2b00000 	adcs	r0, r0, #0
    a4d8:	e0a11a04 	adc	r1, r1, r4, lsl #20
    a4dc:	e8bd4070 	pop	{r4, r5, r6, lr}
    a4e0:	e12fff1e 	bx	lr
    a4e4:	e20ee102 	and	lr, lr, #-2147483648	; 0x80000000
    a4e8:	e18e1621 	orr	r1, lr, r1, lsr #12
    a4ec:	e09440ac 	adds	r4, r4, ip, lsr #1
    a4f0:	c074500c 	rsbsgt	r5, r4, ip
    a4f4:	c1811a04 	orrgt	r1, r1, r4, lsl #20
    a4f8:	c8bd4070 	popgt	{r4, r5, r6, lr}
    a4fc:	c12fff1e 	bxgt	lr
    a500:	e3811601 	orr	r1, r1, #1048576	; 0x100000
    a504:	e3a0e000 	mov	lr, #0
    a508:	e2544001 	subs	r4, r4, #1
    a50c:	eaffff31 	b	a1d8 <__aeabi_dmul+0xec>
    a510:	e185e006 	orr	lr, r5, r6
    a514:	eaffff2f 	b	a1d8 <__aeabi_dmul+0xec>
    a518:	e00c5a23 	and	r5, ip, r3, lsr #20
    a51c:	e134000c 	teq	r4, ip
    a520:	0135000c 	teqeq	r5, ip
    a524:	0affff90 	beq	a36c <__aeabi_dmul+0x280>
    a528:	e134000c 	teq	r4, ip
    a52c:	1a000006 	bne	a54c <__aeabi_ddiv+0x1d0>
    a530:	e1904601 	orrs	r4, r0, r1, lsl #12
    a534:	1affff8c 	bne	a36c <__aeabi_dmul+0x280>
    a538:	e135000c 	teq	r5, ip
    a53c:	1affff83 	bne	a350 <__aeabi_dmul+0x264>
    a540:	e1a00002 	mov	r0, r2
    a544:	e1a01003 	mov	r1, r3
    a548:	eaffff87 	b	a36c <__aeabi_dmul+0x280>
    a54c:	e135000c 	teq	r5, ip
    a550:	1a000004 	bne	a568 <__aeabi_ddiv+0x1ec>
    a554:	e1925603 	orrs	r5, r2, r3, lsl #12
    a558:	0affff68 	beq	a300 <__aeabi_dmul+0x214>
    a55c:	e1a00002 	mov	r0, r2
    a560:	e1a01003 	mov	r1, r3
    a564:	eaffff80 	b	a36c <__aeabi_dmul+0x280>
    a568:	e1906081 	orrs	r6, r0, r1, lsl #1
    a56c:	11926083 	orrsne	r6, r2, r3, lsl #1
    a570:	1affff48 	bne	a298 <__aeabi_dmul+0x1ac>
    a574:	e1904081 	orrs	r4, r0, r1, lsl #1
    a578:	1affff74 	bne	a350 <__aeabi_dmul+0x264>
    a57c:	e1925083 	orrs	r5, r2, r3, lsl #1
    a580:	1affff5e 	bne	a300 <__aeabi_dmul+0x214>
    a584:	eaffff78 	b	a36c <__aeabi_dmul+0x280>

0000a588 <__gedf2>:
    a588:	e3e0c000 	mvn	ip, #0
    a58c:	ea000002 	b	a59c <__cmpdf2+0x4>

0000a590 <__ledf2>:
    a590:	e3a0c001 	mov	ip, #1
    a594:	ea000000 	b	a59c <__cmpdf2+0x4>

0000a598 <__cmpdf2>:
    a598:	e3a0c001 	mov	ip, #1
    a59c:	e52dc004 	push	{ip}		; (str ip, [sp, #-4]!)
    a5a0:	e1a0c081 	lsl	ip, r1, #1
    a5a4:	e1f0cacc 	mvns	ip, ip, asr #21
    a5a8:	e1a0c083 	lsl	ip, r3, #1
    a5ac:	11f0cacc 	mvnsne	ip, ip, asr #21
    a5b0:	0a00000e 	beq	a5f0 <__cmpdf2+0x58>
    a5b4:	e28dd004 	add	sp, sp, #4
    a5b8:	e190c081 	orrs	ip, r0, r1, lsl #1
    a5bc:	0192c083 	orrseq	ip, r2, r3, lsl #1
    a5c0:	11310003 	teqne	r1, r3
    a5c4:	01300002 	teqeq	r0, r2
    a5c8:	03a00000 	moveq	r0, #0
    a5cc:	012fff1e 	bxeq	lr
    a5d0:	e3700000 	cmn	r0, #0
    a5d4:	e1310003 	teq	r1, r3
    a5d8:	51510003 	cmppl	r1, r3
    a5dc:	01500002 	cmpeq	r0, r2
    a5e0:	21a00fc3 	asrcs	r0, r3, #31
    a5e4:	31e00fc3 	mvncc	r0, r3, asr #31
    a5e8:	e3800001 	orr	r0, r0, #1
    a5ec:	e12fff1e 	bx	lr
    a5f0:	e1a0c081 	lsl	ip, r1, #1
    a5f4:	e1f0cacc 	mvns	ip, ip, asr #21
    a5f8:	1a000001 	bne	a604 <__cmpdf2+0x6c>
    a5fc:	e190c601 	orrs	ip, r0, r1, lsl #12
    a600:	1a000004 	bne	a618 <__cmpdf2+0x80>
    a604:	e1a0c083 	lsl	ip, r3, #1
    a608:	e1f0cacc 	mvns	ip, ip, asr #21
    a60c:	1affffe8 	bne	a5b4 <__cmpdf2+0x1c>
    a610:	e192c603 	orrs	ip, r2, r3, lsl #12
    a614:	0affffe6 	beq	a5b4 <__cmpdf2+0x1c>
    a618:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    a61c:	e12fff1e 	bx	lr

0000a620 <__aeabi_cdrcmple>:
    a620:	e1a0c000 	mov	ip, r0
    a624:	e1a00002 	mov	r0, r2
    a628:	e1a0200c 	mov	r2, ip
    a62c:	e1a0c001 	mov	ip, r1
    a630:	e1a01003 	mov	r1, r3
    a634:	e1a0300c 	mov	r3, ip
    a638:	eaffffff 	b	a63c <__aeabi_cdcmpeq>

0000a63c <__aeabi_cdcmpeq>:
    a63c:	e92d4001 	push	{r0, lr}
    a640:	ebffffd4 	bl	a598 <__cmpdf2>
    a644:	e3500000 	cmp	r0, #0
    a648:	43700000 	cmnmi	r0, #0
    a64c:	e8bd4001 	pop	{r0, lr}
    a650:	e12fff1e 	bx	lr

0000a654 <__aeabi_dcmpeq>:
    a654:	e52de008 	str	lr, [sp, #-8]!
    a658:	ebfffff7 	bl	a63c <__aeabi_cdcmpeq>
    a65c:	03a00001 	moveq	r0, #1
    a660:	13a00000 	movne	r0, #0
    a664:	e49de008 	ldr	lr, [sp], #8
    a668:	e12fff1e 	bx	lr

0000a66c <__aeabi_dcmplt>:
    a66c:	e52de008 	str	lr, [sp, #-8]!
    a670:	ebfffff1 	bl	a63c <__aeabi_cdcmpeq>
    a674:	33a00001 	movcc	r0, #1
    a678:	23a00000 	movcs	r0, #0
    a67c:	e49de008 	ldr	lr, [sp], #8
    a680:	e12fff1e 	bx	lr

0000a684 <__aeabi_dcmple>:
    a684:	e52de008 	str	lr, [sp, #-8]!
    a688:	ebffffeb 	bl	a63c <__aeabi_cdcmpeq>
    a68c:	93a00001 	movls	r0, #1
    a690:	83a00000 	movhi	r0, #0
    a694:	e49de008 	ldr	lr, [sp], #8
    a698:	e12fff1e 	bx	lr

0000a69c <__aeabi_dcmpge>:
    a69c:	e52de008 	str	lr, [sp, #-8]!
    a6a0:	ebffffde 	bl	a620 <__aeabi_cdrcmple>
    a6a4:	93a00001 	movls	r0, #1
    a6a8:	83a00000 	movhi	r0, #0
    a6ac:	e49de008 	ldr	lr, [sp], #8
    a6b0:	e12fff1e 	bx	lr

0000a6b4 <__aeabi_dcmpgt>:
    a6b4:	e52de008 	str	lr, [sp, #-8]!
    a6b8:	ebffffd8 	bl	a620 <__aeabi_cdrcmple>
    a6bc:	33a00001 	movcc	r0, #1
    a6c0:	23a00000 	movcs	r0, #0
    a6c4:	e49de008 	ldr	lr, [sp], #8
    a6c8:	e12fff1e 	bx	lr

0000a6cc <__aeabi_uldivmod>:
    a6cc:	e3530000 	cmp	r3, #0
    a6d0:	03520000 	cmpeq	r2, #0
    a6d4:	1a000004 	bne	a6ec <__aeabi_uldivmod+0x20>
    a6d8:	e3510000 	cmp	r1, #0
    a6dc:	03500000 	cmpeq	r0, #0
    a6e0:	13e01000 	mvnne	r1, #0
    a6e4:	13e00000 	mvnne	r0, #0
    a6e8:	ea000027 	b	a78c <__aeabi_idiv0>
    a6ec:	e24dd008 	sub	sp, sp, #8
    a6f0:	e92d6000 	push	{sp, lr}
    a6f4:	eb000014 	bl	a74c <__gnu_uldivmod_helper>
    a6f8:	e59de004 	ldr	lr, [sp, #4]
    a6fc:	e28dd008 	add	sp, sp, #8
    a700:	e8bd000c 	pop	{r2, r3}
    a704:	e12fff1e 	bx	lr

0000a708 <__gnu_ldivmod_helper>:
    a708:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    a70c:	e59d6020 	ldr	r6, [sp, #32]
    a710:	e1a07002 	mov	r7, r2
    a714:	e1a0a003 	mov	sl, r3
    a718:	e1a04000 	mov	r4, r0
    a71c:	e1a05001 	mov	r5, r1
    a720:	eb00001a 	bl	a790 <__divdi3>
    a724:	e1a03000 	mov	r3, r0
    a728:	e0020197 	mul	r2, r7, r1
    a72c:	e0898097 	umull	r8, r9, r7, r0
    a730:	e023239a 	mla	r3, sl, r3, r2
    a734:	e0544008 	subs	r4, r4, r8
    a738:	e0839009 	add	r9, r3, r9
    a73c:	e0c55009 	sbc	r5, r5, r9
    a740:	e8860030 	stm	r6, {r4, r5}
    a744:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    a748:	e12fff1e 	bx	lr

0000a74c <__gnu_uldivmod_helper>:
    a74c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    a750:	e59d5018 	ldr	r5, [sp, #24]
    a754:	e1a04002 	mov	r4, r2
    a758:	e1a08003 	mov	r8, r3
    a75c:	e1a06000 	mov	r6, r0
    a760:	e1a07001 	mov	r7, r1
    a764:	eb000067 	bl	a908 <__udivdi3>
    a768:	e0080890 	mul	r8, r0, r8
    a76c:	e0832490 	umull	r2, r3, r0, r4
    a770:	e0248491 	mla	r4, r1, r4, r8
    a774:	e0566002 	subs	r6, r6, r2
    a778:	e0843003 	add	r3, r4, r3
    a77c:	e0c77003 	sbc	r7, r7, r3
    a780:	e88500c0 	stm	r5, {r6, r7}
    a784:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    a788:	e12fff1e 	bx	lr

0000a78c <__aeabi_idiv0>:
    a78c:	e12fff1e 	bx	lr

0000a790 <__divdi3>:
    a790:	e3510000 	cmp	r1, #0
    a794:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a798:	a1a04000 	movge	r4, r0
    a79c:	a1a05001 	movge	r5, r1
    a7a0:	a3a0a000 	movge	sl, #0
    a7a4:	ba000053 	blt	a8f8 <__divdi3+0x168>
    a7a8:	e3530000 	cmp	r3, #0
    a7ac:	a1a08002 	movge	r8, r2
    a7b0:	a1a09003 	movge	r9, r3
    a7b4:	ba00004b 	blt	a8e8 <__divdi3+0x158>
    a7b8:	e1550009 	cmp	r5, r9
    a7bc:	01540008 	cmpeq	r4, r8
    a7c0:	33a02000 	movcc	r2, #0
    a7c4:	33a03000 	movcc	r3, #0
    a7c8:	3a00003b 	bcc	a8bc <__divdi3+0x12c>
    a7cc:	e1a01009 	mov	r1, r9
    a7d0:	e1a00008 	mov	r0, r8
    a7d4:	eb000093 	bl	aa28 <__clzdi2>
    a7d8:	e1a01005 	mov	r1, r5
    a7dc:	e1a0b000 	mov	fp, r0
    a7e0:	e1a00004 	mov	r0, r4
    a7e4:	eb00008f 	bl	aa28 <__clzdi2>
    a7e8:	e060000b 	rsb	r0, r0, fp
    a7ec:	e240e020 	sub	lr, r0, #32
    a7f0:	e1a07019 	lsl	r7, r9, r0
    a7f4:	e1877e18 	orr	r7, r7, r8, lsl lr
    a7f8:	e260c020 	rsb	ip, r0, #32
    a7fc:	e1877c38 	orr	r7, r7, r8, lsr ip
    a800:	e1550007 	cmp	r5, r7
    a804:	e1a06018 	lsl	r6, r8, r0
    a808:	01540006 	cmpeq	r4, r6
    a80c:	e1a01000 	mov	r1, r0
    a810:	33a02000 	movcc	r2, #0
    a814:	33a03000 	movcc	r3, #0
    a818:	3a000005 	bcc	a834 <__divdi3+0xa4>
    a81c:	e3a08001 	mov	r8, #1
    a820:	e0544006 	subs	r4, r4, r6
    a824:	e1a03e18 	lsl	r3, r8, lr
    a828:	e1833c38 	orr	r3, r3, r8, lsr ip
    a82c:	e0c55007 	sbc	r5, r5, r7
    a830:	e1a02018 	lsl	r2, r8, r0
    a834:	e3500000 	cmp	r0, #0
    a838:	0a00001f 	beq	a8bc <__divdi3+0x12c>
    a83c:	e1b070a7 	lsrs	r7, r7, #1
    a840:	e1a06066 	rrx	r6, r6
    a844:	ea000007 	b	a868 <__divdi3+0xd8>
    a848:	e0544006 	subs	r4, r4, r6
    a84c:	e0c55007 	sbc	r5, r5, r7
    a850:	e0944004 	adds	r4, r4, r4
    a854:	e0a55005 	adc	r5, r5, r5
    a858:	e2944001 	adds	r4, r4, #1
    a85c:	e2a55000 	adc	r5, r5, #0
    a860:	e2500001 	subs	r0, r0, #1
    a864:	0a000006 	beq	a884 <__divdi3+0xf4>
    a868:	e1570005 	cmp	r7, r5
    a86c:	01560004 	cmpeq	r6, r4
    a870:	9afffff4 	bls	a848 <__divdi3+0xb8>
    a874:	e0944004 	adds	r4, r4, r4
    a878:	e0a55005 	adc	r5, r5, r5
    a87c:	e2500001 	subs	r0, r0, #1
    a880:	1afffff8 	bne	a868 <__divdi3+0xd8>
    a884:	e261c020 	rsb	ip, r1, #32
    a888:	e1a00134 	lsr	r0, r4, r1
    a88c:	e0922004 	adds	r2, r2, r4
    a890:	e241e020 	sub	lr, r1, #32
    a894:	e1800c15 	orr	r0, r0, r5, lsl ip
    a898:	e1a04135 	lsr	r4, r5, r1
    a89c:	e1800e35 	orr	r0, r0, r5, lsr lr
    a8a0:	e1a07114 	lsl	r7, r4, r1
    a8a4:	e1877e10 	orr	r7, r7, r0, lsl lr
    a8a8:	e1a06110 	lsl	r6, r0, r1
    a8ac:	e0a33005 	adc	r3, r3, r5
    a8b0:	e1877c30 	orr	r7, r7, r0, lsr ip
    a8b4:	e0522006 	subs	r2, r2, r6
    a8b8:	e0c33007 	sbc	r3, r3, r7
    a8bc:	e29a0000 	adds	r0, sl, #0
    a8c0:	13a00001 	movne	r0, #1
    a8c4:	e3a01000 	mov	r1, #0
    a8c8:	e2704000 	rsbs	r4, r0, #0
    a8cc:	e2e15000 	rsc	r5, r1, #0
    a8d0:	e0222004 	eor	r2, r2, r4
    a8d4:	e0233005 	eor	r3, r3, r5
    a8d8:	e0900002 	adds	r0, r0, r2
    a8dc:	e0a11003 	adc	r1, r1, r3
    a8e0:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a8e4:	e12fff1e 	bx	lr
    a8e8:	e2728000 	rsbs	r8, r2, #0
    a8ec:	e1e0a00a 	mvn	sl, sl
    a8f0:	e2e39000 	rsc	r9, r3, #0
    a8f4:	eaffffaf 	b	a7b8 <__divdi3+0x28>
    a8f8:	e2704000 	rsbs	r4, r0, #0
    a8fc:	e2e15000 	rsc	r5, r1, #0
    a900:	e3e0a000 	mvn	sl, #0
    a904:	eaffffa7 	b	a7a8 <__divdi3+0x18>

0000a908 <__udivdi3>:
    a908:	e1510003 	cmp	r1, r3
    a90c:	01500002 	cmpeq	r0, r2
    a910:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    a914:	e1a04000 	mov	r4, r0
    a918:	e1a05001 	mov	r5, r1
    a91c:	e1a08002 	mov	r8, r2
    a920:	e1a09003 	mov	r9, r3
    a924:	33a00000 	movcc	r0, #0
    a928:	33a01000 	movcc	r1, #0
    a92c:	3a00003b 	bcc	aa20 <__udivdi3+0x118>
    a930:	e1a01003 	mov	r1, r3
    a934:	e1a00002 	mov	r0, r2
    a938:	eb00003a 	bl	aa28 <__clzdi2>
    a93c:	e1a01005 	mov	r1, r5
    a940:	e1a0a000 	mov	sl, r0
    a944:	e1a00004 	mov	r0, r4
    a948:	eb000036 	bl	aa28 <__clzdi2>
    a94c:	e060300a 	rsb	r3, r0, sl
    a950:	e243e020 	sub	lr, r3, #32
    a954:	e1a07319 	lsl	r7, r9, r3
    a958:	e1877e18 	orr	r7, r7, r8, lsl lr
    a95c:	e263c020 	rsb	ip, r3, #32
    a960:	e1877c38 	orr	r7, r7, r8, lsr ip
    a964:	e1550007 	cmp	r5, r7
    a968:	e1a06318 	lsl	r6, r8, r3
    a96c:	01540006 	cmpeq	r4, r6
    a970:	e1a02003 	mov	r2, r3
    a974:	33a00000 	movcc	r0, #0
    a978:	33a01000 	movcc	r1, #0
    a97c:	3a000005 	bcc	a998 <__udivdi3+0x90>
    a980:	e3a08001 	mov	r8, #1
    a984:	e0544006 	subs	r4, r4, r6
    a988:	e1a01e18 	lsl	r1, r8, lr
    a98c:	e1811c38 	orr	r1, r1, r8, lsr ip
    a990:	e0c55007 	sbc	r5, r5, r7
    a994:	e1a00318 	lsl	r0, r8, r3
    a998:	e3530000 	cmp	r3, #0
    a99c:	0a00001f 	beq	aa20 <__udivdi3+0x118>
    a9a0:	e1b070a7 	lsrs	r7, r7, #1
    a9a4:	e1a06066 	rrx	r6, r6
    a9a8:	ea000007 	b	a9cc <__udivdi3+0xc4>
    a9ac:	e0544006 	subs	r4, r4, r6
    a9b0:	e0c55007 	sbc	r5, r5, r7
    a9b4:	e0944004 	adds	r4, r4, r4
    a9b8:	e0a55005 	adc	r5, r5, r5
    a9bc:	e2944001 	adds	r4, r4, #1
    a9c0:	e2a55000 	adc	r5, r5, #0
    a9c4:	e2533001 	subs	r3, r3, #1
    a9c8:	0a000006 	beq	a9e8 <__udivdi3+0xe0>
    a9cc:	e1570005 	cmp	r7, r5
    a9d0:	01560004 	cmpeq	r6, r4
    a9d4:	9afffff4 	bls	a9ac <__udivdi3+0xa4>
    a9d8:	e0944004 	adds	r4, r4, r4
    a9dc:	e0a55005 	adc	r5, r5, r5
    a9e0:	e2533001 	subs	r3, r3, #1
    a9e4:	1afffff8 	bne	a9cc <__udivdi3+0xc4>
    a9e8:	e0948000 	adds	r8, r4, r0
    a9ec:	e0a59001 	adc	r9, r5, r1
    a9f0:	e1a03234 	lsr	r3, r4, r2
    a9f4:	e2621020 	rsb	r1, r2, #32
    a9f8:	e2420020 	sub	r0, r2, #32
    a9fc:	e1833115 	orr	r3, r3, r5, lsl r1
    aa00:	e1a0c235 	lsr	ip, r5, r2
    aa04:	e1833035 	orr	r3, r3, r5, lsr r0
    aa08:	e1a0721c 	lsl	r7, ip, r2
    aa0c:	e1877013 	orr	r7, r7, r3, lsl r0
    aa10:	e1a06213 	lsl	r6, r3, r2
    aa14:	e1877133 	orr	r7, r7, r3, lsr r1
    aa18:	e0580006 	subs	r0, r8, r6
    aa1c:	e0c91007 	sbc	r1, r9, r7
    aa20:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    aa24:	e12fff1e 	bx	lr

0000aa28 <__clzdi2>:
    aa28:	e92d4010 	push	{r4, lr}
    aa2c:	e3510000 	cmp	r1, #0
    aa30:	1a000002 	bne	aa40 <__clzdi2+0x18>
    aa34:	eb000005 	bl	aa50 <__clzsi2>
    aa38:	e2800020 	add	r0, r0, #32
    aa3c:	ea000001 	b	aa48 <__clzdi2+0x20>
    aa40:	e1a00001 	mov	r0, r1
    aa44:	eb000001 	bl	aa50 <__clzsi2>
    aa48:	e8bd4010 	pop	{r4, lr}
    aa4c:	e12fff1e 	bx	lr

0000aa50 <__clzsi2>:
    aa50:	e3a0101c 	mov	r1, #28
    aa54:	e3500801 	cmp	r0, #65536	; 0x10000
    aa58:	21a00820 	lsrcs	r0, r0, #16
    aa5c:	22411010 	subcs	r1, r1, #16
    aa60:	e3500c01 	cmp	r0, #256	; 0x100
    aa64:	21a00420 	lsrcs	r0, r0, #8
    aa68:	22411008 	subcs	r1, r1, #8
    aa6c:	e3500010 	cmp	r0, #16
    aa70:	21a00220 	lsrcs	r0, r0, #4
    aa74:	22411004 	subcs	r1, r1, #4
    aa78:	e28f2008 	add	r2, pc, #8
    aa7c:	e7d20000 	ldrb	r0, [r2, r0]
    aa80:	e0800001 	add	r0, r0, r1
    aa84:	e12fff1e 	bx	lr
    aa88:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    aa8c:	01010101 	tsteq	r1, r1, lsl #2
	...

Disassembly of section .rodata:

0000b000 <__rodata_start>:
    b000:	0083f001 	addeq	pc, r3, r1
    b004:	00836401 	addeq	r6, r3, r1, lsl #8

0000b008 <digits>:
    b008:	33323130 	teqcc	r2, #48, 2
    b00c:	37363534 			; <UNDEFINED> instruction: 0x37363534
    b010:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    b014:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .rodata.str1.4:

0000b01c <.rodata.str1.4>:
    b01c:	00000030 	andeq	r0, r0, r0, lsr r0
    b020:	00007830 	andeq	r7, r0, r0, lsr r8
    b024:	7453200a 	ldrbvc	r2, [r3], #-10
    b028:	73757461 	cmnvc	r5, #1627389952	; 0x61000000
    b02c:	25203d20 	strcs	r3, [r0, #-3360]!	; 0xd20
    b030:	00000a64 	andeq	r0, r0, r4, ror #20
    b034:	45524854 	ldrbmi	r4, [r2, #-2132]	; 0x854
    b038:	49204441 	stmdbmi	r0!, {r0, r6, sl, lr}
    b03c:	2054494e 	subscs	r4, r4, lr, asr #18
    b040:	6425203d 	strtvs	r2, [r5], #-61	; 0x3d
    b044:	0000000a 	andeq	r0, r0, sl
    b048:	5f6d756e 	svcpl	0x006d756e
    b04c:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0x56d
    b050:	20736578 	rsbscs	r6, r3, r8, ror r5
    b054:	6425203d 	strtvs	r2, [r5], #-61	; 0x3d
    b058:	0000000a 	andeq	r0, r0, sl
    b05c:	49206425 	stmdbmi	r0!, {r0, r2, r5, sl, sp, lr}
    b060:	4c412053 	mcrrmi	0, 5, r2, r1, cr3
    b064:	44414552 	strbmi	r4, [r1], #-1362	; 0x552
    b068:	4f4c2059 	svcmi	0x004c2059
    b06c:	44454b43 	strbmi	r4, [r5], #-2883	; 0xb43
    b070:	20594220 	subscs	r4, r9, r0, lsr #4
    b074:	000a6425 	andeq	r6, sl, r5, lsr #8
    b078:	4e4e5552 	mcrmi	5, 2, r5, cr14, cr2, {2}
    b07c:	3a474e49 	bcc	11de9a8 <__user_program+0xede9a8>
    b080:	20642520 	rsbcs	r2, r4, r0, lsr #10
    b084:	3154207c 	cmpcc	r4, ip, ror r0
    b088:	6425203a 	strtvs	r2, [r5], #-58	; 0x3a
    b08c:	3354202c 	cmpcc	r4, #44	; 0x2c
    b090:	6425203a 	strtvs	r2, [r5], #-58	; 0x3a
    b094:	0000000a 	andeq	r0, r0, sl
    b098:	20706f54 	rsbscs	r6, r0, r4, asr pc
    b09c:	6f697250 	svcvs	0x00697250
    b0a0:	79746972 	ldmdbvc	r4!, {r1, r4, r5, r6, r8, fp, sp, lr}^
    b0a4:	25203d20 	strcs	r3, [r0, #-3360]!	; 0xd20
    b0a8:	00000a64 	andeq	r0, r0, r4, ror #20

Disassembly of section .ARM.exidx:

0000b0ac <.ARM.exidx>:
    b0ac:	7ffff6e4 	svcvc	0x00fff6e4
    b0b0:	00000001 	andeq	r0, r0, r1

Disassembly of section .bss:

0000c000 <__bss_start>:
	...

0000c008 <running_index>:
    c008:	00000000 	andeq	r0, r0, r0

0000c00c <num_mutexes>:
    c00c:	00000000 	andeq	r0, r0, r0

0000c010 <runnable_BV>:
    c010:	00000000 	andeq	r0, r0, r0

0000c014 <system_time>:
    c014:	00000000 	andeq	r0, r0, r0

0000c018 <TCBs>:
	...

0000ce18 <UBTest>:
	...

0000cf20 <mutexes>:
	...

0000cfa0 <waiting_BV>:
    cfa0:	00000000 	andeq	r0, r0, r0

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	00000175 	andeq	r0, r0, r5, ror r1
       4:	00000004 	andeq	r0, r0, r4
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	0000006d 	andeq	r0, r0, sp, rrx
      10:	00005a01 	andeq	r5, r0, r1, lsl #20
      14:	00010e00 	andeq	r0, r1, r0, lsl #28
      18:	00805400 	addeq	r5, r0, r0, lsl #8
      1c:	00006000 	andeq	r6, r0, r0
      20:	00000000 	andeq	r0, r0, r0
      24:	08010200 	stmdaeq	r1, {r9}
      28:	000000fd 	strdeq	r0, [r0], -sp
      2c:	62050202 	andvs	r0, r5, #536870912	; 0x20000000
      30:	03000001 	movweq	r0, #1
      34:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
      38:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
      3c:	00000005 	andeq	r0, r0, r5
      40:	00ec0400 	rsceq	r0, ip, r0, lsl #8
      44:	16030000 	strne	r0, [r3], -r0
      48:	0000004c 	andeq	r0, r0, ip, asr #32
      4c:	f4080102 	vst4.8	{d0,d2,d4,d6}, [r8], r2
      50:	02000000 	andeq	r0, r0, #0
      54:	01350702 	teqeq	r5, r2, lsl #14
      58:	04020000 	streq	r0, [r2], #-0
      5c:	00004407 	andeq	r4, r0, r7, lsl #8
      60:	07080200 	streq	r0, [r8, -r0, lsl #4]
      64:	0000003a 	andeq	r0, r0, sl, lsr r0
      68:	00003105 	andeq	r3, r0, r5, lsl #2
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
      ac:	00014805 	andeq	r4, r1, r5, lsl #16
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
     11c:	02050000 	andeq	r0, r5, #0
     120:	01000001 	tsteq	r0, r1
     124:	0080a42c 	addeq	sl, r0, ip, lsr #8
     128:	00001000 	andeq	r1, r0, r0
     12c:	449c0100 	ldrmi	r0, [ip], #256	; 0x100
     130:	08000001 	stmdaeq	r0, {r0}
     134:	000080b0 	strheq	r8, [r0], -r0
     138:	0000016b 	andeq	r0, r0, fp, ror #2
     13c:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
     140:	00002308 	andeq	r2, r0, r8, lsl #6
     144:	00015609 	andeq	r5, r1, r9, lsl #12
     148:	5a370200 	bpl	dc0950 <__user_program+0xac0950>
     14c:	0a000001 	beq	158 <__start-0x7ea8>
     150:	00000041 	andeq	r0, r0, r1, asr #32
     154:	0000410a 	andeq	r4, r0, sl, lsl #2
     158:	28090000 	stmdacs	r9, {}	; <UNPREDICTABLE>
     15c:	02000000 	andeq	r0, r0, #0
     160:	00016b3d 	andeq	r6, r1, sp, lsr fp
     164:	00410a00 	subeq	r0, r1, r0, lsl #20
     168:	0b000000 	bleq	170 <__start-0x7e90>
     16c:	00000051 	andeq	r0, r0, r1, asr r0
     170:	410a4302 	tstmi	sl, r2, lsl #6
     174:	00000000 	andeq	r0, r0, r0
     178:	0001f400 	andeq	pc, r1, r0, lsl #8
     17c:	a0000400 	andge	r0, r0, r0, lsl #8
     180:	04000000 	streq	r0, [r0], #-0
     184:	00006d01 	andeq	r6, r0, r1, lsl #26
     188:	01b10100 			; <UNDEFINED> instruction: 0x01b10100
     18c:	010e0000 	mrseq	r0, (UNDEF: 14)
     190:	80b40000 	adcshi	r0, r4, r0
     194:	01940000 	orrseq	r0, r4, r0
     198:	00730000 	rsbseq	r0, r3, r0
     19c:	01020000 	mrseq	r0, (UNDEF: 2)
     1a0:	0000f408 	andeq	pc, r0, r8, lsl #8
     1a4:	00ed0300 	rsceq	r0, sp, r0, lsl #6
     1a8:	0e020000 	cdpeq	0, 0, cr0, cr2, cr0, {0}
     1ac:	00000037 	andeq	r0, r0, r7, lsr r0
     1b0:	fd080102 	stc2	1, cr0, [r8, #-8]
     1b4:	02000000 	andeq	r0, r0, #0
     1b8:	01620502 	cmneq	r2, r2, lsl #10
     1bc:	04040000 	streq	r0, [r4], #-0
     1c0:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     1c4:	05080200 	streq	r0, [r8, #-512]	; 0x200
     1c8:	00000000 	andeq	r0, r0, r0
     1cc:	0000ec03 	andeq	lr, r0, r3, lsl #24
     1d0:	25160200 	ldrcs	r0, [r6, #-512]	; 0x200
     1d4:	02000000 	andeq	r0, r0, #0
     1d8:	01350702 	teqeq	r5, r2, lsl #14
     1dc:	7a030000 	bvc	c01e4 <__bss_end+0xb31e4>
     1e0:	02000001 	andeq	r0, r0, #1
     1e4:	0000701a 	andeq	r7, r0, sl, lsl r0
     1e8:	07040200 	streq	r0, [r4, -r0, lsl #4]
     1ec:	00000044 	andeq	r0, r0, r4, asr #32
     1f0:	3a070802 	bcc	1c2200 <__end+0x94200>
     1f4:	05000000 	streq	r0, [r0, #-0]
     1f8:	00000156 	andeq	r0, r0, r6, asr r1
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
     238:	0000015b 	andeq	r0, r0, fp, asr r1
     23c:	00655c01 	rsbeq	r5, r5, r1, lsl #24
     240:	005a0000 	subseq	r0, sl, r0
     244:	aa090000 	bge	24024c <__end+0x11224c>
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
     27c:	00000051 	andeq	r0, r0, r1, asr r0
     280:	814c7101 	cmphi	ip, r1, lsl #2
     284:	00440000 	subeq	r0, r4, r0
     288:	9c010000 	stcls	0, cr0, [r1], {-0}
     28c:	00000127 	andeq	r0, r0, r7, lsr #2
     290:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
     294:	53710100 	cmnpl	r1, #0, 2
     298:	c5000000 	strgt	r0, [r0, #-0]
     29c:	00000000 	andeq	r0, r0, r0
     2a0:	00016c05 	andeq	r6, r1, r5, lsl #24
     2a4:	907d0100 	rsbsls	r0, sp, r0, lsl #2
     2a8:	84000081 	strhi	r0, [r0], #-129	; 0x81
     2ac:	01000000 	mrseq	r0, (UNDEF: 0)
     2b0:	0001939c 	muleq	r1, ip, r3
     2b4:	69700600 	ldmdbvs	r0!, {r9, sl}^
     2b8:	7d01006e 	stcvc	0, cr0, [r1, #-440]	; 0xfffffe48
     2bc:	00000053 	andeq	r0, r0, r3, asr r0
     2c0:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     2c4:	0001a40a 	andeq	sl, r1, sl, lsl #8
     2c8:	537d0100 	cmnpl	sp, #0, 2
     2cc:	20000000 	andcs	r0, r0, r0
     2d0:	0b000001 	bleq	2dc <__start-0x7d24>
     2d4:	000081b8 			; <UNDEFINED> instruction: 0x000081b8
     2d8:	000001ea 	andeq	r0, r0, sl, ror #3
     2dc:	0000016e 	andeq	r0, r0, lr, ror #2
     2e0:	0250010c 	subseq	r0, r0, #12, 2
     2e4:	0b009608 	bleq	25b0c <__bss_end+0x18b0c>
     2e8:	000081e0 	andeq	r8, r0, r0, ror #3
     2ec:	000001ea 	andeq	r0, r0, sl, ror #3
     2f0:	00000182 	andeq	r0, r0, r2, lsl #3
     2f4:	0250010c 	subseq	r0, r0, #12, 2
     2f8:	0d009608 	stceq	6, cr9, [r0, #-32]	; 0xffffffe0
     2fc:	00008208 	andeq	r8, r0, r8, lsl #4
     300:	000001ea 	andeq	r0, r0, sl, ror #3
     304:	0250010c 	subseq	r0, r0, #12, 2
     308:	00009608 	andeq	r9, r0, r8, lsl #12
     30c:	0001880e 	andeq	r8, r1, lr, lsl #16
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
     344:	0001830f 	andeq	r8, r1, pc, lsl #6
     348:	da520100 	ble	1480750 <__user_program+0x1180750>
     34c:	00000001 	andeq	r0, r0, r1
     350:	103f2000 	eorsne	r2, pc, r0
     354:	000001df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     358:	01e50411 	mvneq	r0, r1, lsl r4
     35c:	65120000 	ldrvs	r0, [r2, #-0]
     360:	13000000 	movwne	r0, #0
     364:	00000197 	muleq	r0, r7, r1
     368:	65141903 	ldrvs	r1, [r4, #-2307]	; 0x903
     36c:	00000000 	andeq	r0, r0, r0
     370:	00021700 	andeq	r1, r2, r0, lsl #14
     374:	ba000400 	blt	137c <__start-0x6c84>
     378:	04000001 	streq	r0, [r0], #-1
     37c:	00006d01 	andeq	r6, r0, r1, lsl #26
     380:	01f40100 	mvnseq	r0, r0, lsl #2
     384:	010e0000 	mrseq	r0, (UNDEF: 14)
     388:	82480000 	subhi	r0, r8, #0
     38c:	00c40000 	sbceq	r0, r4, r0
     390:	01070000 	mrseq	r0, (UNDEF: 7)
     394:	01020000 	mrseq	r0, (UNDEF: 2)
     398:	0000fd08 	andeq	pc, r0, r8, lsl #26
     39c:	05020200 	streq	r0, [r2, #-512]	; 0x200
     3a0:	00000162 	andeq	r0, r0, r2, ror #2
     3a4:	69050403 	stmdbvs	r5, {r0, r1, sl}
     3a8:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     3ac:	00000508 	andeq	r0, r0, r8, lsl #10
     3b0:	ec040000 	stc	0, cr0, [r4], {-0}
     3b4:	02000000 	andeq	r0, r0, #0
     3b8:	00004c16 	andeq	r4, r0, r6, lsl ip
     3bc:	08010200 	stmdaeq	r1, {r9}
     3c0:	000000f4 	strdeq	r0, [r0], -r4
     3c4:	00022204 	andeq	r2, r2, r4, lsl #4
     3c8:	5e180200 	cdppl	2, 1, cr0, cr8, cr0, {0}
     3cc:	02000000 	andeq	r0, r0, #0
     3d0:	01350702 	teqeq	r5, r2, lsl #14
     3d4:	04020000 	streq	r0, [r2], #-0
     3d8:	00004407 	andeq	r4, r0, r7, lsl #8
     3dc:	07080200 	streq	r0, [r8, -r0, lsl #4]
     3e0:	0000003a 	andeq	r0, r0, sl, lsr r0
     3e4:	0001e005 	andeq	lr, r1, r5
     3e8:	48210100 	stmdami	r1!, {r8}
     3ec:	10000082 	andne	r0, r0, r2, lsl #1
     3f0:	01000000 	mrseq	r0, (UNDEF: 0)
     3f4:	00009a9c 	muleq	r0, ip, sl
     3f8:	82540600 	subshi	r0, r4, #0, 12
     3fc:	01c90000 	biceq	r0, r9, r0
     400:	01070000 	mrseq	r0, (UNDEF: 7)
     404:	dc0a0350 	stcle	3, cr0, [sl], {80}	; 0x50
     408:	08000005 	stmdaeq	r0, {r0, r2}
     40c:	0000023b 	andeq	r0, r0, fp, lsr r2
     410:	00532501 	subseq	r2, r3, r1, lsl #10
     414:	82580000 	subshi	r0, r8, #0
     418:	00b40000 	adcseq	r0, r4, r0
     41c:	9c010000 	stcls	0, cr0, [r1], {-0}
     420:	00000192 	muleq	r0, r2, r1
     424:	00021a09 	andeq	r1, r2, r9, lsl #20
     428:	41250100 	teqmi	r5, r0, lsl #2
     42c:	99000000 	stmdbls	r0, {}	; <UNPREDICTABLE>
     430:	0a000001 	beq	43c <__start-0x7bc4>
     434:	0000022b 	andeq	r0, r0, fp, lsr #4
     438:	01923401 	orrseq	r3, r2, r1, lsl #8
     43c:	91020000 	mrsls	r0, (UNDEF: 2)
     440:	01e90a74 	mvneq	r0, r4, ror sl
     444:	38010000 	stmdacc	r1, {}	; <UNPREDICTABLE>
     448:	000001a9 	andeq	r0, r0, r9, lsr #3
     44c:	0b709102 	bleq	1c2485c <__user_program+0x192485c>
     450:	000001ee 	andeq	r0, r0, lr, ror #3
     454:	00533d01 	subseq	r3, r3, r1, lsl #26
     458:	680c0000 	stmdavs	ip, {}	; <UNPREDICTABLE>
     45c:	28000082 	stmdacs	r0, {r1, r7}
     460:	20000000 	andcs	r0, r0, r0
     464:	0a000001 	beq	470 <__start-0x7b90>
     468:	000001d4 	ldrdeq	r0, [r0], -r4
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
     49c:	d40a0000 	strle	r0, [sl], #-0
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
     514:	02550704 	subseq	r0, r5, #4, 14	; 0x100000
     518:	410e0000 	mrsmi	r0, (UNDEF: 14)
     51c:	b9000000 	stmdblt	r0, {}	; <UNPREDICTABLE>
     520:	0f000001 	svceq	0x00000001
     524:	000001a2 	andeq	r0, r0, r2, lsr #3
     528:	410e0001 	tstmi	lr, r1
     52c:	c9000000 	stmdbgt	r0, {}	; <UNPREDICTABLE>
     530:	0f000001 	svceq	0x00000001
     534:	000001a2 	andeq	r0, r0, r2, lsr #3
     538:	c4100002 	ldrgt	r0, [r0], #-2
     53c:	03000001 	movweq	r0, #1
     540:	0001da19 	andeq	sp, r1, r9, lsl sl
     544:	00531100 	subseq	r1, r3, r0, lsl #2
     548:	12000000 	andne	r0, r0, #0
     54c:	00000244 	andeq	r0, r0, r4, asr #4
     550:	00412203 	subeq	r2, r1, r3, lsl #4
     554:	01f90000 	mvnseq	r0, r0
     558:	f9110000 			; <UNDEFINED> instruction: 0xf9110000
     55c:	11000001 	tstne	r0, r1
     560:	00000053 	andeq	r0, r0, r3, asr r0
     564:	00004111 	andeq	r4, r0, r1, lsl r1
     568:	04130000 	ldreq	r0, [r3], #-0
     56c:	00000041 	andeq	r0, r0, r1, asr #32
     570:	00020a14 	andeq	r0, r2, r4, lsl sl
     574:	412b0300 	teqmi	fp, r0, lsl #6
     578:	11000000 	mrsne	r0, (UNDEF: 0)
     57c:	000001f9 	strdeq	r0, [r0], -r9
     580:	00005311 	andeq	r5, r0, r1, lsl r3
     584:	00411100 	subeq	r1, r1, r0, lsl #2
     588:	00000000 	andeq	r0, r0, r0
     58c:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     590:	02de0004 	sbcseq	r0, lr, #4
     594:	01040000 	mrseq	r0, (UNDEF: 4)
     598:	0000006d 	andeq	r0, r0, sp, rrx
     59c:	00026301 	andeq	r6, r2, r1, lsl #6
     5a0:	00010e00 	andeq	r0, r1, r0, lsl #28
     5a4:	00830c00 	addeq	r0, r3, r0, lsl #24
     5a8:	00019400 	andeq	r9, r1, r0, lsl #8
     5ac:	00019200 	andeq	r9, r1, r0, lsl #4
     5b0:	08010200 	stmdaeq	r1, {r9}
     5b4:	000000fd 	strdeq	r0, [r0], -sp
     5b8:	62050202 	andvs	r0, r5, #536870912	; 0x20000000
     5bc:	03000001 	movweq	r0, #1
     5c0:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     5c4:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
     5c8:	00000005 	andeq	r0, r0, r5
     5cc:	00ec0400 	rsceq	r0, ip, r0, lsl #8
     5d0:	16020000 	strne	r0, [r2], -r0
     5d4:	0000004c 	andeq	r0, r0, ip, asr #32
     5d8:	f4080102 	vst4.8	{d0,d2,d4,d6}, [r8], r2
     5dc:	04000000 	streq	r0, [r0], #-0
     5e0:	00000222 	andeq	r0, r0, r2, lsr #4
     5e4:	005e1802 	subseq	r1, lr, r2, lsl #16
     5e8:	02020000 	andeq	r0, r2, #0
     5ec:	00013507 	andeq	r3, r1, r7, lsl #10
     5f0:	017a0400 	cmneq	sl, r0, lsl #8
     5f4:	1a020000 	bne	805fc <__bss_end+0x735fc>
     5f8:	00000070 	andeq	r0, r0, r0, ror r0
     5fc:	44070402 	strmi	r0, [r7], #-1026	; 0x402
     600:	02000000 	andeq	r0, r0, #0
     604:	003a0708 	eorseq	r0, sl, r8, lsl #14
     608:	c4050000 	strgt	r0, [r5], #-0
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
     68c:	00000244 	andeq	r0, r0, r4, asr #4
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
     6c0:	5e0b0000 	cdppl	0, 0, cr0, cr11, cr0, {0}
     6c4:	01000002 	tsteq	r0, r2
     6c8:	0000412d 	andeq	r4, r0, sp, lsr #2
     6cc:	00026500 	andeq	r6, r2, r0, lsl #10
     6d0:	00690c00 	rsbeq	r0, r9, r0, lsl #24
     6d4:	00333801 	eorseq	r3, r3, r1, lsl #16
     6d8:	02910000 	addseq	r0, r1, #0
     6dc:	0d000000 	stceq	0, cr0, [r0, #-0]
     6e0:	00004104 	andeq	r4, r0, r4, lsl #2
     6e4:	020a0a00 	andeq	r0, sl, #0, 20
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
     718:	5e0b5101 	adfple	f5, f3, f1
     71c:	01000002 	tsteq	r0, r2
     720:	00004145 	andeq	r4, r0, r5, asr #2
     724:	00033700 	andeq	r3, r3, r0, lsl #14
     728:	00690c00 	rsbeq	r0, r9, r0, lsl #24
     72c:	00335701 	eorseq	r5, r3, r1, lsl #14
     730:	03630000 	cmneq	r3, #0
     734:	0f000000 	svceq	0x00000000
     738:	0000016c 	andeq	r0, r0, ip, ror #2
     73c:	01c14b03 	biceq	r4, r1, r3, lsl #22
     740:	41100000 	tstmi	r0, r0
     744:	10000000 	andne	r0, r0, r0
     748:	00000041 	andeq	r0, r0, r1, asr #32
     74c:	01561100 	cmpeq	r6, r0, lsl #2
     750:	37030000 	strcc	r0, [r3, -r0]
     754:	00004110 	andeq	r4, r0, r0, lsl r1
     758:	00411000 	subeq	r1, r1, r0
     75c:	00000000 	andeq	r0, r0, r0
     760:	00000757 	andeq	r0, r0, r7, asr r7
     764:	03df0004 	bicseq	r0, pc, #4
     768:	01040000 	mrseq	r0, (UNDEF: 4)
     76c:	0000006d 	andeq	r0, r0, sp, rrx
     770:	00057f01 	andeq	r7, r5, r1, lsl #30
     774:	00010e00 	andeq	r0, r1, r0, lsl #28
     778:	0084a000 	addeq	sl, r4, r0
     77c:	0008b400 	andeq	fp, r8, r0, lsl #8
     780:	00025000 	andeq	r5, r2, r0
     784:	08010200 	stmdaeq	r1, {r9}
     788:	000000fd 	strdeq	r0, [r0], -sp
     78c:	62050202 	andvs	r0, r5, #536870912	; 0x20000000
     790:	03000001 	movweq	r0, #1
     794:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     798:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
     79c:	00000005 	andeq	r0, r0, r5
     7a0:	00ec0400 	rsceq	r0, ip, r0, lsl #8
     7a4:	16020000 	strne	r0, [r2], -r0
     7a8:	0000004c 	andeq	r0, r0, ip, asr #32
     7ac:	f4080102 	vst4.8	{d0,d2,d4,d6}, [r8], r2
     7b0:	02000000 	andeq	r0, r0, #0
     7b4:	01350702 	teqeq	r5, r2, lsl #14
     7b8:	7a040000 	bvc	1007c0 <__bss_end+0xf37c0>
     7bc:	02000001 	andeq	r0, r0, #1
     7c0:	0000651a 	andeq	r6, r0, sl, lsl r5
     7c4:	07040200 	streq	r0, [r4, -r0, lsl #4]
     7c8:	00000044 	andeq	r0, r0, r4, asr #32
     7cc:	3a070802 	bcc	1c27dc <__end+0x947dc>
     7d0:	05000000 	streq	r0, [r0, #-0]
     7d4:	000004c0 	andeq	r0, r0, r0, asr #9
     7d8:	a404030c 	strge	r0, [r4], #-780	; 0x30c
     7dc:	06000000 	streq	r0, [r0], -r0
     7e0:	0000047f 	andeq	r0, r0, pc, ror r4
     7e4:	00410503 	subeq	r0, r1, r3, lsl #10
     7e8:	06000000 	streq	r0, [r0], -r0
     7ec:	00000434 	andeq	r0, r0, r4, lsr r4
     7f0:	005a0603 	subseq	r0, sl, r3, lsl #12
     7f4:	06040000 	streq	r0, [r4], -r0
     7f8:	000006f9 	strdeq	r0, [r0], -r9
     7fc:	005a0703 	subseq	r0, sl, r3, lsl #14
     800:	00080000 	andeq	r0, r8, r0
     804:	00048604 	andeq	r8, r4, r4, lsl #12
     808:	73080300 	movwvc	r0, #33536	; 0x8300
     80c:	04000000 	streq	r0, [r0], #-0
     810:	00000386 	andeq	r0, r0, r6, lsl #7
     814:	00ba2604 	adcseq	r2, sl, r4, lsl #12
     818:	04070000 	streq	r0, [r7], #-0
     81c:	000000c0 	andeq	r0, r0, r0, asr #1
     820:	03f50508 	mvnseq	r0, #8, 10	; 0x2000000
     824:	04700000 	ldrbteq	r0, [r0], #-0
     828:	00022b29 	andeq	r2, r2, r9, lsr #22
     82c:	04780600 	ldrbteq	r0, [r8], #-1536	; 0x600
     830:	2a040000 	bcs	100838 <__bss_end+0xf3838>
     834:	00000041 	andeq	r0, r0, r1, asr #32
     838:	06b90600 	ldrteq	r0, [r9], r0, lsl #12
     83c:	2b040000 	blcs	100844 <__bss_end+0xf3844>
     840:	00000041 	andeq	r0, r0, r1, asr #32
     844:	054d0601 	strbeq	r0, [sp, #-1537]	; 0x601
     848:	2c040000 	stccs	0, cr0, [r4], {-0}
     84c:	00000041 	andeq	r0, r0, r1, asr #32
     850:	03360602 	teqeq	r6, #2097152	; 0x200000
     854:	2d040000 	stccs	0, cr0, [r4, #-0]
     858:	0000005a 	andeq	r0, r0, sl, asr r0
     85c:	041a0604 	ldreq	r0, [sl], #-1540	; 0x604
     860:	2e040000 	cdpcs	0, 0, cr0, cr4, cr0, {0}
     864:	0000005a 	andeq	r0, r0, sl, asr r0
     868:	04b40608 	ldrteq	r0, [r4], #1544	; 0x608
     86c:	2f040000 	svccs	0x00040000
     870:	0000005a 	andeq	r0, r0, sl, asr r0
     874:	045f060c 	ldrbeq	r0, [pc], #-1548	; 87c <__start-0x7784>
     878:	30040000 	andcc	r0, r4, r0
     87c:	0000005a 	andeq	r0, r0, sl, asr r0
     880:	6e660910 	mcrvs	9, 3, r0, cr6, cr0, {0}
     884:	5a310400 	bpl	c4188c <__user_program+0x94188c>
     888:	14000000 	strne	r0, [r0], #-0
     88c:	00036406 	andeq	r6, r3, r6, lsl #8
     890:	5a320400 	bpl	c81898 <__user_program+0x981898>
     894:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     898:	00052d06 	andeq	r2, r5, r6, lsl #26
     89c:	5a330400 	bpl	cc18a4 <__user_program+0x9c18a4>
     8a0:	1c000000 	stcne	0, cr0, [r0], {-0}
     8a4:	00057706 	andeq	r7, r5, r6, lsl #14
     8a8:	5a360400 	bpl	d818b0 <__user_program+0xa818b0>
     8ac:	20000000 	andcs	r0, r0, r0
     8b0:	00050806 	andeq	r0, r5, r6, lsl #16
     8b4:	5a370400 	bpl	dc18bc <__user_program+0xac18bc>
     8b8:	24000000 	strcs	r0, [r0], #-0
     8bc:	32317209 	eorscc	r7, r1, #-1879048192	; 0x90000000
     8c0:	5a380400 	bpl	e018c8 <__user_program+0xb018c8>
     8c4:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
     8c8:	31317209 	teqcc	r1, r9, lsl #4
     8cc:	5a390400 	bpl	e418d4 <__user_program+0xb418d4>
     8d0:	2c000000 	stccs	0, cr0, [r0], {-0}
     8d4:	30317209 	eorscc	r7, r1, r9, lsl #4
     8d8:	5a3a0400 	bpl	e818e0 <__user_program+0xb818e0>
     8dc:	30000000 	andcc	r0, r0, r0
     8e0:	00397209 	eorseq	r7, r9, r9, lsl #4
     8e4:	005a3b04 	subseq	r3, sl, r4, lsl #22
     8e8:	09340000 	ldmdbeq	r4!, {}	; <UNPREDICTABLE>
     8ec:	04003872 	streq	r3, [r0], #-2162	; 0x872
     8f0:	00005a3c 	andeq	r5, r0, ip, lsr sl
     8f4:	72093800 	andvc	r3, r9, #0, 16
     8f8:	3d040037 	stccc	0, cr0, [r4, #-220]	; 0xffffff24
     8fc:	0000005a 	andeq	r0, r0, sl, asr r0
     900:	3672093c 			; <UNDEFINED> instruction: 0x3672093c
     904:	5a3e0400 	bpl	f8190c <__user_program+0xc8190c>
     908:	40000000 	andmi	r0, r0, r0
     90c:	00357209 	eorseq	r7, r5, r9, lsl #4
     910:	005a3f04 	subseq	r3, sl, r4, lsl #30
     914:	09440000 	stmdbeq	r4, {}^	; <UNPREDICTABLE>
     918:	04003472 	streq	r3, [r0], #-1138	; 0x472
     91c:	00005a40 	andeq	r5, r0, r0, asr #20
     920:	72094800 	andvc	r4, r9, #0, 16
     924:	41040033 	tstmi	r4, r3, lsr r0
     928:	0000005a 	andeq	r0, r0, sl, asr r0
     92c:	3272094c 	rsbscc	r0, r2, #76, 18	; 0x130000
     930:	5a420400 	bpl	1081938 <__user_program+0xd81938>
     934:	50000000 	andpl	r0, r0, r0
     938:	00317209 	eorseq	r7, r1, r9, lsl #4
     93c:	005a4304 	subseq	r4, sl, r4, lsl #6
     940:	09540000 	ldmdbeq	r4, {}^	; <UNPREDICTABLE>
     944:	04003072 	streq	r3, [r0], #-114	; 0x72
     948:	00005a44 	andeq	r5, r0, r4, asr #20
     94c:	3c065800 	stccc	8, cr5, [r6], {-0}
     950:	04000005 	streq	r0, [r0], #-5
     954:	00005a45 	andeq	r5, r0, r5, asr #20
     958:	95065c00 	strls	r5, [r6, #-3072]	; 0xc00
     95c:	04000004 	streq	r0, [r0], #-4
     960:	00005a46 	andeq	r5, r0, r6, asr #20
     964:	c1066000 	mrsgt	r6, (UNDEF: 6)
     968:	04000003 	streq	r0, [r0], #-3
     96c:	00005a47 	andeq	r5, r0, r7, asr #20
     970:	8e066400 	cfcpyshi	mvf6, mvf6
     974:	04000004 	streq	r0, [r0], #-4
     978:	00005a48 	andeq	r5, r0, r8, asr #20
     97c:	cc066800 	stcgt	8, cr6, [r6], {-0}
     980:	04000002 	streq	r0, [r0], #-2
     984:	00005a49 	andeq	r5, r0, r9, asr #20
     988:	04006c00 	streq	r6, [r0], #-3072	; 0xc00
     98c:	0000027f 	andeq	r0, r0, pc, ror r2
     990:	00c14a04 	sbceq	r4, r1, r4, lsl #20
     994:	aa0a0000 	bge	28099c <__end+0x15299c>
     998:	01000002 	tsteq	r0, r2
     99c:	0084a018 	addeq	sl, r4, r8, lsl r0
     9a0:	00002000 	andeq	r2, r0, r0
     9a4:	829c0100 	addshi	r0, ip, #0, 2
     9a8:	0b000002 	bleq	9b8 <__start-0x7648>
     9ac:	000084a8 	andeq	r8, r0, r8, lsr #9
     9b0:	00000592 	muleq	r0, r2, r5
     9b4:	0084ac0b 	addeq	sl, r4, fp, lsl #24
     9b8:	00059900 	andeq	r9, r5, r0, lsl #18
     9bc:	84b00b00 	ldrthi	r0, [r0], #2816	; 0xb00
     9c0:	05a00000 	streq	r0, [r0, #0]!
     9c4:	b40b0000 	strlt	r0, [fp], #-0
     9c8:	a7000084 	strge	r0, [r0, -r4, lsl #1]
     9cc:	0b000005 	bleq	9e8 <__start-0x7618>
     9d0:	000084b8 			; <UNDEFINED> instruction: 0x000084b8
     9d4:	000005b4 			; <UNDEFINED> instruction: 0x000005b4
     9d8:	0084bc0b 	addeq	fp, r4, fp, lsl #24
     9dc:	0005bb00 	andeq	fp, r5, r0, lsl #22
     9e0:	920c0000 	andls	r0, ip, #0
     9e4:	01000002 	tsteq	r0, r2
     9e8:	00005a24 	andeq	r5, r0, r4, lsr #20
     9ec:	0084c000 	addeq	ip, r4, r0
     9f0:	00006800 	andeq	r6, r0, r0, lsl #16
     9f4:	c79c0100 	ldrgt	r0, [ip, r0, lsl #2]
     9f8:	0d000002 	stceq	0, cr0, [r0, #-8]
     9fc:	25010069 	strcs	r0, [r1, #-105]	; 0x69
     a00:	0000005a 	andeq	r0, r0, sl, asr r0
     a04:	00000388 	andeq	r0, r0, r8, lsl #7
     a08:	0005940e 	andeq	r9, r5, lr, lsl #8
     a0c:	5a260100 	bpl	980e14 <__user_program+0x680e14>
     a10:	a7000000 	strge	r0, [r0, -r0]
     a14:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
     a18:	00000296 	muleq	r0, r6, r2
     a1c:	005a2701 	subseq	r2, sl, r1, lsl #14
     a20:	03c70000 	biceq	r0, r7, #0
     a24:	0a000000 	beq	a2c <__start-0x75d4>
     a28:	000002f1 	strdeq	r0, [r0], -r1
     a2c:	85283101 	strhi	r3, [r8, #-257]!	; 0x101
     a30:	02a00000 	adceq	r0, r0, #0
     a34:	9c010000 	stcls	0, cr0, [r1], {-0}
     a38:	000002ea 	andeq	r0, r0, sl, ror #5
     a3c:	00044a0f 	andeq	r4, r4, pc, lsl #20
     a40:	ea310100 	b	c40e48 <__user_program+0x940e48>
     a44:	01000002 	tsteq	r0, r2
     a48:	04070050 	streq	r0, [r7], #-80	; 0x50
     a4c:	0000005a 	andeq	r0, r0, sl, asr r0
     a50:	0005100a 	andeq	r1, r5, sl
     a54:	c84f0100 	stmdagt	pc, {r8}^	; <UNPREDICTABLE>
     a58:	f0000087 			; <UNDEFINED> instruction: 0xf0000087
     a5c:	01000001 	tsteq	r0, r1
     a60:	0003139c 	muleq	r3, ip, r3
     a64:	044a0f00 	strbeq	r0, [sl], #-3840	; 0xf00
     a68:	4f010000 	svcmi	0x00010000
     a6c:	000002ea 	andeq	r0, r0, sl, ror #5
     a70:	10005001 	andne	r5, r0, r1
     a74:	000002b6 			; <UNDEFINED> instruction: 0x000002b6
     a78:	89b86701 	ldmibhi	r8!, {r0, r8, r9, sl, sp, lr}
     a7c:	00f40000 	rscseq	r0, r4, r0
     a80:	9c010000 	stcls	0, cr0, [r1], {-0}
     a84:	0004b90a 	andeq	fp, r4, sl, lsl #18
     a88:	ac740100 	ldfgee	f0, [r4], #-0
     a8c:	9000008a 	andls	r0, r0, sl, lsl #1
     a90:	01000000 	mrseq	r0, (UNDEF: 0)
     a94:	0003479c 	muleq	r3, ip, r7
     a98:	00690d00 	rsbeq	r0, r9, r0, lsl #26
     a9c:	005a7501 	subseq	r7, sl, r1, lsl #10
     aa0:	03f20000 	mvnseq	r0, #0
     aa4:	0a000000 	beq	aac <__start-0x7554>
     aa8:	000002e3 	andeq	r0, r0, r3, ror #5
     aac:	8b3c8301 	blhi	f216b8 <__user_program+0xc216b8>
     ab0:	00580000 	subseq	r0, r8, r0
     ab4:	9c010000 	stcls	0, cr0, [r1], {-0}
     ab8:	000003bd 			; <UNDEFINED> instruction: 0x000003bd
     abc:	00044a11 	andeq	r4, r4, r1, lsl sl
     ac0:	ea830100 	b	fe0c0ec8 <__user_program+0xfddc0ec8>
     ac4:	11000002 	tstne	r0, r2
     ac8:	0b000004 	bleq	ae0 <__start-0x7520>
     acc:	00008b48 	andeq	r8, r0, r8, asr #22
     ad0:	000005cc 	andeq	r0, r0, ip, asr #11
     ad4:	008b540b 	addeq	r5, fp, fp, lsl #8
     ad8:	0005a000 	andeq	sl, r5, r0
     adc:	8b6c0b00 	blhi	1b036e4 <__user_program+0x18036e4>
     ae0:	03130000 	tsteq	r3, #0
     ae4:	74120000 	ldrvc	r0, [r2], #-0
     ae8:	c700008b 	strgt	r0, [r0, -fp, lsl #1]
     aec:	9a000002 	bls	afc <__start-0x7504>
     af0:	13000003 	movwne	r0, #3
     af4:	74025001 	strvc	r5, [r2], #-1
     af8:	780b0000 	stmdavc	fp, {}	; <UNPREDICTABLE>
     afc:	2400008b 	strcs	r0, [r0], #-139	; 0x8b
     b00:	0b000003 	bleq	b14 <__start-0x74ec>
     b04:	00008b7c 	andeq	r8, r0, ip, ror fp
     b08:	00000282 	andeq	r0, r0, r2, lsl #5
     b0c:	008b9014 	addeq	r9, fp, r4, lsl r0
     b10:	0002f000 	andeq	pc, r2, r0
     b14:	50011300 	andpl	r1, r1, r0, lsl #6
     b18:	00007402 	andeq	r7, r0, r2, lsl #8
     b1c:	04e50c00 	strbteq	r0, [r5], #3072	; 0xc00
     b20:	9c010000 	stcls	0, cr0, [r1], {-0}
     b24:	000004af 	andeq	r0, r0, pc, lsr #9
     b28:	00008b94 	muleq	r0, r4, fp
     b2c:	000001c0 	andeq	r0, r0, r0, asr #3
     b30:	04af9c01 	strteq	r9, [pc], #3073	; b38 <__start-0x74c8>
     b34:	21110000 	tstcs	r1, r0
     b38:	01000004 	tsteq	r0, r4
     b3c:	0000339c 	muleq	r0, ip, r3
     b40:	00042f00 	andeq	r2, r4, r0, lsl #30
     b44:	044a1100 	strbeq	r1, [sl], #-256	; 0x100
     b48:	9c010000 	stcls	0, cr0, [r1], {-0}
     b4c:	000004b1 			; <UNDEFINED> instruction: 0x000004b1
     b50:	00000604 	andeq	r0, r0, r4, lsl #12
     b54:	0003ee0e 	andeq	lr, r3, lr, lsl #28
     b58:	af9e0100 	svcge	0x009e0100
     b5c:	22000004 	andcs	r0, r0, #4
     b60:	0b000006 	bleq	b80 <__start-0x7480>
     b64:	00008ba8 	andeq	r8, r0, r8, lsr #23
     b68:	000005d7 	ldrdeq	r0, [r0], -r7
     b6c:	008c0c0b 	addeq	r0, ip, fp, lsl #24
     b70:	0005de00 	andeq	sp, r5, r0, lsl #28
     b74:	8c240b00 	stchi	11, cr0, [r4], #-0
     b78:	05f30000 	ldrbeq	r0, [r3, #0]!
     b7c:	340b0000 	strcc	r0, [fp], #-0
     b80:	1800008c 	stmdane	r0, {r2, r3, r7}
     b84:	0b000006 	bleq	ba4 <__start-0x745c>
     b88:	00008c48 	andeq	r8, r0, r8, asr #24
     b8c:	0000062d 	andeq	r0, r0, sp, lsr #12
     b90:	008c580b 	addeq	r5, ip, fp, lsl #16
     b94:	00064700 	andeq	r4, r6, r0, lsl #14
     b98:	8c700b00 	ldclhi	11, cr0, [r0], #-0
     b9c:	065c0000 	ldrbeq	r0, [ip], -r0
     ba0:	880b0000 	stmdahi	fp, {}	; <UNPREDICTABLE>
     ba4:	7b00008c 	blvc	ddc <__start-0x7224>
     ba8:	0b000006 	bleq	bc8 <__start-0x7438>
     bac:	00008c98 	muleq	r0, r8, ip
     bb0:	0000069a 	muleq	r0, sl, r6
     bb4:	008cac0b 	addeq	sl, ip, fp, lsl #24
     bb8:	0006ab00 	andeq	sl, r6, r0, lsl #22
     bbc:	8cd00b00 	vldmiahi	r0, {d16-d15}
     bc0:	06c50000 	strbeq	r0, [r5], r0
     bc4:	e40b0000 	str	r0, [fp], #-0
     bc8:	ee00008c 	cdp	0, 0, cr0, cr0, cr12, {4}
     bcc:	0b000006 	bleq	bec <__start-0x7414>
     bd0:	00008cf4 	strdeq	r8, [r0], -r4
     bd4:	0000070e 	andeq	r0, r0, lr, lsl #14
     bd8:	008d040b 	addeq	r0, sp, fp, lsl #8
     bdc:	00071f00 	andeq	r1, r7, r0, lsl #30
     be0:	8d100b00 	vldrhi	d0, [r0, #-0]
     be4:	07300000 	ldreq	r0, [r0, -r0]!
     be8:	1c0b0000 	stcne	0, cr0, [fp], {-0}
     bec:	3700008d 	strcc	r0, [r0, -sp, lsl #1]
     bf0:	0b000007 	bleq	c14 <__start-0x73ec>
     bf4:	00008d28 	andeq	r8, r0, r8, lsr #26
     bf8:	00000742 	andeq	r0, r0, r2, asr #14
     bfc:	008d380b 	addeq	r3, sp, fp, lsl #16
     c00:	00074d00 	andeq	r4, r7, r0, lsl #26
     c04:	8d480b00 	vstrhi	d16, [r8, #-0]
     c08:	05990000 	ldreq	r0, [r9]
     c0c:	15000000 	strne	r0, [r0, #-0]
     c10:	33040704 	movwcc	r0, #18180	; 0x4704
     c14:	16000000 	strne	r0, [r0], -r0
     c18:	0000022b 	andeq	r0, r0, fp, lsr #4
     c1c:	000004c7 	andeq	r0, r0, r7, asr #9
     c20:	0004c717 	andeq	ip, r4, r7, lsl r7
     c24:	02001f00 	andeq	r1, r0, #0, 30
     c28:	02550704 	subseq	r0, r5, #4, 14	; 0x100000
     c2c:	d9180000 	ldmdble	r8, {}	; <UNPREDICTABLE>
     c30:	04000004 	streq	r0, [r0], #-4
     c34:	0004df4d 	andeq	sp, r4, sp, asr #30
     c38:	18030500 	stmdane	r3, {r8, sl}
     c3c:	190000c0 	stmdbne	r0, {r6, r7}
     c40:	000004b7 			; <UNDEFINED> instruction: 0x000004b7
     c44:	0004f416 	andeq	pc, r4, r6, lsl r4	; <UNPREDICTABLE>
     c48:	0004f400 	andeq	pc, r4, r0, lsl #8
     c4c:	04c71700 	strbeq	r1, [r7], #1792	; 0x700
     c50:	001f0000 	andseq	r0, pc, r0
     c54:	04fa0407 	ldrbteq	r0, [sl], #1031	; 0x407
     c58:	a4190000 	ldrge	r0, [r9], #-0
     c5c:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     c60:	00000500 	andeq	r0, r0, r0, lsl #10
     c64:	04e44f04 	strbteq	r4, [r4], #3844	; 0xf04
     c68:	03050000 	movweq	r0, #20480	; 0x5000
     c6c:	0000cf20 	andeq	ip, r0, r0, lsr #30
     c70:	0004fc18 	andeq	pc, r4, r8, lsl ip	; <UNPREDICTABLE>
     c74:	21510400 	cmpcs	r1, r0, lsl #8
     c78:	05000005 	streq	r0, [r0, #-5]
     c7c:	00c00c03 	sbceq	r0, r0, r3, lsl #24
     c80:	005a1900 	subseq	r1, sl, r0, lsl #18
     c84:	b5180000 	ldrlt	r0, [r8, #-0]
     c88:	04000003 	streq	r0, [r0], #-3
     c8c:	00052153 	andeq	r2, r5, r3, asr r1
     c90:	10030500 	andne	r0, r3, r0, lsl #10
     c94:	180000c0 	stmdane	r0, {r6, r7}
     c98:	00000429 	andeq	r0, r0, r9, lsr #8
     c9c:	05215504 	streq	r5, [r1, #-1284]!	; 0x504
     ca0:	03050000 	movweq	r0, #20480	; 0x5000
     ca4:	0000cfa0 	andeq	ip, r0, r0, lsr #31
     ca8:	00034518 	andeq	r4, r3, r8, lsl r5
     cac:	21570400 	cmpcs	r7, r0, lsl #8
     cb0:	05000005 	streq	r0, [r0, #-5]
     cb4:	00c00803 	sbceq	r0, r0, r3, lsl #16
     cb8:	055e1800 	ldrbeq	r1, [lr, #-2048]	; 0x800
     cbc:	59040000 	stmdbpl	r4, {}	; <UNPREDICTABLE>
     cc0:	00000521 	andeq	r0, r0, r1, lsr #10
     cc4:	c0140305 	andsgt	r0, r4, r5, lsl #6
     cc8:	7a160000 	bvc	580cd0 <__user_program+0x280cd0>
     ccc:	7a000005 	bvc	ce8 <__start-0x7318>
     cd0:	17000005 	strne	r0, [r0, -r5]
     cd4:	000004c7 	andeq	r0, r0, r7, asr #9
     cd8:	08020020 	stmdaeq	r2, {r5}
     cdc:	0004de04 	andeq	sp, r4, r4, lsl #28
     ce0:	02a31800 	adceq	r1, r3, #0, 16
     ce4:	5b040000 	blpl	100cec <__bss_end+0xf3cec>
     ce8:	0000056a 	andeq	r0, r0, sl, ror #10
     cec:	ce180305 	cdpgt	3, 1, cr0, cr8, cr5, {0}
     cf0:	221a0000 	andscs	r0, sl, #0
     cf4:	05000005 	streq	r0, [r0, #-5]
     cf8:	03a21a2c 			; <UNDEFINED> instruction: 0x03a21a2c
     cfc:	30060000 	andcc	r0, r6, r0
     d00:	0003041a 	andeq	r0, r3, sl, lsl r4
     d04:	1b390500 	blne	e4210c <__user_program+0xb4210c>
     d08:	0000049c 	muleq	r0, ip, r4
     d0c:	05b41008 	ldreq	r1, [r4, #8]!
     d10:	001c0000 	andseq	r0, ip, r0
     d14:	0002751a 	andeq	r7, r2, sl, lsl r5
     d18:	1d310700 	ldcne	7, cr0, [r1, #-0]
     d1c:	0000044f 	andeq	r0, r0, pc, asr #8
     d20:	00331708 	eorseq	r1, r3, r8, lsl #14
     d24:	05cc0000 	strbeq	r0, [ip]
     d28:	001c0000 	andseq	r0, ip, r0
     d2c:	0003531e 	andeq	r5, r3, lr, lsl r3
     d30:	33330500 	teqcc	r3, #0, 10
     d34:	1a000000 	bne	d3c <__start-0x72c4>
     d38:	00000390 	muleq	r0, r0, r3
     d3c:	851f2b06 	ldrhi	r2, [pc, #-2822]	; 23e <__start-0x7dc2>
     d40:	04000002 	streq	r0, [r0], #-2
     d44:	0004af63 	andeq	sl, r4, r3, ror #30
     d48:	0005f300 	andeq	pc, r5, r0, lsl #6
     d4c:	00332000 	eorseq	r2, r3, r0
     d50:	1f000000 	svcne	0x00000000
     d54:	0000046a 	andeq	r0, r0, sl, ror #8
     d58:	00336d04 	eorseq	r6, r3, r4, lsl #26
     d5c:	06120000 	ldreq	r0, [r2], -r0
     d60:	33200000 	teqcc	r0, #0
     d64:	20000000 	andcs	r0, r0, r0
     d68:	00000612 	andeq	r0, r0, r2, lsl r6
     d6c:	00003320 	andeq	r3, r0, r0, lsr #6
     d70:	04070000 	streq	r0, [r7], #-0
     d74:	00000025 	andeq	r0, r0, r5, lsr #32
     d78:	0004cb1f 	andeq	ip, r4, pc, lsl fp
     d7c:	33760400 	cmncc	r6, #0, 8
     d80:	2d000000 	stccs	0, cr0, [r0, #-0]
     d84:	20000006 	andcs	r0, r0, r6
     d88:	00000033 	andeq	r0, r0, r3, lsr r0
     d8c:	02d51f00 	sbcseq	r1, r5, #0, 30
     d90:	80040000 	andhi	r0, r4, r0
     d94:	00000033 	andeq	r0, r0, r3, lsr r0
     d98:	00000647 	andeq	r0, r0, r7, asr #12
     d9c:	00003320 	andeq	r3, r0, r0, lsr #6
     da0:	04af2000 	strteq	r2, [pc], #0	; da8 <__start-0x7258>
     da4:	1f000000 	svcne	0x00000000
     da8:	0000036c 	andeq	r0, r0, ip, ror #6
     dac:	00338904 	eorseq	r8, r3, r4, lsl #18
     db0:	065c0000 	ldrbeq	r0, [ip], -r0
     db4:	33200000 	teqcc	r0, #0
     db8:	00000000 	andeq	r0, r0, r0
     dbc:	0002be1f 	andeq	fp, r2, pc, lsl lr
     dc0:	33940400 	orrscc	r0, r4, #0, 8
     dc4:	7b000000 	blvc	dcc <__start-0x7234>
     dc8:	20000006 	andcs	r0, r0, r6
     dcc:	00000033 	andeq	r0, r0, r3, lsr r0
     dd0:	00003320 	andeq	r3, r0, r0, lsr #6
     dd4:	00332000 	eorseq	r2, r3, r0
     dd8:	1f000000 	svcne	0x00000000
     ddc:	0000056a 	andeq	r0, r0, sl, ror #10
     de0:	00339e04 	eorseq	r9, r3, r4, lsl #28
     de4:	069a0000 	ldreq	r0, [sl], r0
     de8:	33200000 	teqcc	r0, #0
     dec:	20000000 	andcs	r0, r0, r0
     df0:	00000612 	andeq	r0, r0, r2, lsl r6
     df4:	00003320 	andeq	r3, r0, r0, lsr #6
     df8:	3d210000 	stccc	0, cr0, [r1, #-0]
     dfc:	04000004 	streq	r0, [r0], #-4
     e00:	0006aba6 	andeq	sl, r6, r6, lsr #23
     e04:	00332000 	eorseq	r2, r3, r0
     e08:	1f000000 	svcne	0x00000000
     e0c:	000003ca 	andeq	r0, r0, sl, asr #7
     e10:	0033b404 	eorseq	fp, r3, r4, lsl #8
     e14:	06c50000 	strbeq	r0, [r5], r0
     e18:	af200000 	svcge	0x00200000
     e1c:	20000000 	andcs	r0, r0, r0
     e20:	000002ea 	andeq	r0, r0, sl, ror #5
     e24:	03281f00 	teqeq	r8, #0, 30
     e28:	c1040000 	mrsgt	r0, (UNDEF: 4)
     e2c:	00000033 	andeq	r0, r0, r3, lsr r0
     e30:	000006ee 	andeq	r0, r0, lr, ror #13
     e34:	0000af20 	andeq	sl, r0, r0, lsr #30
     e38:	02ea2000 	rsceq	r2, sl, #0
     e3c:	65200000 	strvs	r0, [r0, #-0]!
     e40:	20000000 	andcs	r0, r0, r0
     e44:	00000065 	andeq	r0, r0, r5, rrx
     e48:	00006520 	andeq	r6, r0, r0, lsr #10
     e4c:	7b1f0000 	blvc	7c0e54 <__user_program+0x4c0e54>
     e50:	04000003 	streq	r0, [r0], #-3
     e54:	000033cf 	andeq	r3, r0, pc, asr #7
     e58:	00070800 	andeq	r0, r7, r0, lsl #16
     e5c:	07082000 	streq	r2, [r8, -r0]
     e60:	65200000 	strvs	r0, [r0, #-0]!
     e64:	00000000 	andeq	r0, r0, r0
     e68:	00a40407 	adceq	r0, r4, r7, lsl #8
     e6c:	d6210000 	strtle	r0, [r1], -r0
     e70:	04000003 	streq	r0, [r0], #-3
     e74:	00071fd9 	ldrdeq	r1, [r7], -r9
     e78:	07082000 	streq	r2, [r8, -r0]
     e7c:	21000000 	mrscs	r0, (UNDEF: 0)
     e80:	000003e1 	andeq	r0, r0, r1, ror #7
     e84:	0730df04 	ldreq	sp, [r0, -r4, lsl #30]!
     e88:	08200000 	stmdaeq	r0!, {}	; <UNPREDICTABLE>
     e8c:	00000007 	andeq	r0, r0, r7
     e90:	00040a1a 	andeq	r0, r4, sl, lsl sl
     e94:	1ee20400 	cdpne	4, 14, cr0, cr2, cr0, {0}
     e98:	000004f3 	strdeq	r0, [r0], -r3
     e9c:	0065e504 	rsbeq	lr, r5, r4, lsl #10
     ea0:	181e0000 	ldmdane	lr, {}	; <UNPREDICTABLE>
     ea4:	04000003 	streq	r0, [r0], #-3
     ea8:	000033ef 	andeq	r3, r0, pc, ror #7
     eac:	05432200 	strbeq	r2, [r3, #-512]	; 0x200
     eb0:	fc040000 	stc2	0, cr0, [r4], {-0}
     eb4:	00006520 	andeq	r6, r0, r0, lsr #10
     eb8:	f0000000 			; <UNDEFINED> instruction: 0xf0000000
     ebc:	04000002 	streq	r0, [r0], #-2
     ec0:	0005ca00 	andeq	ip, r5, r0, lsl #20
     ec4:	6d010400 	cfstrsvs	mvf0, [r1, #-0]
     ec8:	01000000 	mrseq	r0, (UNDEF: 0)
     ecc:	000005ec 	andeq	r0, r0, ip, ror #11
     ed0:	0000010e 	andeq	r0, r0, lr, lsl #2
     ed4:	00008d54 	andeq	r8, r0, r4, asr sp
     ed8:	00000298 	muleq	r0, r8, r2
     edc:	000003f1 	strdeq	r0, [r0], -r1
     ee0:	0000ed02 	andeq	lr, r0, r2, lsl #26
     ee4:	300e0200 	andcc	r0, lr, r0, lsl #4
     ee8:	03000000 	movweq	r0, #0
     eec:	00fd0801 	rscseq	r0, sp, r1, lsl #16
     ef0:	02030000 	andeq	r0, r3, #0
     ef4:	00016205 	andeq	r6, r1, r5, lsl #4
     ef8:	017b0200 	cmneq	fp, r0, lsl #4
     efc:	12020000 	andne	r0, r2, #0
     f00:	00000049 	andeq	r0, r0, r9, asr #32
     f04:	69050404 	stmdbvs	r5, {r2, sl}
     f08:	0300746e 	movweq	r7, #1134	; 0x46e
     f0c:	00000508 	andeq	r0, r0, r8, lsl #10
     f10:	ec020000 	stc	0, cr0, [r2], {-0}
     f14:	02000000 	andeq	r0, r0, #0
     f18:	00006216 	andeq	r6, r0, r6, lsl r2
     f1c:	08010300 	stmdaeq	r1, {r8, r9}
     f20:	000000f4 	strdeq	r0, [r0], -r4
     f24:	35070203 	strcc	r0, [r7, #-515]	; 0x203
     f28:	02000001 	andeq	r0, r0, #1
     f2c:	0000017a 	andeq	r0, r0, sl, ror r1
     f30:	007b1a02 	rsbseq	r1, fp, r2, lsl #20
     f34:	04030000 	streq	r0, [r3], #-0
     f38:	00004407 	andeq	r4, r0, r7, lsl #8
     f3c:	05a70200 	streq	r0, [r7, #512]!	; 0x200
     f40:	1c020000 	stcne	0, cr0, [r2], {-0}
     f44:	0000008d 	andeq	r0, r0, sp, lsl #1
     f48:	3a070803 	bcc	1c2f5c <__end+0x94f5c>
     f4c:	02000000 	andeq	r0, r0, #0
     f50:	000005bc 			; <UNDEFINED> instruction: 0x000005bc
     f54:	009f1303 	addseq	r1, pc, r3, lsl #6
     f58:	ba050000 	blt	140f60 <__end+0x12f60>
     f5c:	04000005 	streq	r0, [r0], #-5
     f60:	00b60004 	adcseq	r0, r6, r4
     f64:	01060000 	mrseq	r0, (UNDEF: 6)
     f68:	b6000006 	strlt	r0, [r0], -r6
     f6c:	00000000 	andeq	r0, r0, r0
     f70:	08040700 	stmdaeq	r4, {r8, r9, sl}
     f74:	000005b0 			; <UNDEFINED> instruction: 0x000005b0
     f78:	8d542101 	ldfhie	f2, [r4, #-4]
     f7c:	00e00000 	rsceq	r0, r0, r0
     f80:	9c010000 	stcls	0, cr0, [r1], {-0}
     f84:	0000012a 	andeq	r0, r0, sl, lsr #2
     f88:	0005e009 	andeq	lr, r5, r9
     f8c:	57210100 	strpl	r0, [r1, -r0, lsl #2]!
     f90:	55000000 	strpl	r0, [r0, #-0]
     f94:	0a000007 	beq	fb8 <__start-0x7048>
     f98:	006d756e 	rsbeq	r7, sp, lr, ror #10
     f9c:	00822101 	addeq	r2, r2, r1, lsl #2
     fa0:	07760000 	ldrbeq	r0, [r6, -r0]!
     fa4:	d90b0000 	stmdble	fp, {}	; <UNPREDICTABLE>
     fa8:	01000005 	tsteq	r0, r5
     fac:	00012a22 	andeq	r2, r1, r2, lsr #20
     fb0:	0007ae00 	andeq	sl, r7, r0, lsl #28
     fb4:	75620c00 	strbvc	r0, [r2, #-3072]!	; 0xc00
     fb8:	23010066 	movwcs	r0, #4198	; 0x1066
     fbc:	00000130 	andeq	r0, r0, r0, lsr r1
     fc0:	0d589102 	ldfeqp	f1, [r8, #-8]
     fc4:	00727470 	rsbseq	r7, r2, r0, ror r4
     fc8:	012a2401 	teqeq	sl, r1, lsl #8
     fcc:	07e50000 	strbeq	r0, [r5, r0]!
     fd0:	080e0000 	stmdaeq	lr, {}	; <UNPREDICTABLE>
     fd4:	e600008e 	str	r0, [r0], -lr, lsl #1
     fd8:	0e000002 	cdpeq	0, 0, cr0, cr0, cr2, {0}
     fdc:	00008e20 	andeq	r8, r0, r0, lsr #28
     fe0:	000002e6 	andeq	r0, r0, r6, ror #5
     fe4:	25040f00 	strcs	r0, [r4, #-3840]	; 0xf00
     fe8:	10000000 	andne	r0, r0, r0
     fec:	00000025 	andeq	r0, r0, r5, lsr #32
     ff0:	00000140 	andeq	r0, r0, r0, asr #2
     ff4:	00014011 	andeq	r4, r1, r1, lsl r0
     ff8:	03000700 	movweq	r0, #1792	; 0x700
     ffc:	02550704 	subseq	r0, r5, #4, 14	; 0x100000
    1000:	e5120000 	ldr	r0, [r2, #-0]
    1004:	01000005 	tsteq	r0, r5
    1008:	0000493f 	andeq	r4, r0, pc, lsr r9
    100c:	008e3400 	addeq	r3, lr, r0, lsl #8
    1010:	0001b800 	andeq	fp, r1, r0, lsl #16
    1014:	b59c0100 	ldrlt	r0, [ip, #256]	; 0x100
    1018:	0a000002 	beq	1028 <__start-0x6fd8>
    101c:	00746d66 	rsbseq	r6, r4, r6, ror #26
    1020:	02b53f01 	adcseq	r3, r5, #1, 30
    1024:	084d0000 	stmdaeq	sp, {}^	; <UNPREDICTABLE>
    1028:	14130000 	ldrne	r0, [r3], #-0
    102c:	0000044a 	andeq	r0, r0, sl, asr #8
    1030:	00944001 	addseq	r4, r4, r1
    1034:	91020000 	mrsls	r0, (UNDEF: 2)
    1038:	00001554 	andeq	r1, r0, r4, asr r5
    103c:	01a70000 			; <UNDEFINED> instruction: 0x01a70000
    1040:	6e0d0000 	cdpvs	0, 0, cr0, cr13, cr0, {0}
    1044:	01006d75 	tsteq	r0, r5, ror sp
    1048:	00007061 	andeq	r7, r0, r1, rrx
    104c:	00088400 	andeq	r8, r8, r0, lsl #8
    1050:	8f4c1600 	svchi	0x004c1600
    1054:	00b80000 	adcseq	r0, r8, r0
    1058:	01170000 	tsteq	r7, r0
    105c:	00780250 	rsbseq	r0, r8, r0, asr r2
    1060:	18150000 	ldmdane	r5, {}	; <UNPREDICTABLE>
    1064:	d0000000 	andle	r0, r0, r0
    1068:	0d000001 	stceq	0, cr0, [r0, #-4]
    106c:	006d756e 	rsbeq	r7, sp, lr, ror #10
    1070:	00706801 	rsbseq	r6, r0, r1, lsl #16
    1074:	08a30000 	stmiaeq	r3!, {}	; <UNPREDICTABLE>
    1078:	6c160000 	ldcvs	0, cr0, [r6], {-0}
    107c:	b800008f 	stmdalt	r0, {r0, r1, r2, r3, r7}
    1080:	17000000 	strne	r0, [r0, -r0]
    1084:	77025001 	strvc	r5, [r2, -r1]
    1088:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    108c:	00008ec8 	andeq	r8, r0, r8, asr #29
    1090:	00000048 	andeq	r0, r0, r8, asr #32
    1094:	00000223 	andeq	r0, r0, r3, lsr #4
    1098:	6d756e0d 	ldclvs	14, cr6, [r5, #-52]!	; 0xffffffcc
    109c:	3e500100 	rdfccs	f0, f0, f0
    10a0:	c2000000 	andgt	r0, r0, #0
    10a4:	19000008 	stmdbne	r0, {r3}
    10a8:	00008ee8 	andeq	r8, r0, r8, ror #29
    10ac:	000002e6 	andeq	r0, r0, r6, ror #5
    10b0:	00000200 	andeq	r0, r0, r0, lsl #4
    10b4:	02500117 	subseq	r0, r0, #-1073741819	; 0xc0000005
    10b8:	19002d08 	stmdbne	r0, {r3, r8, sl, fp, sp}
    10bc:	00008ef8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
    10c0:	000000b8 	strheq	r0, [r0], -r8
    10c4:	00000213 	andeq	r0, r0, r3, lsl r2
    10c8:	01500117 	cmpeq	r0, r7, lsl r1
    10cc:	0c16003a 	ldceq	0, cr0, [r6], {58}	; 0x3a
    10d0:	b800008f 	stmdalt	r0, {r0, r1, r2, r3, r7}
    10d4:	17000000 	strne	r0, [r0, -r0]
    10d8:	3a015001 	bcc	550e4 <__bss_end+0x480e4>
    10dc:	10180000 	andsne	r0, r8, r0
    10e0:	2000008f 	andcs	r0, r0, pc, lsl #1
    10e4:	4f000000 	svcmi	0x00000000
    10e8:	0d000002 	stceq	0, cr0, [r0, #-8]
    10ec:	006d756e 	rsbeq	r7, sp, lr, ror #10
    10f0:	00705b01 	rsbseq	r5, r0, r1, lsl #22
    10f4:	08d50000 	ldmeq	r5, {}^	; <UNPREDICTABLE>
    10f8:	2c160000 	ldccs	0, cr0, [r6], {-0}
    10fc:	b800008f 	stmdalt	r0, {r0, r1, r2, r3, r7}
    1100:	17000000 	strne	r0, [r0, -r0]
    1104:	3a015001 	bcc	55110 <__bss_end+0x48110>
    1108:	70180000 	andsvc	r0, r8, r0
    110c:	3000008f 	andcc	r0, r0, pc, lsl #1
    1110:	75000000 	strvc	r0, [r0, #-0]
    1114:	0b000002 	bleq	1124 <__start-0x6edc>
    1118:	0000059e 	muleq	r0, lr, r5
    111c:	012a6e01 	teqeq	sl, r1, lsl #28
    1120:	08f40000 	ldmeq	r4!, {}^	; <UNPREDICTABLE>
    1124:	900e0000 	andls	r0, lr, r0
    1128:	e600008f 	str	r0, [r0], -pc, lsl #1
    112c:	00000002 	andeq	r0, r0, r2
    1130:	008fa018 	addeq	sl, pc, r8, lsl r0	; <UNPREDICTABLE>
    1134:	00001800 	andeq	r1, r0, r0, lsl #16
    1138:	00029b00 	andeq	r9, r2, r0, lsl #22
    113c:	06340b00 	ldrteq	r0, [r4], -r0, lsl #22
    1140:	77010000 	strvc	r0, [r1, -r0]
    1144:	0000003e 	andeq	r0, r0, lr, lsr r0
    1148:	00000914 	andeq	r0, r0, r4, lsl r9
    114c:	008fb40e 	addeq	fp, pc, lr, lsl #8
    1150:	0002e600 	andeq	lr, r2, r0, lsl #12
    1154:	6c0e0000 	stcvs	0, cr0, [lr], {-0}
    1158:	e600008e 	str	r0, [r0], -lr, lsl #1
    115c:	16000002 	strne	r0, [r0], -r2
    1160:	00008fc0 	andeq	r8, r0, r0, asr #31
    1164:	000002e6 	andeq	r0, r0, r6, ror #5
    1168:	02500117 	subseq	r0, r0, #-1073741819	; 0xc0000005
    116c:	00002508 	andeq	r2, r0, r8, lsl #10
    1170:	02bb040f 	adcseq	r0, fp, #251658240	; 0xf000000
    1174:	301a0000 	andscc	r0, sl, r0
    1178:	10000000 	andne	r0, r0, r0
    117c:	00000030 	andeq	r0, r0, r0, lsr r0
    1180:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    1184:	00014011 	andeq	r4, r1, r1, lsl r0
    1188:	14001000 	strne	r1, [r0], #-0
    118c:	000005d2 	ldrdeq	r0, [r0], -r2
    1190:	02e11801 	rsceq	r1, r1, #65536	; 0x10000
    1194:	03050000 	movweq	r0, #20480	; 0x5000
    1198:	0000b008 	andeq	fp, r0, r8
    119c:	0002c01a 	andeq	ip, r2, sl, lsl r0
    11a0:	05c41b00 	strbeq	r1, [r4, #2816]	; 0xb00
    11a4:	3d050000 	stccc	0, cr0, [r5, #-0]
    11a8:	0000571c 	andeq	r5, r0, ip, lsl r7
    11ac:	bf000000 	svclt	0x00000000
    11b0:	04000000 	streq	r0, [r0], #-0
    11b4:	00073400 	andeq	r3, r7, r0, lsl #8
    11b8:	6d010400 	cfstrsvs	mvf0, [r1, #-0]
    11bc:	01000000 	mrseq	r0, (UNDEF: 0)
    11c0:	00000617 	andeq	r0, r0, r7, lsl r6
    11c4:	0000010e 	andeq	r0, r0, lr, lsl #2
    11c8:	00008fec 	andeq	r8, r0, ip, ror #31
    11cc:	000000a8 	andeq	r0, r0, r8, lsr #1
    11d0:	000004d7 	ldrdeq	r0, [r0], -r7
    11d4:	fd080102 	stc2	1, cr0, [r8, #-8]
    11d8:	02000000 	andeq	r0, r0, #0
    11dc:	01620502 	cmneq	r2, r2, lsl #10
    11e0:	04030000 	streq	r0, [r3], #-0
    11e4:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
    11e8:	05080200 	streq	r0, [r8, #-512]	; 0x200
    11ec:	00000000 	andeq	r0, r0, r0
    11f0:	f4080102 	vst4.8	{d0,d2,d4,d6}, [r8], r2
    11f4:	02000000 	andeq	r0, r0, #0
    11f8:	01350702 	teqeq	r5, r2, lsl #14
    11fc:	7a040000 	bvc	101204 <__bss_end+0xf4204>
    1200:	02000001 	andeq	r0, r0, #1
    1204:	00005a1a 	andeq	r5, r0, sl, lsl sl
    1208:	07040200 	streq	r0, [r4, -r0, lsl #4]
    120c:	00000044 	andeq	r0, r0, r4, asr #32
    1210:	3a070802 	bcc	1c3220 <__end+0x95220>
    1214:	05000000 	streq	r0, [r0, #-0]
    1218:	0000060b 	andeq	r0, r0, fp, lsl #12
    121c:	8fec0e01 	svchi	0x00ec0e01
    1220:	004c0000 	subeq	r0, ip, r0
    1224:	9c010000 	stcls	0, cr0, [r1], {-0}
    1228:	0000008b 	andeq	r0, r0, fp, lsl #1
    122c:	00060606 	andeq	r0, r6, r6, lsl #12
    1230:	330e0100 	movwcc	r0, #57600	; 0xe100
    1234:	01000000 	mrseq	r0, (UNDEF: 0)
    1238:	22070050 	andcs	r0, r7, #80	; 0x50
    123c:	01000005 	tsteq	r0, r5
    1240:	00903818 	addseq	r3, r0, r8, lsl r8
    1244:	00003000 	andeq	r3, r0, r0
    1248:	089c0100 	ldmeq	ip, {r8}
    124c:	00000353 	andeq	r0, r0, r3, asr r3
    1250:	00332001 	eorseq	r2, r3, r1
    1254:	90680000 	rsbls	r0, r8, r0
    1258:	00140000 	andseq	r0, r4, r0
    125c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1260:	00030407 	andeq	r0, r3, r7, lsl #8
    1264:	7c260100 	stfvcs	f0, [r6], #-0
    1268:	18000090 	stmdane	r0, {r4, r7}
    126c:	01000000 	mrseq	r0, (UNDEF: 0)
    1270:	0160009c 			; <UNDEFINED> instruction: 0x0160009c
    1274:	00040000 	andeq	r0, r4, r0
    1278:	000007c6 	andeq	r0, r0, r6, asr #15
    127c:	006d0104 	rsbeq	r0, sp, r4, lsl #2
    1280:	46010000 	strmi	r0, [r1], -r0
    1284:	0e000006 	cdpeq	0, 0, cr0, cr0, cr6, {0}
    1288:	94000001 	strls	r0, [r0], #-1
    128c:	d8000090 	stmdale	r0, {r4, r7}
    1290:	46000000 	strmi	r0, [r0], -r0
    1294:	02000005 	andeq	r0, r0, #5
    1298:	00fd0801 	rscseq	r0, sp, r1, lsl #16
    129c:	02020000 	andeq	r0, r2, #0
    12a0:	00016205 	andeq	r6, r1, r5, lsl #4
    12a4:	05040300 	streq	r0, [r4, #-768]	; 0x300
    12a8:	00746e69 	rsbseq	r6, r4, r9, ror #28
    12ac:	00050802 	andeq	r0, r5, r2, lsl #16
    12b0:	04000000 	streq	r0, [r0], #-0
    12b4:	000000ec 	andeq	r0, r0, ip, ror #1
    12b8:	004c1602 	subeq	r1, ip, r2, lsl #12
    12bc:	01020000 	mrseq	r0, (UNDEF: 2)
    12c0:	0000f408 	andeq	pc, r0, r8, lsl #8
    12c4:	07020200 	streq	r0, [r2, -r0, lsl #4]
    12c8:	00000135 	andeq	r0, r0, r5, lsr r1
    12cc:	00017a04 	andeq	r7, r1, r4, lsl #20
    12d0:	651a0200 	ldrvs	r0, [sl, #-512]	; 0x200
    12d4:	02000000 	andeq	r0, r0, #0
    12d8:	00440704 	subeq	r0, r4, r4, lsl #14
    12dc:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    12e0:	00003a07 	andeq	r3, r0, r7, lsl #20
    12e4:	02750500 	rsbseq	r0, r5, #0, 10
    12e8:	0f010000 	svceq	0x00010000
    12ec:	00009094 	muleq	r0, r4, r0
    12f0:	00000074 	andeq	r0, r0, r4, ror r0
    12f4:	00f29c01 	rscseq	r9, r2, r1, lsl #24
    12f8:	39060000 	stmdbcc	r6, {}	; <UNPREDICTABLE>
    12fc:	01000006 	tsteq	r0, r6
    1300:	00005a1b 	andeq	r5, r0, fp, lsl sl
    1304:	07010e00 	streq	r0, [r1, -r0, lsl #28]
    1308:	000090a4 	andeq	r9, r0, r4, lsr #1
    130c:	0000013b 	andeq	r0, r0, fp, lsr r1
    1310:	000000ad 	andeq	r0, r0, sp, lsr #1
    1314:	01510108 	cmpeq	r1, r8, lsl #2
    1318:	50010830 	andpl	r0, r1, r0, lsr r8
    131c:	07003f01 	streq	r3, [r0, -r1, lsl #30]
    1320:	000090b0 	strheq	r9, [r0], -r0
    1324:	0000013b 	andeq	r0, r0, fp, lsr r1
    1328:	000000c5 	andeq	r0, r0, r5, asr #1
    132c:	01510108 	cmpeq	r1, r8, lsl #2
    1330:	50010830 	andpl	r0, r1, r0, lsr r8
    1334:	07003e01 	streq	r3, [r0, -r1, lsl #28]
    1338:	000090bc 	strheq	r9, [r0], -ip
    133c:	00000151 	andeq	r0, r0, r1, asr r1
    1340:	000000dd 	ldrdeq	r0, [r0], -sp
    1344:	01510108 	cmpeq	r1, r8, lsl #2
    1348:	50010832 	andpl	r0, r1, r2, lsr r8
    134c:	09003f01 	stmdbeq	r0, {r0, r8, r9, sl, fp, ip, sp}
    1350:	000090c8 	andeq	r9, r0, r8, asr #1
    1354:	00000151 	andeq	r0, r0, r1, asr r1
    1358:	01510108 	cmpeq	r1, r8, lsl #2
    135c:	50010832 	andpl	r0, r1, r2, lsr r8
    1360:	00003e01 	andeq	r3, r0, r1, lsl #28
    1364:	0006590a 	andeq	r5, r6, sl, lsl #18
    1368:	08200100 	stmdaeq	r0!, {r8}
    136c:	18000091 	stmdane	r0, {r0, r4, r7}
    1370:	01000000 	mrseq	r0, (UNDEF: 0)
    1374:	05c4059c 	strbeq	r0, [r4, #1436]	; 0x59c
    1378:	24010000 	strcs	r0, [r1], #-0
    137c:	00009120 	andeq	r9, r0, r0, lsr #2
    1380:	00000024 	andeq	r0, r0, r4, lsr #32
    1384:	01269c01 	teqeq	r6, r1, lsl #24
    1388:	340b0000 	strcc	r0, [fp], #-0
    138c:	01000006 	tsteq	r0, r6
    1390:	00004124 	andeq	r4, r0, r4, lsr #2
    1394:	00500100 	subseq	r0, r0, r0, lsl #2
    1398:	00062b0c 	andeq	r2, r6, ip, lsl #22
    139c:	41290100 	teqmi	r9, r0, lsl #2
    13a0:	44000000 	strmi	r0, [r0], #-0
    13a4:	28000091 	stmdacs	r0, {r0, r4, r7}
    13a8:	01000000 	mrseq	r0, (UNDEF: 0)
    13ac:	016c0d9c 			; <UNDEFINED> instruction: 0x016c0d9c
    13b0:	4b030000 	blmi	c13b8 <__bss_end+0xb43b8>
    13b4:	00000151 	andeq	r0, r0, r1, asr r1
    13b8:	0000410e 	andeq	r4, r0, lr, lsl #2
    13bc:	00410e00 	subeq	r0, r1, r0, lsl #28
    13c0:	0f000000 	svceq	0x00000000
    13c4:	00000156 	andeq	r0, r0, r6, asr r1
    13c8:	410e3703 	tstmi	lr, r3, lsl #14
    13cc:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    13d0:	00000041 	andeq	r0, r0, r1, asr #32
    13d4:	096f0000 	stmdbeq	pc!, {}^	; <UNPREDICTABLE>
    13d8:	00040000 	andeq	r0, r4, r0
    13dc:	000008b6 			; <UNDEFINED> instruction: 0x000008b6
    13e0:	006d0104 	rsbeq	r0, sp, r4, lsl #2
    13e4:	95010000 	strls	r0, [r1, #-0]
    13e8:	0e000006 	cdpeq	0, 0, cr0, cr0, cr6, {0}
    13ec:	6c000001 	stcvs	0, cr0, [r0], {1}
    13f0:	60000091 	mulvs	r0, r1, r0
    13f4:	cf000009 	svcgt	0x00000009
    13f8:	02000005 	andeq	r0, r0, #5
    13fc:	00fd0801 	rscseq	r0, sp, r1, lsl #16
    1400:	02020000 	andeq	r0, r2, #0
    1404:	00016205 	andeq	r6, r1, r5, lsl #4
    1408:	05040300 	streq	r0, [r4, #-768]	; 0x300
    140c:	00746e69 	rsbseq	r6, r4, r9, ror #28
    1410:	00050802 	andeq	r0, r5, r2, lsl #16
    1414:	04000000 	streq	r0, [r0], #-0
    1418:	000000ec 	andeq	r0, r0, ip, ror #1
    141c:	004c1602 	subeq	r1, ip, r2, lsl #12
    1420:	01020000 	mrseq	r0, (UNDEF: 2)
    1424:	0000f408 	andeq	pc, r0, r8, lsl #8
    1428:	07020200 	streq	r0, [r2, -r0, lsl #4]
    142c:	00000135 	andeq	r0, r0, r5, lsr r1
    1430:	00017a04 	andeq	r7, r1, r4, lsl #20
    1434:	651a0200 	ldrvs	r0, [sl, #-512]	; 0x200
    1438:	02000000 	andeq	r0, r0, #0
    143c:	00440704 	subeq	r0, r4, r4, lsl #14
    1440:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    1444:	00003a07 	andeq	r3, r0, r7, lsl #20
    1448:	04c00500 	strbeq	r0, [r0], #1280	; 0x500
    144c:	030c0000 	movweq	r0, #49152	; 0xc000
    1450:	0000a404 	andeq	sl, r0, r4, lsl #8
    1454:	047f0600 	ldrbteq	r0, [pc], #-1536	; 145c <__start-0x6ba4>
    1458:	05030000 	streq	r0, [r3, #-0]
    145c:	00000041 	andeq	r0, r0, r1, asr #32
    1460:	04340600 	ldrteq	r0, [r4], #-1536	; 0x600
    1464:	06030000 	streq	r0, [r3], -r0
    1468:	0000005a 	andeq	r0, r0, sl, asr r0
    146c:	06f90604 	ldrbteq	r0, [r9], r4, lsl #12
    1470:	07030000 	streq	r0, [r3, -r0]
    1474:	0000005a 	andeq	r0, r0, sl, asr r0
    1478:	86040008 	strhi	r0, [r4], -r8
    147c:	03000004 	movweq	r0, #4
    1480:	00007308 	andeq	r7, r0, r8, lsl #6
    1484:	03860400 	orreq	r0, r6, #0, 8
    1488:	26040000 	strcs	r0, [r4], -r0
    148c:	000000ba 	strheq	r0, [r0], -sl
    1490:	00c00407 	sbceq	r0, r0, r7, lsl #8
    1494:	05080000 	streq	r0, [r8, #-0]
    1498:	000003f5 	strdeq	r0, [r0], -r5
    149c:	2b290470 	blcs	a42664 <__user_program+0x742664>
    14a0:	06000002 	streq	r0, [r0], -r2
    14a4:	00000478 	andeq	r0, r0, r8, ror r4
    14a8:	00412a04 	subeq	r2, r1, r4, lsl #20
    14ac:	06000000 	streq	r0, [r0], -r0
    14b0:	000006b9 			; <UNDEFINED> instruction: 0x000006b9
    14b4:	00412b04 	subeq	r2, r1, r4, lsl #22
    14b8:	06010000 	streq	r0, [r1], -r0
    14bc:	0000054d 	andeq	r0, r0, sp, asr #10
    14c0:	00412c04 	subeq	r2, r1, r4, lsl #24
    14c4:	06020000 	streq	r0, [r2], -r0
    14c8:	00000336 	andeq	r0, r0, r6, lsr r3
    14cc:	005a2d04 	subseq	r2, sl, r4, lsl #26
    14d0:	06040000 	streq	r0, [r4], -r0
    14d4:	0000041a 	andeq	r0, r0, sl, lsl r4
    14d8:	005a2e04 	subseq	r2, sl, r4, lsl #28
    14dc:	06080000 	streq	r0, [r8], -r0
    14e0:	000004b4 			; <UNDEFINED> instruction: 0x000004b4
    14e4:	005a2f04 	subseq	r2, sl, r4, lsl #30
    14e8:	060c0000 	streq	r0, [ip], -r0
    14ec:	0000045f 	andeq	r0, r0, pc, asr r4
    14f0:	005a3004 	subseq	r3, sl, r4
    14f4:	09100000 	ldmdbeq	r0, {}	; <UNPREDICTABLE>
    14f8:	04006e66 	streq	r6, [r0], #-3686	; 0xe66
    14fc:	00005a31 	andeq	r5, r0, r1, lsr sl
    1500:	64061400 	strvs	r1, [r6], #-1024	; 0x400
    1504:	04000003 	streq	r0, [r0], #-3
    1508:	00005a32 	andeq	r5, r0, r2, lsr sl
    150c:	2d061800 	stccs	8, cr1, [r6, #-0]
    1510:	04000005 	streq	r0, [r0], #-5
    1514:	00005a33 	andeq	r5, r0, r3, lsr sl
    1518:	77061c00 	strvc	r1, [r6, -r0, lsl #24]
    151c:	04000005 	streq	r0, [r0], #-5
    1520:	00005a36 	andeq	r5, r0, r6, lsr sl
    1524:	08062000 	stmdaeq	r6, {sp}
    1528:	04000005 	streq	r0, [r0], #-5
    152c:	00005a37 	andeq	r5, r0, r7, lsr sl
    1530:	72092400 	andvc	r2, r9, #0, 8
    1534:	04003231 	streq	r3, [r0], #-561	; 0x231
    1538:	00005a38 	andeq	r5, r0, r8, lsr sl
    153c:	72092800 	andvc	r2, r9, #0, 16
    1540:	04003131 	streq	r3, [r0], #-305	; 0x131
    1544:	00005a39 	andeq	r5, r0, r9, lsr sl
    1548:	72092c00 	andvc	r2, r9, #0, 24
    154c:	04003031 	streq	r3, [r0], #-49	; 0x31
    1550:	00005a3a 	andeq	r5, r0, sl, lsr sl
    1554:	72093000 	andvc	r3, r9, #0
    1558:	3b040039 	blcc	101644 <__bss_end+0xf4644>
    155c:	0000005a 	andeq	r0, r0, sl, asr r0
    1560:	38720934 	ldmdacc	r2!, {r2, r4, r5, r8, fp}^
    1564:	5a3c0400 	bpl	f0256c <__user_program+0xc0256c>
    1568:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
    156c:	00377209 	eorseq	r7, r7, r9, lsl #4
    1570:	005a3d04 	subseq	r3, sl, r4, lsl #26
    1574:	093c0000 	ldmdbeq	ip!, {}	; <UNPREDICTABLE>
    1578:	04003672 	streq	r3, [r0], #-1650	; 0x672
    157c:	00005a3e 	andeq	r5, r0, lr, lsr sl
    1580:	72094000 	andvc	r4, r9, #0
    1584:	3f040035 	svccc	0x00040035
    1588:	0000005a 	andeq	r0, r0, sl, asr r0
    158c:	34720944 	ldrbtcc	r0, [r2], #-2372	; 0x944
    1590:	5a400400 	bpl	1002598 <__user_program+0xd02598>
    1594:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
    1598:	00337209 	eorseq	r7, r3, r9, lsl #4
    159c:	005a4104 	subseq	r4, sl, r4, lsl #2
    15a0:	094c0000 	stmdbeq	ip, {}^	; <UNPREDICTABLE>
    15a4:	04003272 	streq	r3, [r0], #-626	; 0x272
    15a8:	00005a42 	andeq	r5, r0, r2, asr #20
    15ac:	72095000 	andvc	r5, r9, #0
    15b0:	43040031 	movwmi	r0, #16433	; 0x4031
    15b4:	0000005a 	andeq	r0, r0, sl, asr r0
    15b8:	30720954 	rsbscc	r0, r2, r4, asr r9
    15bc:	5a440400 	bpl	11025c4 <__user_program+0xe025c4>
    15c0:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
    15c4:	00053c06 	andeq	r3, r5, r6, lsl #24
    15c8:	5a450400 	bpl	11425d0 <__user_program+0xe425d0>
    15cc:	5c000000 	stcpl	0, cr0, [r0], {-0}
    15d0:	00049506 	andeq	r9, r4, r6, lsl #10
    15d4:	5a460400 	bpl	11825dc <__user_program+0xe825dc>
    15d8:	60000000 	andvs	r0, r0, r0
    15dc:	0003c106 	andeq	ip, r3, r6, lsl #2
    15e0:	5a470400 	bpl	11c25e8 <__user_program+0xec25e8>
    15e4:	64000000 	strvs	r0, [r0], #-0
    15e8:	00048e06 	andeq	r8, r4, r6, lsl #28
    15ec:	5a480400 	bpl	12025f4 <__user_program+0xf025f4>
    15f0:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
    15f4:	0002cc06 	andeq	ip, r2, r6, lsl #24
    15f8:	5a490400 	bpl	1242600 <__user_program+0xf42600>
    15fc:	6c000000 	stcvs	0, cr0, [r0], {-0}
    1600:	027f0400 	rsbseq	r0, pc, #0, 8
    1604:	4a040000 	bmi	10160c <__bss_end+0xf460c>
    1608:	000000c1 	andeq	r0, r0, r1, asr #1
    160c:	00043d0a 	andeq	r3, r4, sl, lsl #26
    1610:	6c160100 	ldfvss	f0, [r6], {-0}
    1614:	20000091 	mulcs	r0, r1, r0
    1618:	01000000 	mrseq	r0, (UNDEF: 0)
    161c:	00027d9c 	muleq	r2, ip, sp
    1620:	04780b00 	ldrbteq	r0, [r8], #-2816	; 0xb00
    1624:	16010000 	strne	r0, [r1], -r0
    1628:	00000033 	andeq	r0, r0, r3, lsr r0
    162c:	00000928 	andeq	r0, r0, r8, lsr #18
    1630:	0091780c 	addseq	r7, r1, ip, lsl #16
    1634:	00091a00 	andeq	r1, r9, r0, lsl #20
    1638:	91880d00 	orrls	r0, r8, r0, lsl #26
    163c:	09210000 	stmdbeq	r1!, {}	; <UNPREDICTABLE>
    1640:	010e0000 	mrseq	r0, (UNDEF: 14)
    1644:	00740251 	rsbseq	r0, r4, r1, asr r2
    1648:	0550010e 	ldrbeq	r0, [r0, #-270]	; 0x10e
    164c:	00b02403 	adcseq	r2, r0, r3, lsl #8
    1650:	0f000000 	svceq	0x00000000
    1654:	0000046a 	andeq	r0, r0, sl, ror #8
    1658:	00331e01 	eorseq	r1, r3, r1, lsl #28
    165c:	918c0000 	orrls	r0, ip, r0
    1660:	00480000 	subeq	r0, r8, r0
    1664:	9c010000 	stcls	0, cr0, [r1], {-0}
    1668:	000002da 	ldrdeq	r0, [r0], -sl
    166c:	0006740b 	andeq	r7, r6, fp, lsl #8
    1670:	331e0100 	tstcc	lr, #0, 2
    1674:	46000000 	strmi	r0, [r0], -r0
    1678:	10000009 	andne	r0, r0, r9
    167c:	00727470 	rsbseq	r7, r2, r0, ror r4
    1680:	02da1e01 	sbcseq	r1, sl, #1, 28
    1684:	09990000 	ldmibeq	r9, {}	; <UNPREDICTABLE>
    1688:	6c100000 	ldcvs	0, cr0, [r0], {-0}
    168c:	01006e65 	tsteq	r0, r5, ror #28
    1690:	0000331e 	andeq	r3, r0, lr, lsl r3
    1694:	0009c500 	andeq	ip, r9, r0, lsl #10
    1698:	00691100 	rsbeq	r1, r9, r0, lsl #2
    169c:	00332001 	eorseq	r2, r3, r1
    16a0:	09ee0000 	stmibeq	lr!, {}^	; <UNPREDICTABLE>
    16a4:	b40c0000 	strlt	r0, [ip], #-0
    16a8:	42000091 	andmi	r0, r0, #145	; 0x91
    16ac:	00000009 	andeq	r0, r0, r9
    16b0:	00250407 	eoreq	r0, r5, r7, lsl #8
    16b4:	6a0f0000 	bvs	3c16bc <__user_program+0xc16bc>
    16b8:	01000005 	tsteq	r0, r5
    16bc:	0000332f 	andeq	r3, r0, pc, lsr #6
    16c0:	0091d400 	addseq	sp, r1, r0, lsl #8
    16c4:	0000cc00 	andeq	ip, r0, r0, lsl #24
    16c8:	ba9c0100 	blt	fe701ad0 <__user_program+0xfe401ad0>
    16cc:	0b000003 	bleq	16e0 <__start-0x6920>
    16d0:	00000674 	andeq	r0, r0, r4, ror r6
    16d4:	00332f01 	eorseq	r2, r3, r1, lsl #30
    16d8:	0a420000 	beq	10816e0 <__user_program+0xd816e0>
    16dc:	70100000 	andsvc	r0, r0, r0
    16e0:	01007274 	tsteq	r0, r4, ror r2
    16e4:	0002da2f 	andeq	sp, r2, pc, lsr #20
    16e8:	000a7c00 	andeq	r7, sl, r0, lsl #24
    16ec:	656c1000 	strbvs	r1, [ip, #-0]!
    16f0:	2f01006e 	svccs	0x0001006e
    16f4:	00000033 	andeq	r0, r0, r3, lsr r0
    16f8:	00000aa5 	andeq	r0, r0, r5, lsr #21
    16fc:	00066b12 	andeq	r6, r6, r2, lsl fp
    1700:	33310100 	teqcc	r1, #0, 2
    1704:	ce000000 	cdpgt	0, 0, cr0, cr0, cr0, {0}
    1708:	1200000a 	andne	r0, r0, #10
    170c:	00000679 	andeq	r0, r0, r9, ror r6
    1710:	00413201 	subeq	r3, r1, r1, lsl #4
    1714:	0b0d0000 	bleq	34171c <__user_program+0x4171c>
    1718:	18130000 	ldmdane	r3, {}	; <UNPREDICTABLE>
    171c:	42000092 	andmi	r0, r0, #146	; 0x92
    1720:	58000009 	stmdapl	r0, {r0, r3}
    1724:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
    1728:	79025001 	stmdbvc	r2, {r0, ip, lr}
    172c:	20130000 	andscs	r0, r3, r0
    1730:	42000092 	andmi	r0, r0, #146	; 0x92
    1734:	6c000009 	stcvs	0, cr0, [r0], {9}
    1738:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
    173c:	7a025001 	bvc	95748 <__bss_end+0x88748>
    1740:	28130000 	ldmdacs	r3, {}	; <UNPREDICTABLE>
    1744:	42000092 	andmi	r0, r0, #146	; 0x92
    1748:	80000009 	andhi	r0, r0, r9
    174c:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
    1750:	79025001 	stmdbvc	r2, {r0, ip, lr}
    1754:	400c0000 	andmi	r0, ip, r0
    1758:	53000092 	movwpl	r0, #146	; 0x92
    175c:	13000009 	movwne	r0, #9
    1760:	00009258 	andeq	r9, r0, r8, asr r2
    1764:	00000942 	andeq	r0, r0, r2, asr #18
    1768:	0000039c 	muleq	r0, ip, r3
    176c:	0150010e 	cmpeq	r0, lr, lsl #2
    1770:	7013003a 	andsvc	r0, r3, sl, lsr r0
    1774:	42000092 	andmi	r0, r0, #146	; 0x92
    1778:	b0000009 	andlt	r0, r0, r9
    177c:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
    1780:	74025001 	strvc	r5, [r2], #-1
    1784:	780c0000 	stmdavc	ip, {}	; <UNPREDICTABLE>
    1788:	53000092 	movwpl	r0, #146	; 0x92
    178c:	00000009 	andeq	r0, r0, r9
    1790:	0003280f 	andeq	r2, r3, pc, lsl #16
    1794:	33540100 	cmpcc	r4, #0, 2
    1798:	a0000000 	andge	r0, r0, r0
    179c:	cc000092 	stcgt	0, cr0, [r0], {146}	; 0x92
    17a0:	01000000 	mrseq	r0, (UNDEF: 0)
    17a4:	0004199c 	muleq	r4, ip, r9
    17a8:	6e661000 	cdpvs	0, 6, cr1, cr6, cr0, {0}
    17ac:	af540100 	svcge	0x00540100
    17b0:	36000000 	strcc	r0, [r0], -r0
    17b4:	0b00000b 	bleq	17e8 <__start-0x6818>
    17b8:	0000070b 	andeq	r0, r0, fp, lsl #14
    17bc:	04195401 	ldreq	r5, [r9], #-1025	; 0x401
    17c0:	0b780000 	bleq	1e017c8 <__user_program+0x1b017c8>
    17c4:	380b0000 	stmdacc	fp, {}	; <UNPREDICTABLE>
    17c8:	01000004 	tsteq	r0, r4
    17cc:	00006554 	andeq	r6, r0, r4, asr r5
    17d0:	000bac00 	andeq	sl, fp, r0, lsl #24
    17d4:	00431000 	subeq	r1, r3, r0
    17d8:	00655401 	rsbeq	r5, r5, r1, lsl #8
    17dc:	0bd80000 	bleq	ff6017e4 <__user_program+0xff3017e4>
    17e0:	54140000 	ldrpl	r0, [r4], #-0
    17e4:	65540100 	ldrbvs	r0, [r4, #-256]	; 0x100
    17e8:	02000000 	andeq	r0, r0, #0
    17ec:	07000091 			; <UNDEFINED> instruction: 0x07000091
    17f0:	00005a04 	andeq	r5, r0, r4, lsl #20
    17f4:	03ca0f00 	biceq	r0, sl, #0, 30
    17f8:	4c010000 	stcmi	0, cr0, [r1], {-0}
    17fc:	00000033 	andeq	r0, r0, r3, lsr r0
    1800:	0000936c 	andeq	r9, r0, ip, ror #6
    1804:	0000006c 	andeq	r0, r0, ip, rrx
    1808:	04969c01 	ldreq	r9, [r6], #3073	; 0xc01
    180c:	e00b0000 	and	r0, fp, r0
    1810:	01000006 	tsteq	r0, r6
    1814:	0000af4c 	andeq	sl, r0, ip, asr #30
    1818:	000c0400 	andeq	r0, ip, r0, lsl #8
    181c:	07060b00 	streq	r0, [r6, -r0, lsl #22]
    1820:	4c010000 	stcmi	0, cr0, [r1], {-0}
    1824:	00000419 	andeq	r0, r0, r9, lsl r4
    1828:	00000c22 	andeq	r0, r0, r2, lsr #24
    182c:	0093b813 	addseq	fp, r3, r3, lsl r8
    1830:	00092100 	andeq	r2, r9, r0, lsl #2
    1834:	00046d00 	andeq	r6, r4, r0, lsl #26
    1838:	50010e00 	andpl	r0, r1, r0, lsl #28
    183c:	b0340305 	eorslt	r0, r4, r5, lsl #6
    1840:	0d000000 	stceq	0, cr0, [r0, #-0]
    1844:	000093d0 	ldrdeq	r9, [r0], -r0
    1848:	000003ba 			; <UNDEFINED> instruction: 0x000003ba
    184c:	0253010e 	subseq	r0, r3, #-2147483645	; 0x80000003
    1850:	010e0074 	tsteq	lr, r4, ror r0
    1854:	0e4f0152 	mcreq	1, 2, r0, cr15, cr2, {2}
    1858:	75025101 	strvc	r5, [r2, #-257]	; 0x101
    185c:	50010e00 	andpl	r0, r1, r0, lsl #28
    1860:	0e007602 	cfmadd32eq	mvax0, mvfx7, mvfx0, mvfx2
    1864:	02007d02 	andeq	r7, r0, #2, 26	; 0x80
    1868:	00000074 	andeq	r0, r0, r4, ror r0
    186c:	00037b0f 	andeq	r7, r3, pc, lsl #22
    1870:	336d0100 	cmncc	sp, #0, 2
    1874:	d8000000 	stmdale	r0, {}	; <UNPREDICTABLE>
    1878:	78000093 	stmdavc	r0, {r0, r1, r4, r7}
    187c:	01000000 	mrseq	r0, (UNDEF: 0)
    1880:	0004e19c 	muleq	r4, ip, r1
    1884:	07000b00 	streq	r0, [r0, -r0, lsl #22]
    1888:	6d010000 	stcvs	0, cr0, [r1, #-0]
    188c:	000004e1 	andeq	r0, r0, r1, ror #9
    1890:	00000c40 	andeq	r0, r0, r0, asr #24
    1894:	0004340b 	andeq	r3, r4, fp, lsl #8
    1898:	656d0100 	strbvs	r0, [sp, #-256]!	; 0x100
    189c:	8b000000 	blhi	18a4 <__start-0x675c>
    18a0:	0d00000c 	stceq	0, cr0, [r0, #-48]	; 0xffffffd0
    18a4:	00009440 	andeq	r9, r0, r0, asr #8
    18a8:	00000921 	andeq	r0, r0, r1, lsr #18
    18ac:	0550010e 	ldrbeq	r0, [r0, #-270]	; 0x10e
    18b0:	00b04803 	adcseq	r4, r0, r3, lsl #16
    18b4:	07000000 	streq	r0, [r0, -r0]
    18b8:	0000a404 	andeq	sl, r0, r4, lsl #8
    18bc:	06c20f00 	strbeq	r0, [r2], r0, lsl #30
    18c0:	77010000 	strvc	r0, [r1, -r0]
    18c4:	0000005a 	andeq	r0, r0, sl, asr r0
    18c8:	00009450 	andeq	r9, r0, r0, asr r4
    18cc:	00000068 	andeq	r0, r0, r8, rrx
    18d0:	052c9c01 	streq	r9, [ip, #-3073]!	; 0xc01
    18d4:	69110000 	ldmdbvs	r1, {}	; <UNPREDICTABLE>
    18d8:	5a780100 	bpl	1e01ce0 <__user_program+0x1b01ce0>
    18dc:	b7000000 	strlt	r0, [r0, -r0]
    18e0:	1200000c 	andne	r0, r0, #12
    18e4:	00000594 	muleq	r0, r4, r5
    18e8:	005a7901 	subseq	r7, sl, r1, lsl #18
    18ec:	0cd60000 	ldcleq	0, cr0, [r6], {0}
    18f0:	96120000 	ldrls	r0, [r2], -r0
    18f4:	01000002 	tsteq	r0, r2
    18f8:	00005a7a 	andeq	r5, r0, sl, ror sl
    18fc:	000cf600 	andeq	pc, ip, r0, lsl #12
    1900:	d60a0000 	strle	r0, [sl], -r0
    1904:	01000003 	tsteq	r0, r3
    1908:	0094b884 	addseq	fp, r4, r4, lsl #17
    190c:	00011000 	andeq	r1, r1, r0
    1910:	089c0100 	ldmeq	ip, {r8}
    1914:	0b000006 	bleq	1934 <__start-0x66cc>
    1918:	00000700 	andeq	r0, r0, r0, lsl #14
    191c:	04e18401 	strbteq	r8, [r1], #1025	; 0x401
    1920:	0d210000 	stceq	0, cr0, [r1, #-0]
    1924:	b4150000 	ldrlt	r0, [r5], #-0
    1928:	01000006 	tsteq	r0, r6
    192c:	00005a86 	andeq	r5, r0, r6, lsl #21
    1930:	11570100 	cmpne	r7, r0, lsl #2
    1934:	87010069 	strhi	r0, [r1, -r9, rrx]
    1938:	0000005a 	andeq	r0, r0, sl, asr r0
    193c:	00000d3f 	andeq	r0, r0, pc, lsr sp
    1940:	00003016 	andeq	r3, r0, r6, lsl r0
    1944:	0005ec00 	andeq	lr, r5, r0, lsl #24
    1948:	06f31200 	ldrbteq	r1, [r3], r0, lsl #4
    194c:	8a010000 	bhi	41954 <__bss_end+0x34954>
    1950:	0000005a 	andeq	r0, r0, sl, asr r0
    1954:	00000d75 	andeq	r0, r0, r5, ror sp
    1958:	00953813 	addseq	r3, r5, r3, lsl r8
    195c:	00092100 	andeq	r2, r9, r0, lsl #2
    1960:	0005a200 	andeq	sl, r5, r0, lsl #4
    1964:	52010e00 	andpl	r0, r1, #0, 28
    1968:	0e007b02 	vmlaeq.f64	d7, d0, d2
    196c:	74025101 	strvc	r5, [r2], #-257	; 0x101
    1970:	50010e00 	andpl	r0, r1, r0, lsl #28
    1974:	00007902 	andeq	r7, r0, r2, lsl #18
    1978:	00956413 	addseq	r6, r5, r3, lsl r4
    197c:	00092100 	andeq	r2, r9, r0, lsl #2
    1980:	0005b900 	andeq	fp, r5, r0, lsl #18
    1984:	50010e00 	andpl	r0, r1, r0, lsl #28
    1988:	b0780305 	rsbslt	r0, r8, r5, lsl #6
    198c:	0c000000 	stceq	0, cr0, [r0], {-0}
    1990:	00009568 	andeq	r9, r0, r8, ror #10
    1994:	000004e7 	andeq	r0, r0, r7, ror #9
    1998:	00957813 	addseq	r7, r5, r3, lsl r8
    199c:	00092100 	andeq	r2, r9, r0, lsl #2
    19a0:	0005d900 	andeq	sp, r5, r0, lsl #18
    19a4:	50010e00 	andpl	r0, r1, r0, lsl #28
    19a8:	b0980305 	addslt	r0, r8, r5, lsl #6
    19ac:	0c000000 	stceq	0, cr0, [r0], {-0}
    19b0:	0000957c 	andeq	r9, r0, ip, ror r5
    19b4:	0000095e 	andeq	r0, r0, lr, asr r9
    19b8:	0095900c 	addseq	r9, r5, ip
    19bc:	00091a00 	andeq	r1, r9, r0, lsl #20
    19c0:	c40c0000 	strgt	r0, [ip], #-0
    19c4:	1a000094 	bne	1c1c <__start-0x63e4>
    19c8:	0c000009 	stceq	0, cr0, [r0], {9}
    19cc:	000095a8 	andeq	r9, r0, r8, lsr #11
    19d0:	0000091a 	andeq	r0, r0, sl, lsl r9
    19d4:	0095c40c 	addseq	ip, r5, ip, lsl #8
    19d8:	00095e00 	andeq	r5, r9, r0, lsl #28
    19dc:	e10a0000 	mrs	r0, (UNDEF: 10)
    19e0:	01000003 	tsteq	r0, r3
    19e4:	0095c89c 	umullseq	ip, r5, ip, r8
    19e8:	00004800 	andeq	r4, r0, r0, lsl #16
    19ec:	4e9c0100 	fmlmie	f0, f4, f0
    19f0:	0b000006 	bleq	1a10 <__start-0x65f0>
    19f4:	00000700 	andeq	r0, r0, r0, lsl #14
    19f8:	04e19c01 	strbteq	r9, [r1], #3073	; 0xc01
    19fc:	0d880000 	stceq	0, cr0, [r8]
    1a00:	f3120000 	vhadd.u16	d0, d2, d0
    1a04:	01000006 	tsteq	r0, r6
    1a08:	00005a9f 	muleq	r0, pc, sl	; <UNPREDICTABLE>
    1a0c:	000da600 	andeq	sl, sp, r0, lsl #12
    1a10:	95d40c00 	ldrbls	r0, [r4, #3072]	; 0xc00
    1a14:	091a0000 	ldmdbeq	sl, {}	; <UNPREDICTABLE>
    1a18:	0c0c0000 	stceq	0, cr0, [ip], {-0}
    1a1c:	5e000096 	mcrpl	0, 0, r0, cr0, cr6, {4}
    1a20:	00000009 	andeq	r0, r0, r9
    1a24:	00031817 	andeq	r1, r3, r7, lsl r8
    1a28:	33a40100 			; <UNDEFINED> instruction: 0x33a40100
    1a2c:	10000000 	andne	r0, r0, r0
    1a30:	94000096 	strls	r0, [r0], #-150	; 0x96
    1a34:	01000003 	tsteq	r0, r3
    1a38:	0006ad9c 	muleq	r6, ip, sp
    1a3c:	00691100 	rsbeq	r1, r9, r0, lsl #2
    1a40:	0033c701 	eorseq	ip, r3, r1, lsl #14
    1a44:	0db90000 	ldceq	0, cr0, [r9]
    1a48:	64120000 	ldrvs	r0, [r2], #-0
    1a4c:	01000006 	tsteq	r0, r6
    1a50:	000033c8 	andeq	r3, r0, r8, asr #7
    1a54:	000dd800 	andeq	sp, sp, r0, lsl #16
    1a58:	06ac1200 	strteq	r1, [ip], r0, lsl #4
    1a5c:	ca010000 	bgt	41a64 <__bss_end+0x34a64>
    1a60:	000006ad 	andeq	r0, r0, sp, lsr #13
    1a64:	00000df7 	strdeq	r0, [r0], -r7
    1a68:	00998c0c 	addseq	r8, r9, ip, lsl #24
    1a6c:	00095e00 	andeq	r5, r9, r0, lsl #28
    1a70:	99940d00 	ldmibls	r4, {r8, sl, fp}
    1a74:	09650000 	stmdbeq	r5!, {}^	; <UNPREDICTABLE>
    1a78:	010e0000 	mrseq	r0, (UNDEF: 14)
    1a7c:	e80a0350 	stmda	sl, {r4, r6, r8, r9}
    1a80:	02000003 	andeq	r0, r0, #3
    1a84:	04de0408 	ldrbeq	r0, [lr], #1032	; 0x408
    1a88:	0a180000 	beq	601a90 <__user_program+0x301a90>
    1a8c:	01000004 	tsteq	r0, r4
    1a90:	0099a4df 			; <UNDEFINED> instruction: 0x0099a4df
    1a94:	00005000 	andeq	r5, r0, r0
    1a98:	199c0100 	ldmibne	ip, {r8}
    1a9c:	000004f3 	strdeq	r0, [r0], -r3
    1aa0:	0065e401 	rsbeq	lr, r5, r1, lsl #8
    1aa4:	99f40000 	ldmibls	r4!, {}^	; <UNPREDICTABLE>
    1aa8:	00100000 	andseq	r0, r0, r0
    1aac:	9c010000 	stcls	0, cr0, [r1], {-0}
    1ab0:	0005430a 	andeq	r4, r5, sl, lsl #6
    1ab4:	04e80100 	strbteq	r0, [r8], #256	; 0x100
    1ab8:	5000009a 	mulpl	r0, sl, r0
    1abc:	01000000 	mrseq	r0, (UNDEF: 0)
    1ac0:	0006fc9c 	muleq	r6, ip, ip
    1ac4:	736d1400 	cmnvc	sp, #0, 8
    1ac8:	65e80100 	strbvs	r0, [r8, #256]!	; 0x100
    1acc:	01000000 	mrseq	r0, (UNDEF: 0)
    1ad0:	850f0050 	strhi	r0, [pc, #-80]	; 1a88 <__start-0x6578>
    1ad4:	01000002 	tsteq	r0, r2
    1ad8:	000748f1 	strdeq	r4, [r7], -r1
    1adc:	009a5400 	addseq	r5, sl, r0, lsl #8
    1ae0:	00005800 	andeq	r5, r0, r0, lsl #16
    1ae4:	489c0100 	ldmmi	ip, {r8}
    1ae8:	0b000007 	bleq	1b0c <__start-0x64f4>
    1aec:	00000690 	muleq	r0, r0, r6
    1af0:	0033f101 	eorseq	pc, r3, r1, lsl #2
    1af4:	0e330000 	cdpeq	0, 3, cr0, cr3, cr0, {0}
    1af8:	d51a0000 	ldrle	r0, [sl, #-0]
    1afc:	01000006 	tsteq	r0, r6
    1b00:	000025f2 	strdeq	r2, [r0], -r2	; <UNPREDICTABLE>
    1b04:	06e81a00 	strbteq	r1, [r8], r0, lsl #20
    1b08:	f3010000 	vhadd.u8	d0, d1, d0
    1b0c:	00000025 	andeq	r0, r0, r5, lsr #32
    1b10:	00068215 	andeq	r8, r6, r5, lsl r2
    1b14:	daf40100 	ble	ffd01f1c <__user_program+0xffa01f1c>
    1b18:	01000002 	tsteq	r0, r2
    1b1c:	041b0053 	ldreq	r0, [fp], #-83	; 0x53
    1b20:	0004cb1c 	andeq	ip, r4, ip, lsl fp
    1b24:	01060100 	mrseq	r0, (UNDEF: 22)
    1b28:	00000033 	andeq	r0, r0, r3, lsr r0
    1b2c:	00009aac 	andeq	r9, r0, ip, lsr #21
    1b30:	00000008 	andeq	r0, r0, r8
    1b34:	07759c01 	ldrbeq	r9, [r5, -r1, lsl #24]!
    1b38:	741d0000 	ldrvc	r0, [sp], #-0
    1b3c:	01000006 	tsteq	r0, r6
    1b40:	00330106 	eorseq	r0, r3, r6, lsl #2
    1b44:	0e540000 	cdpeq	0, 5, cr0, cr4, cr0, {0}
    1b48:	1c000000 	stcne	0, cr0, [r0], {-0}
    1b4c:	000002d5 	ldrdeq	r0, [r0], -r5
    1b50:	33010a01 	movwcc	r0, #6657	; 0x1a01
    1b54:	b4000000 	strlt	r0, [r0], #-0
    1b58:	0800009a 	stmdaeq	r0, {r1, r3, r4, r7}
    1b5c:	01000000 	mrseq	r0, (UNDEF: 0)
    1b60:	0007ad9c 	muleq	r7, ip, sp
    1b64:	06741d00 	ldrbteq	r1, [r4], -r0, lsl #26
    1b68:	0a010000 	beq	41b70 <__bss_end+0x34b70>
    1b6c:	00003301 	andeq	r3, r0, r1, lsl #6
    1b70:	000e7500 	andeq	r7, lr, r0, lsl #10
    1b74:	74731e00 	ldrbtvc	r1, [r3], #-3584	; 0xe00
    1b78:	010a0100 	mrseq	r0, (UNDEF: 26)
    1b7c:	00000748 	andeq	r0, r0, r8, asr #14
    1b80:	1c005101 	stfnes	f5, [r0], {1}
    1b84:	0000036c 	andeq	r0, r0, ip, ror #6
    1b88:	33010e01 	movwcc	r0, #7681	; 0x1e01
    1b8c:	bc000000 	stclt	0, cr0, [r0], {-0}
    1b90:	0800009a 	stmdaeq	r0, {r1, r3, r4, r7}
    1b94:	01000000 	mrseq	r0, (UNDEF: 0)
    1b98:	0007d89c 	muleq	r7, ip, r8
    1b9c:	06741d00 	ldrbteq	r1, [r4], -r0, lsl #26
    1ba0:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
    1ba4:	00003301 	andeq	r3, r0, r1, lsl #6
    1ba8:	000e9600 	andeq	r9, lr, r0, lsl #12
    1bac:	be1c0000 	cdplt	0, 1, cr0, cr12, cr0, {0}
    1bb0:	01000002 	tsteq	r0, r2
    1bb4:	00330112 	eorseq	r0, r3, r2, lsl r1
    1bb8:	9ac40000 	bls	ff101bc0 <__user_program+0xfee01bc0>
    1bbc:	00080000 	andeq	r0, r8, r0
    1bc0:	9c010000 	stcls	0, cr0, [r1], {-0}
    1bc4:	0000081f 	andeq	r0, r0, pc, lsl r8
    1bc8:	0006741d 	andeq	r7, r6, sp, lsl r4
    1bcc:	01120100 	tsteq	r2, r0, lsl #2
    1bd0:	00000033 	andeq	r0, r0, r3, lsr r0
    1bd4:	00000eb7 			; <UNDEFINED> instruction: 0x00000eb7
    1bd8:	7274701e 	rsbsvc	r7, r4, #30
    1bdc:	01120100 	tsteq	r2, r0, lsl #2
    1be0:	00000033 	andeq	r0, r0, r3, lsr r0
    1be4:	641e5101 	ldrvs	r5, [lr], #-257	; 0x101
    1be8:	01007269 	tsteq	r0, r9, ror #4
    1bec:	00330112 	eorseq	r0, r3, r2, lsl r1
    1bf0:	52010000 	andpl	r0, r1, #0
    1bf4:	022b1f00 	eoreq	r1, fp, #0, 30
    1bf8:	082f0000 	stmdaeq	pc!, {}	; <UNPREDICTABLE>
    1bfc:	2f200000 	svccs	0x00200000
    1c00:	1f000008 	svcne	0x00000008
    1c04:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1c08:	00000255 	andeq	r0, r0, r5, asr r2
    1c0c:	0004d921 	andeq	sp, r4, r1, lsr #18
    1c10:	474d0400 	strbmi	r0, [sp, -r0, lsl #8]
    1c14:	05000008 	streq	r0, [r0, #-8]
    1c18:	00c01803 	sbceq	r1, r0, r3, lsl #16
    1c1c:	081f2200 	ldmdaeq	pc, {r9, sp}	; <UNPREDICTABLE>
    1c20:	5c1f0000 	ldcpl	0, cr0, [pc], {-0}
    1c24:	5c000008 	stcpl	0, cr0, [r0], {8}
    1c28:	20000008 	andcs	r0, r0, r8
    1c2c:	0000082f 	andeq	r0, r0, pc, lsr #16
    1c30:	0407001f 	streq	r0, [r7], #-31
    1c34:	00000862 	andeq	r0, r0, r2, ror #16
    1c38:	0000a422 	andeq	sl, r0, r2, lsr #8
    1c3c:	05002100 	streq	r2, [r0, #-256]	; 0x100
    1c40:	4f040000 	svcmi	0x00040000
    1c44:	0000084c 	andeq	r0, r0, ip, asr #16
    1c48:	cf200305 	svcgt	0x00200305
    1c4c:	fc210000 	stc2	0, cr0, [r1], #-0
    1c50:	04000004 	streq	r0, [r0], #-4
    1c54:	00088951 	andeq	r8, r8, r1, asr r9
    1c58:	0c030500 	cfstr32eq	mvfx0, [r3], {-0}
    1c5c:	220000c0 	andcs	r0, r0, #192	; 0xc0
    1c60:	0000005a 	andeq	r0, r0, sl, asr r0
    1c64:	0003b521 	andeq	fp, r3, r1, lsr #10
    1c68:	89530400 	ldmdbhi	r3, {sl}^
    1c6c:	05000008 	streq	r0, [r0, #-8]
    1c70:	00c01003 	sbceq	r1, r0, r3
    1c74:	04292100 	strteq	r2, [r9], #-256	; 0x100
    1c78:	55040000 	strpl	r0, [r4, #-0]
    1c7c:	00000889 	andeq	r0, r0, r9, lsl #17
    1c80:	cfa00305 	svcgt	0x00a00305
    1c84:	45210000 	strmi	r0, [r1, #-0]!
    1c88:	04000003 	streq	r0, [r0], #-3
    1c8c:	00088957 	andeq	r8, r8, r7, asr r9
    1c90:	08030500 	stmdaeq	r3, {r8, sl}
    1c94:	210000c0 	smlabtcs	r0, r0, r0, r0
    1c98:	0000055e 	andeq	r0, r0, lr, asr r5
    1c9c:	08895904 	stmeq	r9, {r2, r8, fp, ip, lr}
    1ca0:	03050000 	movweq	r0, #20480	; 0x5000
    1ca4:	0000c014 	andeq	ip, r0, r4, lsl r0
    1ca8:	0006ad1f 	andeq	sl, r6, pc, lsl sp
    1cac:	0008e200 	andeq	lr, r8, r0, lsl #4
    1cb0:	082f2000 	stmdaeq	pc!, {sp}	; <UNPREDICTABLE>
    1cb4:	00200000 	eoreq	r0, r0, r0
    1cb8:	0002a321 	andeq	sl, r2, r1, lsr #6
    1cbc:	d25b0400 	subsle	r0, fp, #0, 8
    1cc0:	05000008 	streq	r0, [r0, #-8]
    1cc4:	00ce1803 	sbceq	r1, lr, r3, lsl #16
    1cc8:	06872100 	streq	r2, [r7], r0, lsl #2
    1ccc:	13010000 	movwne	r0, #4096	; 0x1000
    1cd0:	000002da 	ldrdeq	r0, [r0], -sl
    1cd4:	c0000305 	andgt	r0, r0, r5, lsl #6
    1cd8:	d51a0000 	ldrle	r0, [sl, #-0]
    1cdc:	01000006 	tsteq	r0, r6
    1ce0:	000025f2 	strdeq	r2, [r0], -r2	; <UNPREDICTABLE>
    1ce4:	06e81a00 	strbteq	r1, [r8], r0, lsl #20
    1ce8:	f3010000 	vhadd.u8	d0, d1, d0
    1cec:	00000025 	andeq	r0, r0, r5, lsr #32
    1cf0:	0003a223 	andeq	sl, r3, r3, lsr #4
    1cf4:	24300500 	ldrtcs	r0, [r0], #-1280	; 0x500
    1cf8:	000005e5 	andeq	r0, r0, r5, ror #11
    1cfc:	00331306 	eorseq	r1, r3, r6, lsl #6
    1d00:	09370000 	ldmdbeq	r7!, {}	; <UNPREDICTABLE>
    1d04:	37250000 	strcc	r0, [r5, -r0]!
    1d08:	26000009 	strcs	r0, [r0], -r9
    1d0c:	3d040700 	stccc	7, cr0, [r4, #-0]
    1d10:	27000009 	strcs	r0, [r0, -r9]
    1d14:	00000025 	andeq	r0, r0, r5, lsr #32
    1d18:	0005c428 	andeq	ip, r5, r8, lsr #8
    1d1c:	533d0700 	teqpl	sp, #0, 14
    1d20:	25000009 	strcs	r0, [r0, #-9]
    1d24:	00000041 	andeq	r0, r0, r1, asr #32
    1d28:	062b2900 	strteq	r2, [fp], -r0, lsl #18
    1d2c:	44070000 	strmi	r0, [r7], #-0
    1d30:	00000041 	andeq	r0, r0, r1, asr #32
    1d34:	00039023 	andeq	r9, r3, r3, lsr #32
    1d38:	2a2b0500 	bcs	ac3140 <__user_program+0x7c3140>
    1d3c:	0000060b 	andeq	r0, r0, fp, lsl #12
    1d40:	33252708 	teqcc	r5, #8, 14	; 0x200000
    1d44:	00000000 	andeq	r0, r0, r0
    1d48:	00005e00 	andeq	r5, r0, r0, lsl #28
    1d4c:	2c000200 	sfmcs	f0, 4, [r0], {-0}
    1d50:	0400000b 	streq	r0, [r0], #-11
    1d54:	0007bc01 	andeq	fp, r7, r1, lsl #24
    1d58:	00800000 	addeq	r0, r0, r0
    1d5c:	00805400 	addeq	r5, r0, r0, lsl #8
    1d60:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
    1d64:	6b62696c 	blvs	189c31c <__user_program+0x159c31c>
    1d68:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
    1d6c:	6f6f622f 	svcvs	0x006f622f
    1d70:	00532e74 	subseq	r2, r3, r4, ror lr
    1d74:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xd2f
    1d78:	6667682f 	strbtvs	r6, [r7], -pc, lsr #16
    1d7c:	34332f73 	ldrtcc	r2, [r3], #-3955	; 0xf73
    1d80:	31662f39 	cmncc	r6, r9, lsr pc
    1d84:	616c2d37 	cmnvs	ip, r7, lsr sp
    1d88:	642d3362 	strtvs	r3, [sp], #-866	; 0x362
    1d8c:	64697661 	strbtvs	r7, [r9], #-1633	; 0x661
    1d90:	656d616a 	strbvs	r6, [sp, #-362]!	; 0x16a
    1d94:	6f632f73 	svcvs	0x00632f73
    1d98:	47006564 	strmi	r6, [r0, -r4, ror #10]
    1d9c:	4120554e 	teqmi	r0, lr, asr #10
    1da0:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
    1da4:	302e3432 	eorcc	r3, lr, r2, lsr r4
    1da8:	5d800100 	stfpls	f0, [r0]
    1dac:	02000000 	andeq	r0, r0, #0
    1db0:	000b4000 	andeq	r4, fp, r0
    1db4:	14010400 	strne	r0, [r1], #-1024	; 0x400
    1db8:	cc000008 	stcgt	0, cr0, [r0], {8}
    1dbc:	1000009a 	mulne	r0, sl, r0
    1dc0:	3300009b 	movwcc	r0, #155	; 0x9b
    1dc4:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
    1dc8:	732f6b62 	teqvc	pc, #100352	; 0x18800
    1dcc:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
    1dd0:	532e6d72 	teqpl	lr, #7296	; 0x1c80
    1dd4:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
    1dd8:	67682f74 			; <UNDEFINED> instruction: 0x67682f74
    1ddc:	332f7366 	teqcc	pc, #-1744830463	; 0x98000001
    1de0:	662f3934 			; <UNDEFINED> instruction: 0x662f3934
    1de4:	6c2d3731 	stcvs	7, cr3, [sp], #-196	; 0xffffff3c
    1de8:	2d336261 	lfmcs	f6, 4, [r3, #-388]!	; 0xfffffe7c
    1dec:	69766164 	ldmdbvs	r6!, {r2, r5, r6, r8, sp, lr}^
    1df0:	6d616a64 	vstmdbvs	r1!, {s13-s112}
    1df4:	632f7365 	teqvs	pc, #-1811939327	; 0x94000001
    1df8:	0065646f 	rsbeq	r6, r5, pc, ror #8
    1dfc:	20554e47 	subscs	r4, r5, r7, asr #28
    1e00:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    1e04:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
    1e08:	80010030 	andhi	r0, r1, r0, lsr r0
    1e0c:	00000064 	andeq	r0, r0, r4, rrx
    1e10:	0b540002 	bleq	1501e20 <__user_program+0x1201e20>
    1e14:	01040000 	mrseq	r0, (UNDEF: 4)
    1e18:	00000865 	andeq	r0, r0, r5, ror #16
    1e1c:	00009b10 	andeq	r9, r0, r0, lsl fp
    1e20:	00009cd0 	ldrdeq	r9, [r0], -r0
    1e24:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
    1e28:	2f2f6c65 	svccs	0x002f6c65
    1e2c:	2f637273 	svccs	0x00637273
    1e30:	65707573 	ldrbvs	r7, [r0, #-1395]!	; 0x573
    1e34:	73697672 	cmnvc	r9, #119537664	; 0x7200000
    1e38:	532e726f 	teqpl	lr, #-268435450	; 0xf0000006
    1e3c:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
    1e40:	67682f74 			; <UNDEFINED> instruction: 0x67682f74
    1e44:	332f7366 	teqcc	pc, #-1744830463	; 0x98000001
    1e48:	662f3934 			; <UNDEFINED> instruction: 0x662f3934
    1e4c:	6c2d3731 	stcvs	7, cr3, [sp], #-196	; 0xffffff3c
    1e50:	2d336261 	lfmcs	f6, 4, [r3, #-388]!	; 0xfffffe7c
    1e54:	69766164 	ldmdbvs	r6!, {r2, r5, r6, r8, sp, lr}^
    1e58:	6d616a64 	vstmdbvs	r1!, {s13-s112}
    1e5c:	632f7365 	teqvs	pc, #-1811939327	; 0x94000001
    1e60:	0065646f 	rsbeq	r6, r5, pc, ror #8
    1e64:	20554e47 	subscs	r4, r5, r7, asr #28
    1e68:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    1e6c:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
    1e70:	80010030 	andhi	r0, r1, r0, lsr r0

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <__end+0x1920ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <__user_program+0xb83840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x1a087c>
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
  94:	3b0b3a0e 	blcc	2ce8d4 <__end+0x1a08d4>
  98:	3c19270b 	ldccc	7, cr2, [r9], {11}
  9c:	00000019 	andeq	r0, r0, r9, lsl r0
  a0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
  a4:	030b130e 	movweq	r1, #45838	; 0xb30e
  a8:	110e1b0e 	tstne	lr, lr, lsl #22
  ac:	10061201 	andne	r1, r6, r1, lsl #4
  b0:	02000017 	andeq	r0, r0, #23
  b4:	0b0b0024 	bleq	2c014c <__end+0x19214c>
  b8:	0e030b3e 	vmoveq.16	d3[0], r0
  bc:	16030000 	strne	r0, [r3], -r0
  c0:	3a0e0300 	bcc	380cc8 <__user_program+0x80cc8>
  c4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  c8:	04000013 	streq	r0, [r0], #-19
  cc:	0b0b0024 	bleq	2c0164 <__end+0x192164>
  d0:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
  d4:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  d8:	03193f01 	tsteq	r9, #1, 30
  dc:	3b0b3a0e 	blcc	2ce91c <__end+0x1a091c>
  e0:	1119270b 	tstne	r9, fp, lsl #14
  e4:	40061201 	andmi	r1, r6, r1, lsl #4
  e8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  ec:	00001301 	andeq	r1, r0, r1, lsl #6
  f0:	03000506 	movweq	r0, #1286	; 0x506
  f4:	3b0b3a08 	blcc	2ce91c <__end+0x1a091c>
  f8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  fc:	07000017 	smladeq	r0, r7, r0, r0
 100:	08030005 	stmdaeq	r3, {r0, r2}
 104:	0b3b0b3a 	bleq	ec2df4 <__user_program+0xbc2df4>
 108:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 10c:	34080000 	strcc	r0, [r8], #-0
 110:	3a080300 	bcc	200d18 <__end+0xd2d18>
 114:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 118:	00170213 	andseq	r0, r7, r3, lsl r2
 11c:	00340900 	eorseq	r0, r4, r0, lsl #18
 120:	0b3a0e03 	bleq	e83934 <__user_program+0xb83934>
 124:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 128:	00001702 	andeq	r1, r0, r2, lsl #14
 12c:	0300050a 	movweq	r0, #1290	; 0x50a
 130:	3b0b3a0e 	blcc	2ce970 <__end+0x1a0970>
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
 1d8:	0b002403 	bleq	91ec <syscall_read+0x18>
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
 250:	3b0b3a0e 	blcc	2cea90 <__end+0x1a0a90>
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
 298:	3b0b3a0e 	blcc	2cead8 <__end+0x1a0ad8>
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
 2d0:	3b0b3a0e 	blcc	2ceb10 <__end+0x1a0b10>
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
 2fc:	0b002403 	bleq	9310 <thread_create+0x70>
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
 330:	3a080300 	bcc	200f38 <__end+0xd2f38>
 334:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 338:	00170213 	andseq	r0, r7, r3, lsl r2
 33c:	82890700 	addhi	r0, r9, #0, 14
 340:	01110101 	tsteq	r1, r1, lsl #2
 344:	13011331 	movwne	r1, #4913	; 0x1331
 348:	8a080000 	bhi	200350 <__end+0xd2350>
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
 390:	3b0b3a08 	blcc	2cebb8 <__end+0x1a0bb8>
 394:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 398:	0d000017 	stceq	0, cr0, [r0, #-92]	; 0xffffffa4
 39c:	0b0b000f 	bleq	2c03e0 <__end+0x1923e0>
 3a0:	00001349 	andeq	r1, r0, r9, asr #6
 3a4:	0300050e 	movweq	r0, #1294	; 0x50e
 3a8:	3b0b3a08 	blcc	2cebd0 <__end+0x1a0bd0>
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
 3f0:	24020000 	strcs	r0, [r2], #-0
 3f4:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 3f8:	000e030b 	andeq	r0, lr, fp, lsl #6
 3fc:	00240300 	eoreq	r0, r4, r0, lsl #6
 400:	0b3e0b0b 	bleq	f83034 <__user_program+0xc83034>
 404:	00000803 	andeq	r0, r0, r3, lsl #16
 408:	03001604 	movweq	r1, #1540	; 0x604
 40c:	3b0b3a0e 	blcc	2cec4c <__end+0x1a0c4c>
 410:	0013490b 	andseq	r4, r3, fp, lsl #18
 414:	01130500 	tsteq	r3, r0, lsl #10
 418:	0b0b0e03 	bleq	2c3c2c <__end+0x195c2c>
 41c:	0b3b0b3a 	bleq	ec310c <__user_program+0xbc310c>
 420:	00001301 	andeq	r1, r0, r1, lsl #6
 424:	03000d06 	movweq	r0, #3334	; 0xd06
 428:	3b0b3a0e 	blcc	2cec68 <__end+0x1a0c68>
 42c:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 430:	0700000b 	streq	r0, [r0, -fp]
 434:	0b0b000f 	bleq	2c0478 <__end+0x192478>
 438:	00001349 	andeq	r1, r0, r9, asr #6
 43c:	27001508 	strcs	r1, [r0, -r8, lsl #10]
 440:	09000019 	stmdbeq	r0, {r0, r3, r4}
 444:	0803000d 	stmdaeq	r3, {r0, r2, r3}
 448:	0b3b0b3a 	bleq	ec3138 <__user_program+0xbc3138>
 44c:	0b381349 	bleq	e05178 <__user_program+0xb05178>
 450:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 454:	03193f01 	tsteq	r9, #1, 30
 458:	3b0b3a0e 	blcc	2cec98 <__end+0x1a0c98>
 45c:	1119270b 	tstne	r9, fp, lsl #14
 460:	40061201 	andmi	r1, r6, r1, lsl #4
 464:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 468:	00001301 	andeq	r1, r0, r1, lsl #6
 46c:	0182890b 	orreq	r8, r2, fp, lsl #18
 470:	31011100 	mrscc	r1, (UNDEF: 17)
 474:	0c000013 	stceq	0, cr0, [r0], {19}
 478:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 47c:	0b3a0e03 	bleq	e83c90 <__user_program+0xb83c90>
 480:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 484:	01111349 	tsteq	r1, r9, asr #6
 488:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 48c:	01194297 			; <UNDEFINED> instruction: 0x01194297
 490:	0d000013 	stceq	0, cr0, [r0, #-76]	; 0xffffffb4
 494:	08030034 	stmdaeq	r3, {r2, r4, r5}
 498:	0b3b0b3a 	bleq	ec3188 <__user_program+0xbc3188>
 49c:	17021349 	strne	r1, [r2, -r9, asr #6]
 4a0:	340e0000 	strcc	r0, [lr], #-0
 4a4:	3a0e0300 	bcc	3810ac <__user_program+0x810ac>
 4a8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 4ac:	00170213 	andseq	r0, r7, r3, lsl r2
 4b0:	00050f00 	andeq	r0, r5, r0, lsl #30
 4b4:	0b3a0e03 	bleq	e83cc8 <__user_program+0xb83cc8>
 4b8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 4bc:	00001802 	andeq	r1, r0, r2, lsl #16
 4c0:	3f002e10 	svccc	0x00002e10
 4c4:	3a0e0319 	bcc	381130 <__user_program+0x81130>
 4c8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 4cc:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 4d0:	97184006 	ldrls	r4, [r8, -r6]
 4d4:	00001942 	andeq	r1, r0, r2, asr #18
 4d8:	03000511 	movweq	r0, #1297	; 0x511
 4dc:	3b0b3a0e 	blcc	2ced1c <__end+0x1a0d1c>
 4e0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 4e4:	12000017 	andne	r0, r0, #23
 4e8:	01018289 	smlabbeq	r1, r9, r2, r8
 4ec:	13310111 	teqne	r1, #1073741828	; 0x40000004
 4f0:	00001301 	andeq	r1, r0, r1, lsl #6
 4f4:	01828a13 	orreq	r8, r2, r3, lsl sl
 4f8:	91180200 	tstls	r8, r0, lsl #4
 4fc:	00001842 	andeq	r1, r0, r2, asr #16
 500:	01828914 	orreq	r8, r2, r4, lsl r9
 504:	31011101 	tstcc	r1, r1, lsl #2
 508:	15000013 	strne	r0, [r0, #-19]
 50c:	0b0b000f 	bleq	2c0550 <__end+0x192550>
 510:	01160000 	tsteq	r6, r0
 514:	01134901 	tsteq	r3, r1, lsl #18
 518:	17000013 	smladne	r0, r3, r0, r0
 51c:	13490021 	movtne	r0, #36897	; 0x9021
 520:	00000b2f 	andeq	r0, r0, pc, lsr #22
 524:	03003418 	movweq	r3, #1048	; 0x418
 528:	3b0b3a0e 	blcc	2ced68 <__end+0x1a0d68>
 52c:	3f13490b 	svccc	0x0013490b
 530:	00180219 	andseq	r0, r8, r9, lsl r2
 534:	00351900 	eorseq	r1, r5, r0, lsl #18
 538:	00001349 	andeq	r1, r0, r9, asr #6
 53c:	3f002e1a 	svccc	0x00002e1a
 540:	3a0e0319 	bcc	3811ac <__user_program+0x811ac>
 544:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 548:	00193c19 	andseq	r3, r9, r9, lsl ip
 54c:	012e1b00 	teqeq	lr, r0, lsl #22
 550:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 554:	0b3b0b3a 	bleq	ec3244 <__user_program+0xbc3244>
 558:	1301193c 	movwne	r1, #6460	; 0x193c
 55c:	181c0000 	ldmdane	ip, {}	; <UNPREDICTABLE>
 560:	1d000000 	stcne	0, cr0, [r0, #-0]
 564:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 568:	0b3a0e03 	bleq	e83d7c <__user_program+0xb83d7c>
 56c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 570:	1301193c 	movwne	r1, #6460	; 0x193c
 574:	2e1e0000 	cdpcs	0, 1, cr0, cr14, cr0, {0}
 578:	03193f00 	tsteq	r9, #0, 30
 57c:	3b0b3a0e 	blcc	2cedbc <__end+0x1a0dbc>
 580:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 584:	00193c13 	andseq	r3, r9, r3, lsl ip
 588:	012e1f00 	teqeq	lr, r0, lsl #30
 58c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 590:	0b3b0b3a 	bleq	ec3280 <__user_program+0xbc3280>
 594:	13491927 	movtne	r1, #39207	; 0x9927
 598:	1301193c 	movwne	r1, #6460	; 0x193c
 59c:	05200000 	streq	r0, [r0, #-0]!
 5a0:	00134900 	andseq	r4, r3, r0, lsl #18
 5a4:	012e2100 	teqeq	lr, r0, lsl #2
 5a8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 5ac:	0b3b0b3a 	bleq	ec329c <__user_program+0xbc329c>
 5b0:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 5b4:	00001301 	andeq	r1, r0, r1, lsl #6
 5b8:	3f012e22 	svccc	0x00012e22
 5bc:	3a0e0319 	bcc	381228 <__user_program+0x81228>
 5c0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 5c4:	00193c19 	andseq	r3, r9, r9, lsl ip
 5c8:	11010000 	mrsne	r0, (UNDEF: 1)
 5cc:	130e2501 	movwne	r2, #58625	; 0xe501
 5d0:	1b0e030b 	blne	381204 <__user_program+0x81204>
 5d4:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 5d8:	00171006 	andseq	r1, r7, r6
 5dc:	00160200 	andseq	r0, r6, r0, lsl #4
 5e0:	0b3a0e03 	bleq	e83df4 <__user_program+0xb83df4>
 5e4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 5e8:	24030000 	strcs	r0, [r3], #-0
 5ec:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 5f0:	000e030b 	andeq	r0, lr, fp, lsl #6
 5f4:	00240400 	eoreq	r0, r4, r0, lsl #8
 5f8:	0b3e0b0b 	bleq	f8322c <__user_program+0xc8322c>
 5fc:	00000803 	andeq	r0, r0, r3, lsl #16
 600:	03011305 	movweq	r1, #4869	; 0x1305
 604:	3a0b0b0e 	bcc	2c3244 <__end+0x195244>
 608:	010b3b0b 	tsteq	fp, fp, lsl #22
 60c:	06000013 			; <UNDEFINED> instruction: 0x06000013
 610:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 614:	0b381349 	bleq	e05340 <__user_program+0xb05340>
 618:	00001934 	andeq	r1, r0, r4, lsr r9
 61c:	0b000f07 	bleq	4240 <__start-0x3dc0>
 620:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 624:	0e03012e 	adfeqsp	f0, f3, #0.5
 628:	0b3b0b3a 	bleq	ec3318 <__user_program+0xbc3318>
 62c:	01111927 	tsteq	r1, r7, lsr #18
 630:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 634:	01194296 			; <UNDEFINED> instruction: 0x01194296
 638:	09000013 	stmdbeq	r0, {r0, r1, r4}
 63c:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 640:	0b3b0b3a 	bleq	ec3330 <__user_program+0xbc3330>
 644:	17021349 	strne	r1, [r2, -r9, asr #6]
 648:	050a0000 	streq	r0, [sl, #-0]
 64c:	3a080300 	bcc	201254 <__end+0xd3254>
 650:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 654:	00170213 	andseq	r0, r7, r3, lsl r2
 658:	00340b00 	eorseq	r0, r4, r0, lsl #22
 65c:	0b3a0e03 	bleq	e83e70 <__user_program+0xb83e70>
 660:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 664:	00001702 	andeq	r1, r0, r2, lsl #14
 668:	0300340c 	movweq	r3, #1036	; 0x40c
 66c:	3b0b3a08 	blcc	2cee94 <__end+0x1a0e94>
 670:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 674:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 678:	08030034 	stmdaeq	r3, {r2, r4, r5}
 67c:	0b3b0b3a 	bleq	ec336c <__user_program+0xbc336c>
 680:	17021349 	strne	r1, [r2, -r9, asr #6]
 684:	890e0000 	stmdbhi	lr, {}	; <UNPREDICTABLE>
 688:	11000182 	smlabbne	r0, r2, r1, r0
 68c:	00133101 	andseq	r3, r3, r1, lsl #2
 690:	000f0f00 	andeq	r0, pc, r0, lsl #30
 694:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 698:	01100000 	tsteq	r0, r0
 69c:	01134901 	tsteq	r3, r1, lsl #18
 6a0:	11000013 	tstne	r0, r3, lsl r0
 6a4:	13490021 	movtne	r0, #36897	; 0x9021
 6a8:	00000b2f 	andeq	r0, r0, pc, lsr #22
 6ac:	3f012e12 	svccc	0x00012e12
 6b0:	3a0e0319 	bcc	38131c <__user_program+0x8131c>
 6b4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 6b8:	11134919 	tstne	r3, r9, lsl r9
 6bc:	40061201 	andmi	r1, r6, r1, lsl #4
 6c0:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 6c4:	00001301 	andeq	r1, r0, r1, lsl #6
 6c8:	00001813 	andeq	r1, r0, r3, lsl r8
 6cc:	00341400 	eorseq	r1, r4, r0, lsl #8
 6d0:	0b3a0e03 	bleq	e83ee4 <__user_program+0xb83ee4>
 6d4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6d8:	00001802 	andeq	r1, r0, r2, lsl #16
 6dc:	55010b15 	strpl	r0, [r1, #-2837]	; 0xb15
 6e0:	00130117 	andseq	r0, r3, r7, lsl r1
 6e4:	82891600 	addhi	r1, r9, #0, 12
 6e8:	01110101 	tsteq	r1, r1, lsl #2
 6ec:	00001331 	andeq	r1, r0, r1, lsr r3
 6f0:	01828a17 	orreq	r8, r2, r7, lsl sl
 6f4:	91180200 	tstls	r8, r0, lsl #4
 6f8:	00001842 	andeq	r1, r0, r2, asr #16
 6fc:	11010b18 	tstne	r1, r8, lsl fp
 700:	01061201 	tsteq	r6, r1, lsl #4
 704:	19000013 	stmdbne	r0, {r0, r1, r4}
 708:	01018289 	smlabbeq	r1, r9, r2, r8
 70c:	13310111 	teqne	r1, #1073741828	; 0x40000004
 710:	00001301 	andeq	r1, r0, r1, lsl #6
 714:	4900261a 	stmdbmi	r0, {r1, r3, r4, r9, sl, sp}
 718:	1b000013 	blne	76c <__start-0x7894>
 71c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 720:	0b3a0e03 	bleq	e83f34 <__user_program+0xb83f34>
 724:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 728:	0000193c 	andeq	r1, r0, ip, lsr r9
 72c:	4900051c 	stmdbmi	r0, {r2, r3, r4, r8, sl}
 730:	00000013 	andeq	r0, r0, r3, lsl r0
 734:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 738:	030b130e 	movweq	r1, #45838	; 0xb30e
 73c:	110e1b0e 	tstne	lr, lr, lsl #22
 740:	10061201 	andne	r1, r6, r1, lsl #4
 744:	02000017 	andeq	r0, r0, #23
 748:	0b0b0024 	bleq	2c07e0 <__end+0x1927e0>
 74c:	0e030b3e 	vmoveq.16	d3[0], r0
 750:	24030000 	strcs	r0, [r3], #-0
 754:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 758:	0008030b 	andeq	r0, r8, fp, lsl #6
 75c:	00160400 	andseq	r0, r6, r0, lsl #8
 760:	0b3a0e03 	bleq	e83f74 <__user_program+0xb83f74>
 764:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 768:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
 76c:	03193f01 	tsteq	r9, #1, 30
 770:	3b0b3a0e 	blcc	2cefb0 <__end+0x1a0fb0>
 774:	1119270b 	tstne	r9, fp, lsl #14
 778:	40061201 	andmi	r1, r6, r1, lsl #4
 77c:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 780:	00001301 	andeq	r1, r0, r1, lsl #6
 784:	03000506 	movweq	r0, #1286	; 0x506
 788:	3b0b3a0e 	blcc	2cefc8 <__end+0x1a0fc8>
 78c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 790:	07000018 	smladeq	r0, r8, r0, r0
 794:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 798:	0b3a0e03 	bleq	e83fac <__user_program+0xb83fac>
 79c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 7a0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 7a4:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 7a8:	08000019 	stmdaeq	r0, {r0, r3, r4}
 7ac:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 7b0:	0b3a0e03 	bleq	e83fc4 <__user_program+0xb83fc4>
 7b4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 7b8:	01111349 	tsteq	r1, r9, asr #6
 7bc:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 7c0:	00194297 	mulseq	r9, r7, r2
 7c4:	11010000 	mrsne	r0, (UNDEF: 1)
 7c8:	130e2501 	movwne	r2, #58625	; 0xe501
 7cc:	1b0e030b 	blne	381400 <__user_program+0x81400>
 7d0:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 7d4:	00171006 	andseq	r1, r7, r6
 7d8:	00240200 	eoreq	r0, r4, r0, lsl #4
 7dc:	0b3e0b0b 	bleq	f83410 <__user_program+0xc83410>
 7e0:	00000e03 	andeq	r0, r0, r3, lsl #28
 7e4:	0b002403 	bleq	97f8 <scheduler_start+0x1e8>
 7e8:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 7ec:	04000008 	streq	r0, [r0], #-8
 7f0:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 7f4:	0b3b0b3a 	bleq	ec34e4 <__user_program+0xbc34e4>
 7f8:	00001349 	andeq	r1, r0, r9, asr #6
 7fc:	3f012e05 	svccc	0x00012e05
 800:	3a0e0319 	bcc	38146c <__user_program+0x8146c>
 804:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 808:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 80c:	97184006 	ldrls	r4, [r8, -r6]
 810:	13011942 	movwne	r1, #6466	; 0x1942
 814:	34060000 	strcc	r0, [r6], #-0
 818:	3a0e0300 	bcc	381420 <__user_program+0x81420>
 81c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 820:	00051c13 	andeq	r1, r5, r3, lsl ip
 824:	82890700 	addhi	r0, r9, #0, 14
 828:	01110101 	tsteq	r1, r1, lsl #2
 82c:	13011331 	movwne	r1, #4913	; 0x1331
 830:	8a080000 	bhi	200838 <__end+0xd2838>
 834:	02000182 	andeq	r0, r0, #-2147483616	; 0x80000020
 838:	18429118 	stmdane	r2, {r3, r4, r8, ip, pc}^
 83c:	89090000 	stmdbhi	r9, {}	; <UNPREDICTABLE>
 840:	11010182 	smlabbne	r1, r2, r1, r0
 844:	00133101 	andseq	r3, r3, r1, lsl #2
 848:	002e0a00 	eoreq	r0, lr, r0, lsl #20
 84c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 850:	0b3b0b3a 	bleq	ec3540 <__user_program+0xbc3540>
 854:	01111927 	tsteq	r1, r7, lsr #18
 858:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 85c:	00194297 	mulseq	r9, r7, r2
 860:	00050b00 	andeq	r0, r5, r0, lsl #22
 864:	0b3a0e03 	bleq	e84078 <__user_program+0xb84078>
 868:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 86c:	00001802 	andeq	r1, r0, r2, lsl #16
 870:	3f002e0c 	svccc	0x00002e0c
 874:	3a0e0319 	bcc	3814e0 <__user_program+0x814e0>
 878:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 87c:	11134919 	tstne	r3, r9, lsl r9
 880:	40061201 	andmi	r1, r6, r1, lsl #4
 884:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 888:	2e0d0000 	cdpcs	0, 0, cr0, cr13, cr0, {0}
 88c:	03193f01 	tsteq	r9, #1, 30
 890:	3b0b3a0e 	blcc	2cf0d0 <__end+0x1a10d0>
 894:	3c19270b 	ldccc	7, cr2, [r9], {11}
 898:	00130119 	andseq	r0, r3, r9, lsl r1
 89c:	00050e00 	andeq	r0, r5, r0, lsl #28
 8a0:	00001349 	andeq	r1, r0, r9, asr #6
 8a4:	3f012e0f 	svccc	0x00012e0f
 8a8:	3a0e0319 	bcc	381514 <__user_program+0x81514>
 8ac:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 8b0:	00193c19 	andseq	r3, r9, r9, lsl ip
 8b4:	11010000 	mrsne	r0, (UNDEF: 1)
 8b8:	130e2501 	movwne	r2, #58625	; 0xe501
 8bc:	1b0e030b 	blne	3814f0 <__user_program+0x814f0>
 8c0:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 8c4:	00171006 	andseq	r1, r7, r6
 8c8:	00240200 	eoreq	r0, r4, r0, lsl #4
 8cc:	0b3e0b0b 	bleq	f83500 <__user_program+0xc83500>
 8d0:	00000e03 	andeq	r0, r0, r3, lsl #28
 8d4:	0b002403 	bleq	98e8 <scheduler_start+0x2d8>
 8d8:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 8dc:	04000008 	streq	r0, [r0], #-8
 8e0:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 8e4:	0b3b0b3a 	bleq	ec35d4 <__user_program+0xbc35d4>
 8e8:	00001349 	andeq	r1, r0, r9, asr #6
 8ec:	03011305 	movweq	r1, #4869	; 0x1305
 8f0:	3a0b0b0e 	bcc	2c3530 <__end+0x195530>
 8f4:	010b3b0b 	tsteq	fp, fp, lsl #22
 8f8:	06000013 			; <UNDEFINED> instruction: 0x06000013
 8fc:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 900:	0b3b0b3a 	bleq	ec35f0 <__user_program+0xbc35f0>
 904:	0b381349 	bleq	e05630 <__user_program+0xb05630>
 908:	0f070000 	svceq	0x00070000
 90c:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 910:	08000013 	stmdaeq	r0, {r0, r1, r4}
 914:	19270015 	stmdbne	r7!, {r0, r2, r4}
 918:	0d090000 	stceq	0, cr0, [r9, #-0]
 91c:	3a080300 	bcc	201524 <__end+0xd3524>
 920:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 924:	000b3813 	andeq	r3, fp, r3, lsl r8
 928:	012e0a00 	teqeq	lr, r0, lsl #20
 92c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 930:	0b3b0b3a 	bleq	ec3620 <__user_program+0xbc3620>
 934:	01111927 	tsteq	r1, r7, lsr #18
 938:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 93c:	01194297 			; <UNDEFINED> instruction: 0x01194297
 940:	0b000013 	bleq	994 <__start-0x766c>
 944:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 948:	0b3b0b3a 	bleq	ec3638 <__user_program+0xbc3638>
 94c:	17021349 	strne	r1, [r2, -r9, asr #6]
 950:	890c0000 	stmdbhi	ip, {}	; <UNPREDICTABLE>
 954:	11000182 	smlabbne	r0, r2, r1, r0
 958:	00133101 	andseq	r3, r3, r1, lsl #2
 95c:	82890d00 	addhi	r0, r9, #0, 26
 960:	01110101 	tsteq	r1, r1, lsl #2
 964:	00001331 	andeq	r1, r0, r1, lsr r3
 968:	01828a0e 	orreq	r8, r2, lr, lsl #20
 96c:	91180200 	tstls	r8, r0, lsl #4
 970:	00001842 	andeq	r1, r0, r2, asr #16
 974:	3f012e0f 	svccc	0x00012e0f
 978:	3a0e0319 	bcc	3815e4 <__user_program+0x815e4>
 97c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 980:	11134919 	tstne	r3, r9, lsl r9
 984:	40061201 	andmi	r1, r6, r1, lsl #4
 988:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 98c:	00001301 	andeq	r1, r0, r1, lsl #6
 990:	03000510 	movweq	r0, #1296	; 0x510
 994:	3b0b3a08 	blcc	2cf1bc <__end+0x1a11bc>
 998:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 99c:	11000017 	tstne	r0, r7, lsl r0
 9a0:	08030034 	stmdaeq	r3, {r2, r4, r5}
 9a4:	0b3b0b3a 	bleq	ec3694 <__user_program+0xbc3694>
 9a8:	17021349 	strne	r1, [r2, -r9, asr #6]
 9ac:	34120000 	ldrcc	r0, [r2], #-0
 9b0:	3a0e0300 	bcc	3815b8 <__user_program+0x815b8>
 9b4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 9b8:	00170213 	andseq	r0, r7, r3, lsl r2
 9bc:	82891300 	addhi	r1, r9, #0, 6
 9c0:	01110101 	tsteq	r1, r1, lsl #2
 9c4:	13011331 	movwne	r1, #4913	; 0x1331
 9c8:	05140000 	ldreq	r0, [r4, #-0]
 9cc:	3a080300 	bcc	2015d4 <__end+0xd35d4>
 9d0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 9d4:	00180213 	andseq	r0, r8, r3, lsl r2
 9d8:	00341500 	eorseq	r1, r4, r0, lsl #10
 9dc:	0b3a0e03 	bleq	e841f0 <__user_program+0xb841f0>
 9e0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 9e4:	00001802 	andeq	r1, r0, r2, lsl #16
 9e8:	55010b16 	strpl	r0, [r1, #-2838]	; 0xb16
 9ec:	00130117 	andseq	r0, r3, r7, lsl r1
 9f0:	012e1700 	teqeq	lr, r0, lsl #14
 9f4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 9f8:	0b3b0b3a 	bleq	ec36e8 <__user_program+0xbc36e8>
 9fc:	13491927 	movtne	r1, #39207	; 0x9927
 a00:	06120111 			; <UNDEFINED> instruction: 0x06120111
 a04:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 a08:	00130119 	andseq	r0, r3, r9, lsl r1
 a0c:	002e1800 	eoreq	r1, lr, r0, lsl #16
 a10:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 a14:	0b3b0b3a 	bleq	ec3704 <__user_program+0xbc3704>
 a18:	01111927 	tsteq	r1, r7, lsr #18
 a1c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 a20:	00194297 	mulseq	r9, r7, r2
 a24:	002e1900 	eoreq	r1, lr, r0, lsl #18
 a28:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 a2c:	0b3b0b3a 	bleq	ec371c <__user_program+0xbc371c>
 a30:	13491927 	movtne	r1, #39207	; 0x9927
 a34:	06120111 			; <UNDEFINED> instruction: 0x06120111
 a38:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 a3c:	1a000019 	bne	aa8 <__start-0x7558>
 a40:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 a44:	0b3b0b3a 	bleq	ec3734 <__user_program+0xbc3734>
 a48:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 a4c:	0000193c 	andeq	r1, r0, ip, lsr r9
 a50:	0b000f1b 	bleq	46c4 <__start-0x393c>
 a54:	1c00000b 	stcne	0, cr0, [r0], {11}
 a58:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 a5c:	0b3a0e03 	bleq	e84270 <__user_program+0xb84270>
 a60:	1927053b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, sl}
 a64:	01111349 	tsteq	r1, r9, asr #6
 a68:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 a6c:	01194297 			; <UNDEFINED> instruction: 0x01194297
 a70:	1d000013 	stcne	0, cr0, [r0, #-76]	; 0xffffffb4
 a74:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 a78:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xb3a
 a7c:	17021349 	strne	r1, [r2, -r9, asr #6]
 a80:	051e0000 	ldreq	r0, [lr, #-0]
 a84:	3a080300 	bcc	20168c <__end+0xd368c>
 a88:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 a8c:	00180213 	andseq	r0, r8, r3, lsl r2
 a90:	01011f00 	tsteq	r1, r0, lsl #30
 a94:	13011349 	movwne	r1, #4937	; 0x1349
 a98:	21200000 	teqcs	r0, r0
 a9c:	2f134900 	svccs	0x00134900
 aa0:	2100000b 	tstcs	r0, fp
 aa4:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 aa8:	0b3b0b3a 	bleq	ec3798 <__user_program+0xbc3798>
 aac:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 ab0:	00001802 	andeq	r1, r0, r2, lsl #16
 ab4:	49003522 	stmdbmi	r0, {r1, r5, r8, sl, ip, sp}
 ab8:	23000013 	movwcs	r0, #19
 abc:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 ac0:	0b3a0e03 	bleq	e842d4 <__user_program+0xb842d4>
 ac4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 ac8:	0000193c 	andeq	r1, r0, ip, lsr r9
 acc:	3f012e24 	svccc	0x00012e24
 ad0:	3a0e0319 	bcc	38173c <__user_program+0x8173c>
 ad4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 ad8:	3c134919 	ldccc	9, cr4, [r3], {25}
 adc:	00130119 	andseq	r0, r3, r9, lsl r1
 ae0:	00052500 	andeq	r2, r5, r0, lsl #10
 ae4:	00001349 	andeq	r1, r0, r9, asr #6
 ae8:	00001826 	andeq	r1, r0, r6, lsr #16
 aec:	00262700 	eoreq	r2, r6, r0, lsl #14
 af0:	00001349 	andeq	r1, r0, r9, asr #6
 af4:	3f012e28 	svccc	0x00012e28
 af8:	3a0e0319 	bcc	381764 <__user_program+0x81764>
 afc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 b00:	01193c19 	tsteq	r9, r9, lsl ip
 b04:	29000013 	stmdbcs	r0, {r0, r1, r4}
 b08:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 b0c:	0b3a0e03 	bleq	e84320 <__user_program+0xb84320>
 b10:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 b14:	193c1349 	ldmdbne	ip!, {r0, r3, r6, r8, r9, ip}
 b18:	2e2a0000 	cdpcs	0, 2, cr0, cr10, cr0, {0}
 b1c:	03193f01 	tsteq	r9, #1, 30
 b20:	3b0b3a0e 	blcc	2cf360 <__end+0x1a1360>
 b24:	3c19270b 	ldccc	7, cr2, [r9], {11}
 b28:	00000019 	andeq	r0, r0, r9, lsl r0
 b2c:	10001101 	andne	r1, r0, r1, lsl #2
 b30:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 b34:	1b080301 	blne	201740 <__end+0xd3740>
 b38:	13082508 	movwne	r2, #34056	; 0x8508
 b3c:	00000005 	andeq	r0, r0, r5
 b40:	10001101 	andne	r1, r0, r1, lsl #2
 b44:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 b48:	1b080301 	blne	201754 <__end+0xd3754>
 b4c:	13082508 	movwne	r2, #34056	; 0x8508
 b50:	00000005 	andeq	r0, r0, r5
 b54:	10001101 	andne	r1, r0, r1, lsl #2
 b58:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 b5c:	1b080301 	blne	201768 <__end+0xd3768>
 b60:	13082508 	movwne	r2, #34056	; 0x8508
 b64:	00000005 	andeq	r0, r0, r5

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
  94:	000008b4 			; <UNDEFINED> instruction: 0x000008b4
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	0ebb0002 	cdpeq	0, 11, cr0, cr11, cr2, {0}
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008d54 	andeq	r8, r0, r4, asr sp
  b4:	00000298 	muleq	r0, r8, r2
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	11af0002 			; <UNDEFINED> instruction: 0x11af0002
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008fec 	andeq	r8, r0, ip, ror #31
  d4:	000000a8 	andeq	r0, r0, r8, lsr #1
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	12720002 	rsbsne	r0, r2, #2
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00009094 	muleq	r0, r4, r0
  f4:	000000d8 	ldrdeq	r0, [r0], -r8
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	13d60002 	bicsne	r0, r6, #2
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	0000916c 	andeq	r9, r0, ip, ror #2
 114:	00000960 	andeq	r0, r0, r0, ror #18
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	1d490002 	stclne	0, cr0, [r9, #-8]
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008000 	andeq	r8, r0, r0
 134:	00000054 	andeq	r0, r0, r4, asr r0
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	1dab0002 	stcne	0, cr0, [fp, #8]!
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	00009acc 	andeq	r9, r0, ip, asr #21
 154:	00000044 	andeq	r0, r0, r4, asr #32
	...
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	1e0c0002 	cdpne	0, 0, cr0, cr12, cr2, {0}
 168:	00040000 	andeq	r0, r4, r0
 16c:	00000000 	andeq	r0, r0, r0
 170:	00009b10 	andeq	r9, r0, r0, lsl fp
 174:	000001c0 	andeq	r0, r0, r0, asr #3
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
  7c:	fb010200 	blx	40886 <__bss_end+0x33886>
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
 110:	fb010200 	blx	4091a <__bss_end+0x3391a>
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
 238:	4a060304 	bmi	180e50 <__end+0x52e50>
 23c:	03040200 	movweq	r0, #16896	; 0x4200
 240:	a04e4906 	subge	r4, lr, r6, lsl #18
 244:	4d4a6903 	stclmi	9, cr6, [sl, #-12]
 248:	022e1503 	eoreq	r1, lr, #12582912	; 0xc00000
 24c:	01010002 	tsteq	r1, r2
 250:	0000019d 	muleq	r0, sp, r1
 254:	009f0002 	addseq	r0, pc, r2
 258:	01020000 	mrseq	r0, (UNDEF: 2)
 25c:	000d0efb 	strdeq	r0, [sp], -fp
 260:	01010101 	tsteq	r1, r1, lsl #2
 264:	01000000 	mrseq	r0, (UNDEF: 0)
 268:	6b010000 	blvs	40270 <__bss_end+0x33270>
 26c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 270:	732f2f6c 	teqvc	pc, #108, 30	; 0x1b0
 274:	33006372 	movwcc	r6, #882	; 0x372
 278:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 27c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 280:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 284:	6b006564 	blvs	1981c <__bss_end+0xc81c>
 288:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 28c:	692f2f6c 	stmdbvs	pc!, {r2, r3, r5, r6, r8, r9, sl, fp, sp}	; <UNPREDICTABLE>
 290:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 294:	00006564 	andeq	r6, r0, r4, ror #10
 298:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 29c:	632e6c65 	teqvs	lr, #25856	; 0x6500
 2a0:	00000100 	andeq	r0, r0, r0, lsl #2
 2a4:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 2a8:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 2ac:	00020068 	andeq	r0, r2, r8, rrx
 2b0:	74756d00 	ldrbtvc	r6, [r5], #-3328	; 0xd00
 2b4:	682e7865 	stmdavs	lr!, {r0, r2, r5, r6, fp, ip, sp, lr}
 2b8:	00000300 	andeq	r0, r0, r0, lsl #6
 2bc:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 2c0:	736c6c61 	cmnvc	ip, #24832	; 0x6100
 2c4:	0300682e 	movweq	r6, #2094	; 0x82e
 2c8:	69740000 	ldmdbvs	r4!, {}^	; <UNPREDICTABLE>
 2cc:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 2d0:	00030068 	andeq	r0, r3, r8, rrx
 2d4:	6d726100 	ldfvse	f6, [r2, #-0]
 2d8:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 2dc:	61750000 	cmnvs	r5, r0
 2e0:	682e7472 	stmdavs	lr!, {r1, r4, r5, r6, sl, ip, sp, lr}
 2e4:	00000300 	andeq	r0, r0, r0, lsl #6
 2e8:	65707573 	ldrbvs	r7, [r0, #-1395]!	; 0x573
 2ec:	73697672 	cmnvc	r9, #119537664	; 0x7200000
 2f0:	682e726f 	stmdavs	lr!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
 2f4:	00000300 	andeq	r0, r0, r0, lsl #6
 2f8:	02050000 	andeq	r0, r5, #0
 2fc:	000084a0 	andeq	r8, r0, r0, lsr #9
 300:	2f011703 	svccs	0x00011703
 304:	2f302f2f 	svccs	0x00302f2f
 308:	0402002f 	streq	r0, [r2], #-47	; 0x2f
 30c:	31313001 	teqcc	r1, r1
 310:	002f302d 	eoreq	r3, pc, sp, lsr #32
 314:	06010402 	streq	r0, [r1], -r2, lsl #8
 318:	02005808 	andeq	r5, r0, #8, 16	; 0x80000
 31c:	4c060104 	stfmis	f0, [r6], {4}
 320:	02040200 	andeq	r0, r4, #0, 4
 324:	13306d9b 	teqne	r0, #9920	; 0x26c0
 328:	0200309d 	andeq	r3, r0, #157	; 0x9d
 32c:	08060104 	stmdaeq	r6, {r2, r8}
 330:	3d08063c 	stccc	6, cr0, [r8, #-240]	; 0xffffff10
 334:	21085908 	tstcs	r8, r8, lsl #18
 338:	08e608bb 	stmiaeq	r6!, {r0, r1, r3, r4, r5, r7, fp}^
 33c:	9f9f9f21 	svcls	0x009f9f21
 340:	9f9f9f9f 	svcls	0x009f9f9f
 344:	9f9f9f9f 	svcls	0x009f9f9f
 348:	9f9f9f9f 	svcls	0x009f9f9f
 34c:	13bd9fa0 			; <UNDEFINED> instruction: 0x13bd9fa0
 350:	01040200 	mrseq	r0, R12_usr
 354:	06580806 	ldrbeq	r0, [r8], -r6, lsl #16
 358:	3d082108 	stfccs	f2, [r8, #-32]	; 0xffffffe0
 35c:	bb9fbb9f 	bllt	fe7ef1e0 <__user_program+0xfe4ef1e0>
 360:	bb9fbb9f 	bllt	fe7ef1e4 <__user_program+0xfe4ef1e4>
 364:	bb9fbb9f 	bllt	fe7ef1e8 <__user_program+0xfe4ef1e8>
 368:	9fa0bb9f 	svcls	0x00a0bb9f
 36c:	089f13da 	ldmeq	pc, {r1, r3, r4, r6, r7, r8, r9, ip}	; <UNPREDICTABLE>
 370:	d93d0892 	ldmdble	sp!, {r1, r4, r7, fp}
 374:	01040200 	mrseq	r0, R12_usr
 378:	06580806 	ldrbeq	r0, [r8], -r6, lsl #16
 37c:	2f30cd08 	svccs	0x0030cd08
 380:	004630d8 	ldrdeq	r3, [r6], #-8
 384:	06010402 	streq	r0, [r1], -r2, lsl #8
 388:	67bb0682 	ldrvs	r0, [fp, r2, lsl #13]!
 38c:	0200672f 	andeq	r6, r0, #12320768	; 0xbc0000
 390:	6e610204 	cdpvs	2, 6, cr0, cr1, cr4, {0}
 394:	02004b33 	andeq	r4, r0, #52224	; 0xcc00
 398:	66060104 	strvs	r0, [r6], -r4, lsl #2
 39c:	2fa03006 	svccs	0x00a03006
 3a0:	03852f4c 	orreq	r2, r5, #76, 30	; 0x130
 3a4:	3083660d 	addcc	r6, r3, sp, lsl #12
 3a8:	67142e02 	ldrvs	r2, [r4, -r2, lsl #28]
 3ac:	67309f30 			; <UNDEFINED> instruction: 0x67309f30
 3b0:	67308330 			; <UNDEFINED> instruction: 0x67308330
 3b4:	9f309f30 	svcls	0x00309f30
 3b8:	4a680330 	bmi	1a01080 <__user_program+0x1701080>
 3bc:	302e1903 	eorcc	r1, lr, r3, lsl #18
 3c0:	30f33083 	rscscc	r3, r3, r3, lsl #1
 3c4:	5c033083 	stcpl	0, cr3, [r3], {131}	; 0x83
 3c8:	2e25034a 	cdpcs	3, 2, cr0, cr5, cr10, {2}
 3cc:	4a590330 	bmi	1641094 <__user_program+0x1341094>
 3d0:	302e2803 	eorcc	r2, lr, r3, lsl #16
 3d4:	032e5603 	teqeq	lr, #3145728	; 0x300000
 3d8:	4b302e2b 	blmi	c0bc8c <__user_program+0x90bc8c>
 3dc:	03304b30 	teqeq	r0, #48, 22	; 0xc000
 3e0:	34034a4d 	strcc	r4, [r3], #-2637	; 0xa4d
 3e4:	2e4c032e 	cdpcs	3, 4, cr0, cr12, cr14, {1}
 3e8:	302e3703 	eorcc	r3, lr, r3, lsl #14
 3ec:	01000602 	tsteq	r0, r2, lsl #12
 3f0:	0000e201 	andeq	lr, r0, r1, lsl #4
 3f4:	7d000200 	sfmvc	f0, 4, [r0, #-0]
 3f8:	02000000 	andeq	r0, r0, #0
 3fc:	0d0efb01 	vstreq	d15, [lr, #-4]
 400:	01010100 	mrseq	r0, (UNDEF: 17)
 404:	00000001 	andeq	r0, r0, r1
 408:	01000001 	tsteq	r0, r1
 40c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 410:	2f2f6c65 	svccs	0x002f6c65
 414:	00637273 	rsbeq	r7, r3, r3, ror r2
 418:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 41c:	2f6b6269 	svccs	0x006b6269
 420:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 424:	00656475 	rsbeq	r6, r5, r5, ror r4
 428:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 42c:	2f2f6c65 	svccs	0x002f6c65
 430:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 434:	00656475 	rsbeq	r6, r5, r5, ror r4
 438:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 43c:	2e6b746e 	cdpcs	4, 6, cr7, cr11, cr14, {3}
 440:	00010063 	andeq	r0, r1, r3, rrx
 444:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 448:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 44c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 450:	736b0000 	cmnvc	fp, #0
 454:	72616474 	rsbvc	r6, r1, #116, 8	; 0x74000000
 458:	00682e67 	rsbeq	r2, r8, r7, ror #28
 45c:	3c000002 	stccc	0, cr0, [r0], {2}
 460:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 464:	6e692d74 	mcrvs	13, 3, r2, cr9, cr4, {3}
 468:	0000003e 	andeq	r0, r0, lr, lsr r0
 46c:	72617500 	rsbvc	r7, r1, #0, 10
 470:	00682e74 	rsbeq	r2, r8, r4, ror lr
 474:	00000003 	andeq	r0, r0, r3
 478:	54020500 	strpl	r0, [r2], #-1280	; 0x500
 47c:	0300008d 	movweq	r0, #141	; 0x8d
 480:	4d880120 	stfmis	f0, [r8, #128]	; 0x80
 484:	0402009c 	streq	r0, [r2], #-156	; 0x9c
 488:	02004c01 	andeq	r4, r0, #256	; 0x100
 48c:	00330104 	eorseq	r0, r3, r4, lsl #2
 490:	08010402 	stmdaeq	r1, {r1, sl}
 494:	04020059 	streq	r0, [r2], #-89	; 0x59
 498:	4b4dd701 	blmi	13760a4 <__user_program+0x10760a4>
 49c:	872d9b6a 	strhi	r9, [sp, -sl, ror #22]!
 4a0:	854d6949 	strbhi	r6, [sp, #-2377]	; 0x949
 4a4:	514a2003 	cmppl	sl, r3
 4a8:	302e5c03 	eorcc	r5, lr, r3, lsl #24
 4ac:	02324b4b 	eorseq	r4, r2, #76800	; 0x12c00
 4b0:	4b83152c 	blmi	fe0c5968 <__user_program+0xfddc5968>
 4b4:	67a4a04b 	strvs	sl, [r4, fp, asr #32]!
 4b8:	83673283 	cmnhi	r7, #805306376	; 0x30000008
 4bc:	32836733 	addcc	r6, r3, #13369344	; 0xcc0000
 4c0:	8a2d6783 	bhi	b5a2d4 <__user_program+0x85a2d4>
 4c4:	4b324b67 	blmi	c93268 <__user_program+0x993268>
 4c8:	bf034d33 	svclt	0x00034d33
 4cc:	c6032e7f 			; <UNDEFINED> instruction: 0xc6032e7f
 4d0:	08026600 	stmdaeq	r2, {r9, sl, sp, lr}
 4d4:	6b010100 	blvs	408dc <__bss_end+0x338dc>
 4d8:	02000000 	andeq	r0, r0, #0
 4dc:	00004700 	andeq	r4, r0, r0, lsl #14
 4e0:	fb010200 	blx	40cea <__bss_end+0x33cea>
 4e4:	01000d0e 	tsteq	r0, lr, lsl #26
 4e8:	00010101 	andeq	r0, r1, r1, lsl #2
 4ec:	00010000 	andeq	r0, r1, r0
 4f0:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 4f4:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 4f8:	72732f2f 	rsbsvc	r2, r3, #47, 30	; 0xbc
 4fc:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 500:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 504:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 508:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 50c:	74000065 	strvc	r0, [r0], #-101	; 0x65
 510:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 514:	0100632e 	tsteq	r0, lr, lsr #6
 518:	736b0000 	cmnvc	fp, #0
 51c:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 520:	00682e74 	rsbeq	r2, r8, r4, ror lr
 524:	00000002 	andeq	r0, r0, r2
 528:	ec020500 	cfstr32	mvfx0, [r2], {-0}
 52c:	0300008f 	movweq	r0, #143	; 0x8f
 530:	6713010d 	ldrvs	r0, [r3, -sp, lsl #2]
 534:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 538:	679f1386 	ldrvs	r1, [pc, r6, lsl #7]
 53c:	4d681387 	stclmi	3, cr1, [r8, #-540]!	; 0xfffffde4
 540:	000c0213 	andeq	r0, ip, r3, lsl r2
 544:	00850101 	addeq	r0, r5, r1, lsl #2
 548:	00020000 	andeq	r0, r2, r0
 54c:	00000050 	andeq	r0, r0, r0, asr r0
 550:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 554:	0101000d 	tsteq	r1, sp
 558:	00000101 	andeq	r0, r0, r1, lsl #2
 55c:	00000100 	andeq	r0, r0, r0, lsl #2
 560:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 564:	2f6c656e 	svccs	0x006c656e
 568:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 56c:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 570:	6b62696c 	blvs	189ab28 <__user_program+0x159ab28>
 574:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 578:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 57c:	61750000 	cmnvs	r5, r0
 580:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 584:	00000100 	andeq	r0, r0, r0, lsl #2
 588:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 58c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 590:	00020068 	andeq	r0, r2, r8, rrx
 594:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
 598:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 59c:	00000002 	andeq	r0, r0, r2
 5a0:	94020500 	strls	r0, [r2], #-1280	; 0x500
 5a4:	03000090 	movweq	r0, #144	; 0x90
 5a8:	6730010e 	ldrvs	r0, [r0, -lr, lsl #2]!
 5ac:	9f686768 	svcls	0x00686768
 5b0:	6a68674b 	bvs	1a1a2e4 <__user_program+0x171a2e4>
 5b4:	0013bd13 	andseq	fp, r3, r3, lsl sp
 5b8:	06010402 	streq	r0, [r1], -r2, lsl #8
 5bc:	8567064a 	strbhi	r0, [r7, #-1610]!	; 0x64a
 5c0:	04020013 	streq	r0, [r2], #-19
 5c4:	064a0601 	strbeq	r0, [sl], -r1, lsl #12
 5c8:	04026767 	streq	r6, [r2], #-1895	; 0x767
 5cc:	e9010100 	stmdb	r1, {r8}
 5d0:	02000001 	andeq	r0, r0, #1
 5d4:	00009d00 	andeq	r9, r0, r0, lsl #26
 5d8:	fb010200 	blx	40de2 <__bss_end+0x33de2>
 5dc:	01000d0e 	tsteq	r0, lr, lsl #26
 5e0:	00010101 	andeq	r0, r1, r1, lsl #2
 5e4:	00010000 	andeq	r0, r1, r0
 5e8:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 5ec:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 5f0:	72732f2f 	rsbsvc	r2, r3, #47, 30	; 0xbc
 5f4:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 5f8:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 5fc:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 600:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 604:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 608:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 60c:	6e692f2f 	cdpvs	15, 6, cr2, cr9, cr15, {1}
 610:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 614:	73000065 	movwvc	r0, #101	; 0x65
 618:	61637379 	smcvs	14137	; 0x3739
 61c:	2e736c6c 	cdpcs	12, 7, cr6, cr3, cr12, {3}
 620:	00010063 	andeq	r0, r1, r3, rrx
 624:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 628:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 62c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 630:	756d0000 	strbvc	r0, [sp, #-0]!
 634:	2e786574 	mrccs	5, 3, r6, cr8, cr4, {3}
 638:	00030068 	andeq	r0, r3, r8, rrx
 63c:	73797300 	cmnvc	r9, #0, 6
 640:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 644:	00682e73 	rsbeq	r2, r8, r3, ror lr
 648:	61000003 	tstvs	r0, r3
 64c:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
 650:	00000200 	andeq	r0, r0, r0, lsl #4
 654:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 658:	682e6b74 	stmdavs	lr!, {r2, r4, r5, r6, r8, r9, fp, sp, lr}
 65c:	00000300 	andeq	r0, r0, r0, lsl #6
 660:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 664:	0300682e 	movweq	r6, #2094	; 0x82e
 668:	69740000 	ldmdbvs	r4!, {}^	; <UNPREDICTABLE>
 66c:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 670:	00030068 	andeq	r0, r3, r8, rrx
 674:	05000000 	streq	r0, [r0, #-0]
 678:	00916c02 	addseq	r6, r1, r2, lsl #24
 67c:	01150300 	tsteq	r5, r0, lsl #6
 680:	02002f4b 	andeq	r2, r0, #300	; 0x12c
 684:	33830104 	orrcc	r0, r3, #4, 2
 688:	04020013 	streq	r0, [r2], #-19
 68c:	00474c01 	subeq	r4, r7, r1, lsl #24
 690:	86030402 	strhi	r0, [r3], -r2, lsl #8
 694:	03040200 	movweq	r0, #16896	; 0x4200
 698:	4f454d49 	svcmi	0x00454d49
 69c:	134a0b03 	movtne	r0, #43779	; 0xab03
 6a0:	82090349 	andhi	r0, r9, #603979777	; 0x24000001
 6a4:	2f4b6763 	svccs	0x004b6763
 6a8:	040200da 	streq	r0, [r2], #-218	; 0xda
 6ac:	004a0601 	subeq	r0, sl, r1, lsl #12
 6b0:	4a020402 	bmi	816c0 <__bss_end+0x746c0>
 6b4:	2d676706 	stclcs	7, cr6, [r7, #-24]!	; 0xffffffe8
 6b8:	494b3230 	stmdbmi	fp, {r4, r5, r9, ip, sp}^
 6bc:	032e7003 	teqeq	lr, #3
 6c0:	034b9e15 	movteq	r9, #48661	; 0xbe15
 6c4:	24034a67 	strcs	r4, [r3], #-2663	; 0xa67
 6c8:	6865134a 	stmdavs	r5!, {r1, r3, r6, r8, r9, ip}^
 6cc:	4bf3a1d8 	blmi	ffce8e34 <__user_program+0xff9e8e34>
 6d0:	4b4b2f2f 	blmi	12cc394 <__user_program+0xfcc394>
 6d4:	2f314b2f 	svccs	0x00314b2f
 6d8:	03674b4b 	cmneq	r7, #76800	; 0x12c00
 6dc:	16032e6b 	strne	r2, [r3], -fp, ror #28
 6e0:	2e6b032e 	cdpcs	3, 6, cr0, cr11, cr14, {1}
 6e4:	032e1503 	teqeq	lr, #12582912	; 0xc00000
 6e8:	83832e61 	orrhi	r2, r3, #1552	; 0x610
 6ec:	bb838367 	bllt	fe0e1490 <__user_program+0xfdde1490>
 6f0:	134a1b03 	movtne	r1, #43779	; 0xab03
 6f4:	83bb309d 			; <UNDEFINED> instruction: 0x83bb309d
 6f8:	03836767 	orreq	r6, r3, #27000832	; 0x19c0000
 6fc:	09034a7a 	stmdbeq	r3, {r1, r3, r4, r5, r6, r9, fp, lr}
 700:	302d314a 	eorcc	r3, sp, sl, asr #2
 704:	0402002f 	streq	r0, [r2], #-47	; 0x2f
 708:	58080601 	stmdapl	r8, {r0, r9, sl}
 70c:	01040200 	mrseq	r0, R12_usr
 710:	02004c06 	andeq	r4, r0, #1536	; 0x600
 714:	6d9b0204 	lfmvs	f0, 4, [fp, #16]
 718:	082f4b30 	stmdaeq	pc!, {r4, r5, r8, r9, fp, lr}	; <UNPREDICTABLE>
 71c:	4b4c2f3e 	blmi	130c41c <__user_program+0x100c41c>
 720:	04020047 	streq	r0, [r2], #-71	; 0x47
 724:	06820601 	streq	r0, [r2], r1, lsl #12
 728:	67832f67 	strvs	r2, [r3, r7, ror #30]
 72c:	002f9ff3 	strdeq	r9, [pc], -r3	; <UNPREDICTABLE>
 730:	06010402 	streq	r0, [r1], -r2, lsl #8
 734:	0367062e 	cmneq	r7, #48234496	; 0x2e00000
 738:	02002e77 	andeq	r2, r0, #1904	; 0x770
 73c:	4a060204 	bmi	180f54 <__end+0x52f54>
 740:	660e0306 	strvs	r0, [lr], -r6, lsl #6
 744:	4d834b2f 	vstrmi	d4, [r3, #188]	; 0xbc
 748:	2f4b2f4b 	svccs	0x004b2f4b
 74c:	4c4d3d08 	mcrrmi	13, 0, r3, sp, cr8
 750:	9f9f9fbb 	svcls	0x009f9fbb
 754:	9f9f9f9f 	svcls	0x009f9f9f
 758:	9f9f9f9f 	svcls	0x009f9f9f
 75c:	9f9f9f9f 	svcls	0x009f9f9f
 760:	9f9f9f9f 	svcls	0x009f9f9f
 764:	9f9f9f9f 	svcls	0x009f9f9f
 768:	9f9f9f9f 	svcls	0x009f9f9f
 76c:	bf9f9f9f 	svclt	0x009f9f9f
 770:	682f3148 	stmdavs	pc!, {r3, r6, r8, ip, sp}	; <UNPREDICTABLE>
 774:	002f6748 	eoreq	r6, pc, r8, asr #14
 778:	02020402 	andeq	r0, r2, #33554432	; 0x2000000
 77c:	086c0f26 	stmdaeq	ip!, {r1, r2, r5, r8, r9, sl, fp}^
 780:	67678324 	strbvs	r8, [r7, -r4, lsr #6]!
 784:	02002f83 	andeq	r2, r0, #524	; 0x20c
 788:	304b0104 	subcc	r0, fp, r4, lsl #2
 78c:	21081368 	tstcs	r8, r8, ror #6
 790:	01040200 	mrseq	r0, R12_usr
 794:	bb068206 	bllt	1a0fb4 <__end+0x72fb4>
 798:	30671330 	rsbcc	r1, r7, r0, lsr r3
 79c:	0200f313 	andeq	pc, r0, #1275068416	; 0x4c000000
 7a0:	82060104 	andhi	r0, r6, #4, 2
 7a4:	1734d706 	ldrne	sp, [r4, -r6, lsl #14]!
 7a8:	8867a184 	stmdahi	r7!, {r2, r7, r8, sp, pc}^
 7ac:	30342967 	eorscc	r2, r4, r7, ror #18
 7b0:	4c144c14 	ldcmi	12, cr4, [r4], {20}
 7b4:	02144c14 	andseq	r4, r4, #20, 24	; 0x1400
 7b8:	01010004 	tsteq	r1, r4
 7bc:	00000054 	andeq	r0, r0, r4, asr r0
 7c0:	00290002 	eoreq	r0, r9, r2
 7c4:	01020000 	mrseq	r0, (UNDEF: 2)
 7c8:	000d0efb 	strdeq	r0, [sp], -fp
 7cc:	01010101 	tsteq	r1, r1, lsl #2
 7d0:	01000000 	mrseq	r0, (UNDEF: 0)
 7d4:	33010000 	movwcc	r0, #4096	; 0x1000
 7d8:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 7dc:	732f6b62 	teqvc	pc, #100352	; 0x18800
 7e0:	00006372 	andeq	r6, r0, r2, ror r3
 7e4:	746f6f62 	strbtvc	r6, [pc], #-3938	; 7ec <__start-0x7814>
 7e8:	0100532e 	tsteq	r0, lr, lsr #6
 7ec:	00000000 	andeq	r0, r0, r0
 7f0:	80000205 	andhi	r0, r0, r5, lsl #4
 7f4:	1b030000 	blne	c07fc <__bss_end+0xb37fc>
 7f8:	2f2f2f01 	svccs	0x002f2f01
 7fc:	2f2f2f30 	svccs	0x002f2f30
 800:	312f2f2f 	teqcc	pc, pc, lsr #30
 804:	33312f2f 	teqcc	r1, #47, 30	; 0xbc
 808:	2e69032f 	cdpcs	3, 6, cr0, cr9, cr15, {1}
 80c:	022f2f31 	eoreq	r2, pc, #49, 30	; 0xc4
 810:	01010002 	tsteq	r1, r2
 814:	0000004d 	andeq	r0, r0, sp, asr #32
 818:	00280002 	eoreq	r0, r8, r2
 81c:	01020000 	mrseq	r0, (UNDEF: 2)
 820:	000d0efb 	strdeq	r0, [sp], -fp
 824:	01010101 	tsteq	r1, r1, lsl #2
 828:	01000000 	mrseq	r0, (UNDEF: 0)
 82c:	33010000 	movwcc	r0, #4096	; 0x1000
 830:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 834:	732f6b62 	teqvc	pc, #100352	; 0x18800
 838:	00006372 	andeq	r6, r0, r2, ror r3
 83c:	2e6d7261 	cdpcs	2, 6, cr7, cr13, cr1, {3}
 840:	00010053 	andeq	r0, r1, r3, asr r0
 844:	05000000 	streq	r0, [r0, #-0]
 848:	009acc02 	addseq	ip, sl, r2, lsl #24
 84c:	01100300 	tsteq	r0, r0, lsl #6
 850:	2f332f2f 	svccs	0x00332f2f
 854:	2f332f33 	svccs	0x00332f33
 858:	332f2f2f 	teqcc	pc, #47, 30	; 0xbc
 85c:	2f2f2f2f 	svccs	0x002f2f2f
 860:	01000202 	tsteq	r0, r2, lsl #4
 864:	0000bb01 	andeq	fp, r0, r1, lsl #22
 868:	2f000200 	svccs	0x00000200
 86c:	02000000 	andeq	r0, r0, #0
 870:	0d0efb01 	vstreq	d15, [lr, #-4]
 874:	01010100 	mrseq	r0, (UNDEF: 17)
 878:	00000001 	andeq	r0, r0, r1
 87c:	01000001 	tsteq	r0, r1
 880:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 884:	2f2f6c65 	svccs	0x002f6c65
 888:	00637273 	rsbeq	r7, r3, r3, ror r2
 88c:	70757300 	rsbsvc	r7, r5, r0, lsl #6
 890:	69767265 	ldmdbvs	r6!, {r0, r2, r5, r6, r9, ip, sp, lr}^
 894:	2e726f73 	mrccs	15, 3, r6, cr2, cr3, {3}
 898:	00010053 	andeq	r0, r1, r3, asr r0
 89c:	05000000 	streq	r0, [r0, #-0]
 8a0:	009b1002 	addseq	r1, fp, r2
 8a4:	01150300 	tsteq	r5, r0, lsl #6
 8a8:	2f2f2f2f 	svccs	0x002f2f2f
 8ac:	032f2f2f 	teqeq	pc, #47, 30	; 0xbc
 8b0:	2f2ff215 	svccs	0x002ff215
 8b4:	2f302f30 	svccs	0x00302f30
 8b8:	0d032f2f 	stceq	15, cr2, [r3, #-188]	; 0xffffff44
 8bc:	2f2f2f2e 	svccs	0x002f2f2e
 8c0:	2f2f2f31 	svccs	0x002f2f31
 8c4:	2f312f2f 	svccs	0x00312f2f
 8c8:	2f2f2f31 	svccs	0x002f2f31
 8cc:	2f2f312f 	svccs	0x002f312f
 8d0:	032f312f 	teqeq	pc, #-1073741813	; 0xc000000b
 8d4:	2f312e13 	svccs	0x00312e13
 8d8:	2f2f2f31 	svccs	0x002f2f31
 8dc:	2f312f2f 	svccs	0x00312f2f
 8e0:	3230312f 	eorscc	r3, r0, #-1073741813	; 0xc000000b
 8e4:	2f2f312f 	svccs	0x002f312f
 8e8:	312f2f2f 	teqcc	pc, pc, lsr #30
 8ec:	2f302f2f 	svccs	0x00302f2f
 8f0:	2f2f2f2f 	svccs	0x002f2f2f
 8f4:	2f2f2f2f 	svccs	0x002f2f2f
 8f8:	312f302f 	teqcc	pc, pc, lsr #32
 8fc:	2f2f3130 	svccs	0x002f3130
 900:	2f2f2f2f 	svccs	0x002f2f2f
 904:	322f2f2f 	eorcc	r2, pc, #47, 30	; 0xbc
 908:	31313136 	teqcc	r1, r6, lsr r1
 90c:	2f2f3136 	svccs	0x002f3136
 910:	0330302f 	teqeq	r0, #47	; 0x2f
 914:	032e7ec8 	teqeq	lr, #200, 28	; 0xc80
 918:	032e00c9 	teqeq	lr, #201	; 0xc9
 91c:	022e00ed 	eoreq	r0, lr, #237	; 0xed
 920:	01010002 	tsteq	r1, r2

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
  30:	64656c00 	strbtvs	r6, [r5], #-3072	; 0xc00
  34:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
  38:	6f6c0074 	svcvs	0x006c0074
  3c:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
  40:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  44:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  48:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  4c:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
  50:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  54:	6c635f6f 	stclvs	15, cr5, [r3], #-444	; 0xfffffe44
  58:	34330072 	ldrtcc	r0, [r3], #-114	; 0x72
  5c:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
  60:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
  64:	656c2f63 	strbvs	r2, [ip, #-3939]!	; 0xf63
  68:	632e7364 	teqvs	lr, #100, 6	; 0x90000001
  6c:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
  70:	34204320 	strtcc	r4, [r0], #-800	; 0x320
  74:	332e392e 	teqcc	lr, #753664	; 0xb8000
  78:	31303220 	teqcc	r0, r0, lsr #4
  7c:	32353035 	eorscc	r3, r5, #53	; 0x35
  80:	72282039 	eorvc	r2, r8, #57	; 0x39
  84:	61656c65 	cmnvs	r5, r5, ror #24
  88:	20296573 	eorcs	r6, r9, r3, ror r5
  8c:	4d52415b 	ldfmie	f4, [r2, #-364]	; 0xfffffe94
  90:	626d652f 	rsbvs	r6, sp, #197132288	; 0xbc00000
  94:	65646465 	strbvs	r6, [r4, #-1125]!	; 0x465
  98:	5f342d64 	svcpl	0x00342d64
  9c:	72622d39 	rsbvc	r2, r2, #3648	; 0xe40
  a0:	68636e61 	stmdavs	r3!, {r0, r5, r6, r9, sl, fp, sp, lr}^
  a4:	76657220 	strbtvc	r7, [r5], -r0, lsr #4
  a8:	6f697369 	svcvs	0x00697369
  ac:	3232206e 	eorscc	r2, r2, #110	; 0x6e
  b0:	38383234 	ldmdacc	r8!, {r2, r4, r5, r9, ip, sp}
  b4:	6d2d205d 	stcvs	0, cr2, [sp, #-372]!	; 0xfffffe8c
  b8:	616f6c66 	cmnvs	pc, r6, ror #24
  bc:	62612d74 	rsbvs	r2, r1, #116, 26	; 0x1d00
  c0:	6f733d69 	svcvs	0x00733d69
  c4:	2d207466 	cfstrscs	mvf7, [r0, #-408]!	; 0xfffffe68
  c8:	6372616d 	cmnvs	r2, #1073741851	; 0x4000001b
  cc:	72613d68 	rsbvc	r3, r1, #104, 26	; 0x1a00
  d0:	2d37766d 	ldccs	6, cr7, [r7, #-436]!	; 0xfffffe4c
  d4:	672d2061 	strvs	r2, [sp, -r1, rrx]!
  d8:	314f2d20 	cmpcc	pc, r0, lsr #26
  dc:	66662d20 	strbtvs	r2, [r6], -r0, lsr #26
  e0:	73656572 	cmnvc	r5, #478150656	; 0x1c800000
  e4:	646e6174 	strbtvs	r6, [lr], #-372	; 0x174
  e8:	00676e69 	rsbeq	r6, r7, r9, ror #28
  ec:	746e6975 	strbtvc	r6, [lr], #-2421	; 0x975
  f0:	00745f38 	rsbseq	r5, r4, r8, lsr pc
  f4:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  f8:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  fc:	61686320 	cmnvs	r8, r0, lsr #6
 100:	656c0072 	strbvs	r0, [ip, #-114]!	; 0x72
 104:	6c635f64 	stclvs	15, cr5, [r3], #-400	; 0xfffffe70
 108:	65725f72 	ldrbvs	r5, [r2, #-3954]!	; 0xf72
 10c:	6d2f0064 	stcvs	0, cr0, [pc, #-400]!	; ffffff84 <__user_program+0xffcfff84>
 110:	682f746e 	stmdavs	pc!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}	; <UNPREDICTABLE>
 114:	2f736667 	svccs	0x00736667
 118:	2f393433 	svccs	0x00393433
 11c:	2d373166 	ldfcss	f3, [r7, #-408]!	; 0xfffffe68
 120:	3362616c 	cmncc	r2, #108, 2
 124:	7661642d 	strbtvc	r6, [r1], -sp, lsr #8
 128:	616a6469 	cmnvs	sl, r9, ror #8
 12c:	2f73656d 	svccs	0x0073656d
 130:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 134:	6f687300 	svcvs	0x00687300
 138:	75207472 	strvc	r7, [r0, #-1138]!	; 0x472
 13c:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
 140:	2064656e 	rsbcs	r6, r4, lr, ror #10
 144:	00746e69 	rsbseq	r6, r4, r9, ror #28
 148:	5f64656c 	svcpl	0x0064656c
 14c:	5f746573 	svcpl	0x00746573
 150:	65657267 	strbvs	r7, [r5, #-615]!	; 0x267
 154:	7067006e 	rsbvc	r0, r7, lr, rrx
 158:	635f6f69 	cmpvs	pc, #420	; 0x1a4
 15c:	69666e6f 	stmdbvs	r6!, {r0, r1, r2, r3, r5, r6, r9, sl, fp, sp, lr}^
 160:	68730067 	ldmdavs	r3!, {r0, r1, r2, r5, r6}^
 164:	2074726f 	rsbscs	r7, r4, pc, ror #4
 168:	00746e69 	rsbseq	r6, r4, r9, ror #28
 16c:	6f697067 	svcvs	0x00697067
 170:	7465735f 	strbtvc	r7, [r5], #-863	; 0x35f
 174:	6c75705f 	ldclvs	0, cr7, [r5], #-380	; 0xfffffe84
 178:	6975006c 	ldmdbvs	r5!, {r2, r3, r5, r6}^
 17c:	3233746e 	eorscc	r7, r3, #1845493760	; 0x6e000000
 180:	6700745f 	smlsdvs	r0, pc, r4, r7	; <UNPREDICTABLE>
 184:	006f6970 	rsbeq	r6, pc, r0, ror r9	; <UNPREDICTABLE>
 188:	6f697067 	svcvs	0x00697067
 18c:	7465675f 	strbtvc	r6, [r5], #-1887	; 0x75f
 190:	76656c5f 			; <UNDEFINED> instruction: 0x76656c5f
 194:	64006c65 	strvs	r6, [r0], #-3173	; 0xc65
 198:	79616c65 	stmdbvc	r1!, {r0, r2, r5, r6, sl, fp, sp, lr}^
 19c:	6379635f 	cmnvs	r9, #2080374785	; 0x7c000001
 1a0:	0073656c 	rsbseq	r6, r3, ip, ror #10
 1a4:	74617473 	strbtvc	r7, [r1], #-1139	; 0x473
 1a8:	666f0065 	strbtvs	r0, [pc], -r5, rrx
 1ac:	74657366 	strbtvc	r7, [r5], #-870	; 0x366
 1b0:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 1b4:	6b62696c 	blvs	189a76c <__user_program+0x159a76c>
 1b8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 1bc:	6970672f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r8, r9, sl, sp, lr}^
 1c0:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 1c4:	5f633269 	svcpl	0x00633269
 1c8:	7473616d 	ldrbtvc	r6, [r3], #-365	; 0x16d
 1cc:	695f7265 	ldmdbvs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 1d0:	0074696e 	rsbseq	r6, r4, lr, ror #18
 1d4:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
 1d8:	645f6769 	ldrbvs	r6, [pc], #-1897	; 1e0 <__start-0x7e20>
 1dc:	00617461 	rsbeq	r7, r1, r1, ror #8
 1e0:	5f636461 	svcpl	0x00636461
 1e4:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 1e8:	61657200 	cmnvs	r5, r0, lsl #4
 1ec:	61765f64 	cmnvs	r6, r4, ror #30
 1f0:	0065756c 	rsbeq	r7, r5, ip, ror #10
 1f4:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 1f8:	2f2f6c65 	svccs	0x002f6c65
 1fc:	2f637273 	svccs	0x00637273
 200:	31736461 	cmncc	r3, r1, ror #8
 204:	2e353130 	mrccs	1, 1, r3, cr5, cr0, {1}
 208:	32690063 	rsbcc	r0, r9, #99	; 0x63
 20c:	616d5f63 	cmnvs	sp, r3, ror #30
 210:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
 214:	6165725f 	cmnvs	r5, pc, asr r2
 218:	68630064 	stmdavs	r3!, {r2, r5, r6}^
 21c:	656e6e61 	strbvs	r6, [lr, #-3681]!	; 0xe61
 220:	6975006c 	ldmdbvs	r5!, {r2, r3, r5, r6}^
 224:	3631746e 	ldrtcc	r7, [r1], -lr, ror #8
 228:	6300745f 	movwvs	r7, #1119	; 0x45f
 22c:	65766e6f 	ldrbvs	r6, [r6, #-3695]!	; 0xe6f
 230:	6f697372 	svcvs	0x00697372
 234:	61645f6e 	cmnvs	r4, lr, ror #30
 238:	61006174 	tstvs	r0, r4, ror r1
 23c:	725f6364 	subsvc	r6, pc, #100, 6	; 0x90000001
 240:	00646165 	rsbeq	r6, r4, r5, ror #2
 244:	5f633269 	svcpl	0x00633269
 248:	7473616d 	ldrbtvc	r6, [r3], #-365	; 0x16d
 24c:	775f7265 	ldrbvc	r7, [pc, -r5, ror #4]
 250:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0x972
 254:	7a697300 	bvc	1a5ce5c <__user_program+0x175ce5c>
 258:	70797465 	rsbsvc	r7, r9, r5, ror #8
 25c:	64610065 	strbtvs	r0, [r1], #-101	; 0x65
 260:	6b007264 	blvs	1cbf8 <__bss_end+0xfbf8>
 264:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 268:	732f2f6c 	teqvc	pc, #108, 30	; 0x1b0
 26c:	692f6372 	stmdbvs	pc!, {r1, r4, r5, r6, r8, r9, sp, lr}	; <UNPREDICTABLE>
 270:	632e6332 	teqvs	lr, #-939524096	; 0xc8000000
 274:	72617500 	rsbvc	r7, r1, #0, 10
 278:	6e695f74 	mcrvs	15, 3, r5, cr9, cr4, {3}
 27c:	54007469 	strpl	r7, [r0], #-1129	; 0x469
 280:	745f4243 	ldrbvc	r4, [pc], #-579	; 288 <__start-0x7d78>
 284:	73797300 	cmnvc	r9, #0, 6
 288:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 28c:	7262735f 	rsbvc	r7, r2, #2080374785	; 0x7c000001
 290:	6567006b 	strbvs	r0, [r7, #-107]!	; 0x6b
 294:	6f745f74 	svcvs	0x00745f74
 298:	72705f70 	rsbsvc	r5, r0, #112, 30	; 0x1c0
 29c:	69726f69 	ldmdbvs	r2!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
 2a0:	55007974 	strpl	r7, [r0, #-2420]	; 0x974
 2a4:	73655442 	cmnvc	r5, #1107296256	; 0x42000000
 2a8:	656b0074 	strbvs	r0, [fp, #-116]!	; 0x74
 2ac:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 2b0:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
 2b4:	6e65006e 	cdpvs	0, 6, cr0, cr5, cr14, {3}
 2b8:	63726f66 	cmnvs	r2, #408	; 0x198
 2bc:	79730065 	ldmdbvc	r3!, {r0, r2, r5, r6}^
 2c0:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 2c4:	736c5f6c 	cmnvc	ip, #108, 30	; 0x1b0
 2c8:	006b6565 	rsbeq	r6, fp, r5, ror #10
 2cc:	5f717269 	svcpl	0x00717269
 2d0:	72737073 	rsbsvc	r7, r3, #115	; 0x73
 2d4:	73797300 	cmnvc	r9, #0, 6
 2d8:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 2dc:	7473665f 	ldrbtvc	r6, [r3], #-1631	; 0x65f
 2e0:	69007461 	stmdbvs	r0, {r0, r5, r6, sl, ip, sp, lr}
 2e4:	635f7172 	cmpvs	pc, #-2147483620	; 0x8000001c
 2e8:	6e61685f 	mcrvs	8, 3, r6, cr1, cr15, {2}
 2ec:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
 2f0:	6f747300 	svcvs	0x00747300
 2f4:	635f6572 	cmpvs	pc, #478150656	; 0x1c800000
 2f8:	65727275 	ldrbvs	r7, [r2, #-629]!	; 0x275
 2fc:	745f746e 	ldrbvc	r7, [pc], #-1134	; 304 <__start-0x7cfc>
 300:	006b7361 	rsbeq	r7, fp, r1, ror #6
 304:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 308:	6c635f72 	stclvs	15, cr5, [r3], #-456	; 0xfffffe38
 30c:	5f726165 	svcpl	0x00726165
 310:	646e6570 	strbtvs	r6, [lr], #-1392	; 0x570
 314:	00676e69 	rsbeq	r6, r7, r9, ror #28
 318:	65686373 	strbvs	r6, [r8, #-883]!	; 0x373
 31c:	656c7564 	strbvs	r7, [ip, #-1380]!	; 0x564
 320:	74735f72 	ldrbtvc	r5, [r3], #-3954	; 0xf72
 324:	00747261 	rsbseq	r7, r4, r1, ror #4
 328:	65726874 	ldrbvs	r6, [r2, #-2164]!	; 0x874
 32c:	635f6461 	cmpvs	pc, #1627389952	; 0x61000000
 330:	74616572 	strbtvc	r6, [r1], #-1394	; 0x572
 334:	78650065 	stmdavc	r5!, {r0, r2, r5, r6}^
 338:	74756365 	ldrbtvc	r6, [r5], #-869	; 0x365
 33c:	5f6e6f69 	svcpl	0x006e6f69
 340:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 344:	6e757200 	cdpvs	2, 7, cr7, cr5, cr0, {0}
 348:	676e696e 	strbvs	r6, [lr, -lr, ror #18]!
 34c:	646e695f 	strbtvs	r6, [lr], #-2399	; 0x95f
 350:	74007865 	strvc	r7, [r0], #-2149	; 0x865
 354:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 358:	5f73695f 	svcpl	0x0073695f
 35c:	646e6570 	strbtvs	r6, [lr], #-1392	; 0x570
 360:	00676e69 	rsbeq	r6, r7, r9, ror #28
 364:	546e7572 	strbtpl	r7, [lr], #-1394	; 0x572
 368:	00656d69 	rsbeq	r6, r5, r9, ror #26
 36c:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 370:	5f6c6c61 	svcpl	0x006c6c61
 374:	74617369 	strbtvc	r7, [r1], #-873	; 0x369
 378:	6d007974 	stcvs	9, cr7, [r0, #-464]	; 0xfffffe30
 37c:	78657475 	stmdavc	r5!, {r0, r2, r4, r5, r6, sl, ip, sp, lr}^
 380:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 384:	68740074 	ldmdavs	r4!, {r2, r4, r5, r6}^
 388:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 38c:	006e665f 	rsbeq	r6, lr, pc, asr r6
 390:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
 394:	695f656c 	ldmdbvs	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 398:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 39c:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0x572
 3a0:	69640073 	stmdbvs	r4!, {r0, r1, r4, r5, r6}^
 3a4:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
 3a8:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
 3ac:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
 3b0:	73747075 	cmnvc	r4, #117	; 0x75
 3b4:	6e757200 	cdpvs	2, 7, cr7, cr5, cr0, {0}
 3b8:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
 3bc:	56425f65 	strbpl	r5, [r2], -r5, ror #30
 3c0:	63767300 	cmnvs	r6, #0, 6
 3c4:	7370735f 	cmnvc	r0, #2080374785	; 0x7c000001
 3c8:	68740072 	ldmdavs	r4!, {r1, r4, r5, r6}^
 3cc:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 3d0:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 3d4:	756d0074 	strbvc	r0, [sp, #-116]!	; 0x74
 3d8:	5f786574 	svcpl	0x00786574
 3dc:	6b636f6c 	blvs	18dc194 <__user_program+0x15dc194>
 3e0:	74756d00 	ldrbtvc	r6, [r5], #-3328	; 0xd00
 3e4:	755f7865 	ldrbvc	r7, [pc, #-2149]	; fffffb87 <__user_program+0xffcffb87>
 3e8:	636f6c6e 	cmnvs	pc, #28160	; 0x6e00
 3ec:	6572006b 	ldrbvs	r0, [r2, #-107]!	; 0x6b
 3f0:	746c7573 	strbtvc	r7, [ip], #-1395	; 0x573
 3f4:	72687400 	rsbvc	r7, r8, #0, 8
 3f8:	5f646165 	svcpl	0x00646165
 3fc:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xf63
 400:	5f6c6f72 	svcpl	0x006c6f72
 404:	636f6c62 	cmnvs	pc, #25088	; 0x6200
 408:	6177006b 	cmnvs	r7, fp, rrx
 40c:	755f7469 	ldrbvc	r7, [pc, #-1129]	; ffffffab <__user_program+0xffcfffab>
 410:	6c69746e 	cfstrdvs	mvd7, [r9], #-440	; 0xfffffe48
 414:	78656e5f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, r9, sl, fp, sp, lr}^
 418:	65705f74 	ldrbvs	r5, [r0, #-3956]!	; 0xf74
 41c:	646f6972 	strbtvs	r6, [pc], #-2418	; 424 <__start-0x7bdc>
 420:	69777300 	ldmdbvs	r7!, {r8, r9, ip, sp, lr}^
 424:	6d756e5f 	ldclvs	14, cr6, [r5, #-380]!	; 0xfffffe84
 428:	69617700 	stmdbvs	r1!, {r8, r9, sl, ip, sp, lr}^
 42c:	676e6974 			; <UNDEFINED> instruction: 0x676e6974
 430:	0056425f 	subseq	r4, r6, pc, asr r2
 434:	5f78616d 	svcpl	0x0078616d
 438:	6f697270 	svcvs	0x00697270
 43c:	73797300 	cmnvc	r9, #0, 6
 440:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 444:	6978655f 	ldmdbvs	r8!, {r0, r1, r2, r3, r4, r6, r8, sl, sp, lr}^
 448:	72610074 	rsbvc	r0, r1, #116	; 0x74
 44c:	65007367 	strvs	r7, [r0, #-871]	; 0x367
 450:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 454:	6573755f 	ldrbvs	r7, [r3, #-1375]!	; 0x55f
 458:	6f6d5f72 	svcvs	0x006d5f72
 45c:	6e006564 	cfsh32vs	mvfx6, mvfx0, #52
 460:	5f747865 	svcpl	0x00747865
 464:	65656c73 	strbvs	r6, [r5, #-3187]!	; 0xc73
 468:	79730070 	ldmdbvc	r3!, {r4, r5, r6}^
 46c:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 470:	72775f6c 	rsbsvc	r5, r7, #108, 30	; 0x1b0
 474:	00657469 	rsbeq	r7, r5, r9, ror #8
 478:	74617473 	strbtvc	r7, [r1], #-1139	; 0x473
 47c:	6c007375 	stcvs	3, cr7, [r0], {117}	; 0x75
 480:	656b636f 	strbvs	r6, [fp, #-879]!	; 0x36f
 484:	756d0064 	strbvc	r0, [sp, #-100]!	; 0x64
 488:	5f786574 	svcpl	0x00786574
 48c:	72690074 	rsbvc	r0, r9, #116	; 0x74
 490:	726c5f71 	rsbvc	r5, ip, #452	; 0x1c4
 494:	63767300 	cmnvs	r6, #0, 6
 498:	0070735f 	rsbseq	r7, r0, pc, asr r3
 49c:	74736e69 	ldrbtvc	r6, [r3], #-3689	; 0xe69
 4a0:	5f6c6c61 	svcpl	0x006c6c61
 4a4:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xe69
 4a8:	70757272 	rsbsvc	r7, r5, r2, ror r2
 4ac:	61745f74 	cmnvs	r4, r4, ror pc
 4b0:	00656c62 	rsbeq	r6, r5, r2, ror #24
 4b4:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0x56e
 4b8:	6b61775f 	blvs	185e23c <__user_program+0x155e23c>
 4bc:	00707565 	rsbseq	r7, r0, r5, ror #10
 4c0:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0x56d
 4c4:	79745f78 	ldmdbvc	r4!, {r3, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 4c8:	73006570 	movwvc	r6, #1392	; 0x570
 4cc:	61637379 	smcvs	14137	; 0x3739
 4d0:	635f6c6c 	cmpvs	pc, #108, 24	; 0x6c00
 4d4:	65736f6c 	ldrbvs	r6, [r3, #-3948]!	; 0xf6c
 4d8:	42435400 	submi	r5, r3, #0, 8
 4dc:	6f640073 	svcvs	0x00640073
 4e0:	656c6275 	strbvs	r6, [ip, #-629]!	; 0x275
 4e4:	69777300 	ldmdbvs	r7!, {r8, r9, ip, sp, lr}^
 4e8:	685f635f 	ldmdavs	pc, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 4ec:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
 4f0:	67007265 	strvs	r7, [r0, -r5, ror #4]
 4f4:	745f7465 	ldrbvc	r7, [pc], #-1125	; 4fc <__start-0x7b04>
 4f8:	00656d69 	rsbeq	r6, r5, r9, ror #26
 4fc:	5f6d756e 	svcpl	0x006d756e
 500:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0x56d
 504:	00736578 	rsbseq	r6, r3, r8, ror r5
 508:	72657375 	rsbvc	r7, r5, #-738197503	; 0xd4000001
 50c:	0070735f 	rsbseq	r7, r0, pc, asr r3
 510:	74736572 	ldrbtvc	r6, [r3], #-1394	; 0x572
 514:	5f65726f 	svcpl	0x0065726f
 518:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0x56e
 51c:	7361745f 	cmnvc	r1, #1593835520	; 0x5f000000
 520:	6974006b 	ldmdbvs	r4!, {r0, r1, r3, r5, r6}^
 524:	5f72656d 	svcpl	0x0072656d
 528:	706f7473 	rsbvc	r7, pc, r3, ror r4	; <UNPREDICTABLE>
 52c:	69707300 	ldmdbvs	r0!, {r8, r9, ip, sp, lr}^
 530:	61775f6e 	cmnvs	r7, lr, ror #30
 534:	745f7469 	ldrbvc	r7, [pc], #-1129	; 53c <__start-0x7ac4>
 538:	00656d69 	rsbeq	r6, r5, r9, ror #26
 53c:	5f637673 	svcpl	0x00637673
 540:	7300726c 	movwvc	r7, #620	; 0x26c
 544:	5f6e6970 	svcpl	0x006e6970
 548:	74696177 	strbtvc	r6, [r9], #-375	; 0x177
 54c:	72756300 	rsbsvc	r6, r5, #0, 6
 550:	746e6572 	strbtvc	r6, [lr], #-1394	; 0x572
 554:	6972705f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, ip, sp, lr}^
 558:	7469726f 	strbtvc	r7, [r9], #-623	; 0x26f
 55c:	79730079 	ldmdbvc	r3!, {r0, r3, r4, r5, r6}^
 560:	6d657473 	cfstrdvs	mvd7, [r5, #-460]!	; 0xfffffe34
 564:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
 568:	79730065 	ldmdbvc	r3!, {r0, r2, r5, r6}^
 56c:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 570:	65725f6c 	ldrbvs	r5, [r2, #-3948]!	; 0xf6c
 574:	75006461 	strvc	r6, [r0, #-1121]	; 0x461
 578:	5f726573 	svcpl	0x00726573
 57c:	6b00726c 	blvs	1cf34 <__bss_end+0xff34>
 580:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 584:	732f2f6c 	teqvc	pc, #108, 30	; 0x1b0
 588:	6b2f6372 	blvs	bd9358 <__user_program+0x8d9358>
 58c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 590:	00632e6c 	rsbeq	r2, r3, ip, ror #28
 594:	5f706f74 	svcpl	0x00706f74
 598:	65646e69 	strbvs	r6, [r4, #-3689]!	; 0xe69
 59c:	79620078 	stmdbvc	r2!, {r3, r4, r5, r6}^
 5a0:	705f6574 	subsvc	r6, pc, r4, ror r5	; <UNPREDICTABLE>
 5a4:	75007274 	strvc	r7, [r0, #-628]	; 0x274
 5a8:	36746e69 	ldrbtcc	r6, [r4], -r9, ror #28
 5ac:	00745f34 	rsbseq	r5, r4, r4, lsr pc
 5b0:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 5b4:	6d756e74 	ldclvs	14, cr6, [r5, #-464]!	; 0xfffffe30
 5b8:	5f5f006b 	svcpl	0x005f006b
 5bc:	6c5f6176 	ldfvse	f6, [pc], {118}	; 0x76
 5c0:	00747369 	rsbseq	r7, r4, r9, ror #6
 5c4:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 5c8:	7475705f 	ldrbtvc	r7, [r5], #-95	; 0x5f
 5cc:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0x25f
 5d0:	69640065 	stmdbvs	r4!, {r0, r2, r5, r6}^
 5d4:	73746967 	cmnvc	r4, #1687552	; 0x19c000
 5d8:	65727000 	ldrbvs	r7, [r2, #-0]!
 5dc:	00786966 	rsbseq	r6, r8, r6, ror #18
 5e0:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0x162
 5e4:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 5e8:	006b746e 	rsbeq	r7, fp, lr, ror #8
 5ec:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 5f0:	2f2f6c65 	svccs	0x002f6c65
 5f4:	2f637273 	svccs	0x00637273
 5f8:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 5fc:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 600:	615f5f00 	cmpvs	pc, r0, lsl #30
 604:	72660070 	rsbvc	r0, r6, #112	; 0x70
 608:	74007165 	strvc	r7, [r0], #-357	; 0x165
 60c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 610:	6174735f 	cmnvs	r4, pc, asr r3
 614:	6b007472 	blvs	1d7e4 <__bss_end+0x107e4>
 618:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 61c:	732f2f6c 	teqvc	pc, #108, 30	; 0x1b0
 620:	742f6372 	strtvc	r6, [pc], #-882	; 628 <__start-0x79d8>
 624:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 628:	7500632e 	strvc	r6, [r0, #-814]	; 0x32e
 62c:	5f747261 	svcpl	0x00747261
 630:	5f746567 	svcpl	0x00746567
 634:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0x962
 638:	75616200 	strbvc	r6, [r1, #-512]!	; 0x200
 63c:	74617264 	strbtvc	r7, [r1], #-612	; 0x264
 640:	65725f65 	ldrbvs	r5, [r2, #-3941]!	; 0xf65
 644:	656b0067 	strbvs	r0, [fp, #-103]!	; 0x67
 648:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 64c:	72732f2f 	rsbsvc	r2, r3, #47, 30	; 0xbc
 650:	61752f63 	cmnvs	r5, r3, ror #30
 654:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 658:	72617500 	rsbvc	r7, r1, #0, 10
 65c:	6c635f74 	stclvs	15, cr5, [r3], #-464	; 0xfffffe30
 660:	0065736f 	rsbeq	r7, r5, pc, ror #6
 664:	436e7572 	cmnmi	lr, #478150656	; 0x1c800000
 668:	6e00746e 	cdpvs	4, 0, cr7, cr0, cr14, {3}
 66c:	725f6d75 	subsvc	r6, pc, #7488	; 0x1d40
 670:	00646165 	rsbeq	r6, r4, r5, ror #2
 674:	656c6966 	strbvs	r6, [ip, #-2406]!	; 0x966
 678:	77656e00 	strbvc	r6, [r5, -r0, lsl #28]!
 67c:	6168635f 	cmnvs	r8, pc, asr r3
 680:	72700072 	rsbsvc	r0, r0, #114	; 0x72
 684:	685f7665 	ldmdavs	pc, {r0, r2, r5, r6, r9, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 688:	5f706165 	svcpl	0x00706165
 68c:	00646e65 	rsbeq	r6, r4, r5, ror #28
 690:	72636e69 	rsbvc	r6, r3, #1680	; 0x690
 694:	72656b00 	rsbvc	r6, r5, #0, 22
 698:	2f6c656e 	svccs	0x006c656e
 69c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 6a0:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 6a4:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 6a8:	00632e73 	rsbeq	r2, r3, r3, ror lr
 6ac:	55757063 	ldrbpl	r7, [r5, #-99]!	; 0x63
 6b0:	006c6974 	rsbeq	r6, ip, r4, ror r9
 6b4:	6b736174 	blvs	1cd8c8c <__user_program+0x19d8c8c>
 6b8:	6972705f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, ip, sp, lr}^
 6bc:	7469726f 	strbtvc	r7, [r9], #-623	; 0x26f
 6c0:	65670079 	strbvs	r0, [r7, #-121]!	; 0x79
 6c4:	6f745f74 	svcvs	0x00745f74
 6c8:	72705f70 	rsbsvc	r5, r0, #112, 30	; 0x1c0
 6cc:	69726f69 	ldmdbvs	r2!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
 6d0:	315f7974 	cmpcc	pc, r4, ror r9	; <UNPREDICTABLE>
 6d4:	685f5f00 	ldmdavs	pc, {r8, r9, sl, fp, ip, lr}^	; <UNPREDICTABLE>
 6d8:	5f706165 	svcpl	0x00706165
 6dc:	00776f6c 	rsbseq	r6, r7, ip, ror #30
 6e0:	656c6469 	strbvs	r6, [ip, #-1129]!	; 0x469
 6e4:	006e665f 	rsbeq	r6, lr, pc, asr r6
 6e8:	65685f5f 	strbvs	r5, [r8, #-3935]!	; 0xf5f
 6ec:	745f7061 	ldrbvc	r7, [pc], #-97	; 6f4 <__start-0x790c>
 6f0:	6d00706f 	stcvs	0, cr7, [r0, #-444]	; 0xfffffe44
 6f4:	78657475 	stmdavc	r5!, {r0, r2, r4, r5, r6, sl, ip, sp, lr}^
 6f8:	6c6f685f 	stclvs	8, cr6, [pc], #-380	; 584 <__start-0x7a7c>
 6fc:	00726564 	rsbseq	r6, r2, r4, ror #10
 700:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0x56d
 704:	64690078 	strbtvs	r0, [r9], #-120	; 0x78
 708:	735f656c 	cmpvc	pc, #108, 10	; 0x1b000000
 70c:	6b636174 	blvs	18d8ce4 <__user_program+0x15d8ce4>
 710:	6174735f 	cmnvs	r4, pc, asr r3
 714:	Address 0x00000714 is out of bounds.


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
  24:	1a011803 	bne	46038 <__bss_end+0x39038>
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
 19c:	00000020 	andeq	r0, r0, r0, lsr #32
 1a0:	83080e42 	movwhi	r0, #36418	; 0x8e42
 1a4:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a8:	00000014 	andeq	r0, r0, r4, lsl r0
 1ac:	00000180 	andeq	r0, r0, r0, lsl #3
 1b0:	000084c0 	andeq	r8, r0, r0, asr #9
 1b4:	00000068 	andeq	r0, r0, r8, rrx
 1b8:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 1bc:	00018e02 	andeq	r8, r1, r2, lsl #28
 1c0:	00000014 	andeq	r0, r0, r4, lsl r0
 1c4:	00000180 	andeq	r0, r0, r0, lsl #3
 1c8:	00008528 	andeq	r8, r0, r8, lsr #10
 1cc:	000002a0 	andeq	r0, r0, r0, lsr #5
 1d0:	8e040e4c 	cdphi	14, 0, cr0, cr4, cr12, {2}
 1d4:	00000001 	andeq	r0, r0, r1
 1d8:	0000000c 	andeq	r0, r0, ip
 1dc:	00000180 	andeq	r0, r0, r0, lsl #3
 1e0:	000087c8 	andeq	r8, r0, r8, asr #15
 1e4:	000001f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 1e8:	0000000c 	andeq	r0, r0, ip
 1ec:	00000180 	andeq	r0, r0, r0, lsl #3
 1f0:	000089b8 			; <UNDEFINED> instruction: 0x000089b8
 1f4:	000000f4 	strdeq	r0, [r0], -r4
 1f8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1fc:	00000180 	andeq	r0, r0, r0, lsl #3
 200:	00008aac 	andeq	r8, r0, ip, lsr #21
 204:	00000090 	muleq	r0, r0, r0
 208:	84140e42 	ldrhi	r0, [r4], #-3650	; 0xe42
 20c:	86048505 	strhi	r8, [r4], -r5, lsl #10
 210:	8e028703 	cdphi	7, 0, cr8, cr2, cr3, {0}
 214:	00000001 	andeq	r0, r0, r1
 218:	00000014 	andeq	r0, r0, r4, lsl r0
 21c:	00000180 	andeq	r0, r0, r0, lsl #3
 220:	00008b3c 	andeq	r8, r0, ip, lsr fp
 224:	00000058 	andeq	r0, r0, r8, asr r0
 228:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000180 	andeq	r0, r0, r0, lsl #3
 238:	00008b94 	muleq	r0, r4, fp
 23c:	000001c0 	andeq	r0, r0, r0, asr #3
 240:	840c0e42 	strhi	r0, [ip], #-3650	; 0xe42
 244:	8e028503 	cfsh32hi	mvfx8, mvfx2, #3
 248:	180e4201 	stmdane	lr, {r0, r9, lr}
 24c:	0c0eda02 	stceq	10, cr13, [lr], {2}
 250:	0000000c 	andeq	r0, r0, ip
 254:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 258:	7c020001 	stcvc	0, cr0, [r2], {1}
 25c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 260:	00000028 	andeq	r0, r0, r8, lsr #32
 264:	00000250 	andeq	r0, r0, r0, asr r2
 268:	00008d54 	andeq	r8, r0, r4, asr sp
 26c:	000000e0 	andeq	r0, r0, r0, ror #1
 270:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 274:	86078508 	strhi	r8, [r7], -r8, lsl #10
 278:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 27c:	8a038904 	bhi	e2694 <__bss_end+0xd5694>
 280:	42018e02 	andmi	r8, r1, #2, 28
 284:	6a02280e 	bvs	8a2c4 <__bss_end+0x7d2c4>
 288:	0000200e 	andeq	r2, r0, lr
 28c:	00000040 	andeq	r0, r0, r0, asr #32
 290:	00000250 	andeq	r0, r0, r0, asr r2
 294:	00008e34 	andeq	r8, r0, r4, lsr lr
 298:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 29c:	80100e42 	andshi	r0, r0, r2, asr #28
 2a0:	82038104 	andhi	r8, r3, #4, 2
 2a4:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
 2a8:	0a84280e 	beq	fe10a2e8 <__user_program+0xfde0a2e8>
 2ac:	08860985 	stmeq	r6, {r0, r2, r7, r8, fp}
 2b0:	06880787 	streq	r0, [r8], r7, lsl #15
 2b4:	0e42058e 	cdpeq	5, 4, cr0, cr2, cr14, {4}
 2b8:	0ed00230 	mrceq	2, 6, r0, cr0, cr0, {1}
 2bc:	c8ce4228 	stmiagt	lr, {r3, r5, r9, lr}^
 2c0:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 2c4:	c342100e 	movtgt	r1, #8206	; 0x200e
 2c8:	0ec0c1c2 	acseqdm	f4, f2
 2cc:	00000000 	andeq	r0, r0, r0
 2d0:	0000000c 	andeq	r0, r0, ip
 2d4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2d8:	7c020001 	stcvc	0, cr0, [r2], {1}
 2dc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2e0:	0000000c 	andeq	r0, r0, ip
 2e4:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 2e8:	00008fec 	andeq	r8, r0, ip, ror #31
 2ec:	0000004c 	andeq	r0, r0, ip, asr #32
 2f0:	0000000c 	andeq	r0, r0, ip
 2f4:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 2f8:	00009038 	andeq	r9, r0, r8, lsr r0
 2fc:	00000030 	andeq	r0, r0, r0, lsr r0
 300:	0000000c 	andeq	r0, r0, ip
 304:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 308:	00009068 	andeq	r9, r0, r8, rrx
 30c:	00000014 	andeq	r0, r0, r4, lsl r0
 310:	0000000c 	andeq	r0, r0, ip
 314:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 318:	0000907c 	andeq	r9, r0, ip, ror r0
 31c:	00000018 	andeq	r0, r0, r8, lsl r0
 320:	0000000c 	andeq	r0, r0, ip
 324:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 328:	7c020001 	stcvc	0, cr0, [r2], {1}
 32c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 330:	00000014 	andeq	r0, r0, r4, lsl r0
 334:	00000320 	andeq	r0, r0, r0, lsr #6
 338:	00009094 	muleq	r0, r4, r0
 33c:	00000074 	andeq	r0, r0, r4, ror r0
 340:	83080e42 	movwhi	r0, #36418	; 0x8e42
 344:	00018e02 	andeq	r8, r1, r2, lsl #28
 348:	0000000c 	andeq	r0, r0, ip
 34c:	00000320 	andeq	r0, r0, r0, lsr #6
 350:	00009108 	andeq	r9, r0, r8, lsl #2
 354:	00000018 	andeq	r0, r0, r8, lsl r0
 358:	0000000c 	andeq	r0, r0, ip
 35c:	00000320 	andeq	r0, r0, r0, lsr #6
 360:	00009120 	andeq	r9, r0, r0, lsr #2
 364:	00000024 	andeq	r0, r0, r4, lsr #32
 368:	0000000c 	andeq	r0, r0, ip
 36c:	00000320 	andeq	r0, r0, r0, lsr #6
 370:	00009144 	andeq	r9, r0, r4, asr #2
 374:	00000028 	andeq	r0, r0, r8, lsr #32
 378:	0000000c 	andeq	r0, r0, ip
 37c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 380:	7c020001 	stcvc	0, cr0, [r2], {1}
 384:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 388:	00000014 	andeq	r0, r0, r4, lsl r0
 38c:	00000378 	andeq	r0, r0, r8, ror r3
 390:	0000916c 	andeq	r9, r0, ip, ror #2
 394:	00000020 	andeq	r0, r0, r0, lsr #32
 398:	83080e42 	movwhi	r0, #36418	; 0x8e42
 39c:	00018e02 	andeq	r8, r1, r2, lsl #28
 3a0:	00000020 	andeq	r0, r0, r0, lsr #32
 3a4:	00000378 	andeq	r0, r0, r8, ror r3
 3a8:	0000918c 	andeq	r9, r0, ip, lsl #3
 3ac:	00000048 	andeq	r0, r0, r8, asr #32
 3b0:	84100e4a 	ldrhi	r0, [r0], #-3658	; 0xe4a
 3b4:	86038504 	strhi	r8, [r3], -r4, lsl #10
 3b8:	52018e02 	andpl	r8, r1, #2, 28
 3bc:	c5c4000e 	strbgt	r0, [r4, #14]
 3c0:	0000cec6 	andeq	ip, r0, r6, asr #29
 3c4:	0000002c 	andeq	r0, r0, ip, lsr #32
 3c8:	00000378 	andeq	r0, r0, r8, ror r3
 3cc:	000091d4 	ldrdeq	r9, [r0], -r4
 3d0:	000000cc 	andeq	r0, r0, ip, asr #1
 3d4:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 3d8:	86078508 	strhi	r8, [r7], -r8, lsl #10
 3dc:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 3e0:	8a038904 	bhi	e27f8 <__bss_end+0xd57f8>
 3e4:	02018e02 	andeq	r8, r1, #2, 28
 3e8:	c4000e5c 	strgt	r0, [r0], #-3676	; 0xe5c
 3ec:	c8c7c6c5 	stmiagt	r7, {r0, r2, r6, r7, r9, sl, lr, pc}^
 3f0:	00cecac9 	sbceq	ip, lr, r9, asr #21
 3f4:	0000002c 	andeq	r0, r0, ip, lsr #32
 3f8:	00000378 	andeq	r0, r0, r8, ror r3
 3fc:	000092a0 	andeq	r9, r0, r0, lsr #5
 400:	000000cc 	andeq	r0, r0, ip, asr #1
 404:	84100e48 	ldrhi	r0, [r0], #-3656	; 0xe48
 408:	86038504 	strhi	r8, [r3], -r4, lsl #10
 40c:	02018e02 	andeq	r8, r1, #2, 28
 410:	c4000e56 	strgt	r0, [r0], #-3670	; 0xe56
 414:	44cec6c5 	strbmi	ip, [lr], #1733	; 0x6c5
 418:	0484100e 	streq	r1, [r4], #14
 41c:	02860385 	addeq	r0, r6, #335544322	; 0x14000002
 420:	0000018e 	andeq	r0, r0, lr, lsl #3
 424:	00000020 	andeq	r0, r0, r0, lsr #32
 428:	00000378 	andeq	r0, r0, r8, ror r3
 42c:	0000936c 	andeq	r9, r0, ip, ror #6
 430:	0000006c 	andeq	r0, r0, ip, rrx
 434:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xe42
 438:	86038504 	strhi	r8, [r3], -r4, lsl #10
 43c:	42018e02 	andmi	r8, r1, #2, 28
 440:	0e70180e 	cdpeq	8, 7, cr1, cr0, cr14, {0}
 444:	00000010 	andeq	r0, r0, r0, lsl r0
 448:	00000018 	andeq	r0, r0, r8, lsl r0
 44c:	00000378 	andeq	r0, r0, r8, ror r3
 450:	000093d8 	ldrdeq	r9, [r0], -r8
 454:	00000078 	andeq	r0, r0, r8, ror r0
 458:	84080e4c 	strhi	r0, [r8], #-3660	; 0xe4c
 45c:	6c018e02 	stcvs	14, cr8, [r1], {2}
 460:	cec4000e 	cdpgt	0, 12, cr0, cr4, cr14, {0}
 464:	00000014 	andeq	r0, r0, r4, lsl r0
 468:	00000378 	andeq	r0, r0, r8, ror r3
 46c:	00009450 	andeq	r9, r0, r0, asr r4
 470:	00000068 	andeq	r0, r0, r8, rrx
 474:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 478:	00018e02 	andeq	r8, r1, r2, lsl #28
 47c:	00000024 	andeq	r0, r0, r4, lsr #32
 480:	00000378 	andeq	r0, r0, r8, ror r3
 484:	000094b8 			; <UNDEFINED> instruction: 0x000094b8
 488:	00000110 	andeq	r0, r0, r0, lsl r1
 48c:	83280e42 	teqhi	r8, #1056	; 0x420
 490:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 494:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 498:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 49c:	8b038a04 	blhi	e2cb4 <__bss_end+0xd5cb4>
 4a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 4a4:	00000014 	andeq	r0, r0, r4, lsl r0
 4a8:	00000378 	andeq	r0, r0, r8, ror r3
 4ac:	000095c8 	andeq	r9, r0, r8, asr #11
 4b0:	00000048 	andeq	r0, r0, r8, asr #32
 4b4:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 4b8:	00018e02 	andeq	r8, r1, r2, lsl #28
 4bc:	0000002c 	andeq	r0, r0, ip, lsr #32
 4c0:	00000378 	andeq	r0, r0, r8, ror r3
 4c4:	00009610 	andeq	r9, r0, r0, lsl r6
 4c8:	00000394 	muleq	r0, r4, r3
 4cc:	84240e42 	strthi	r0, [r4], #-3650	; 0xe42
 4d0:	86088509 	strhi	r8, [r8], -r9, lsl #10
 4d4:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
 4d8:	8a048905 	bhi	1228f4 <__svc_stack_top+0x58f4>
 4dc:	8e028b03 	vmlahi.f64	d8, d2, d3
 4e0:	300e4201 	andcc	r4, lr, r1, lsl #4
 4e4:	0e01c403 	cdpeq	4, 0, cr12, cr1, cr3, {0}
 4e8:	00000024 	andeq	r0, r0, r4, lsr #32
 4ec:	0000000c 	andeq	r0, r0, ip
 4f0:	00000378 	andeq	r0, r0, r8, ror r3
 4f4:	000099a4 	andeq	r9, r0, r4, lsr #19
 4f8:	00000050 	andeq	r0, r0, r0, asr r0
 4fc:	0000000c 	andeq	r0, r0, ip
 500:	00000378 	andeq	r0, r0, r8, ror r3
 504:	000099f4 	strdeq	r9, [r0], -r4
 508:	00000010 	andeq	r0, r0, r0, lsl r0
 50c:	0000000c 	andeq	r0, r0, ip
 510:	00000378 	andeq	r0, r0, r8, ror r3
 514:	00009a04 	andeq	r9, r0, r4, lsl #20
 518:	00000050 	andeq	r0, r0, r0, asr r0
 51c:	0000000c 	andeq	r0, r0, ip
 520:	00000378 	andeq	r0, r0, r8, ror r3
 524:	00009a54 	andeq	r9, r0, r4, asr sl
 528:	00000058 	andeq	r0, r0, r8, asr r0
 52c:	0000000c 	andeq	r0, r0, ip
 530:	00000378 	andeq	r0, r0, r8, ror r3
 534:	00009aac 	andeq	r9, r0, ip, lsr #21
 538:	00000008 	andeq	r0, r0, r8
 53c:	0000000c 	andeq	r0, r0, ip
 540:	00000378 	andeq	r0, r0, r8, ror r3
 544:	00009ab4 			; <UNDEFINED> instruction: 0x00009ab4
 548:	00000008 	andeq	r0, r0, r8
 54c:	0000000c 	andeq	r0, r0, ip
 550:	00000378 	andeq	r0, r0, r8, ror r3
 554:	00009abc 			; <UNDEFINED> instruction: 0x00009abc
 558:	00000008 	andeq	r0, r0, r8
 55c:	0000000c 	andeq	r0, r0, ip
 560:	00000378 	andeq	r0, r0, r8, ror r3
 564:	00009ac4 	andeq	r9, r0, r4, asr #21
 568:	00000008 	andeq	r0, r0, r8
 56c:	0000000c 	andeq	r0, r0, ip
 570:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 574:	7c010001 	stcvc	0, cr0, [r1], {1}
 578:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 57c:	00000014 	andeq	r0, r0, r4, lsl r0
 580:	0000056c 	andeq	r0, r0, ip, ror #10
 584:	0000a6cc 	andeq	sl, r0, ip, asr #13
 588:	0000003c 	andeq	r0, r0, ip, lsr r0
 58c:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 590:	00000010 	andeq	r0, r0, r0, lsl r0
 594:	0000000c 	andeq	r0, r0, ip
 598:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 59c:	7c020001 	stcvc	0, cr0, [r2], {1}
 5a0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 5a4:	0000002c 	andeq	r0, r0, ip, lsr #32
 5a8:	00000594 	muleq	r0, r4, r5
 5ac:	0000a708 	andeq	sl, r0, r8, lsl #14
 5b0:	00000044 	andeq	r0, r0, r4, asr #32
 5b4:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 5b8:	86078508 	strhi	r8, [r7], -r8, lsl #10
 5bc:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 5c0:	8a038904 	bhi	e29d8 <__bss_end+0xd59d8>
 5c4:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 5c8:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 5cc:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 5d0:	0000000e 	andeq	r0, r0, lr
 5d4:	00000024 	andeq	r0, r0, r4, lsr #32
 5d8:	00000594 	muleq	r0, r4, r5
 5dc:	0000a74c 	andeq	sl, r0, ip, asr #14
 5e0:	00000040 	andeq	r0, r0, r0, asr #32
 5e4:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 5e8:	86058506 	strhi	r8, [r5], -r6, lsl #10
 5ec:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 5f0:	5c018e02 	stcpl	14, cr8, [r1], {2}
 5f4:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 5f8:	000ec4c5 	andeq	ip, lr, r5, asr #9
 5fc:	0000000c 	andeq	r0, r0, ip
 600:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 604:	7c020001 	stcvc	0, cr0, [r2], {1}
 608:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 60c:	00000034 	andeq	r0, r0, r4, lsr r0
 610:	000005fc 	strdeq	r0, [r0], -ip
 614:	0000a790 	muleq	r0, r0, r7
 618:	00000178 	andeq	r0, r0, r8, ror r1
 61c:	83280e44 	teqhi	r8, #68, 28	; 0x440
 620:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 624:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 628:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 62c:	8b038a04 	blhi	e2e44 <__bss_end+0xd5e44>
 630:	02018e02 	andeq	r8, r1, #2, 28
 634:	cbce0aa6 	blgt	ff3830d4 <__user_program+0xff0830d4>
 638:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 63c:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 640:	0b42000e 	bleq	1080680 <__user_program+0xd80680>
 644:	0000000c 	andeq	r0, r0, ip
 648:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 64c:	7c020001 	stcvc	0, cr0, [r2], {1}
 650:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 654:	0000002c 	andeq	r0, r0, ip, lsr #32
 658:	00000644 	andeq	r0, r0, r4, asr #12
 65c:	0000a908 	andeq	sl, r0, r8, lsl #18
 660:	00000120 	andeq	r0, r0, r0, lsr #2
 664:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 668:	86078508 	strhi	r8, [r7], -r8, lsl #10
 66c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 670:	8a038904 	bhi	e2a88 <__bss_end+0xd5a88>
 674:	02018e02 	andeq	r8, r1, #2, 28
 678:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 67c:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 680:	00000ec4 	andeq	r0, r0, r4, asr #29

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
 388:	00000024 	andeq	r0, r0, r4, lsr #32
 38c:	00000044 	andeq	r0, r0, r4, asr #32
 390:	9f300002 	svcls	0x00300002
 394:	00000044 	andeq	r0, r0, r4, asr #32
 398:	00000088 	andeq	r0, r0, r8, lsl #1
 39c:	00530001 	subseq	r0, r3, r1
 3a0:	00000000 	andeq	r0, r0, r0
 3a4:	24000000 	strcs	r0, [r0], #-0
 3a8:	44000000 	strmi	r0, [r0], #-0
 3ac:	03000000 	movweq	r0, #0
 3b0:	9f200800 	svcls	0x00200800
 3b4:	00000064 	andeq	r0, r0, r4, rrx
 3b8:	00000078 	andeq	r0, r0, r8, ror r0
 3bc:	00530001 	subseq	r0, r3, r1
 3c0:	00000000 	andeq	r0, r0, r0
 3c4:	24000000 	strcs	r0, [r0], #-0
 3c8:	44000000 	strmi	r0, [r0], #-0
 3cc:	03000000 	movweq	r0, #0
 3d0:	9f200800 	svcls	0x00200800
 3d4:	00000044 	andeq	r0, r0, r4, asr #32
 3d8:	00000070 	andeq	r0, r0, r0, ror r0
 3dc:	74510001 	ldrbvc	r0, [r1], #-1
 3e0:	88000000 	stmdahi	r0, {}	; <UNPREDICTABLE>
 3e4:	01000000 	mrseq	r0, (UNDEF: 0)
 3e8:	00005100 	andeq	r5, r0, r0, lsl #2
 3ec:	00000000 	andeq	r0, r0, r0
 3f0:	06100000 	ldreq	r0, [r0], -r0
 3f4:	063c0000 	ldrteq	r0, [ip], -r0
 3f8:	00020000 	andeq	r0, r2, r0
 3fc:	063c9f30 	shasxeq	r9, ip, r0
 400:	069c0000 	ldreq	r0, [ip], r0
 404:	00010000 	andeq	r0, r1, r0
 408:	00000053 	andeq	r0, r0, r3, asr r0
 40c:	00000000 	andeq	r0, r0, r0
 410:	00069c00 	andeq	r9, r6, r0, lsl #24
 414:	0006a700 	andeq	sl, r6, r0, lsl #14
 418:	50000100 	andpl	r0, r0, r0, lsl #2
 41c:	000006a7 	andeq	r0, r0, r7, lsr #13
 420:	000006f4 	strdeq	r0, [r0], -r4
 424:	00540001 	subseq	r0, r4, r1
 428:	00000000 	andeq	r0, r0, r0
 42c:	f4000000 	vst4.8	{d0-d3}, [r0], r0
 430:	07000006 	streq	r0, [r0, -r6]
 434:	01000007 	tsteq	r0, r7
 438:	07075000 	streq	r5, [r7, -r0]
 43c:	07700000 	ldrbeq	r0, [r0, -r0]!
 440:	00010000 	andeq	r0, r1, r0
 444:	00077054 	andeq	r7, r7, r4, asr r0
 448:	00077400 	andeq	r7, r7, r0, lsl #8
 44c:	f3000400 	vshl.u8	d0, d0, d0
 450:	749f5001 	ldrvc	r5, [pc], #1	; 458 <__start-0x7ba8>
 454:	88000007 	stmdahi	r0, {r0, r1, r2}
 458:	01000007 	tsteq	r0, r7
 45c:	07885400 	streq	r5, [r8, r0, lsl #8]
 460:	078c0000 	streq	r0, [ip, r0]
 464:	00040000 	andeq	r0, r4, r0
 468:	9f5001f3 	svcls	0x005001f3
 46c:	0000078c 	andeq	r0, r0, ip, lsl #15
 470:	00000798 	muleq	r0, r8, r7
 474:	98540001 	ldmdals	r4, {r0}^
 478:	9c000007 	stcls	0, cr0, [r0], {7}
 47c:	04000007 	streq	r0, [r0], #-7
 480:	5001f300 	andpl	pc, r1, r0, lsl #6
 484:	00079c9f 	muleq	r7, pc, ip	; <UNPREDICTABLE>
 488:	0007ac00 	andeq	sl, r7, r0, lsl #24
 48c:	54000100 	strpl	r0, [r0], #-256	; 0x100
 490:	000007ac 	andeq	r0, r0, ip, lsr #15
 494:	000007b0 			; <UNDEFINED> instruction: 0x000007b0
 498:	01f30004 	mvnseq	r0, r4
 49c:	07b09f50 	sbfxeq	r9, r0, #30, #17
 4a0:	07bc0000 	ldreq	r0, [ip, r0]!
 4a4:	00010000 	andeq	r0, r1, r0
 4a8:	0007bc54 	andeq	fp, r7, r4, asr ip
 4ac:	0007c000 	andeq	ip, r7, r0
 4b0:	f3000400 	vshl.u8	d0, d0, d0
 4b4:	c09f5001 	addsgt	r5, pc, r1
 4b8:	d4000007 	strle	r0, [r0], #-7
 4bc:	01000007 	tsteq	r0, r7
 4c0:	07d45400 	ldrbeq	r5, [r4, r0, lsl #8]
 4c4:	07d80000 	ldrbeq	r0, [r8, r0]
 4c8:	00040000 	andeq	r0, r4, r0
 4cc:	9f5001f3 	svcls	0x005001f3
 4d0:	000007d8 	ldrdeq	r0, [r0], -r8
 4d4:	000007ec 	andeq	r0, r0, ip, ror #15
 4d8:	ec540001 	mrrc	0, 0, r0, r4, cr1
 4dc:	f0000007 			; <UNDEFINED> instruction: 0xf0000007
 4e0:	04000007 	streq	r0, [r0], #-7
 4e4:	5001f300 	andpl	pc, r1, r0, lsl #6
 4e8:	0007f09f 	muleq	r7, pc, r0	; <UNPREDICTABLE>
 4ec:	0007fc00 	andeq	pc, r7, r0, lsl #24
 4f0:	54000100 	strpl	r0, [r0], #-256	; 0x100
 4f4:	000007fc 	strdeq	r0, [r0], -ip
 4f8:	00000800 	andeq	r0, r0, r0, lsl #16
 4fc:	01f30004 	mvnseq	r0, r4
 500:	08009f50 	stmdaeq	r0, {r4, r6, r8, r9, sl, fp, ip, pc}
 504:	08100000 	ldmdaeq	r0, {}	; <UNPREDICTABLE>
 508:	00010000 	andeq	r0, r1, r0
 50c:	00081054 	andeq	r1, r8, r4, asr r0
 510:	00081400 	andeq	r1, r8, r0, lsl #8
 514:	f3000400 	vshl.u8	d0, d0, d0
 518:	149f5001 	ldrne	r5, [pc], #1	; 520 <__start-0x7ae0>
 51c:	34000008 	strcc	r0, [r0], #-8
 520:	01000008 	tsteq	r0, r8
 524:	08345400 	ldmdaeq	r4!, {sl, ip, lr}
 528:	08380000 	ldmdaeq	r8!, {}	; <UNPREDICTABLE>
 52c:	00040000 	andeq	r0, r4, r0
 530:	9f5001f3 	svcls	0x005001f3
 534:	00000838 	andeq	r0, r0, r8, lsr r8
 538:	00000848 	andeq	r0, r0, r8, asr #16
 53c:	48540001 	ldmdami	r4, {r0}^
 540:	4c000008 	stcmi	0, cr0, [r0], {8}
 544:	04000008 	streq	r0, [r0], #-8
 548:	5001f300 	andpl	pc, r1, r0, lsl #6
 54c:	00084c9f 	muleq	r8, pc, ip	; <UNPREDICTABLE>
 550:	00085800 	andeq	r5, r8, r0, lsl #16
 554:	54000100 	strpl	r0, [r0], #-256	; 0x100
 558:	00000858 	andeq	r0, r0, r8, asr r8
 55c:	0000085c 	andeq	r0, r0, ip, asr r8
 560:	01f30004 	mvnseq	r0, r4
 564:	085c9f50 	ldmdaeq	ip, {r4, r6, r8, r9, sl, fp, ip, pc}^
 568:	08680000 	stmdaeq	r8!, {}^	; <UNPREDICTABLE>
 56c:	00010000 	andeq	r0, r1, r0
 570:	00086854 	andeq	r6, r8, r4, asr r8
 574:	00086c00 	andeq	r6, r8, r0, lsl #24
 578:	f3000400 	vshl.u8	d0, d0, d0
 57c:	6c9f5001 	ldcvs	0, cr5, [pc], {1}
 580:	74000008 	strvc	r0, [r0], #-8
 584:	01000008 	tsteq	r0, r8
 588:	08745400 	ldmdaeq	r4!, {sl, ip, lr}^
 58c:	08780000 	ldmdaeq	r8!, {}^	; <UNPREDICTABLE>
 590:	00040000 	andeq	r0, r4, r0
 594:	9f5001f3 	svcls	0x005001f3
 598:	00000878 	andeq	r0, r0, r8, ror r8
 59c:	00000880 	andeq	r0, r0, r0, lsl #17
 5a0:	80540001 	subshi	r0, r4, r1
 5a4:	84000008 	strhi	r0, [r0], #-8
 5a8:	04000008 	streq	r0, [r0], #-8
 5ac:	5001f300 	andpl	pc, r1, r0, lsl #6
 5b0:	0008849f 	muleq	r8, pc, r4	; <UNPREDICTABLE>
 5b4:	00088c00 	andeq	r8, r8, r0, lsl #24
 5b8:	54000100 	strpl	r0, [r0], #-256	; 0x100
 5bc:	0000088c 	andeq	r0, r0, ip, lsl #17
 5c0:	00000890 	muleq	r0, r0, r8
 5c4:	01f30004 	mvnseq	r0, r4
 5c8:	08909f50 	ldmeq	r0, {r4, r6, r8, r9, sl, fp, ip, pc}
 5cc:	089c0000 	ldmeq	ip, {}	; <UNPREDICTABLE>
 5d0:	00010000 	andeq	r0, r1, r0
 5d4:	00089c54 	andeq	r9, r8, r4, asr ip
 5d8:	0008a000 	andeq	sl, r8, r0
 5dc:	f3000400 	vshl.u8	d0, d0, d0
 5e0:	a09f5001 	addsge	r5, pc, r1
 5e4:	a4000008 	strge	r0, [r0], #-8
 5e8:	01000008 	tsteq	r0, r8
 5ec:	08a45400 	stmiaeq	r4!, {sl, ip, lr}
 5f0:	08b40000 	ldmeq	r4!, {}	; <UNPREDICTABLE>
 5f4:	00040000 	andeq	r0, r4, r0
 5f8:	9f5001f3 	svcls	0x005001f3
	...
 604:	000006f4 	strdeq	r0, [r0], -r4
 608:	00000707 	andeq	r0, r0, r7, lsl #14
 60c:	07510001 	ldrbeq	r0, [r1, -r1]
 610:	b4000007 	strlt	r0, [r0], #-7
 614:	01000008 	tsteq	r0, r8
 618:	00005500 	andeq	r5, r0, r0, lsl #10
 61c:	00000000 	andeq	r0, r0, r0
 620:	07080000 	streq	r0, [r8, -r0]
 624:	07700000 	ldrbeq	r0, [r0, -r0]!
 628:	00020000 	andeq	r0, r2, r0
 62c:	07709f30 			; <UNDEFINED> instruction: 0x07709f30
 630:	07740000 	ldrbeq	r0, [r4, -r0]!
 634:	00010000 	andeq	r0, r1, r0
 638:	00077450 	andeq	r7, r7, r0, asr r4
 63c:	00078800 	andeq	r8, r7, r0, lsl #16
 640:	30000200 	andcc	r0, r0, r0, lsl #4
 644:	0007889f 	muleq	r7, pc, r8	; <UNPREDICTABLE>
 648:	00078c00 	andeq	r8, r7, r0, lsl #24
 64c:	50000100 	andpl	r0, r0, r0, lsl #2
 650:	0000078c 	andeq	r0, r0, ip, lsl #15
 654:	00000798 	muleq	r0, r8, r7
 658:	9f300002 	svcls	0x00300002
 65c:	00000798 	muleq	r0, r8, r7
 660:	0000079c 	muleq	r0, ip, r7
 664:	9c500001 	mrrcls	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
 668:	ac000007 	stcge	0, cr0, [r0], {7}
 66c:	02000007 	andeq	r0, r0, #7
 670:	ac9f3000 	ldcge	0, cr3, [pc], {0}
 674:	b0000007 	andlt	r0, r0, r7
 678:	01000007 	tsteq	r0, r7
 67c:	07b05000 	ldreq	r5, [r0, r0]!
 680:	07bc0000 	ldreq	r0, [ip, r0]!
 684:	00020000 	andeq	r0, r2, r0
 688:	07bc9f30 			; <UNDEFINED> instruction: 0x07bc9f30
 68c:	07c00000 	strbeq	r0, [r0, r0]
 690:	00010000 	andeq	r0, r1, r0
 694:	0007c050 	andeq	ip, r7, r0, asr r0
 698:	0007d400 	andeq	sp, r7, r0, lsl #8
 69c:	30000200 	andcc	r0, r0, r0, lsl #4
 6a0:	0007d49f 	muleq	r7, pc, r4	; <UNPREDICTABLE>
 6a4:	0007d800 	andeq	sp, r7, r0, lsl #16
 6a8:	50000100 	andpl	r0, r0, r0, lsl #2
 6ac:	000007d8 	ldrdeq	r0, [r0], -r8
 6b0:	000007ec 	andeq	r0, r0, ip, ror #15
 6b4:	9f300002 	svcls	0x00300002
 6b8:	000007ec 	andeq	r0, r0, ip, ror #15
 6bc:	000007f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 6c0:	f0500001 			; <UNDEFINED> instruction: 0xf0500001
 6c4:	10000007 	andne	r0, r0, r7
 6c8:	02000008 	andeq	r0, r0, #8
 6cc:	109f3000 	addsne	r3, pc, r0
 6d0:	14000008 	strne	r0, [r0], #-8
 6d4:	01000008 	tsteq	r0, r8
 6d8:	08145000 	ldmdaeq	r4, {ip, lr}
 6dc:	08340000 	ldmdaeq	r4!, {}	; <UNPREDICTABLE>
 6e0:	00020000 	andeq	r0, r2, r0
 6e4:	08349f30 	ldmdaeq	r4!, {r4, r5, r8, r9, sl, fp, ip, pc}
 6e8:	08380000 	ldmdaeq	r8!, {}	; <UNPREDICTABLE>
 6ec:	00010000 	andeq	r0, r1, r0
 6f0:	00083850 	andeq	r3, r8, r0, asr r8
 6f4:	00084800 	andeq	r4, r8, r0, lsl #16
 6f8:	30000200 	andcc	r0, r0, r0, lsl #4
 6fc:	0008489f 	muleq	r8, pc, r8	; <UNPREDICTABLE>
 700:	00084c00 	andeq	r4, r8, r0, lsl #24
 704:	50000100 	andpl	r0, r0, r0, lsl #2
 708:	0000084c 	andeq	r0, r0, ip, asr #16
 70c:	00000880 	andeq	r0, r0, r0, lsl #17
 710:	9f300002 	svcls	0x00300002
 714:	00000880 	andeq	r0, r0, r0, lsl #17
 718:	00000884 	andeq	r0, r0, r4, lsl #17
 71c:	84500001 	ldrbhi	r0, [r0], #-1
 720:	8c000008 	stchi	0, cr0, [r0], {8}
 724:	02000008 	andeq	r0, r0, #8
 728:	8c9f3000 	ldchi	0, cr3, [pc], {0}
 72c:	90000008 	andls	r0, r0, r8
 730:	01000008 	tsteq	r0, r8
 734:	08905000 	ldmeq	r0, {ip, lr}
 738:	08a40000 	stmiaeq	r4!, {}	; <UNPREDICTABLE>
 73c:	00020000 	andeq	r0, r2, r0
 740:	08a49f30 	stmiaeq	r4!, {r4, r5, r8, r9, sl, fp, ip, pc}
 744:	08b40000 	ldmeq	r4!, {}	; <UNPREDICTABLE>
 748:	00010000 	andeq	r0, r1, r0
 74c:	00000054 	andeq	r0, r0, r4, asr r0
	...
 758:	00004800 	andeq	r4, r0, r0, lsl #16
 75c:	50000100 	andpl	r0, r0, r0, lsl #2
 760:	00000048 	andeq	r0, r0, r8, asr #32
 764:	000000e0 	andeq	r0, r0, r0, ror #1
 768:	01f30004 	mvnseq	r0, r4
 76c:	00009f50 	andeq	r9, r0, r0, asr pc
	...
 778:	00480000 	subeq	r0, r8, r0
 77c:	00060000 	andeq	r0, r6, r0
 780:	53049352 	movwpl	r9, #17234	; 0x4352
 784:	00480493 	umaaleq	r0, r8, r3, r4
 788:	007c0000 	rsbseq	r0, ip, r0
 78c:	00060000 	andeq	r0, r6, r0
 790:	57049356 	smlsdpl	r4, r6, r3, r9
 794:	00800493 	umulleq	r0, r0, r3, r4	; <UNPREDICTABLE>
 798:	00e00000 	rsceq	r0, r0, r0
 79c:	00060000 	andeq	r0, r6, r0
 7a0:	57049356 	smlsdpl	r4, r6, r3, r9
 7a4:	00000493 	muleq	r0, r3, r4
 7a8:	00000000 	andeq	r0, r0, r0
 7ac:	00100000 	andseq	r0, r0, r0
 7b0:	00480000 	subeq	r0, r8, r0
 7b4:	00020000 	andeq	r0, r2, r0
 7b8:	00909f30 	addseq	r9, r0, r0, lsr pc
 7bc:	009c0000 	addseq	r0, ip, r0
 7c0:	00010000 	andeq	r0, r1, r0
 7c4:	0000b058 	andeq	fp, r0, r8, asr r0
 7c8:	0000b800 	andeq	fp, r0, r0, lsl #16
 7cc:	58000100 	stmdapl	r0, {r8}
 7d0:	000000b8 	strheq	r0, [r0], -r8
 7d4:	000000c4 	andeq	r0, r0, r4, asr #1
 7d8:	7f780003 	svcvc	0x00780003
 7dc:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 7e0:	00000000 	andeq	r0, r0, r0
 7e4:	00001000 	andeq	r1, r0, r0
 7e8:	00003800 	andeq	r3, r0, r0, lsl #16
 7ec:	91000300 	mrsls	r0, LR_irq
 7f0:	00389f57 	eorseq	r9, r8, r7, asr pc
 7f4:	00640000 	rsbeq	r0, r4, r0
 7f8:	00010000 	andeq	r0, r1, r0
 7fc:	00006454 	andeq	r6, r0, r4, asr r4
 800:	00009c00 	andeq	r9, r0, r0, lsl #24
 804:	74000300 	strvc	r0, [r0], #-768	; 0x300
 808:	009c9f01 	addseq	r9, ip, r1, lsl #30
 80c:	00b00000 	adcseq	r0, r0, r0
 810:	00010000 	andeq	r0, r1, r0
 814:	0000b054 	andeq	fp, r0, r4, asr r0
 818:	0000c400 	andeq	ip, r0, r0, lsl #8
 81c:	74000300 	strvc	r0, [r0], #-768	; 0x300
 820:	00c49f01 	sbceq	r9, r4, r1, lsl #30
 824:	00c80000 	sbceq	r0, r8, r0
 828:	00010000 	andeq	r0, r1, r0
 82c:	0000c854 	andeq	ip, r0, r4, asr r8
 830:	0000cc00 	andeq	ip, r0, r0, lsl #24
 834:	74000300 	strvc	r0, [r0], #-768	; 0x300
 838:	00cc9f7f 	sbceq	r9, ip, pc, ror pc
 83c:	00e00000 	rsceq	r0, r0, r0
 840:	00010000 	andeq	r0, r1, r0
 844:	00000054 	andeq	r0, r0, r4, asr r0
 848:	00000000 	andeq	r0, r0, r0
 84c:	0000e000 	andeq	lr, r0, r0
 850:	00010800 	andeq	r0, r1, r0, lsl #16
 854:	91000200 	mrsls	r0, R8_usr
 858:	00010870 	andeq	r0, r1, r0, ror r8
 85c:	00011c00 	andeq	r1, r1, r0, lsl #24
 860:	54000100 	strpl	r0, [r0], #-256	; 0x100
 864:	0000011c 	andeq	r0, r0, ip, lsl r1
 868:	0000027c 	andeq	r0, r0, ip, ror r2
 86c:	01740003 	cmneq	r4, r3
 870:	00027c9f 	muleq	r2, pc, ip	; <UNPREDICTABLE>
 874:	00028800 	andeq	r8, r2, r0, lsl #16
 878:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
 884:	000001e8 	andeq	r0, r0, r8, ror #3
 888:	000001f4 	strdeq	r0, [r0], -r4
 88c:	00730002 	rsbseq	r0, r3, r2
 890:	000001f4 	strdeq	r0, [r0], -r4
 894:	000001f7 	strdeq	r0, [r0], -r7
 898:	00520001 	subseq	r0, r2, r1
 89c:	00000000 	andeq	r0, r0, r0
 8a0:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 8a4:	14000002 	strne	r0, [r0], #-2
 8a8:	02000002 	andeq	r0, r0, #2
 8ac:	14007300 	strne	r7, [r0], #-768	; 0x300
 8b0:	17000002 	strne	r0, [r0, -r2]
 8b4:	01000002 	tsteq	r0, r2
 8b8:	00005200 	andeq	r5, r0, r0, lsl #4
 8bc:	00000000 	andeq	r0, r0, r0
 8c0:	01840000 	orreq	r0, r4, r0
 8c4:	01bc0000 			; <UNDEFINED> instruction: 0x01bc0000
 8c8:	00010000 	andeq	r0, r1, r0
 8cc:	00000055 	andeq	r0, r0, r5, asr r0
 8d0:	00000000 	andeq	r0, r0, r0
 8d4:	0001c800 	andeq	ip, r1, r0, lsl #16
 8d8:	0001d400 	andeq	sp, r1, r0, lsl #8
 8dc:	73000200 	movwvc	r0, #512	; 0x200
 8e0:	0001d400 	andeq	sp, r1, r0, lsl #8
 8e4:	0001d700 	andeq	sp, r1, r0, lsl #14
 8e8:	52000100 	andpl	r0, r0, #0, 2
	...
 8f4:	0000022c 	andeq	r0, r0, ip, lsr #4
 8f8:	00000240 	andeq	r0, r0, r0, asr #4
 8fc:	40550001 	subsmi	r0, r5, r1
 900:	4c000002 	stcmi	0, cr0, [r0], {2}
 904:	03000002 	movweq	r0, #2
 908:	9f7f7500 	svcls	0x007f7500
	...
 914:	00000258 	andeq	r0, r0, r8, asr r2
 918:	0000025f 	andeq	r0, r0, pc, asr r2
 91c:	00730002 	rsbseq	r0, r3, r2
	...
 92c:	0000000b 	andeq	r0, r0, fp
 930:	0b500001 	bleq	140093c <__user_program+0x110093c>
 934:	20000000 	andcs	r0, r0, r0
 938:	01000000 	mrseq	r0, (UNDEF: 0)
 93c:	00005400 	andeq	r5, r0, r0, lsl #8
 940:	00000000 	andeq	r0, r0, r0
 944:	00200000 	eoreq	r0, r0, r0
 948:	00400000 	subeq	r0, r0, r0
 94c:	00010000 	andeq	r0, r1, r0
 950:	00004050 	andeq	r4, r0, r0, asr r0
 954:	00005800 	andeq	r5, r0, r0, lsl #16
 958:	f3000400 	vshl.u8	d0, d0, d0
 95c:	589f5001 	ldmpl	pc, {r0, ip, lr}	; <UNPREDICTABLE>
 960:	5c000000 	stcpl	0, cr0, [r0], {-0}
 964:	01000000 	mrseq	r0, (UNDEF: 0)
 968:	005c5000 	subseq	r5, ip, r0
 96c:	00600000 	rsbeq	r0, r0, r0
 970:	00040000 	andeq	r0, r4, r0
 974:	9f5001f3 	svcls	0x005001f3
 978:	00000060 	andeq	r0, r0, r0, rrx
 97c:	00000064 	andeq	r0, r0, r4, rrx
 980:	64500001 	ldrbvs	r0, [r0], #-1
 984:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
 988:	04000000 	streq	r0, [r0], #-0
 98c:	5001f300 	andpl	pc, r1, r0, lsl #6
 990:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 994:	00000000 	andeq	r0, r0, r0
 998:	00002000 	andeq	r2, r0, r0
 99c:	00004000 	andeq	r4, r0, r0
 9a0:	51000100 	mrspl	r0, (UNDEF: 16)
 9a4:	00000040 	andeq	r0, r0, r0, asr #32
 9a8:	00000058 	andeq	r0, r0, r8, asr r0
 9ac:	01f30004 	mvnseq	r0, r4
 9b0:	00589f51 	subseq	r9, r8, r1, asr pc
 9b4:	00680000 	rsbeq	r0, r8, r0
 9b8:	00010000 	andeq	r0, r1, r0
 9bc:	00000051 	andeq	r0, r0, r1, asr r0
 9c0:	00000000 	andeq	r0, r0, r0
 9c4:	00002000 	andeq	r2, r0, r0
 9c8:	00004000 	andeq	r4, r0, r0
 9cc:	52000100 	andpl	r0, r0, #0, 2
 9d0:	00000040 	andeq	r0, r0, r0, asr #32
 9d4:	00000058 	andeq	r0, r0, r8, asr r0
 9d8:	58560001 	ldmdapl	r6, {r0}^
 9dc:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
 9e0:	01000000 	mrseq	r0, (UNDEF: 0)
 9e4:	00005200 	andeq	r5, r0, r0, lsl #4
 9e8:	00000000 	andeq	r0, r0, r0
 9ec:	00280000 	eoreq	r0, r8, r0
 9f0:	00400000 	subeq	r0, r0, r0
 9f4:	00020000 	andeq	r0, r2, r0
 9f8:	00409f30 	subeq	r9, r0, r0, lsr pc
 9fc:	00440000 	subeq	r0, r4, r0
 a00:	00070000 	andeq	r0, r7, r0
 a04:	01f30074 	mvnseq	r0, r4, ror r0
 a08:	449f1c51 	ldrmi	r1, [pc], #3153	; a10 <__start-0x75f0>
 a0c:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
 a10:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 a14:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 a18:	22007420 	andcs	r7, r0, #32, 8	; 0x20000000
 a1c:	0000489f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 a20:	00005800 	andeq	r5, r0, r0, lsl #16
 a24:	74000700 	strvc	r0, [r0], #-1792	; 0x700
 a28:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 a2c:	00609f1c 	rsbeq	r9, r0, ip, lsl pc
 a30:	00680000 	rsbeq	r0, r8, r0
 a34:	00020000 	andeq	r0, r2, r0
 a38:	00009f30 	andeq	r9, r0, r0, lsr pc
 a3c:	00000000 	andeq	r0, r0, r0
 a40:	00680000 	rsbeq	r0, r8, r0
 a44:	008c0000 	addeq	r0, ip, r0
 a48:	00010000 	andeq	r0, r1, r0
 a4c:	00008c50 	andeq	r8, r0, r0, asr ip
 a50:	00012c00 	andeq	r2, r1, r0, lsl #24
 a54:	f3000400 	vshl.u8	d0, d0, d0
 a58:	2c9f5001 	ldccs	0, cr5, [pc], {1}
 a5c:	30000001 	andcc	r0, r0, r1
 a60:	01000001 	tsteq	r0, r1
 a64:	01305000 	teqeq	r0, r0
 a68:	01340000 	teqeq	r4, r0
 a6c:	00040000 	andeq	r0, r4, r0
 a70:	9f5001f3 	svcls	0x005001f3
	...
 a7c:	00000068 	andeq	r0, r0, r8, rrx
 a80:	0000008c 	andeq	r0, r0, ip, lsl #1
 a84:	8c510001 	mrrchi	0, 0, r0, r1, cr1
 a88:	2c000000 	stccs	0, cr0, [r0], {-0}
 a8c:	01000001 	tsteq	r0, r1
 a90:	012c5800 	teqeq	ip, r0, lsl #16
 a94:	01340000 	teqeq	r4, r0
 a98:	00010000 	andeq	r0, r1, r0
 a9c:	00000051 	andeq	r0, r0, r1, asr r0
 aa0:	00000000 	andeq	r0, r0, r0
 aa4:	00006800 	andeq	r6, r0, r0, lsl #16
 aa8:	00008c00 	andeq	r8, r0, r0, lsl #24
 aac:	52000100 	andpl	r0, r0, #0, 2
 ab0:	0000008c 	andeq	r0, r0, ip, lsl #1
 ab4:	0000012c 	andeq	r0, r0, ip, lsr #2
 ab8:	2c560001 	mrrccs	0, 0, r0, r6, cr1
 abc:	34000001 	strcc	r0, [r0], #-1
 ac0:	01000001 	tsteq	r0, r1
 ac4:	00005200 	andeq	r5, r0, r0, lsl #4
 ac8:	00000000 	andeq	r0, r0, r0
 acc:	008c0000 	addeq	r0, ip, r0
 ad0:	00e00000 	rsceq	r0, r0, r0
 ad4:	00010000 	andeq	r0, r1, r0
 ad8:	0000e055 	andeq	lr, r0, r5, asr r0
 adc:	0000f400 	andeq	pc, r0, r0, lsl #8
 ae0:	54000100 	strpl	r0, [r0], #-256	; 0x100
 ae4:	000000f4 	strdeq	r0, [r0], -r4
 ae8:	000000f8 	strdeq	r0, [r0], -r8
 aec:	f8550001 			; <UNDEFINED> instruction: 0xf8550001
 af0:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 af4:	01000001 	tsteq	r0, r1
 af8:	01085700 	tsteq	r8, r0, lsl #14
 afc:	012c0000 	teqeq	ip, r0
 b00:	00010000 	andeq	r0, r1, r0
 b04:	00000055 	andeq	r0, r0, r5, asr r0
 b08:	00000000 	andeq	r0, r0, r0
 b0c:	00008c00 	andeq	r8, r0, r0, lsl #24
 b10:	0000a800 	andeq	sl, r0, r0, lsl #16
 b14:	50000100 	andpl	r0, r0, r0, lsl #2
 b18:	000000c0 	andeq	r0, r0, r0, asr #1
 b1c:	000000d3 	ldrdeq	r0, [r0], -r3
 b20:	10500001 	subsne	r0, r0, r1
 b24:	1c000001 	stcne	0, cr0, [r0], {1}
 b28:	01000001 	tsteq	r0, r1
 b2c:	00005000 	andeq	r5, r0, r0
 b30:	00000000 	andeq	r0, r0, r0
 b34:	01340000 	teqeq	r4, r0
 b38:	01580000 	cmpeq	r8, r0
 b3c:	00010000 	andeq	r0, r1, r0
 b40:	00015850 	andeq	r5, r1, r0, asr r8
 b44:	0001f000 	andeq	pc, r1, r0
 b48:	55000100 	strpl	r0, [r0, #-256]	; 0x100
 b4c:	000001f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 b50:	000001f4 	strdeq	r0, [r0], -r4
 b54:	f4500001 			; <UNDEFINED> instruction: 0xf4500001
 b58:	f8000001 			; <UNDEFINED> instruction: 0xf8000001
 b5c:	04000001 	streq	r0, [r0], #-1
 b60:	5001f300 	andpl	pc, r1, r0, lsl #6
 b64:	0001f89f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
 b68:	00020000 	andeq	r0, r2, r0
 b6c:	55000100 	strpl	r0, [r0, #-256]	; 0x100
	...
 b78:	00000134 	andeq	r0, r0, r4, lsr r1
 b7c:	00000150 	andeq	r0, r0, r0, asr r1
 b80:	50510001 	subspl	r0, r1, r1
 b84:	f0000001 			; <UNDEFINED> instruction: 0xf0000001
 b88:	01000001 	tsteq	r0, r1
 b8c:	01f05400 	mvnseq	r5, r0, lsl #8
 b90:	01f80000 	mvnseq	r0, r0
 b94:	00010000 	andeq	r0, r1, r0
 b98:	0001f851 	andeq	pc, r1, r1, asr r8	; <UNPREDICTABLE>
 b9c:	00020000 	andeq	r0, r2, r0
 ba0:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
 bac:	00000134 	andeq	r0, r0, r4, lsr r1
 bb0:	000001e4 	andeq	r0, r0, r4, ror #3
 bb4:	e4520001 	ldrb	r0, [r2], #-1
 bb8:	f0000001 			; <UNDEFINED> instruction: 0xf0000001
 bbc:	04000001 	streq	r0, [r0], #-1
 bc0:	5201f300 	andpl	pc, r1, #0, 6
 bc4:	0001f09f 	muleq	r1, pc, r0	; <UNPREDICTABLE>
 bc8:	00020000 	andeq	r0, r2, r0
 bcc:	52000100 	andpl	r0, r0, #0, 2
	...
 bd8:	00000134 	andeq	r0, r0, r4, lsr r1
 bdc:	000001d4 	ldrdeq	r0, [r0], -r4
 be0:	d4530001 	ldrble	r0, [r3], #-1
 be4:	f0000001 			; <UNDEFINED> instruction: 0xf0000001
 be8:	04000001 	streq	r0, [r0], #-1
 bec:	5301f300 	movwpl	pc, #4864	; 0x1300	; <UNPREDICTABLE>
 bf0:	0001f09f 	muleq	r1, pc, r0	; <UNPREDICTABLE>
 bf4:	00020000 	andeq	r0, r2, r0
 bf8:	53000100 	movwpl	r0, #256	; 0x100
	...
 c04:	00000200 	andeq	r0, r0, r0, lsl #4
 c08:	00000244 	andeq	r0, r0, r4, asr #4
 c0c:	44500001 	ldrbmi	r0, [r0], #-1
 c10:	6c000002 	stcvs	0, cr0, [r0], {2}
 c14:	01000002 	tsteq	r0, r2
 c18:	00005600 	andeq	r5, r0, r0, lsl #12
 c1c:	00000000 	andeq	r0, r0, r0
 c20:	02000000 	andeq	r0, r0, #0
 c24:	02400000 	subeq	r0, r0, #0
 c28:	00010000 	andeq	r0, r1, r0
 c2c:	00024051 	andeq	r4, r2, r1, asr r0
 c30:	00026c00 	andeq	r6, r2, r0, lsl #24
 c34:	55000100 	strpl	r0, [r0, #-256]	; 0x100
	...
 c40:	0000026c 	andeq	r0, r0, ip, ror #4
 c44:	000002a0 	andeq	r0, r0, r0, lsr #5
 c48:	a0500001 	subsge	r0, r0, r1
 c4c:	ac000002 	stcge	0, cr0, [r0], {2}
 c50:	07000002 	streq	r0, [r0, -r2]
 c54:	32007c00 	andcc	r7, r0, #0, 24
 c58:	22007224 	andcs	r7, r0, #36, 4	; 0x40000002
 c5c:	000002ac 	andeq	r0, r0, ip, lsr #5
 c60:	000002dc 	ldrdeq	r0, [r0], -ip
 c64:	01f30004 	mvnseq	r0, r4
 c68:	02dc9f50 	sbcseq	r9, ip, #80, 30	; 0x140
 c6c:	02e00000 	rsceq	r0, r0, #0
 c70:	00010000 	andeq	r0, r1, r0
 c74:	0002e050 	andeq	lr, r2, r0, asr r0
 c78:	0002e400 	andeq	lr, r2, r0, lsl #8
 c7c:	f3000400 	vshl.u8	d0, d0, d0
 c80:	009f5001 	addseq	r5, pc, r1
 c84:	00000000 	andeq	r0, r0, r0
 c88:	6c000000 	stcvs	0, cr0, [r0], {-0}
 c8c:	c8000002 	stmdagt	r0, {r1}
 c90:	01000002 	tsteq	r0, r2
 c94:	02c85100 	sbceq	r5, r8, #0, 2
 c98:	02dc0000 	sbcseq	r0, ip, #0
 c9c:	00040000 	andeq	r0, r4, r0
 ca0:	9f5101f3 	svcls	0x005101f3
 ca4:	000002dc 	ldrdeq	r0, [r0], -ip
 ca8:	000002e4 	andeq	r0, r0, r4, ror #5
 cac:	00510001 	subseq	r0, r1, r1
 cb0:	00000000 	andeq	r0, r0, r0
 cb4:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
 cb8:	08000002 	stmdaeq	r0, {r1}
 cbc:	02000003 	andeq	r0, r0, #3
 cc0:	089f3000 	ldmeq	pc, {ip, sp}	; <UNPREDICTABLE>
 cc4:	4c000003 	stcmi	0, cr0, [r0], {3}
 cc8:	01000003 	tsteq	r0, r3
 ccc:	00005300 	andeq	r5, r0, r0, lsl #6
 cd0:	00000000 	andeq	r0, r0, r0
 cd4:	02e80000 	rsceq	r0, r8, #0
 cd8:	03080000 	movweq	r0, #32768	; 0x8000
 cdc:	00030000 	andeq	r0, r3, r0
 ce0:	289f2008 	ldmcs	pc, {r3, sp}	; <UNPREDICTABLE>
 ce4:	3c000003 	stccc	0, cr0, [r0], {3}
 ce8:	01000003 	tsteq	r0, r3
 cec:	00005300 	andeq	r5, r0, r0, lsl #6
 cf0:	00000000 	andeq	r0, r0, r0
 cf4:	02e80000 	rsceq	r0, r8, #0
 cf8:	03080000 	movweq	r0, #32768	; 0x8000
 cfc:	00030000 	andeq	r0, r3, r0
 d00:	089f2008 	ldmeq	pc, {r3, sp}	; <UNPREDICTABLE>
 d04:	34000003 	strcc	r0, [r0], #-3
 d08:	01000003 	tsteq	r0, r3
 d0c:	03385100 	teqeq	r8, #0, 2
 d10:	034c0000 	movteq	r0, #49152	; 0xc000
 d14:	00010000 	andeq	r0, r1, r0
 d18:	00000051 	andeq	r0, r0, r1, asr r0
 d1c:	00000000 	andeq	r0, r0, r0
 d20:	00034c00 	andeq	r4, r3, r0, lsl #24
 d24:	00035700 	andeq	r5, r3, r0, lsl #14
 d28:	50000100 	andpl	r0, r0, r0, lsl #2
 d2c:	00000357 	andeq	r0, r0, r7, asr r3
 d30:	0000045c 	andeq	r0, r0, ip, asr r4
 d34:	005a0001 	subseq	r0, sl, r1
 d38:	00000000 	andeq	r0, r0, r0
 d3c:	80000000 	andhi	r0, r0, r0
 d40:	9c000003 	stcls	0, cr0, [r0], {3}
 d44:	02000003 	andeq	r0, r0, #3
 d48:	9c9f3000 	ldcls	0, cr3, [pc], {0}
 d4c:	24000003 	strcs	r0, [r0], #-3
 d50:	01000004 	tsteq	r0, r4
 d54:	04245400 	strteq	r5, [r4], #-1024	; 0x400
 d58:	042c0000 	strteq	r0, [ip], #-0
 d5c:	00020000 	andeq	r0, r2, r0
 d60:	042c9f31 	strteq	r9, [ip], #-3889	; 0xf31
 d64:	045c0000 	ldrbeq	r0, [ip], #-0
 d68:	00010000 	andeq	r0, r1, r0
 d6c:	00000054 	andeq	r0, r0, r4, asr r0
 d70:	00000000 	andeq	r0, r0, r0
 d74:	0003bc00 	andeq	fp, r3, r0, lsl #24
 d78:	0003d000 	andeq	sp, r3, r0
 d7c:	5b000100 	blpl	1184 <__start-0x6e7c>
	...
 d88:	0000045c 	andeq	r0, r0, ip, asr r4
 d8c:	00000467 	andeq	r0, r0, r7, ror #8
 d90:	67500001 	ldrbvs	r0, [r0, -r1]
 d94:	a4000004 	strge	r0, [r0], #-4
 d98:	01000004 	tsteq	r0, r4
 d9c:	00005400 	andeq	r5, r0, r0, lsl #8
 da0:	00000000 	andeq	r0, r0, r0
 da4:	04740000 	ldrbteq	r0, [r4], #-0
 da8:	049f0000 	ldreq	r0, [pc], #0	; db0 <__start-0x7250>
 dac:	00010000 	andeq	r0, r1, r0
 db0:	00000050 	andeq	r0, r0, r0, asr r0
 db4:	00000000 	andeq	r0, r0, r0
 db8:	00073400 	andeq	r3, r7, r0, lsl #8
 dbc:	00075800 	andeq	r5, r7, r0, lsl #16
 dc0:	30000200 	andcc	r0, r0, r0, lsl #4
 dc4:	0007589f 	muleq	r7, pc, r8	; <UNPREDICTABLE>
 dc8:	00083800 	andeq	r3, r8, r0, lsl #16
 dcc:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
 dd8:	00000734 	andeq	r0, r0, r4, lsr r7
 ddc:	00000758 	andeq	r0, r0, r8, asr r7
 de0:	9f300002 	svcls	0x00300002
 de4:	00000758 	andeq	r0, r0, r8, asr r7
 de8:	000007cc 	andeq	r0, r0, ip, asr #15
 dec:	00550001 	subseq	r0, r5, r1
 df0:	00000000 	andeq	r0, r0, r0
 df4:	34000000 	strcc	r0, [r0], #-0
 df8:	58000007 	stmdapl	r0, {r0, r1, r2}
 dfc:	0a000007 	beq	e20 <__start-0x71e0>
 e00:	00089e00 	andeq	r9, r8, r0, lsl #28
 e04:	00000000 	andeq	r0, r0, r0
 e08:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
 e0c:	b0000007 	andlt	r0, r0, r7
 e10:	06000007 	streq	r0, [r0], -r7
 e14:	04935600 	ldreq	r5, [r3], #1536	; 0x600
 e18:	b4049357 	strlt	r9, [r4], #-855	; 0x357
 e1c:	38000007 	stmdacc	r0, {r0, r1, r2}
 e20:	06000008 	streq	r0, [r0], -r8
 e24:	04935600 	ldreq	r5, [r3], #1536	; 0x600
 e28:	00049357 	andeq	r9, r4, r7, asr r3
 e2c:	00000000 	andeq	r0, r0, r0
 e30:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
 e34:	1c000008 	stcne	0, cr0, [r0], {8}
 e38:	01000009 	tsteq	r0, r9
 e3c:	091c5000 	ldmdbeq	ip, {ip, lr}
 e40:	09400000 	stmdbeq	r0, {}^	; <UNPREDICTABLE>
 e44:	00040000 	andeq	r0, r4, r0
 e48:	9f5001f3 	svcls	0x005001f3
	...
 e54:	00000940 	andeq	r0, r0, r0, asr #18
 e58:	00000944 	andeq	r0, r0, r4, asr #18
 e5c:	44500001 	ldrbmi	r0, [r0], #-1
 e60:	48000009 	stmdami	r0, {r0, r3}
 e64:	04000009 	streq	r0, [r0], #-9
 e68:	5001f300 	andpl	pc, r1, r0, lsl #6
 e6c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 e70:	00000000 	andeq	r0, r0, r0
 e74:	00094800 	andeq	r4, r9, r0, lsl #16
 e78:	00094c00 	andeq	r4, r9, r0, lsl #24
 e7c:	50000100 	andpl	r0, r0, r0, lsl #2
 e80:	0000094c 	andeq	r0, r0, ip, asr #18
 e84:	00000950 	andeq	r0, r0, r0, asr r9
 e88:	01f30004 	mvnseq	r0, r4
 e8c:	00009f50 	andeq	r9, r0, r0, asr pc
 e90:	00000000 	andeq	r0, r0, r0
 e94:	09500000 	ldmdbeq	r0, {}^	; <UNPREDICTABLE>
 e98:	09540000 	ldmdbeq	r4, {}^	; <UNPREDICTABLE>
 e9c:	00010000 	andeq	r0, r1, r0
 ea0:	00095450 	andeq	r5, r9, r0, asr r4
 ea4:	00095800 	andeq	r5, r9, r0, lsl #16
 ea8:	f3000400 	vshl.u8	d0, d0, d0
 eac:	009f5001 	addseq	r5, pc, r1
 eb0:	00000000 	andeq	r0, r0, r0
 eb4:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
 eb8:	5c000009 	stcpl	0, cr0, [r0], {9}
 ebc:	01000009 	tsteq	r0, r9
 ec0:	095c5000 	ldmdbeq	ip, {ip, lr}^
 ec4:	09600000 	stmdbeq	r0!, {}^	; <UNPREDICTABLE>
 ec8:	00040000 	andeq	r0, r4, r0
 ecc:	9f5001f3 	svcls	0x005001f3
	...

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
  30:	0000038c 	andeq	r0, r0, ip, lsl #7
  34:	0000039c 	muleq	r0, ip, r3
  38:	000003b8 			; <UNDEFINED> instruction: 0x000003b8
  3c:	00000424 	andeq	r0, r0, r4, lsr #8
	...
