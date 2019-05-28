
oled_screen_test/kernel.elf:     file format elf32-littlearm


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
    8038:	eb00006a 	bl	81e8 <kernel_main>

0000803c <hang>:
    803c:	e320f003 	wfi
    8040:	eafffffd 	b	803c <hang>
    8044:	0012d000 	andseq	sp, r2, r0
    8048:	0011c000 	andseq	ip, r1, r0
    804c:	0000b000 	andeq	fp, r0, r0
    8050:	0000c000 	andeq	ip, r0, r0

00008054 <gpio_config>:
    8054:	e3510007 	cmp	r1, #7
    8058:	93500035 	cmpls	r0, #53	; 0x35
    805c:	812fff1e 	bxhi	lr
    8060:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    8064:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    8068:	e0832290 	umull	r2, r3, r0, r2
    806c:	e1a0c1a3 	lsr	ip, r3, #3
    8070:	e6ef307c 	uxtb	r3, ip
    8074:	e1a03103 	lsl	r3, r3, #2
    8078:	e283343f 	add	r3, r3, #1056964608	; 0x3f000000
    807c:	e2833602 	add	r3, r3, #2097152	; 0x200000
    8080:	e5932000 	ldr	r2, [r3]
    8084:	e08cc10c 	add	ip, ip, ip, lsl #2
    8088:	e040008c 	sub	r0, r0, ip, lsl #1
    808c:	e6ef0070 	uxtb	r0, r0
    8090:	e0800080 	add	r0, r0, r0, lsl #1
    8094:	e3a0c007 	mov	ip, #7
    8098:	e1c2201c 	bic	r2, r2, ip, lsl r0
    809c:	e1820011 	orr	r0, r2, r1, lsl r0
    80a0:	e5830000 	str	r0, [r3]
    80a4:	e12fff1e 	bx	lr

000080a8 <gpio_set>:
    80a8:	e3500035 	cmp	r0, #53	; 0x35
    80ac:	812fff1e 	bxhi	lr
    80b0:	e350001f 	cmp	r0, #31
    80b4:	9a000006 	bls	80d4 <gpio_set+0x2c>
    80b8:	e2400020 	sub	r0, r0, #32
    80bc:	e3a03001 	mov	r3, #1
    80c0:	e1a00013 	lsl	r0, r3, r0
    80c4:	e3a03000 	mov	r3, #0
    80c8:	e3433f20 	movt	r3, #16160	; 0x3f20
    80cc:	e5830020 	str	r0, [r3, #32]
    80d0:	e12fff1e 	bx	lr
    80d4:	e3a03001 	mov	r3, #1
    80d8:	e1a00013 	lsl	r0, r3, r0
    80dc:	e3a03000 	mov	r3, #0
    80e0:	e3433f20 	movt	r3, #16160	; 0x3f20
    80e4:	e583001c 	str	r0, [r3, #28]
    80e8:	e12fff1e 	bx	lr

000080ec <gpio_clr>:
    80ec:	e3500035 	cmp	r0, #53	; 0x35
    80f0:	812fff1e 	bxhi	lr
    80f4:	e350001f 	cmp	r0, #31
    80f8:	9a000006 	bls	8118 <gpio_clr+0x2c>
    80fc:	e2400020 	sub	r0, r0, #32
    8100:	e3a03001 	mov	r3, #1
    8104:	e1a00013 	lsl	r0, r3, r0
    8108:	e3a03000 	mov	r3, #0
    810c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8110:	e583002c 	str	r0, [r3, #44]	; 0x2c
    8114:	e12fff1e 	bx	lr
    8118:	e3a03001 	mov	r3, #1
    811c:	e1a00013 	lsl	r0, r3, r0
    8120:	e3a03000 	mov	r3, #0
    8124:	e3433f20 	movt	r3, #16160	; 0x3f20
    8128:	e5830028 	str	r0, [r3, #40]	; 0x28
    812c:	e12fff1e 	bx	lr

00008130 <gpio_set_pull>:
    8130:	e3510002 	cmp	r1, #2
    8134:	93500035 	cmpls	r0, #53	; 0x35
    8138:	812fff1e 	bxhi	lr
    813c:	e92d4038 	push	{r3, r4, r5, lr}
    8140:	e1a04000 	mov	r4, r0
    8144:	e3a03000 	mov	r3, #0
    8148:	e3433f20 	movt	r3, #16160	; 0x3f20
    814c:	e5831094 	str	r1, [r3, #148]	; 0x94
    8150:	e3a00096 	mov	r0, #150	; 0x96
    8154:	eb00024a 	bl	8a84 <delay_cycles>
    8158:	e354001f 	cmp	r4, #31
    815c:	9a00000a 	bls	818c <gpio_set_pull+0x5c>
    8160:	e2440020 	sub	r0, r4, #32
    8164:	e3a04001 	mov	r4, #1
    8168:	e1a00014 	lsl	r0, r4, r0
    816c:	e3a05000 	mov	r5, #0
    8170:	e3435f20 	movt	r5, #16160	; 0x3f20
    8174:	e585009c 	str	r0, [r5, #156]	; 0x9c
    8178:	e3a00096 	mov	r0, #150	; 0x96
    817c:	eb000240 	bl	8a84 <delay_cycles>
    8180:	e3a03000 	mov	r3, #0
    8184:	e585309c 	str	r3, [r5, #156]	; 0x9c
    8188:	e8bd8038 	pop	{r3, r4, r5, pc}
    818c:	e3a00001 	mov	r0, #1
    8190:	e1a00410 	lsl	r0, r0, r4
    8194:	e3a05000 	mov	r5, #0
    8198:	e3435f20 	movt	r5, #16160	; 0x3f20
    819c:	e5850098 	str	r0, [r5, #152]	; 0x98
    81a0:	e3a00096 	mov	r0, #150	; 0x96
    81a4:	eb000236 	bl	8a84 <delay_cycles>
    81a8:	e3a03000 	mov	r3, #0
    81ac:	e5853098 	str	r3, [r5, #152]	; 0x98
    81b0:	e8bd8038 	pop	{r3, r4, r5, pc}

000081b4 <gpio_get_level>:
    81b4:	e3500035 	cmp	r0, #53	; 0x35
    81b8:	8a000008 	bhi	81e0 <gpio_get_level+0x2c>
    81bc:	e350001f 	cmp	r0, #31
    81c0:	e3a03000 	mov	r3, #0
    81c4:	e3433f20 	movt	r3, #16160	; 0x3f20
    81c8:	85933038 	ldrhi	r3, [r3, #56]	; 0x38
    81cc:	82400020 	subhi	r0, r0, #32
    81d0:	95933034 	ldrls	r3, [r3, #52]	; 0x34
    81d4:	e1a00033 	lsr	r0, r3, r0
    81d8:	e2000001 	and	r0, r0, #1
    81dc:	e12fff1e 	bx	lr
    81e0:	e3a000ff 	mov	r0, #255	; 0xff
    81e4:	e12fff1e 	bx	lr

000081e8 <kernel_main>:
    81e8:	e92d43f8 	push	{r3, r4, r5, r6, r7, r8, r9, lr}
    81ec:	eb00019a 	bl	885c <oled_init>
    81f0:	eb000166 	bl	8790 <oled_buf_clr>
    81f4:	e3a04000 	mov	r4, #0
    81f8:	e1a05004 	mov	r5, r4
    81fc:	e1a08004 	mov	r8, r4
    8200:	e1a09004 	mov	r9, r4
    8204:	ea000001 	b	8210 <kernel_main+0x28>
    8208:	e1a04008 	mov	r4, r8
    820c:	e1a05006 	mov	r5, r6
    8210:	e355001f 	cmp	r5, #31
    8214:	c1a04008 	movgt	r4, r8
    8218:	c1a05009 	movgt	r5, r9
    821c:	e1a07004 	mov	r7, r4
    8220:	e1a00005 	mov	r0, r5
    8224:	e1a01004 	mov	r1, r4
    8228:	eb000136 	bl	8708 <oled_buf_pixel_set>
    822c:	e2844001 	add	r4, r4, #1
    8230:	e1a00005 	mov	r0, r5
    8234:	e1a01004 	mov	r1, r4
    8238:	eb000132 	bl	8708 <oled_buf_pixel_set>
    823c:	e2856001 	add	r6, r5, #1
    8240:	e1a00006 	mov	r0, r6
    8244:	e1a01007 	mov	r1, r7
    8248:	eb00012e 	bl	8708 <oled_buf_pixel_set>
    824c:	e1a00006 	mov	r0, r6
    8250:	e1a01004 	mov	r1, r4
    8254:	eb00012b 	bl	8708 <oled_buf_pixel_set>
    8258:	eb0001d1 	bl	89a4 <oled_buf_draw>
    825c:	e1a00005 	mov	r0, r5
    8260:	e1a01007 	mov	r1, r7
    8264:	eb000138 	bl	874c <oled_buf_pixel_clr>
    8268:	e1a00005 	mov	r0, r5
    826c:	e1a01004 	mov	r1, r4
    8270:	eb000135 	bl	874c <oled_buf_pixel_clr>
    8274:	e1a00006 	mov	r0, r6
    8278:	e1a01007 	mov	r1, r7
    827c:	eb000132 	bl	874c <oled_buf_pixel_clr>
    8280:	e1a00006 	mov	r0, r6
    8284:	e1a01004 	mov	r1, r4
    8288:	eb00012f 	bl	874c <oled_buf_pixel_clr>
    828c:	e354007f 	cmp	r4, #127	; 0x7f
    8290:	d1a06005 	movle	r6, r5
    8294:	daffffdc 	ble	820c <kernel_main+0x24>
    8298:	eaffffda 	b	8208 <kernel_main+0x20>

0000829c <printnumk>:
    829c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    82a0:	e24dd008 	sub	sp, sp, #8
    82a4:	e1a06002 	mov	r6, r2
    82a8:	e1a07003 	mov	r7, r3
    82ac:	e3500008 	cmp	r0, #8
    82b0:	0a000004 	beq	82c8 <printnumk+0x2c>
    82b4:	e3098018 	movw	r8, #36888	; 0x9018
    82b8:	e3408000 	movt	r8, #0
    82bc:	e3500010 	cmp	r0, #16
    82c0:	13a08000 	movne	r8, #0
    82c4:	ea000001 	b	82d0 <printnumk+0x34>
    82c8:	e3098014 	movw	r8, #36884	; 0x9014
    82cc:	e3408000 	movt	r8, #0
    82d0:	e28d4007 	add	r4, sp, #7
    82d4:	e1a05000 	mov	r5, r0
    82d8:	e3a09000 	mov	r9, #0
    82dc:	e309a000 	movw	sl, #36864	; 0x9000
    82e0:	e340a000 	movt	sl, #0
    82e4:	e1a00006 	mov	r0, r6
    82e8:	e1a01007 	mov	r1, r7
    82ec:	e1a02005 	mov	r2, r5
    82f0:	e1a03009 	mov	r3, r9
    82f4:	eb0001f3 	bl	8ac8 <__aeabi_uldivmod>
    82f8:	e7da3002 	ldrb	r3, [sl, r2]
    82fc:	e4443001 	strb	r3, [r4], #-1
    8300:	e1a00006 	mov	r0, r6
    8304:	e1a01007 	mov	r1, r7
    8308:	e1a02005 	mov	r2, r5
    830c:	e1a03009 	mov	r3, r9
    8310:	eb0001ec 	bl	8ac8 <__aeabi_uldivmod>
    8314:	e1a06000 	mov	r6, r0
    8318:	e1a07001 	mov	r7, r1
    831c:	e1963007 	orrs	r3, r6, r7
    8320:	1affffef 	bne	82e4 <printnumk+0x48>
    8324:	e3580000 	cmp	r8, #0
    8328:	0a000002 	beq	8338 <printnumk+0x9c>
    832c:	e5d80000 	ldrb	r0, [r8]
    8330:	e3500000 	cmp	r0, #0
    8334:	1a000004 	bne	834c <printnumk+0xb0>
    8338:	e2844001 	add	r4, r4, #1
    833c:	e28d3008 	add	r3, sp, #8
    8340:	e1540003 	cmp	r4, r3
    8344:	1a000005 	bne	8360 <printnumk+0xc4>
    8348:	ea000009 	b	8374 <printnumk+0xd8>
    834c:	eb00007a 	bl	853c <uart_put_byte>
    8350:	e5f80001 	ldrb	r0, [r8, #1]!
    8354:	e3500000 	cmp	r0, #0
    8358:	1afffffb 	bne	834c <printnumk+0xb0>
    835c:	eafffff5 	b	8338 <printnumk+0x9c>
    8360:	e4d40001 	ldrb	r0, [r4], #1
    8364:	eb000074 	bl	853c <uart_put_byte>
    8368:	e28d3008 	add	r3, sp, #8
    836c:	e1540003 	cmp	r4, r3
    8370:	1afffffa 	bne	8360 <printnumk+0xc4>
    8374:	e28dd008 	add	sp, sp, #8
    8378:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}

0000837c <printk>:
    837c:	e92d000f 	push	{r0, r1, r2, r3}
    8380:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8384:	e24dd008 	sub	sp, sp, #8
    8388:	e59d4020 	ldr	r4, [sp, #32]
    838c:	e28d3024 	add	r3, sp, #36	; 0x24
    8390:	e58d3004 	str	r3, [sp, #4]
    8394:	e3a06000 	mov	r6, #0
    8398:	e3a08008 	mov	r8, #8
    839c:	e3a07010 	mov	r7, #16
    83a0:	ea00005c 	b	8518 <printk+0x19c>
    83a4:	e3500025 	cmp	r0, #37	; 0x25
    83a8:	0a000002 	beq	83b8 <printk+0x3c>
    83ac:	e2844001 	add	r4, r4, #1
    83b0:	eb000061 	bl	853c <uart_put_byte>
    83b4:	ea000057 	b	8518 <printk+0x19c>
    83b8:	e5d43001 	ldrb	r3, [r4, #1]
    83bc:	e353006f 	cmp	r3, #111	; 0x6f
    83c0:	0a00002c 	beq	8478 <printk+0xfc>
    83c4:	8a000006 	bhi	83e4 <printk+0x68>
    83c8:	e3530063 	cmp	r3, #99	; 0x63
    83cc:	0a000045 	beq	84e8 <printk+0x16c>
    83d0:	e3530064 	cmp	r3, #100	; 0x64
    83d4:	0a00000d 	beq	8410 <printk+0x94>
    83d8:	e3530025 	cmp	r3, #37	; 0x25
    83dc:	1a00004a 	bne	850c <printk+0x190>
    83e0:	ea000046 	b	8500 <printk+0x184>
    83e4:	e3530073 	cmp	r3, #115	; 0x73
    83e8:	0a000032 	beq	84b8 <printk+0x13c>
    83ec:	8a000002 	bhi	83fc <printk+0x80>
    83f0:	e3530070 	cmp	r3, #112	; 0x70
    83f4:	0a000027 	beq	8498 <printk+0x11c>
    83f8:	ea000043 	b	850c <printk+0x190>
    83fc:	e3530075 	cmp	r3, #117	; 0x75
    8400:	0a000014 	beq	8458 <printk+0xdc>
    8404:	e3530078 	cmp	r3, #120	; 0x78
    8408:	0a000022 	beq	8498 <printk+0x11c>
    840c:	ea00003e 	b	850c <printk+0x190>
    8410:	e59d3004 	ldr	r3, [sp, #4]
    8414:	e2832004 	add	r2, r3, #4
    8418:	e58d2004 	str	r2, [sp, #4]
    841c:	e5935000 	ldr	r5, [r3]
    8420:	e3550000 	cmp	r5, #0
    8424:	aa000006 	bge	8444 <printk+0xc8>
    8428:	e3a0002d 	mov	r0, #45	; 0x2d
    842c:	eb000042 	bl	853c <uart_put_byte>
    8430:	e2652000 	rsb	r2, r5, #0
    8434:	e3a0000a 	mov	r0, #10
    8438:	e1a03fc2 	asr	r3, r2, #31
    843c:	ebffff96 	bl	829c <printnumk>
    8440:	ea000033 	b	8514 <printk+0x198>
    8444:	e3a0000a 	mov	r0, #10
    8448:	e1a02005 	mov	r2, r5
    844c:	e1a03fc5 	asr	r3, r5, #31
    8450:	ebffff91 	bl	829c <printnumk>
    8454:	ea00002e 	b	8514 <printk+0x198>
    8458:	e59d3004 	ldr	r3, [sp, #4]
    845c:	e2832004 	add	r2, r3, #4
    8460:	e58d2004 	str	r2, [sp, #4]
    8464:	e3a0000a 	mov	r0, #10
    8468:	e5932000 	ldr	r2, [r3]
    846c:	e1a03006 	mov	r3, r6
    8470:	ebffff89 	bl	829c <printnumk>
    8474:	ea000026 	b	8514 <printk+0x198>
    8478:	e59d3004 	ldr	r3, [sp, #4]
    847c:	e2832004 	add	r2, r3, #4
    8480:	e58d2004 	str	r2, [sp, #4]
    8484:	e1a00008 	mov	r0, r8
    8488:	e5932000 	ldr	r2, [r3]
    848c:	e1a03006 	mov	r3, r6
    8490:	ebffff81 	bl	829c <printnumk>
    8494:	ea00001e 	b	8514 <printk+0x198>
    8498:	e59d3004 	ldr	r3, [sp, #4]
    849c:	e2832004 	add	r2, r3, #4
    84a0:	e58d2004 	str	r2, [sp, #4]
    84a4:	e1a00007 	mov	r0, r7
    84a8:	e5932000 	ldr	r2, [r3]
    84ac:	e1a03006 	mov	r3, r6
    84b0:	ebffff79 	bl	829c <printnumk>
    84b4:	ea000016 	b	8514 <printk+0x198>
    84b8:	e59d3004 	ldr	r3, [sp, #4]
    84bc:	e2832004 	add	r2, r3, #4
    84c0:	e58d2004 	str	r2, [sp, #4]
    84c4:	e5935000 	ldr	r5, [r3]
    84c8:	e5d50000 	ldrb	r0, [r5]
    84cc:	e3500000 	cmp	r0, #0
    84d0:	0a00000f 	beq	8514 <printk+0x198>
    84d4:	eb000018 	bl	853c <uart_put_byte>
    84d8:	e5f50001 	ldrb	r0, [r5, #1]!
    84dc:	e3500000 	cmp	r0, #0
    84e0:	1afffffb 	bne	84d4 <printk+0x158>
    84e4:	ea00000a 	b	8514 <printk+0x198>
    84e8:	e59d3004 	ldr	r3, [sp, #4]
    84ec:	e2832004 	add	r2, r3, #4
    84f0:	e58d2004 	str	r2, [sp, #4]
    84f4:	e5d30000 	ldrb	r0, [r3]
    84f8:	eb00000f 	bl	853c <uart_put_byte>
    84fc:	ea000004 	b	8514 <printk+0x198>
    8500:	e3a00025 	mov	r0, #37	; 0x25
    8504:	eb00000c 	bl	853c <uart_put_byte>
    8508:	ea000001 	b	8514 <printk+0x198>
    850c:	e3e00000 	mvn	r0, #0
    8510:	ea000003 	b	8524 <printk+0x1a8>
    8514:	e2844002 	add	r4, r4, #2
    8518:	e5d40000 	ldrb	r0, [r4]
    851c:	e3500000 	cmp	r0, #0
    8520:	1affff9f 	bne	83a4 <printk+0x28>
    8524:	e28dd008 	add	sp, sp, #8
    8528:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    852c:	e28dd010 	add	sp, sp, #16
    8530:	e12fff1e 	bx	lr

00008534 <uart_init>:
    8534:	e12fff1e 	bx	lr

00008538 <uart_close>:
    8538:	e12fff1e 	bx	lr

0000853c <uart_put_byte>:
    853c:	e12fff1e 	bx	lr

00008540 <uart_get_byte>:
    8540:	e3a00000 	mov	r0, #0
    8544:	e12fff1e 	bx	lr

00008548 <i2c_master_init>:
    8548:	e12fff1e 	bx	lr

0000854c <i2c_master_write>:
    854c:	e3a00000 	mov	r0, #0
    8550:	e12fff1e 	bx	lr

00008554 <i2c_master_read>:
    8554:	e3a00000 	mov	r0, #0
    8558:	e12fff1e 	bx	lr

0000855c <adc_init>:
    855c:	e12fff1e 	bx	lr

00008560 <adc_read>:
    8560:	e3a00000 	mov	r0, #0
    8564:	e12fff1e 	bx	lr

00008568 <wait>:
    8568:	e2403001 	sub	r3, r0, #1
    856c:	e3500000 	cmp	r0, #0
    8570:	012fff1e 	bxeq	lr
    8574:	e1a00000 	nop			; (mov r0, r0)
    8578:	e2433001 	sub	r3, r3, #1
    857c:	e3730001 	cmn	r3, #1
    8580:	1afffffb 	bne	8574 <wait+0xc>
    8584:	e12fff1e 	bx	lr

00008588 <spi_master_init>:
    8588:	e92d4010 	push	{r4, lr}
    858c:	e1a04001 	mov	r4, r1
    8590:	e3a00007 	mov	r0, #7
    8594:	e3a01004 	mov	r1, #4
    8598:	ebfffead 	bl	8054 <gpio_config>
    859c:	e3a00008 	mov	r0, #8
    85a0:	e3a01004 	mov	r1, #4
    85a4:	ebfffeaa 	bl	8054 <gpio_config>
    85a8:	e3a0000a 	mov	r0, #10
    85ac:	e3a01004 	mov	r1, #4
    85b0:	ebfffea7 	bl	8054 <gpio_config>
    85b4:	e3a0000b 	mov	r0, #11
    85b8:	e3a01004 	mov	r1, #4
    85bc:	ebfffea4 	bl	8054 <gpio_config>
    85c0:	e3a03901 	mov	r3, #16384	; 0x4000
    85c4:	e3433f20 	movt	r3, #16160	; 0x3f20
    85c8:	e3a02000 	mov	r2, #0
    85cc:	e5832000 	str	r2, [r3]
    85d0:	e5932000 	ldr	r2, [r3]
    85d4:	e3822030 	orr	r2, r2, #48	; 0x30
    85d8:	e5832000 	str	r2, [r3]
    85dc:	e5932000 	ldr	r2, [r3]
    85e0:	e3c2200f 	bic	r2, r2, #15
    85e4:	e3822040 	orr	r2, r2, #64	; 0x40
    85e8:	e5832000 	str	r2, [r3]
    85ec:	e5834008 	str	r4, [r3, #8]
    85f0:	e3020710 	movw	r0, #10000	; 0x2710
    85f4:	ebffffdb 	bl	8568 <wait>
    85f8:	e8bd8010 	pop	{r4, pc}

000085fc <spi_begin>:
    85fc:	e3a03901 	mov	r3, #16384	; 0x4000
    8600:	e3433f20 	movt	r3, #16160	; 0x3f20
    8604:	e3a02000 	mov	r2, #0
    8608:	e5832000 	str	r2, [r3]
    860c:	e5932000 	ldr	r2, [r3]
    8610:	e3822030 	orr	r2, r2, #48	; 0x30
    8614:	e5832000 	str	r2, [r3]
    8618:	e5932000 	ldr	r2, [r3]
    861c:	e3c2200f 	bic	r2, r2, #15
    8620:	e3822040 	orr	r2, r2, #64	; 0x40
    8624:	e5832000 	str	r2, [r3]
    8628:	e5831008 	str	r1, [r3, #8]
    862c:	e12fff1e 	bx	lr

00008630 <spi_end>:
    8630:	e3a03901 	mov	r3, #16384	; 0x4000
    8634:	e3433f20 	movt	r3, #16160	; 0x3f20
    8638:	e5932000 	ldr	r2, [r3]
    863c:	e3c22080 	bic	r2, r2, #128	; 0x80
    8640:	e5832000 	str	r2, [r3]
    8644:	e12fff1e 	bx	lr

00008648 <spi_transfer>:
    8648:	e92d4070 	push	{r4, r5, r6, lr}
    864c:	e1a06000 	mov	r6, r0
    8650:	e3a03901 	mov	r3, #16384	; 0x4000
    8654:	e3433f20 	movt	r3, #16160	; 0x3f20
    8658:	e5932000 	ldr	r2, [r3]
    865c:	e38220b0 	orr	r2, r2, #176	; 0xb0
    8660:	e5832000 	str	r2, [r3]
    8664:	e5933000 	ldr	r3, [r3]
    8668:	e3130701 	tst	r3, #262144	; 0x40000
    866c:	1a000007 	bne	8690 <spi_transfer+0x48>
    8670:	e3a05001 	mov	r5, #1
    8674:	e3a04901 	mov	r4, #16384	; 0x4000
    8678:	e3434f20 	movt	r4, #16160	; 0x3f20
    867c:	e1a00005 	mov	r0, r5
    8680:	ebffffb8 	bl	8568 <wait>
    8684:	e5943000 	ldr	r3, [r4]
    8688:	e3130701 	tst	r3, #262144	; 0x40000
    868c:	0afffffa 	beq	867c <spi_transfer+0x34>
    8690:	e3a03901 	mov	r3, #16384	; 0x4000
    8694:	e3433f20 	movt	r3, #16160	; 0x3f20
    8698:	e5836004 	str	r6, [r3, #4]
    869c:	e5933000 	ldr	r3, [r3]
    86a0:	e3130801 	tst	r3, #65536	; 0x10000
    86a4:	1a000007 	bne	86c8 <spi_transfer+0x80>
    86a8:	e3a05001 	mov	r5, #1
    86ac:	e3a04901 	mov	r4, #16384	; 0x4000
    86b0:	e3434f20 	movt	r4, #16160	; 0x3f20
    86b4:	e1a00005 	mov	r0, r5
    86b8:	ebffffaa 	bl	8568 <wait>
    86bc:	e5943000 	ldr	r3, [r4]
    86c0:	e3130801 	tst	r3, #65536	; 0x10000
    86c4:	0afffffa 	beq	86b4 <spi_transfer+0x6c>
    86c8:	e3a03901 	mov	r3, #16384	; 0x4000
    86cc:	e3433f20 	movt	r3, #16160	; 0x3f20
    86d0:	e5930004 	ldr	r0, [r3, #4]
    86d4:	e5932000 	ldr	r2, [r3]
    86d8:	e3c22080 	bic	r2, r2, #128	; 0x80
    86dc:	e5832000 	str	r2, [r3]
    86e0:	e6ef0070 	uxtb	r0, r0
    86e4:	e8bd8070 	pop	{r4, r5, r6, pc}

000086e8 <delay>:
    86e8:	e2403001 	sub	r3, r0, #1
    86ec:	e3500000 	cmp	r0, #0
    86f0:	012fff1e 	bxeq	lr
    86f4:	e1a00000 	nop			; (mov r0, r0)
    86f8:	e2433001 	sub	r3, r3, #1
    86fc:	e3730001 	cmn	r3, #1
    8700:	1afffffb 	bne	86f4 <delay+0xc>
    8704:	e12fff1e 	bx	lr

00008708 <oled_buf_pixel_set>:
    8708:	e350001f 	cmp	r0, #31
    870c:	9351007f 	cmpls	r1, #127	; 0x7f
    8710:	8a00000b 	bhi	8744 <oled_buf_pixel_set+0x3c>
    8714:	e260001f 	rsb	r0, r0, #31
    8718:	e261107f 	rsb	r1, r1, #127	; 0x7f
    871c:	e1a031a0 	lsr	r3, r0, #3
    8720:	e0811383 	add	r1, r1, r3, lsl #7
    8724:	e30b2004 	movw	r2, #45060	; 0xb004
    8728:	e3402000 	movt	r2, #0
    872c:	e2003007 	and	r3, r0, #7
    8730:	e3a00001 	mov	r0, #1
    8734:	e7d2c001 	ldrb	ip, [r2, r1]
    8738:	e18c3310 	orr	r3, ip, r0, lsl r3
    873c:	e7c23001 	strb	r3, [r2, r1]
    8740:	e12fff1e 	bx	lr
    8744:	e3a00000 	mov	r0, #0
    8748:	e12fff1e 	bx	lr

0000874c <oled_buf_pixel_clr>:
    874c:	e350001f 	cmp	r0, #31
    8750:	9351007f 	cmpls	r1, #127	; 0x7f
    8754:	8a00000b 	bhi	8788 <oled_buf_pixel_clr+0x3c>
    8758:	e260001f 	rsb	r0, r0, #31
    875c:	e261107f 	rsb	r1, r1, #127	; 0x7f
    8760:	e1a031a0 	lsr	r3, r0, #3
    8764:	e0811383 	add	r1, r1, r3, lsl #7
    8768:	e30b2004 	movw	r2, #45060	; 0xb004
    876c:	e3402000 	movt	r2, #0
    8770:	e2003007 	and	r3, r0, #7
    8774:	e3a00001 	mov	r0, #1
    8778:	e7d2c001 	ldrb	ip, [r2, r1]
    877c:	e1cc3310 	bic	r3, ip, r0, lsl r3
    8780:	e7c23001 	strb	r3, [r2, r1]
    8784:	e12fff1e 	bx	lr
    8788:	e3a00000 	mov	r0, #0
    878c:	e12fff1e 	bx	lr

00008790 <oled_buf_clr>:
    8790:	e59f3018 	ldr	r3, [pc, #24]	; 87b0 <oled_buf_clr+0x20>
    8794:	e2831080 	add	r1, r3, #128	; 0x80
    8798:	e3a02000 	mov	r2, #0
    879c:	e5e32001 	strb	r2, [r3, #1]!
    87a0:	e1530001 	cmp	r3, r1
    87a4:	1afffffc 	bne	879c <oled_buf_clr+0xc>
    87a8:	e3a00001 	mov	r0, #1
    87ac:	e12fff1e 	bx	lr
    87b0:	0000b003 	andeq	fp, r0, r3

000087b4 <oled_write_command>:
    87b4:	e92d4010 	push	{r4, lr}
    87b8:	e1a04000 	mov	r4, r0
    87bc:	e3a00009 	mov	r0, #9
    87c0:	ebfffe49 	bl	80ec <gpio_clr>
    87c4:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    87c8:	ebffffc6 	bl	86e8 <delay>
    87cc:	e3a00000 	mov	r0, #0
    87d0:	e3a01040 	mov	r1, #64	; 0x40
    87d4:	ebffff88 	bl	85fc <spi_begin>
    87d8:	e1a00004 	mov	r0, r4
    87dc:	ebffff99 	bl	8648 <spi_transfer>
    87e0:	ebffff92 	bl	8630 <spi_end>
    87e4:	e8bd8010 	pop	{r4, pc}

000087e8 <oled_write_data>:
    87e8:	e92d4010 	push	{r4, lr}
    87ec:	e1a04000 	mov	r4, r0
    87f0:	e3a00009 	mov	r0, #9
    87f4:	ebfffe2b 	bl	80a8 <gpio_set>
    87f8:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    87fc:	ebffffb9 	bl	86e8 <delay>
    8800:	e3a00000 	mov	r0, #0
    8804:	e3a01020 	mov	r1, #32
    8808:	ebffff7b 	bl	85fc <spi_begin>
    880c:	e1a00004 	mov	r0, r4
    8810:	ebffff8c 	bl	8648 <spi_transfer>
    8814:	ebffff85 	bl	8630 <spi_end>
    8818:	e8bd8010 	pop	{r4, pc}

0000881c <oled_reset>:
    881c:	e92d4008 	push	{r3, lr}
    8820:	e3a00010 	mov	r0, #16
    8824:	e3a01001 	mov	r1, #1
    8828:	ebfffe09 	bl	8054 <gpio_config>
    882c:	e3a00010 	mov	r0, #16
    8830:	ebfffe1c 	bl	80a8 <gpio_set>
    8834:	e30806a0 	movw	r0, #34464	; 0x86a0
    8838:	e3400001 	movt	r0, #1
    883c:	ebffffa9 	bl	86e8 <delay>
    8840:	e3a00010 	mov	r0, #16
    8844:	ebfffe28 	bl	80ec <gpio_clr>
    8848:	e30c0350 	movw	r0, #50000	; 0xc350
    884c:	ebffffa5 	bl	86e8 <delay>
    8850:	e3a00010 	mov	r0, #16
    8854:	ebfffe13 	bl	80a8 <gpio_set>
    8858:	e8bd8008 	pop	{r3, pc}

0000885c <oled_init>:
    885c:	e92d4008 	push	{r3, lr}
    8860:	ebffffed 	bl	881c <oled_reset>
    8864:	e3a00010 	mov	r0, #16
    8868:	e3a01001 	mov	r1, #1
    886c:	ebfffdf8 	bl	8054 <gpio_config>
    8870:	e3a00009 	mov	r0, #9
    8874:	e3a01001 	mov	r1, #1
    8878:	ebfffdf5 	bl	8054 <gpio_config>
    887c:	e3a00010 	mov	r0, #16
    8880:	ebfffe08 	bl	80a8 <gpio_set>
    8884:	e3a00009 	mov	r0, #9
    8888:	ebfffe17 	bl	80ec <gpio_clr>
    888c:	e3020710 	movw	r0, #10000	; 0x2710
    8890:	ebffff94 	bl	86e8 <delay>
    8894:	e3a00000 	mov	r0, #0
    8898:	e3a01020 	mov	r1, #32
    889c:	ebffff39 	bl	8588 <spi_master_init>
    88a0:	e3a000ae 	mov	r0, #174	; 0xae
    88a4:	ebffffc2 	bl	87b4 <oled_write_command>
    88a8:	e3a000d5 	mov	r0, #213	; 0xd5
    88ac:	ebffffc0 	bl	87b4 <oled_write_command>
    88b0:	e3a00080 	mov	r0, #128	; 0x80
    88b4:	ebffffbe 	bl	87b4 <oled_write_command>
    88b8:	e3a000a8 	mov	r0, #168	; 0xa8
    88bc:	ebffffbc 	bl	87b4 <oled_write_command>
    88c0:	e3a0001f 	mov	r0, #31
    88c4:	ebffffba 	bl	87b4 <oled_write_command>
    88c8:	e3a000d3 	mov	r0, #211	; 0xd3
    88cc:	ebffffb8 	bl	87b4 <oled_write_command>
    88d0:	e3a00000 	mov	r0, #0
    88d4:	ebffffb6 	bl	87b4 <oled_write_command>
    88d8:	e3a00040 	mov	r0, #64	; 0x40
    88dc:	ebffffb4 	bl	87b4 <oled_write_command>
    88e0:	e3a0008d 	mov	r0, #141	; 0x8d
    88e4:	ebffffb2 	bl	87b4 <oled_write_command>
    88e8:	e3a00014 	mov	r0, #20
    88ec:	ebffffb0 	bl	87b4 <oled_write_command>
    88f0:	e3a00020 	mov	r0, #32
    88f4:	ebffffae 	bl	87b4 <oled_write_command>
    88f8:	e3a00000 	mov	r0, #0
    88fc:	ebffffac 	bl	87b4 <oled_write_command>
    8900:	e3a000a1 	mov	r0, #161	; 0xa1
    8904:	ebffffaa 	bl	87b4 <oled_write_command>
    8908:	e3a000c8 	mov	r0, #200	; 0xc8
    890c:	ebffffa8 	bl	87b4 <oled_write_command>
    8910:	e3a000da 	mov	r0, #218	; 0xda
    8914:	ebffffa6 	bl	87b4 <oled_write_command>
    8918:	e3a00002 	mov	r0, #2
    891c:	ebffffa4 	bl	87b4 <oled_write_command>
    8920:	e3a00081 	mov	r0, #129	; 0x81
    8924:	ebffffa2 	bl	87b4 <oled_write_command>
    8928:	e3a0008f 	mov	r0, #143	; 0x8f
    892c:	ebffffa0 	bl	87b4 <oled_write_command>
    8930:	e3a000d9 	mov	r0, #217	; 0xd9
    8934:	ebffff9e 	bl	87b4 <oled_write_command>
    8938:	e3a000f1 	mov	r0, #241	; 0xf1
    893c:	ebffff9c 	bl	87b4 <oled_write_command>
    8940:	e3a000db 	mov	r0, #219	; 0xdb
    8944:	ebffff9a 	bl	87b4 <oled_write_command>
    8948:	e3a00040 	mov	r0, #64	; 0x40
    894c:	ebffff98 	bl	87b4 <oled_write_command>
    8950:	e3a000a4 	mov	r0, #164	; 0xa4
    8954:	ebffff96 	bl	87b4 <oled_write_command>
    8958:	e3a000a6 	mov	r0, #166	; 0xa6
    895c:	ebffff94 	bl	87b4 <oled_write_command>
    8960:	e3a000af 	mov	r0, #175	; 0xaf
    8964:	ebffff92 	bl	87b4 <oled_write_command>
    8968:	e8bd8008 	pop	{r3, pc}

0000896c <oled_start_sequence>:
    896c:	e92d4008 	push	{r3, lr}
    8970:	e3a00021 	mov	r0, #33	; 0x21
    8974:	ebffff8e 	bl	87b4 <oled_write_command>
    8978:	e3a00000 	mov	r0, #0
    897c:	ebffff8c 	bl	87b4 <oled_write_command>
    8980:	e3a0007f 	mov	r0, #127	; 0x7f
    8984:	ebffff8a 	bl	87b4 <oled_write_command>
    8988:	e3a00022 	mov	r0, #34	; 0x22
    898c:	ebffff88 	bl	87b4 <oled_write_command>
    8990:	e3a00000 	mov	r0, #0
    8994:	ebffff86 	bl	87b4 <oled_write_command>
    8998:	e3a00003 	mov	r0, #3
    899c:	ebffff84 	bl	87b4 <oled_write_command>
    89a0:	e8bd8008 	pop	{r3, pc}

000089a4 <oled_buf_draw>:
    89a4:	e92d4038 	push	{r3, r4, r5, lr}
    89a8:	ebffffef 	bl	896c <oled_start_sequence>
    89ac:	e3a00009 	mov	r0, #9
    89b0:	ebfffdbc 	bl	80a8 <gpio_set>
    89b4:	e3a00000 	mov	r0, #0
    89b8:	e3a01020 	mov	r1, #32
    89bc:	ebffff0e 	bl	85fc <spi_begin>
    89c0:	e59f401c 	ldr	r4, [pc, #28]	; 89e4 <oled_buf_draw+0x40>
    89c4:	e2845c02 	add	r5, r4, #512	; 0x200
    89c8:	e5f40001 	ldrb	r0, [r4, #1]!
    89cc:	ebffff1d 	bl	8648 <spi_transfer>
    89d0:	e1540005 	cmp	r4, r5
    89d4:	1afffffb 	bne	89c8 <oled_buf_draw+0x24>
    89d8:	ebffff14 	bl	8630 <spi_end>
    89dc:	e3a00001 	mov	r0, #1
    89e0:	e8bd8038 	pop	{r3, r4, r5, pc}
    89e4:	0000b003 	andeq	fp, r0, r3

000089e8 <oled_scroll_test>:
    89e8:	e92d4038 	push	{r3, r4, r5, lr}
    89ec:	ebffffde 	bl	896c <oled_start_sequence>
    89f0:	e3a00009 	mov	r0, #9
    89f4:	ebfffdab 	bl	80a8 <gpio_set>
    89f8:	e3a00000 	mov	r0, #0
    89fc:	e3a01020 	mov	r1, #32
    8a00:	ebfffefd 	bl	85fc <spi_begin>
    8a04:	e3a04c02 	mov	r4, #512	; 0x200
    8a08:	e30b5000 	movw	r5, #45056	; 0xb000
    8a0c:	e3405000 	movt	r5, #0
    8a10:	e5950000 	ldr	r0, [r5]
    8a14:	e2803001 	add	r3, r0, #1
    8a18:	e5853000 	str	r3, [r5]
    8a1c:	e6ef0070 	uxtb	r0, r0
    8a20:	ebffff08 	bl	8648 <spi_transfer>
    8a24:	e2544001 	subs	r4, r4, #1
    8a28:	1afffff8 	bne	8a10 <oled_scroll_test+0x28>
    8a2c:	ebfffeff 	bl	8630 <spi_end>
    8a30:	e30b3000 	movw	r3, #45056	; 0xb000
    8a34:	e3403000 	movt	r3, #0
    8a38:	e5932000 	ldr	r2, [r3]
    8a3c:	e2822001 	add	r2, r2, #1
    8a40:	e5832000 	str	r2, [r3]
    8a44:	e8bd8038 	pop	{r3, r4, r5, pc}

00008a48 <oled_clear_screen>:
    8a48:	e92d4038 	push	{r3, r4, r5, lr}
    8a4c:	ebffffc6 	bl	896c <oled_start_sequence>
    8a50:	e3a00009 	mov	r0, #9
    8a54:	ebfffd93 	bl	80a8 <gpio_set>
    8a58:	e3a00000 	mov	r0, #0
    8a5c:	e3a01020 	mov	r1, #32
    8a60:	ebfffee5 	bl	85fc <spi_begin>
    8a64:	e3a04c02 	mov	r4, #512	; 0x200
    8a68:	e3a05000 	mov	r5, #0
    8a6c:	e1a00005 	mov	r0, r5
    8a70:	ebfffef4 	bl	8648 <spi_transfer>
    8a74:	e2544001 	subs	r4, r4, #1
    8a78:	1afffffb 	bne	8a6c <oled_clear_screen+0x24>
    8a7c:	ebfffeeb 	bl	8630 <spi_end>
    8a80:	e8bd8038 	pop	{r3, r4, r5, pc}

00008a84 <delay_cycles>:
    8a84:	e2500001 	subs	r0, r0, #1
    8a88:	1afffffd 	bne	8a84 <delay_cycles>
    8a8c:	e1a0f00e 	mov	pc, lr

00008a90 <read_cpsr>:
    8a90:	e10f0000 	mrs	r0, CPSR
    8a94:	e1a0f00e 	mov	pc, lr

00008a98 <write_cpsr>:
    8a98:	e129f000 	msr	CPSR_fc, r0
    8a9c:	e1a0f00e 	mov	pc, lr

00008aa0 <disable_interrupts>:
    8aa0:	e10f0000 	mrs	r0, CPSR
    8aa4:	e3a01d07 	mov	r1, #448	; 0x1c0
    8aa8:	e1800001 	orr	r0, r0, r1
    8aac:	e129f000 	msr	CPSR_fc, r0
    8ab0:	e1a0f00e 	mov	pc, lr

00008ab4 <enable_interrupts>:
    8ab4:	e10f0000 	mrs	r0, CPSR
    8ab8:	e3a01d07 	mov	r1, #448	; 0x1c0
    8abc:	e1c00001 	bic	r0, r0, r1
    8ac0:	e129f000 	msr	CPSR_fc, r0
    8ac4:	e1a0f00e 	mov	pc, lr

00008ac8 <__aeabi_uldivmod>:
    8ac8:	e3530000 	cmp	r3, #0
    8acc:	03520000 	cmpeq	r2, #0
    8ad0:	1a000004 	bne	8ae8 <__aeabi_uldivmod+0x20>
    8ad4:	e3510000 	cmp	r1, #0
    8ad8:	03500000 	cmpeq	r0, #0
    8adc:	13e01000 	mvnne	r1, #0
    8ae0:	13e00000 	mvnne	r0, #0
    8ae4:	ea000027 	b	8b88 <__aeabi_idiv0>
    8ae8:	e24dd008 	sub	sp, sp, #8
    8aec:	e92d6000 	push	{sp, lr}
    8af0:	eb000014 	bl	8b48 <__gnu_uldivmod_helper>
    8af4:	e59de004 	ldr	lr, [sp, #4]
    8af8:	e28dd008 	add	sp, sp, #8
    8afc:	e8bd000c 	pop	{r2, r3}
    8b00:	e12fff1e 	bx	lr

00008b04 <__gnu_ldivmod_helper>:
    8b04:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8b08:	e59d6020 	ldr	r6, [sp, #32]
    8b0c:	e1a07002 	mov	r7, r2
    8b10:	e1a0a003 	mov	sl, r3
    8b14:	e1a04000 	mov	r4, r0
    8b18:	e1a05001 	mov	r5, r1
    8b1c:	eb00001a 	bl	8b8c <__divdi3>
    8b20:	e1a03000 	mov	r3, r0
    8b24:	e0020197 	mul	r2, r7, r1
    8b28:	e0898097 	umull	r8, r9, r7, r0
    8b2c:	e023239a 	mla	r3, sl, r3, r2
    8b30:	e0544008 	subs	r4, r4, r8
    8b34:	e0839009 	add	r9, r3, r9
    8b38:	e0c55009 	sbc	r5, r5, r9
    8b3c:	e8860030 	stm	r6, {r4, r5}
    8b40:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8b44:	e12fff1e 	bx	lr

00008b48 <__gnu_uldivmod_helper>:
    8b48:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8b4c:	e59d5018 	ldr	r5, [sp, #24]
    8b50:	e1a04002 	mov	r4, r2
    8b54:	e1a08003 	mov	r8, r3
    8b58:	e1a06000 	mov	r6, r0
    8b5c:	e1a07001 	mov	r7, r1
    8b60:	eb000067 	bl	8d04 <__udivdi3>
    8b64:	e0080890 	mul	r8, r0, r8
    8b68:	e0832490 	umull	r2, r3, r0, r4
    8b6c:	e0248491 	mla	r4, r1, r4, r8
    8b70:	e0566002 	subs	r6, r6, r2
    8b74:	e0843003 	add	r3, r4, r3
    8b78:	e0c77003 	sbc	r7, r7, r3
    8b7c:	e88500c0 	stm	r5, {r6, r7}
    8b80:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8b84:	e12fff1e 	bx	lr

00008b88 <__aeabi_idiv0>:
    8b88:	e12fff1e 	bx	lr

00008b8c <__divdi3>:
    8b8c:	e3510000 	cmp	r1, #0
    8b90:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8b94:	a1a04000 	movge	r4, r0
    8b98:	a1a05001 	movge	r5, r1
    8b9c:	a3a0a000 	movge	sl, #0
    8ba0:	ba000053 	blt	8cf4 <__divdi3+0x168>
    8ba4:	e3530000 	cmp	r3, #0
    8ba8:	a1a08002 	movge	r8, r2
    8bac:	a1a09003 	movge	r9, r3
    8bb0:	ba00004b 	blt	8ce4 <__divdi3+0x158>
    8bb4:	e1550009 	cmp	r5, r9
    8bb8:	01540008 	cmpeq	r4, r8
    8bbc:	33a02000 	movcc	r2, #0
    8bc0:	33a03000 	movcc	r3, #0
    8bc4:	3a00003b 	bcc	8cb8 <__divdi3+0x12c>
    8bc8:	e1a01009 	mov	r1, r9
    8bcc:	e1a00008 	mov	r0, r8
    8bd0:	eb000093 	bl	8e24 <__clzdi2>
    8bd4:	e1a01005 	mov	r1, r5
    8bd8:	e1a0b000 	mov	fp, r0
    8bdc:	e1a00004 	mov	r0, r4
    8be0:	eb00008f 	bl	8e24 <__clzdi2>
    8be4:	e060000b 	rsb	r0, r0, fp
    8be8:	e240e020 	sub	lr, r0, #32
    8bec:	e1a07019 	lsl	r7, r9, r0
    8bf0:	e1877e18 	orr	r7, r7, r8, lsl lr
    8bf4:	e260c020 	rsb	ip, r0, #32
    8bf8:	e1877c38 	orr	r7, r7, r8, lsr ip
    8bfc:	e1550007 	cmp	r5, r7
    8c00:	e1a06018 	lsl	r6, r8, r0
    8c04:	01540006 	cmpeq	r4, r6
    8c08:	e1a01000 	mov	r1, r0
    8c0c:	33a02000 	movcc	r2, #0
    8c10:	33a03000 	movcc	r3, #0
    8c14:	3a000005 	bcc	8c30 <__divdi3+0xa4>
    8c18:	e3a08001 	mov	r8, #1
    8c1c:	e0544006 	subs	r4, r4, r6
    8c20:	e1a03e18 	lsl	r3, r8, lr
    8c24:	e1833c38 	orr	r3, r3, r8, lsr ip
    8c28:	e0c55007 	sbc	r5, r5, r7
    8c2c:	e1a02018 	lsl	r2, r8, r0
    8c30:	e3500000 	cmp	r0, #0
    8c34:	0a00001f 	beq	8cb8 <__divdi3+0x12c>
    8c38:	e1b070a7 	lsrs	r7, r7, #1
    8c3c:	e1a06066 	rrx	r6, r6
    8c40:	ea000007 	b	8c64 <__divdi3+0xd8>
    8c44:	e0544006 	subs	r4, r4, r6
    8c48:	e0c55007 	sbc	r5, r5, r7
    8c4c:	e0944004 	adds	r4, r4, r4
    8c50:	e0a55005 	adc	r5, r5, r5
    8c54:	e2944001 	adds	r4, r4, #1
    8c58:	e2a55000 	adc	r5, r5, #0
    8c5c:	e2500001 	subs	r0, r0, #1
    8c60:	0a000006 	beq	8c80 <__divdi3+0xf4>
    8c64:	e1570005 	cmp	r7, r5
    8c68:	01560004 	cmpeq	r6, r4
    8c6c:	9afffff4 	bls	8c44 <__divdi3+0xb8>
    8c70:	e0944004 	adds	r4, r4, r4
    8c74:	e0a55005 	adc	r5, r5, r5
    8c78:	e2500001 	subs	r0, r0, #1
    8c7c:	1afffff8 	bne	8c64 <__divdi3+0xd8>
    8c80:	e261c020 	rsb	ip, r1, #32
    8c84:	e1a00134 	lsr	r0, r4, r1
    8c88:	e0922004 	adds	r2, r2, r4
    8c8c:	e241e020 	sub	lr, r1, #32
    8c90:	e1800c15 	orr	r0, r0, r5, lsl ip
    8c94:	e1a04135 	lsr	r4, r5, r1
    8c98:	e1800e35 	orr	r0, r0, r5, lsr lr
    8c9c:	e1a07114 	lsl	r7, r4, r1
    8ca0:	e1877e10 	orr	r7, r7, r0, lsl lr
    8ca4:	e1a06110 	lsl	r6, r0, r1
    8ca8:	e0a33005 	adc	r3, r3, r5
    8cac:	e1877c30 	orr	r7, r7, r0, lsr ip
    8cb0:	e0522006 	subs	r2, r2, r6
    8cb4:	e0c33007 	sbc	r3, r3, r7
    8cb8:	e29a0000 	adds	r0, sl, #0
    8cbc:	13a00001 	movne	r0, #1
    8cc0:	e3a01000 	mov	r1, #0
    8cc4:	e2704000 	rsbs	r4, r0, #0
    8cc8:	e2e15000 	rsc	r5, r1, #0
    8ccc:	e0222004 	eor	r2, r2, r4
    8cd0:	e0233005 	eor	r3, r3, r5
    8cd4:	e0900002 	adds	r0, r0, r2
    8cd8:	e0a11003 	adc	r1, r1, r3
    8cdc:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8ce0:	e12fff1e 	bx	lr
    8ce4:	e2728000 	rsbs	r8, r2, #0
    8ce8:	e1e0a00a 	mvn	sl, sl
    8cec:	e2e39000 	rsc	r9, r3, #0
    8cf0:	eaffffaf 	b	8bb4 <__divdi3+0x28>
    8cf4:	e2704000 	rsbs	r4, r0, #0
    8cf8:	e2e15000 	rsc	r5, r1, #0
    8cfc:	e3e0a000 	mvn	sl, #0
    8d00:	eaffffa7 	b	8ba4 <__divdi3+0x18>

00008d04 <__udivdi3>:
    8d04:	e1510003 	cmp	r1, r3
    8d08:	01500002 	cmpeq	r0, r2
    8d0c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8d10:	e1a04000 	mov	r4, r0
    8d14:	e1a05001 	mov	r5, r1
    8d18:	e1a08002 	mov	r8, r2
    8d1c:	e1a09003 	mov	r9, r3
    8d20:	33a00000 	movcc	r0, #0
    8d24:	33a01000 	movcc	r1, #0
    8d28:	3a00003b 	bcc	8e1c <__udivdi3+0x118>
    8d2c:	e1a01003 	mov	r1, r3
    8d30:	e1a00002 	mov	r0, r2
    8d34:	eb00003a 	bl	8e24 <__clzdi2>
    8d38:	e1a01005 	mov	r1, r5
    8d3c:	e1a0a000 	mov	sl, r0
    8d40:	e1a00004 	mov	r0, r4
    8d44:	eb000036 	bl	8e24 <__clzdi2>
    8d48:	e060300a 	rsb	r3, r0, sl
    8d4c:	e243e020 	sub	lr, r3, #32
    8d50:	e1a07319 	lsl	r7, r9, r3
    8d54:	e1877e18 	orr	r7, r7, r8, lsl lr
    8d58:	e263c020 	rsb	ip, r3, #32
    8d5c:	e1877c38 	orr	r7, r7, r8, lsr ip
    8d60:	e1550007 	cmp	r5, r7
    8d64:	e1a06318 	lsl	r6, r8, r3
    8d68:	01540006 	cmpeq	r4, r6
    8d6c:	e1a02003 	mov	r2, r3
    8d70:	33a00000 	movcc	r0, #0
    8d74:	33a01000 	movcc	r1, #0
    8d78:	3a000005 	bcc	8d94 <__udivdi3+0x90>
    8d7c:	e3a08001 	mov	r8, #1
    8d80:	e0544006 	subs	r4, r4, r6
    8d84:	e1a01e18 	lsl	r1, r8, lr
    8d88:	e1811c38 	orr	r1, r1, r8, lsr ip
    8d8c:	e0c55007 	sbc	r5, r5, r7
    8d90:	e1a00318 	lsl	r0, r8, r3
    8d94:	e3530000 	cmp	r3, #0
    8d98:	0a00001f 	beq	8e1c <__udivdi3+0x118>
    8d9c:	e1b070a7 	lsrs	r7, r7, #1
    8da0:	e1a06066 	rrx	r6, r6
    8da4:	ea000007 	b	8dc8 <__udivdi3+0xc4>
    8da8:	e0544006 	subs	r4, r4, r6
    8dac:	e0c55007 	sbc	r5, r5, r7
    8db0:	e0944004 	adds	r4, r4, r4
    8db4:	e0a55005 	adc	r5, r5, r5
    8db8:	e2944001 	adds	r4, r4, #1
    8dbc:	e2a55000 	adc	r5, r5, #0
    8dc0:	e2533001 	subs	r3, r3, #1
    8dc4:	0a000006 	beq	8de4 <__udivdi3+0xe0>
    8dc8:	e1570005 	cmp	r7, r5
    8dcc:	01560004 	cmpeq	r6, r4
    8dd0:	9afffff4 	bls	8da8 <__udivdi3+0xa4>
    8dd4:	e0944004 	adds	r4, r4, r4
    8dd8:	e0a55005 	adc	r5, r5, r5
    8ddc:	e2533001 	subs	r3, r3, #1
    8de0:	1afffff8 	bne	8dc8 <__udivdi3+0xc4>
    8de4:	e0948000 	adds	r8, r4, r0
    8de8:	e0a59001 	adc	r9, r5, r1
    8dec:	e1a03234 	lsr	r3, r4, r2
    8df0:	e2621020 	rsb	r1, r2, #32
    8df4:	e2420020 	sub	r0, r2, #32
    8df8:	e1833115 	orr	r3, r3, r5, lsl r1
    8dfc:	e1a0c235 	lsr	ip, r5, r2
    8e00:	e1833035 	orr	r3, r3, r5, lsr r0
    8e04:	e1a0721c 	lsl	r7, ip, r2
    8e08:	e1877013 	orr	r7, r7, r3, lsl r0
    8e0c:	e1a06213 	lsl	r6, r3, r2
    8e10:	e1877133 	orr	r7, r7, r3, lsr r1
    8e14:	e0580006 	subs	r0, r8, r6
    8e18:	e0c91007 	sbc	r1, r9, r7
    8e1c:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8e20:	e12fff1e 	bx	lr

00008e24 <__clzdi2>:
    8e24:	e92d4010 	push	{r4, lr}
    8e28:	e3510000 	cmp	r1, #0
    8e2c:	1a000002 	bne	8e3c <__clzdi2+0x18>
    8e30:	eb000005 	bl	8e4c <__clzsi2>
    8e34:	e2800020 	add	r0, r0, #32
    8e38:	ea000001 	b	8e44 <__clzdi2+0x20>
    8e3c:	e1a00001 	mov	r0, r1
    8e40:	eb000001 	bl	8e4c <__clzsi2>
    8e44:	e8bd4010 	pop	{r4, lr}
    8e48:	e12fff1e 	bx	lr

00008e4c <__clzsi2>:
    8e4c:	e3a0101c 	mov	r1, #28
    8e50:	e3500801 	cmp	r0, #65536	; 0x10000
    8e54:	21a00820 	lsrcs	r0, r0, #16
    8e58:	22411010 	subcs	r1, r1, #16
    8e5c:	e3500c01 	cmp	r0, #256	; 0x100
    8e60:	21a00420 	lsrcs	r0, r0, #8
    8e64:	22411008 	subcs	r1, r1, #8
    8e68:	e3500010 	cmp	r0, #16
    8e6c:	21a00220 	lsrcs	r0, r0, #4
    8e70:	22411004 	subcs	r1, r1, #4
    8e74:	e28f2008 	add	r2, pc, #8
    8e78:	e7d20000 	ldrb	r0, [r2, r0]
    8e7c:	e0800001 	add	r0, r0, r1
    8e80:	e12fff1e 	bx	lr
    8e84:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    8e88:	01010101 	tsteq	r1, r1, lsl #2
	...

Disassembly of section .rodata:

00009000 <__rodata_start>:
    9000:	33323130 	teqcc	r2, #48, 2
    9004:	37363534 			; <UNDEFINED> instruction: 0x37363534
    9008:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    900c:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .rodata.str1.4:

00009014 <.rodata.str1.4>:
    9014:	00000030 	andeq	r0, r0, r0, lsr r0
    9018:	00007830 	andeq	r7, r0, r0, lsr r8

Disassembly of section .ARM.exidx:

0000901c <.ARM.exidx>:
    901c:	7ffffb70 	svcvc	0x00fffb70
    9020:	00000001 	andeq	r0, r0, r1

Disassembly of section .data:

0000a000 <__data_start>:
    a000:	Address 0x0000a000 is out of bounds.


Disassembly of section .bss:

0000b000 <__bss_start>:
    b000:	00000000 	andeq	r0, r0, r0

0000b004 <_oled_frame_buffer>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	000001f4 	strdeq	r0, [r0], -r4
       4:	00000004 	andeq	r0, r0, r4
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	00000053 	andeq	r0, r0, r3, asr r0
      10:	00016101 	andeq	r6, r1, r1, lsl #2
      14:	00010400 	andeq	r0, r1, r0, lsl #8
      18:	00805400 	addeq	r5, r0, r0, lsl #8
      1c:	00019400 	andeq	r9, r1, r0, lsl #8
      20:	00000000 	andeq	r0, r0, r0
      24:	08010200 	stmdaeq	r1, {r9}
      28:	000000e9 	andeq	r0, r0, r9, ror #1
      2c:	0000e203 	andeq	lr, r0, r3, lsl #4
      30:	370e0200 	strcc	r0, [lr, -r0, lsl #4]
      34:	02000000 	andeq	r0, r0, #0
      38:	00f20801 	rscseq	r0, r2, r1, lsl #16
      3c:	02020000 	andeq	r0, r2, #0
      40:	00015005 	andeq	r5, r1, r5
      44:	05040400 	streq	r0, [r4, #-1024]	; 0x400
      48:	00746e69 	rsbseq	r6, r4, r9, ror #28
      4c:	00050802 	andeq	r0, r5, r2, lsl #16
      50:	03000000 	movweq	r0, #0
      54:	000000e1 	andeq	r0, r0, r1, ror #1
      58:	00251602 	eoreq	r1, r5, r2, lsl #12
      5c:	02020000 	andeq	r0, r2, #0
      60:	00012b07 	andeq	r2, r1, r7, lsl #22
      64:	001c0300 	andseq	r0, ip, r0, lsl #6
      68:	1a020000 	bne	80070 <__bss_end+0x74070>
      6c:	00000070 	andeq	r0, r0, r0, ror r0
      70:	3d070402 	cfstrscc	mvf0, [r7, #-8]
      74:	02000000 	andeq	r0, r0, #0
      78:	00330708 	eorseq	r0, r3, r8, lsl #14
      7c:	44050000 	strmi	r0, [r5], #-0
      80:	01000001 	tsteq	r0, r1
      84:	00805455 	addeq	r5, r0, r5, asr r4
      88:	00005400 	andeq	r5, r0, r0, lsl #8
      8c:	dd9c0100 	ldfles	f0, [ip]
      90:	06000000 	streq	r0, [r0], -r0
      94:	006e6970 	rsbeq	r6, lr, r0, ror r9
      98:	00535501 	subseq	r5, r3, r1, lsl #10
      9c:	00000000 	andeq	r0, r0, r0
      a0:	66070000 	strvs	r0, [r7], -r0
      a4:	01006e75 	tsteq	r0, r5, ror lr
      a8:	00005355 	andeq	r5, r0, r5, asr r3
      ac:	08510100 	ldmdaeq	r1, {r8}^
      b0:	00676572 	rsbeq	r6, r7, r2, ror r5
      b4:	00655a01 	rsbeq	r5, r5, r1, lsl #20
      b8:	00210000 	eoreq	r0, r1, r0
      bc:	49090000 	stmdbmi	r9, {}	; <UNPREDICTABLE>
      c0:	01000001 	tsteq	r0, r1
      c4:	0000655c 	andeq	r6, r0, ip, asr r5
      c8:	00005a00 	andeq	r5, r0, r0, lsl #20
      cc:	015a0900 	cmpeq	sl, r0, lsl #18
      d0:	5e010000 	cdppl	0, 0, cr0, cr1, cr0, {0}
      d4:	00000065 	andeq	r0, r0, r5, rrx
      d8:	00000078 	andeq	r0, r0, r8, ror r0
      dc:	002a0500 	eoreq	r0, sl, r0, lsl #10
      e0:	65010000 	strvs	r0, [r1, #-0]
      e4:	000080a8 	andeq	r8, r0, r8, lsr #1
      e8:	00000044 	andeq	r0, r0, r4, asr #32
      ec:	01029c01 	tsteq	r2, r1, lsl #24
      f0:	70060000 	andvc	r0, r6, r0
      f4:	01006e69 	tsteq	r0, r9, ror #28
      f8:	00005365 	andeq	r5, r0, r5, ror #6
      fc:	00008b00 	andeq	r8, r0, r0, lsl #22
     100:	4a050000 	bmi	140108 <__end+0x13108>
     104:	01000000 	mrseq	r0, (UNDEF: 0)
     108:	0080ec71 	addeq	lr, r0, r1, ror ip
     10c:	00004400 	andeq	r4, r0, r0, lsl #8
     110:	279c0100 	ldrcs	r0, [ip, r0, lsl #2]
     114:	06000001 	streq	r0, [r0], -r1
     118:	006e6970 	rsbeq	r6, lr, r0, ror r9
     11c:	00537101 	subseq	r7, r3, r1, lsl #2
     120:	00c50000 	sbceq	r0, r5, r0
     124:	05000000 	streq	r0, [r0, #-0]
     128:	0000000e 	andeq	r0, r0, lr
     12c:	81307d01 	teqhi	r0, r1, lsl #26
     130:	00840000 	addeq	r0, r4, r0
     134:	9c010000 	stcls	0, cr0, [r1], {-0}
     138:	00000193 	muleq	r0, r3, r1
     13c:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
     140:	537d0100 	cmnpl	sp, #0, 2
     144:	ff000000 			; <UNDEFINED> instruction: 0xff000000
     148:	0a000000 	beq	150 <__start-0x7eb0>
     14c:	0000013e 	andeq	r0, r0, lr, lsr r1
     150:	00537d01 	subseq	r7, r3, r1, lsl #26
     154:	01200000 	teqeq	r0, r0
     158:	580b0000 	stmdapl	fp, {}	; <UNPREDICTABLE>
     15c:	ea000081 	b	368 <__start-0x7c98>
     160:	6e000001 	cdpvs	0, 0, cr0, cr0, cr1, {0}
     164:	0c000001 	stceq	0, cr0, [r0], {1}
     168:	08025001 	stmdaeq	r2, {r0, ip, lr}
     16c:	800b0096 	mulhi	fp, r6, r0
     170:	ea000081 	b	37c <__start-0x7c84>
     174:	82000001 	andhi	r0, r0, #1
     178:	0c000001 	stceq	0, cr0, [r0], {1}
     17c:	08025001 	stmdaeq	r2, {r0, ip, lr}
     180:	a80d0096 	stmdage	sp, {r1, r2, r4, r7}
     184:	ea000081 	b	390 <__start-0x7c70>
     188:	0c000001 	stceq	0, cr0, [r0], {1}
     18c:	08025001 	stmdaeq	r2, {r0, ip, lr}
     190:	0e000096 	mcreq	0, 0, r0, cr0, cr6, {4}
     194:	000000d2 	ldrdeq	r0, [r0], -r2
     198:	002c8f01 	eoreq	r8, ip, r1, lsl #30
     19c:	81b40000 			; <UNDEFINED> instruction: 0x81b40000
     1a0:	00340000 	eorseq	r0, r4, r0
     1a4:	9c010000 	stcls	0, cr0, [r1], {-0}
     1a8:	000001cb 	andeq	r0, r0, fp, asr #3
     1ac:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
     1b0:	538f0100 	orrpl	r0, pc, #0, 2
     1b4:	41000000 	mrsmi	r0, (UNDEF: 0)
     1b8:	08000001 	stmdaeq	r0, {r0}
     1bc:	006c6176 	rsbeq	r6, ip, r6, ror r1
     1c0:	00659001 	rsbeq	r9, r5, r1
     1c4:	017b0000 	cmneq	fp, r0
     1c8:	0f000000 	svceq	0x00000000
     1cc:	00000025 	andeq	r0, r0, r5, lsr #32
     1d0:	01da5201 	bicseq	r5, sl, r1, lsl #4
     1d4:	00000000 	andeq	r0, r0, r0
     1d8:	df103f20 	svcle	0x00103f20
     1dc:	11000001 	tstne	r0, r1
     1e0:	0001e504 	andeq	lr, r1, r4, lsl #10
     1e4:	00651200 	rsbeq	r1, r5, r0, lsl #4
     1e8:	f7130000 			; <UNDEFINED> instruction: 0xf7130000
     1ec:	03000000 	movweq	r0, #0
     1f0:	00651419 	rsbeq	r1, r5, r9, lsl r4
     1f4:	00000000 	andeq	r0, r0, r0
     1f8:	000001e4 	andeq	r0, r0, r4, ror #3
     1fc:	011a0004 	tsteq	sl, r4
     200:	01040000 	mrseq	r0, (UNDEF: 4)
     204:	00000053 	andeq	r0, r0, r3, asr r0
     208:	0001f701 	andeq	pc, r1, r1, lsl #14
     20c:	00018100 	andeq	r8, r1, r0, lsl #2
     210:	0081e800 	addeq	lr, r1, r0, lsl #16
     214:	0000b400 	andeq	fp, r0, r0, lsl #8
     218:	00009400 	andeq	r9, r0, r0, lsl #8
     21c:	08010200 	stmdaeq	r1, {r9}
     220:	000000f2 	strdeq	r0, [r0], -r2
     224:	50050202 	andpl	r0, r5, r2, lsl #4
     228:	03000001 	movweq	r0, #1
     22c:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     230:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
     234:	00000005 	andeq	r0, r0, r5
     238:	00e10400 	rsceq	r0, r1, r0, lsl #8
     23c:	16020000 	strne	r0, [r2], -r0
     240:	0000004c 	andeq	r0, r0, ip, asr #32
     244:	e9080102 	stmdb	r8, {r1, r8}
     248:	02000000 	andeq	r0, r0, #0
     24c:	012b0702 	teqeq	fp, r2, lsl #14
     250:	1c040000 	stcne	0, cr0, [r4], {-0}
     254:	02000000 	andeq	r0, r0, #0
     258:	0000651a 	andeq	r6, r0, sl, lsl r5
     25c:	07040200 	streq	r0, [r4, -r0, lsl #4]
     260:	0000003d 	andeq	r0, r0, sp, lsr r0
     264:	33070802 	movwcc	r0, #30722	; 0x7802
     268:	05000000 	streq	r0, [r0, #-0]
     26c:	000001c0 	andeq	r0, r0, r0, asr #3
     270:	81e81101 	mvnhi	r1, r1, lsl #2
     274:	00b40000 	adcseq	r0, r4, r0
     278:	9c010000 	stcls	0, cr0, [r1], {-0}
     27c:	0000018e 	andeq	r0, r0, lr, lsl #3
     280:	776f7206 	strbvc	r7, [pc, -r6, lsl #4]!
     284:	33120100 	tstcc	r2, #0, 2
     288:	99000000 	stmdbls	r0, {}	; <UNPREDICTABLE>
     28c:	06000001 	streq	r0, [r0], -r1
     290:	006c6f63 	rsbeq	r6, ip, r3, ror #30
     294:	00331201 	eorseq	r1, r3, r1, lsl #4
     298:	01b80000 			; <UNDEFINED> instruction: 0x01b80000
     29c:	f0070000 			; <UNDEFINED> instruction: 0xf0070000
     2a0:	8e000081 	cdphi	0, 0, cr0, cr0, cr1, {4}
     2a4:	07000001 	streq	r0, [r0, -r1]
     2a8:	000081f4 	strdeq	r8, [r0], -r4
     2ac:	00000195 	muleq	r0, r5, r1
     2b0:	00822c08 	addeq	r2, r2, r8, lsl #24
     2b4:	0001a600 	andeq	sl, r1, r0, lsl #12
     2b8:	0000d200 	andeq	sp, r0, r0, lsl #4
     2bc:	51010900 	tstpl	r1, r0, lsl #18
     2c0:	09007402 	stmdbeq	r0, {r1, sl, ip, sp, lr}
     2c4:	75025001 	strvc	r5, [r2, #-1]
     2c8:	3c080000 	stccc	0, cr0, [r8], {-0}
     2cc:	a6000082 	strge	r0, [r0], -r2, lsl #1
     2d0:	ec000001 	stc	0, cr0, [r0], {1}
     2d4:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
     2d8:	74025101 	strvc	r5, [r2], #-257	; 0x101
     2dc:	50010900 	andpl	r0, r1, r0, lsl #18
     2e0:	00007502 	andeq	r7, r0, r2, lsl #10
     2e4:	00824c08 	addeq	r4, r2, r8, lsl #24
     2e8:	0001a600 	andeq	sl, r1, r0, lsl #12
     2ec:	00010600 	andeq	r0, r1, r0, lsl #12
     2f0:	51010900 	tstpl	r1, r0, lsl #18
     2f4:	09007702 	stmdbeq	r0, {r1, r8, r9, sl, ip, sp, lr}
     2f8:	76025001 	strvc	r5, [r2], -r1
     2fc:	58080000 	stmdapl	r8, {}	; <UNPREDICTABLE>
     300:	a6000082 	strge	r0, [r0], -r2, lsl #1
     304:	20000001 	andcs	r0, r0, r1
     308:	09000001 	stmdbeq	r0, {r0}
     30c:	74025101 	strvc	r5, [r2], #-257	; 0x101
     310:	50010900 	andpl	r0, r1, r0, lsl #18
     314:	00007602 	andeq	r7, r0, r2, lsl #12
     318:	00825c07 	addeq	r5, r2, r7, lsl #24
     31c:	0001c000 	andeq	ip, r1, r0
     320:	82680800 	rsbhi	r0, r8, #0, 16
     324:	01d10000 	bicseq	r0, r1, r0
     328:	01430000 	mrseq	r0, (UNDEF: 67)
     32c:	01090000 	mrseq	r0, (UNDEF: 9)
     330:	00770251 	rsbseq	r0, r7, r1, asr r2
     334:	02500109 	subseq	r0, r0, #1073741826	; 0x40000002
     338:	08000075 	stmdaeq	r0, {r0, r2, r4, r5, r6}
     33c:	00008274 	andeq	r8, r0, r4, ror r2
     340:	000001d1 	ldrdeq	r0, [r0], -r1
     344:	0000015d 	andeq	r0, r0, sp, asr r1
     348:	02510109 	subseq	r0, r1, #1073741826	; 0x40000002
     34c:	01090074 	tsteq	r9, r4, ror r0
     350:	00750250 	rsbseq	r0, r5, r0, asr r2
     354:	82800800 	addhi	r0, r0, #0, 16
     358:	01d10000 	bicseq	r0, r1, r0
     35c:	01770000 	cmneq	r7, r0
     360:	01090000 	mrseq	r0, (UNDEF: 9)
     364:	00770251 	rsbseq	r0, r7, r1, asr r2
     368:	02500109 	subseq	r0, r0, #1073741826	; 0x40000002
     36c:	0a000076 	beq	54c <__start-0x7ab4>
     370:	0000828c 	andeq	r8, r0, ip, lsl #5
     374:	000001d1 	ldrdeq	r0, [r0], -r1
     378:	02510109 	subseq	r0, r1, #1073741826	; 0x40000002
     37c:	01090074 	tsteq	r9, r4, ror r0
     380:	00760250 	rsbseq	r0, r6, r0, asr r2
     384:	ed0b0000 	stc	0, cr0, [fp, #-0]
     388:	03000001 	movweq	r0, #1
     38c:	01740c32 	cmneq	r4, r2, lsr ip
     390:	29030000 	stmdbcs	r3, {}	; <UNPREDICTABLE>
     394:	00000041 	andeq	r0, r0, r1, asr #32
     398:	000001a6 	andeq	r0, r0, r6, lsr #3
     39c:	ad0e000d 	stcge	0, cr0, [lr, #-52]	; 0xffffffcc
     3a0:	03000001 	movweq	r0, #1
     3a4:	00004127 	andeq	r4, r0, r7, lsr #2
     3a8:	0001c000 	andeq	ip, r1, r0
     3ac:	005a0f00 	subseq	r0, sl, r0, lsl #30
     3b0:	5a0f0000 	bpl	3c03b8 <__user_program+0xc03b8>
     3b4:	00000000 	andeq	r0, r0, r0
     3b8:	0001cc0c 	andeq	ip, r1, ip, lsl #24
     3bc:	412a0300 	teqmi	sl, r0, lsl #6
     3c0:	d1000000 	mrsle	r0, (UNDEF: 0)
     3c4:	0d000001 	stceq	0, cr0, [r0, #-4]
     3c8:	01da1000 	bicseq	r1, sl, r0
     3cc:	28030000 	stmdacs	r3, {}	; <UNPREDICTABLE>
     3d0:	00000041 	andeq	r0, r0, r1, asr #32
     3d4:	00005a0f 	andeq	r5, r0, pc, lsl #20
     3d8:	005a0f00 	subseq	r0, sl, r0, lsl #30
     3dc:	00000000 	andeq	r0, r0, r0
     3e0:	000002f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     3e4:	02010004 	andeq	r0, r1, #4
     3e8:	01040000 	mrseq	r0, (UNDEF: 4)
     3ec:	00000053 	andeq	r0, r0, r3, asr r0
     3f0:	00021e01 	andeq	r1, r2, r1, lsl #28
     3f4:	00018100 	andeq	r8, r1, r0, lsl #2
     3f8:	00829c00 	addeq	r9, r2, r0, lsl #24
     3fc:	00029800 	andeq	r9, r2, r0, lsl #16
     400:	00013500 	andeq	r3, r1, r0, lsl #10
     404:	00e20200 	rsceq	r0, r2, r0, lsl #4
     408:	0e020000 	cdpeq	0, 0, cr0, cr2, cr0, {0}
     40c:	00000030 	andeq	r0, r0, r0, lsr r0
     410:	f2080103 	vrhadd.s8	d0, d8, d3
     414:	03000000 	movweq	r0, #0
     418:	01500502 	cmpeq	r0, r2, lsl #10
     41c:	1d020000 	stcne	0, cr0, [r2, #-0]
     420:	02000000 	andeq	r0, r0, #0
     424:	00004912 	andeq	r4, r0, r2, lsl r9
     428:	05040400 	streq	r0, [r4, #-1024]	; 0x400
     42c:	00746e69 	rsbseq	r6, r4, r9, ror #28
     430:	00050803 	andeq	r0, r5, r3, lsl #16
     434:	02000000 	andeq	r0, r0, #0
     438:	000000e1 	andeq	r0, r0, r1, ror #1
     43c:	00621602 	rsbeq	r1, r2, r2, lsl #12
     440:	01030000 	mrseq	r0, (UNDEF: 3)
     444:	0000e908 	andeq	lr, r0, r8, lsl #18
     448:	07020300 	streq	r0, [r2, -r0, lsl #6]
     44c:	0000012b 	andeq	r0, r0, fp, lsr #2
     450:	00001c02 	andeq	r1, r0, r2, lsl #24
     454:	7b1a0200 	blvc	680c5c <__user_program+0x380c5c>
     458:	03000000 	movweq	r0, #0
     45c:	003d0704 	eorseq	r0, sp, r4, lsl #14
     460:	3c020000 	stccc	0, cr0, [r2], {-0}
     464:	02000002 	andeq	r0, r0, #2
     468:	00008d1c 	andeq	r8, r0, ip, lsl sp
     46c:	07080300 	streq	r0, [r8, -r0, lsl #6]
     470:	00000033 	andeq	r0, r0, r3, lsr r0
     474:	00024702 	andeq	r4, r2, r2, lsl #14
     478:	9f130300 	svcls	0x00130300
     47c:	05000000 	streq	r0, [r0, #-0]
     480:	00000245 	andeq	r0, r0, r5, asr #4
     484:	b6000404 	strlt	r0, [r0], -r4, lsl #8
     488:	06000000 	streq	r0, [r0], -r0
     48c:	0000028f 	andeq	r0, r0, pc, lsl #5
     490:	000000b6 	strheq	r0, [r0], -r6
     494:	04070000 	streq	r0, [r7], #-0
     498:	00025d08 	andeq	r5, r2, r8, lsl #26
     49c:	9c210100 	stflss	f0, [r1], #-0
     4a0:	e0000082 	and	r0, r0, r2, lsl #1
     4a4:	01000000 	mrseq	r0, (UNDEF: 0)
     4a8:	00012a9c 	muleq	r1, ip, sl
     4ac:	02750900 	rsbseq	r0, r5, #0, 18
     4b0:	21010000 	mrscs	r0, (UNDEF: 1)
     4b4:	00000057 	andeq	r0, r0, r7, asr r0
     4b8:	00000210 	andeq	r0, r0, r0, lsl r2
     4bc:	6d756e0a 	ldclvs	14, cr6, [r5, #-40]!	; 0xffffffd8
     4c0:	82210100 	eorhi	r0, r1, #0, 2
     4c4:	31000000 	mrscc	r0, (UNDEF: 0)
     4c8:	0b000002 	bleq	4d8 <__start-0x7b28>
     4cc:	0000026e 	andeq	r0, r0, lr, ror #4
     4d0:	012a2201 	teqeq	sl, r1, lsl #4
     4d4:	02690000 	rsbeq	r0, r9, #0
     4d8:	620c0000 	andvs	r0, ip, #0
     4dc:	01006675 	tsteq	r0, r5, ror r6
     4e0:	00013023 	andeq	r3, r1, r3, lsr #32
     4e4:	58910200 	ldmpl	r1, {r9}
     4e8:	7274700d 	rsbsvc	r7, r4, #13
     4ec:	2a240100 	bcs	9008f4 <__user_program+0x6008f4>
     4f0:	a0000001 	andge	r0, r0, r1
     4f4:	0e000002 	cdpeq	0, 0, cr0, cr0, cr2, {0}
     4f8:	00008350 	andeq	r8, r0, r0, asr r3
     4fc:	000002e6 	andeq	r0, r0, r6, ror #5
     500:	0083680e 	addeq	r6, r3, lr, lsl #16
     504:	0002e600 	andeq	lr, r2, r0, lsl #12
     508:	040f0000 	streq	r0, [pc], #-0	; 510 <__start-0x7af0>
     50c:	00000025 	andeq	r0, r0, r5, lsr #32
     510:	00002510 	andeq	r2, r0, r0, lsl r5
     514:	00014000 	andeq	r4, r1, r0
     518:	01401100 	mrseq	r1, (UNDEF: 80)
     51c:	00070000 	andeq	r0, r7, r0
     520:	86070403 	strhi	r0, [r7], -r3, lsl #8
     524:	12000002 	andne	r0, r0, #2
     528:	0000027a 	andeq	r0, r0, sl, ror r2
     52c:	00493f01 	subeq	r3, r9, r1, lsl #30
     530:	837c0000 	cmnhi	ip, #0
     534:	01b80000 			; <UNDEFINED> instruction: 0x01b80000
     538:	9c010000 	stcls	0, cr0, [r1], {-0}
     53c:	000002b5 			; <UNDEFINED> instruction: 0x000002b5
     540:	746d660a 	strbtvc	r6, [sp], #-1546	; 0x60a
     544:	b53f0100 	ldrlt	r0, [pc, #-256]!	; 44c <__start-0x7bb4>
     548:	08000002 	stmdaeq	r0, {r1}
     54c:	13000003 	movwne	r0, #3
     550:	00028114 	andeq	r8, r2, r4, lsl r1
     554:	94400100 	strbls	r0, [r0], #-256	; 0x100
     558:	02000000 	andeq	r0, r0, #0
     55c:	00155491 	mulseq	r5, r1, r4
     560:	a7000000 	strge	r0, [r0, -r0]
     564:	0d000001 	stceq	0, cr0, [r0, #-4]
     568:	006d756e 	rsbeq	r7, sp, lr, ror #10
     56c:	00706101 	rsbseq	r6, r0, r1, lsl #2
     570:	033f0000 	teqeq	pc, #0
     574:	94160000 	ldrls	r0, [r6], #-0
     578:	b8000084 	stmdalt	r0, {r2, r7}
     57c:	17000000 	strne	r0, [r0, -r0]
     580:	78025001 	stmdavc	r2, {r0, ip, lr}
     584:	15000000 	strne	r0, [r0, #-0]
     588:	00000018 	andeq	r0, r0, r8, lsl r0
     58c:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     590:	6d756e0d 	ldclvs	14, cr6, [r5, #-52]!	; 0xffffffcc
     594:	70680100 	rsbvc	r0, r8, r0, lsl #2
     598:	5e000000 	cdppl	0, 0, cr0, cr0, cr0, {0}
     59c:	16000003 	strne	r0, [r0], -r3
     5a0:	000084b4 			; <UNDEFINED> instruction: 0x000084b4
     5a4:	000000b8 	strheq	r0, [r0], -r8
     5a8:	02500117 	subseq	r0, r0, #-1073741819	; 0xc0000005
     5ac:	00000077 	andeq	r0, r0, r7, ror r0
     5b0:	00841018 	addeq	r1, r4, r8, lsl r0
     5b4:	00004800 	andeq	r4, r0, r0, lsl #16
     5b8:	00022300 	andeq	r2, r2, r0, lsl #6
     5bc:	756e0d00 	strbvc	r0, [lr, #-3328]!	; 0xd00
     5c0:	5001006d 	andpl	r0, r1, sp, rrx
     5c4:	0000003e 	andeq	r0, r0, lr, lsr r0
     5c8:	0000037d 	andeq	r0, r0, sp, ror r3
     5cc:	00843019 	addeq	r3, r4, r9, lsl r0
     5d0:	0002e600 	andeq	lr, r2, r0, lsl #12
     5d4:	00020000 	andeq	r0, r2, r0
     5d8:	50011700 	andpl	r1, r1, r0, lsl #14
     5dc:	002d0802 	eoreq	r0, sp, r2, lsl #16
     5e0:	00844019 	addeq	r4, r4, r9, lsl r0
     5e4:	0000b800 	andeq	fp, r0, r0, lsl #16
     5e8:	00021300 	andeq	r1, r2, r0, lsl #6
     5ec:	50011700 	andpl	r1, r1, r0, lsl #14
     5f0:	16003a01 	strne	r3, [r0], -r1, lsl #20
     5f4:	00008454 	andeq	r8, r0, r4, asr r4
     5f8:	000000b8 	strheq	r0, [r0], -r8
     5fc:	01500117 	cmpeq	r0, r7, lsl r1
     600:	1800003a 	stmdane	r0, {r1, r3, r4, r5}
     604:	00008458 	andeq	r8, r0, r8, asr r4
     608:	00000020 	andeq	r0, r0, r0, lsr #32
     60c:	0000024f 	andeq	r0, r0, pc, asr #4
     610:	6d756e0d 	ldclvs	14, cr6, [r5, #-52]!	; 0xffffffcc
     614:	705b0100 	subsvc	r0, fp, r0, lsl #2
     618:	90000000 	andls	r0, r0, r0
     61c:	16000003 	strne	r0, [r0], -r3
     620:	00008474 	andeq	r8, r0, r4, ror r4
     624:	000000b8 	strheq	r0, [r0], -r8
     628:	01500117 	cmpeq	r0, r7, lsl r1
     62c:	1800003a 	stmdane	r0, {r1, r3, r4, r5}
     630:	000084b8 			; <UNDEFINED> instruction: 0x000084b8
     634:	00000030 	andeq	r0, r0, r0, lsr r0
     638:	00000275 	andeq	r0, r0, r5, ror r2
     63c:	0002150b 	andeq	r1, r2, fp, lsl #10
     640:	2a6e0100 	bcs	1b80a48 <__user_program+0x1880a48>
     644:	af000001 	svcge	0x00000001
     648:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
     64c:	000084d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
     650:	000002e6 	andeq	r0, r0, r6, ror #5
     654:	84e81800 	strbthi	r1, [r8], #2048	; 0x800
     658:	00180000 	andseq	r0, r8, r0
     65c:	029b0000 	addseq	r0, fp, #0
     660:	b90b0000 	stmdblt	fp, {}	; <UNPREDICTABLE>
     664:	01000002 	tsteq	r0, r2
     668:	00003e77 	andeq	r3, r0, r7, ror lr
     66c:	0003cf00 	andeq	ip, r3, r0, lsl #30
     670:	84fc0e00 	ldrbthi	r0, [ip], #3584	; 0xe00
     674:	02e60000 	rsceq	r0, r6, #0
     678:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     67c:	000083b4 			; <UNDEFINED> instruction: 0x000083b4
     680:	000002e6 	andeq	r0, r0, r6, ror #5
     684:	00850816 	addeq	r0, r5, r6, lsl r8
     688:	0002e600 	andeq	lr, r2, r0, lsl #12
     68c:	50011700 	andpl	r1, r1, r0, lsl #14
     690:	00250802 	eoreq	r0, r5, r2, lsl #16
     694:	bb040f00 	bllt	10429c <__bss_end+0xf829c>
     698:	1a000002 	bne	6a8 <__start-0x7958>
     69c:	00000030 	andeq	r0, r0, r0, lsr r0
     6a0:	00003010 	andeq	r3, r0, r0, lsl r0
     6a4:	0002d000 	andeq	sp, r2, r0
     6a8:	01401100 	mrseq	r1, (UNDEF: 80)
     6ac:	00100000 	andseq	r0, r0, r0
     6b0:	00026714 	andeq	r6, r2, r4, lsl r7
     6b4:	e1180100 	tst	r8, r0, lsl #2
     6b8:	05000002 	streq	r0, [r0, #-2]
     6bc:	00900003 	addseq	r0, r0, r3
     6c0:	02c01a00 	sbceq	r1, r0, #0, 20
     6c4:	4f1b0000 	svcmi	0x001b0000
     6c8:	05000002 	streq	r0, [r0, #-2]
     6cc:	00571c23 	subseq	r1, r7, r3, lsr #24
     6d0:	00000000 	andeq	r0, r0, r0
     6d4:	000000bf 	strheq	r0, [r0], -pc	; <UNPREDICTABLE>
     6d8:	036b0004 	cmneq	fp, #4
     6dc:	01040000 	mrseq	r0, (UNDEF: 4)
     6e0:	00000053 	andeq	r0, r0, r3, asr r0
     6e4:	00029401 	andeq	r9, r2, r1, lsl #8
     6e8:	00018100 	andeq	r8, r1, r0, lsl #2
     6ec:	00853400 	addeq	r3, r5, r0, lsl #8
     6f0:	00001400 	andeq	r1, r0, r0, lsl #8
     6f4:	00022d00 	andeq	r2, r2, r0, lsl #26
     6f8:	08010200 	stmdaeq	r1, {r9}
     6fc:	000000f2 	strdeq	r0, [r0], -r2
     700:	50050202 	andpl	r0, r5, r2, lsl #4
     704:	03000001 	movweq	r0, #1
     708:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     70c:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
     710:	00000005 	andeq	r0, r0, r5
     714:	00e10400 	rsceq	r0, r1, r0, lsl #8
     718:	16020000 	strne	r0, [r2], -r0
     71c:	0000004c 	andeq	r0, r0, ip, asr #32
     720:	e9080102 	stmdb	r8, {r1, r8}
     724:	02000000 	andeq	r0, r0, #0
     728:	012b0702 	teqeq	fp, r2, lsl #14
     72c:	04020000 	streq	r0, [r2], #-0
     730:	00003d07 	andeq	r3, r0, r7, lsl #26
     734:	07080200 	streq	r0, [r8, -r0, lsl #4]
     738:	00000033 	andeq	r0, r0, r3, lsr r0
     73c:	0002be05 	andeq	fp, r2, r5, lsl #28
     740:	340d0100 	strcc	r0, [sp], #-256	; 0x100
     744:	04000085 	streq	r0, [r0], #-133	; 0x85
     748:	01000000 	mrseq	r0, (UNDEF: 0)
     74c:	02c8059c 	sbceq	r0, r8, #156, 10	; 0x27000000
     750:	11010000 	mrsne	r0, (UNDEF: 1)
     754:	00008538 	andeq	r8, r0, r8, lsr r5
     758:	00000004 	andeq	r0, r0, r4
     75c:	4f069c01 	svcmi	0x00069c01
     760:	01000002 	tsteq	r0, r2
     764:	00853c15 	addeq	r3, r5, r5, lsl ip
     768:	00000400 	andeq	r0, r0, r0, lsl #8
     76c:	ad9c0100 	ldfges	f0, [ip]
     770:	07000000 	streq	r0, [r0, -r0]
     774:	000002b9 			; <UNDEFINED> instruction: 0x000002b9
     778:	00411501 	subeq	r1, r1, r1, lsl #10
     77c:	50010000 	andpl	r0, r1, r0
     780:	02b00800 	adcseq	r0, r0, #0, 16
     784:	19010000 	stmdbne	r1, {}	; <UNPREDICTABLE>
     788:	00000041 	andeq	r0, r0, r1, asr #32
     78c:	00008540 	andeq	r8, r0, r0, asr #10
     790:	00000008 	andeq	r0, r0, r8
     794:	1b009c01 	blne	277a0 <__bss_end+0x1b7a0>
     798:	04000001 	streq	r0, [r0], #-1
     79c:	0003fd00 	andeq	pc, r3, r0, lsl #26
     7a0:	53010400 	movwpl	r0, #5120	; 0x1400
     7a4:	01000000 	mrseq	r0, (UNDEF: 0)
     7a8:	000002e8 	andeq	r0, r0, r8, ror #5
     7ac:	00000181 	andeq	r0, r0, r1, lsl #3
     7b0:	00008548 	andeq	r8, r0, r8, asr #10
     7b4:	00000014 	andeq	r0, r0, r4, lsl r0
     7b8:	00000299 	muleq	r0, r9, r2
     7bc:	f2080102 	vrhadd.s8	d0, d8, d2
     7c0:	02000000 	andeq	r0, r0, #0
     7c4:	01500502 	cmpeq	r0, r2, lsl #10
     7c8:	04030000 	streq	r0, [r3], #-0
     7cc:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     7d0:	05080200 	streq	r0, [r8, #-512]	; 0x200
     7d4:	00000000 	andeq	r0, r0, r0
     7d8:	0000e104 	andeq	lr, r0, r4, lsl #2
     7dc:	4c160200 	lfmmi	f0, 4, [r6], {-0}
     7e0:	02000000 	andeq	r0, r0, #0
     7e4:	00e90801 	rsceq	r0, r9, r1, lsl #16
     7e8:	13040000 	movwne	r0, #16384	; 0x4000
     7ec:	02000003 	andeq	r0, r0, #3
     7f0:	00005e18 	andeq	r5, r0, r8, lsl lr
     7f4:	07020200 	streq	r0, [r2, -r0, lsl #4]
     7f8:	0000012b 	andeq	r0, r0, fp, lsr #2
     7fc:	3d070402 	cfstrscc	mvf0, [r7, #-8]
     800:	02000000 	andeq	r0, r0, #0
     804:	00330708 	eorseq	r0, r3, r8, lsl #14
     808:	d3050000 	movwle	r0, #20480	; 0x5000
     80c:	01000002 	tsteq	r0, r2
     810:	0085480d 	addeq	r4, r5, sp, lsl #16
     814:	00000400 	andeq	r0, r0, r0, lsl #8
     818:	969c0100 	ldrls	r0, [ip], r0, lsl #2
     81c:	06000000 	streq	r0, [r0], -r0
     820:	006b6c63 	rsbeq	r6, fp, r3, ror #24
     824:	00530d01 	subseq	r0, r3, r1, lsl #26
     828:	50010000 	andpl	r0, r1, r0
     82c:	031c0700 	tsteq	ip, #0, 14
     830:	11010000 	mrsne	r0, (UNDEF: 1)
     834:	00000041 	andeq	r0, r0, r1, asr #32
     838:	0000854c 	andeq	r8, r0, ip, asr #10
     83c:	00000008 	andeq	r0, r0, r8
     840:	00d99c01 	sbcseq	r9, r9, r1, lsl #24
     844:	62080000 	andvs	r0, r8, #0
     848:	01006675 	tsteq	r0, r5, ror r6
     84c:	0000d911 	andeq	sp, r0, r1, lsl r9
     850:	0003e300 	andeq	lr, r3, r0, lsl #6
     854:	656c0600 	strbvs	r0, [ip, #-1536]!	; 0x600
     858:	1101006e 	tstne	r1, lr, rrx
     85c:	00000053 	andeq	r0, r0, r3, asr r0
     860:	e3095101 	movw	r5, #37121	; 0x9101
     864:	01000002 	tsteq	r0, r2
     868:	00004111 	andeq	r4, r0, r1, lsl r1
     86c:	00520100 	subseq	r0, r2, r0, lsl #2
     870:	0041040a 	subeq	r0, r1, sl, lsl #8
     874:	030b0000 	movweq	r0, #45056	; 0xb000
     878:	01000003 	tsteq	r0, r3
     87c:	00004115 	andeq	r4, r0, r5, lsl r1
     880:	00855400 	addeq	r5, r5, r0, lsl #8
     884:	00000800 	andeq	r0, r0, r0, lsl #16
     888:	089c0100 	ldmeq	ip, {r8}
     88c:	00667562 	rsbeq	r7, r6, r2, ror #10
     890:	00d91501 	sbcseq	r1, r9, r1, lsl #10
     894:	04040000 	streq	r0, [r4], #-0
     898:	6c060000 	stcvs	0, cr0, [r6], {-0}
     89c:	01006e65 	tsteq	r0, r5, ror #28
     8a0:	00005315 	andeq	r5, r0, r5, lsl r3
     8a4:	09510100 	ldmdbeq	r1, {r8}^
     8a8:	000002e3 	andeq	r0, r0, r3, ror #5
     8ac:	00411501 	subeq	r1, r1, r1, lsl #10
     8b0:	52010000 	andpl	r0, r1, #0
     8b4:	00a60000 	adceq	r0, r6, r0
     8b8:	00040000 	andeq	r0, r4, r0
     8bc:	000004ba 			; <UNDEFINED> instruction: 0x000004ba
     8c0:	00530104 	subseq	r0, r3, r4, lsl #2
     8c4:	35010000 	strcc	r0, [r1, #-0]
     8c8:	81000003 	tsthi	r0, r3
     8cc:	5c000001 	stcpl	0, cr0, [r0], {1}
     8d0:	0c000085 	stceq	0, cr0, [r0], {133}	; 0x85
     8d4:	04000000 	streq	r0, [r0], #-0
     8d8:	02000003 	andeq	r0, r0, #3
     8dc:	00f20801 	rscseq	r0, r2, r1, lsl #16
     8e0:	02020000 	andeq	r0, r2, #0
     8e4:	00015005 	andeq	r5, r1, r5
     8e8:	05040300 	streq	r0, [r4, #-768]	; 0x300
     8ec:	00746e69 	rsbseq	r6, r4, r9, ror #28
     8f0:	00050802 	andeq	r0, r5, r2, lsl #16
     8f4:	04000000 	streq	r0, [r0], #-0
     8f8:	000000e1 	andeq	r0, r0, r1, ror #1
     8fc:	004c1602 	subeq	r1, ip, r2, lsl #12
     900:	01020000 	mrseq	r0, (UNDEF: 2)
     904:	0000e908 	andeq	lr, r0, r8, lsl #18
     908:	03130400 	tsteq	r3, #0, 8
     90c:	18020000 	stmdane	r2, {}	; <UNPREDICTABLE>
     910:	0000005e 	andeq	r0, r0, lr, asr r0
     914:	2b070202 	blcs	1c1124 <__end+0x94124>
     918:	02000001 	andeq	r0, r0, #1
     91c:	003d0704 	eorseq	r0, sp, r4, lsl #14
     920:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     924:	00003307 	andeq	r3, r0, r7, lsl #6
     928:	035d0500 	cmpeq	sp, #0, 10
     92c:	0d010000 	stceq	0, cr0, [r1, #-0]
     930:	0000855c 	andeq	r8, r0, ip, asr r5
     934:	00000004 	andeq	r0, r0, r4
     938:	54069c01 	strpl	r9, [r6], #-3073	; 0xc01
     93c:	01000003 	tsteq	r0, r3
     940:	00005311 	andeq	r5, r0, r1, lsl r3
     944:	00856000 	addeq	r6, r5, r0
     948:	00000800 	andeq	r0, r0, r0, lsl #16
     94c:	079c0100 	ldreq	r0, [ip, r0, lsl #2]
     950:	0000032d 	andeq	r0, r0, sp, lsr #6
     954:	00411101 	subeq	r1, r1, r1, lsl #2
     958:	04250000 	strteq	r0, [r5], #-0
     95c:	00000000 	andeq	r0, r0, r0
     960:	00000216 	andeq	r0, r0, r6, lsl r2
     964:	05320004 	ldreq	r0, [r2, #-4]!
     968:	01040000 	mrseq	r0, (UNDEF: 4)
     96c:	00000053 	andeq	r0, r0, r3, asr r0
     970:	0003a801 	andeq	sl, r3, r1, lsl #16
     974:	00018100 	andeq	r8, r1, r0, lsl #2
     978:	00856800 	addeq	r6, r5, r0, lsl #16
     97c:	00018000 	andeq	r8, r1, r0
     980:	00037100 	andeq	r7, r3, r0, lsl #2
     984:	08010200 	stmdaeq	r1, {r9}
     988:	000000f2 	strdeq	r0, [r0], -r2
     98c:	50050202 	andpl	r0, r5, r2, lsl #4
     990:	03000001 	movweq	r0, #1
     994:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     998:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
     99c:	00000005 	andeq	r0, r0, r5
     9a0:	00e10400 	rsceq	r0, r1, r0, lsl #8
     9a4:	16020000 	strne	r0, [r2], -r0
     9a8:	0000004c 	andeq	r0, r0, ip, asr #32
     9ac:	e9080102 	stmdb	r8, {r1, r8}
     9b0:	02000000 	andeq	r0, r0, #0
     9b4:	012b0702 	teqeq	fp, r2, lsl #14
     9b8:	1c040000 	stcne	0, cr0, [r4], {-0}
     9bc:	02000000 	andeq	r0, r0, #0
     9c0:	0000651a 	andeq	r6, r0, sl, lsl r5
     9c4:	07040200 	streq	r0, [r4, -r0, lsl #4]
     9c8:	0000003d 	andeq	r0, r0, sp, lsr r0
     9cc:	33070802 	movwcc	r0, #30722	; 0x7802
     9d0:	05000000 	streq	r0, [r0, #-0]
     9d4:	000003c4 	andeq	r0, r0, r4, asr #7
     9d8:	85683601 	strbhi	r3, [r8, #-1537]!	; 0x601
     9dc:	00200000 	eoreq	r0, r0, r0
     9e0:	9c010000 	stcls	0, cr0, [r1], {-0}
     9e4:	00000098 	muleq	r0, r8, r0
     9e8:	0003a206 	andeq	sl, r3, r6, lsl #4
     9ec:	65360100 	ldrvs	r0, [r6, #-256]!	; 0x100
     9f0:	46000000 	strmi	r0, [r0], -r0
     9f4:	00000004 	andeq	r0, r0, r4
     9f8:	00038205 	andeq	r8, r3, r5, lsl #4
     9fc:	883c0100 	ldmdahi	ip!, {r8}
     a00:	74000085 	strvc	r0, [r0], #-133	; 0x85
     a04:	01000000 	mrseq	r0, (UNDEF: 0)
     a08:	00014c9c 	muleq	r1, ip, ip
     a0c:	03660600 	cmneq	r6, #0, 12
     a10:	3c010000 	stccc	0, cr0, [r1], {-0}
     a14:	0000005a 	andeq	r0, r0, sl, asr r0
     a18:	00000464 	andeq	r0, r0, r4, ror #8
     a1c:	6b6c6307 	blvs	1b19640 <__user_program+0x1819640>
     a20:	5a3c0100 	bpl	f00e28 <__user_program+0xc00e28>
     a24:	85000000 	strhi	r0, [r0, #-0]
     a28:	08000004 	stmdaeq	r0, {r2}
     a2c:	00726176 	rsbseq	r6, r2, r6, ror r1
     a30:	00653d01 	rsbeq	r3, r5, r1, lsl #26
     a34:	04a30000 	strteq	r0, [r3], #0
     a38:	9c090000 	stcls	0, cr0, [r9], {-0}
     a3c:	07000085 	streq	r0, [r0, -r5, lsl #1]
     a40:	f2000002 	vhadd.s8	d0, d0, d2
     a44:	0a000000 	beq	a4c <__start-0x75b4>
     a48:	34015101 	strcc	r5, [r1], #-257	; 0x101
     a4c:	0150010a 	cmpeq	r0, sl, lsl #2
     a50:	a8090037 	stmdage	r9, {r0, r1, r2, r4, r5}
     a54:	07000085 	streq	r0, [r0, -r5, lsl #1]
     a58:	0a000002 	beq	a68 <__start-0x7598>
     a5c:	0a000001 	beq	a68 <__start-0x7598>
     a60:	34015101 	strcc	r5, [r1], #-257	; 0x101
     a64:	0150010a 	cmpeq	r0, sl, lsl #2
     a68:	b4090038 	strlt	r0, [r9], #-56	; 0x38
     a6c:	07000085 	streq	r0, [r0, -r5, lsl #1]
     a70:	22000002 	andcs	r0, r0, #2
     a74:	0a000001 	beq	a80 <__start-0x7580>
     a78:	34015101 	strcc	r5, [r1], #-257	; 0x101
     a7c:	0150010a 	cmpeq	r0, sl, lsl #2
     a80:	c009003a 	andgt	r0, r9, sl, lsr r0
     a84:	07000085 	streq	r0, [r0, -r5, lsl #1]
     a88:	3a000002 	bcc	a98 <__start-0x7568>
     a8c:	0a000001 	beq	a98 <__start-0x7568>
     a90:	34015101 	strcc	r5, [r1], #-257	; 0x101
     a94:	0150010a 	cmpeq	r0, sl, lsl #2
     a98:	f80b003b 			; <UNDEFINED> instruction: 0xf80b003b
     a9c:	73000085 	movwvc	r0, #133	; 0x85
     aa0:	0a000000 	beq	aa8 <__start-0x7558>
     aa4:	0a035001 	beq	d4ab0 <__bss_end+0xc8ab0>
     aa8:	00002710 	andeq	r2, r0, r0, lsl r7
     aac:	00036b05 	andeq	r6, r3, r5, lsl #22
     ab0:	fc5f0100 	mrrc2	1, 0, r0, pc, cr0	; <UNPREDICTABLE>
     ab4:	34000085 	strcc	r0, [r0], #-133	; 0x85
     ab8:	01000000 	mrseq	r0, (UNDEF: 0)
     abc:	00018b9c 	muleq	r1, ip, fp
     ac0:	039a0c00 	orrseq	r0, sl, #0, 24
     ac4:	5f010000 	svcpl	0x00010000
     ac8:	00000041 	andeq	r0, r0, r1, asr #32
     acc:	630d5001 	movwvs	r5, #53249	; 0xd001
     ad0:	01006b6c 	tsteq	r0, ip, ror #22
     ad4:	00005a5f 	andeq	r5, r0, pc, asr sl
     ad8:	08510100 	ldmdaeq	r1, {r8}^
     adc:	00726176 	rsbseq	r6, r2, r6, ror r1
     ae0:	00656001 	rsbeq	r6, r5, r1
     ae4:	04c60000 	strbeq	r0, [r6], #0
     ae8:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     aec:	00000392 	muleq	r0, r2, r3
     af0:	86308301 	ldrthi	r8, [r0], -r1, lsl #6
     af4:	00180000 	andseq	r0, r8, r0
     af8:	9c010000 	stcls	0, cr0, [r1], {-0}
     afc:	0003750f 	andeq	r7, r3, pc, lsl #10
     b00:	41890100 	orrmi	r0, r9, r0, lsl #2
     b04:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
     b08:	a0000086 	andge	r0, r0, r6, lsl #1
     b0c:	01000000 	mrseq	r0, (UNDEF: 0)
     b10:	0002079c 	muleq	r2, ip, r7
     b14:	03d40600 	bicseq	r0, r4, #0, 12
     b18:	89010000 	stmdbhi	r1, {}	; <UNPREDICTABLE>
     b1c:	00000041 	andeq	r0, r0, r1, asr #32
     b20:	000004e9 	andeq	r0, r0, r9, ror #9
     b24:	72617608 	rsbvc	r7, r1, #8, 12	; 0x800000
     b28:	658a0100 	strvs	r0, [sl, #256]	; 0x100
     b2c:	0a000000 	beq	b34 <__start-0x74cc>
     b30:	08000005 	stmdaeq	r0, {r0, r2}
     b34:	00746572 	rsbseq	r6, r4, r2, ror r5
     b38:	00658b01 	rsbeq	r8, r5, r1, lsl #22
     b3c:	05440000 	strbeq	r0, [r4, #-0]
     b40:	84090000 	strhi	r0, [r9], #-0
     b44:	73000086 	movwvc	r0, #134	; 0x86
     b48:	f6000000 			; <UNDEFINED> instruction: 0xf6000000
     b4c:	0a000001 	beq	b58 <__start-0x74a8>
     b50:	75025001 	strvc	r5, [r2, #-1]
     b54:	bc0b0000 	stclt	0, cr0, [fp], {-0}
     b58:	73000086 	movwvc	r0, #134	; 0x86
     b5c:	0a000000 	beq	b64 <__start-0x749c>
     b60:	75025001 	strvc	r5, [r2, #-1]
     b64:	10000000 	andne	r0, r0, r0
     b68:	00000144 	andeq	r0, r0, r4, asr #2
     b6c:	41113703 	tstmi	r1, r3, lsl #14
     b70:	11000000 	mrsne	r0, (UNDEF: 0)
     b74:	00000041 	andeq	r0, r0, r1, asr #32
     b78:	081a0000 	ldmdaeq	sl, {}	; <UNPREDICTABLE>
     b7c:	00040000 	andeq	r0, r4, r0
     b80:	0000063e 	andeq	r0, r0, lr, lsr r6
     b84:	00530104 	subseq	r0, r3, r4, lsl #2
     b88:	fc010000 	stc2	0, cr0, [r1], {-0}
     b8c:	81000003 	tsthi	r0, r3
     b90:	e8000001 	stmda	r0, {r0}
     b94:	9c000086 	stcls	0, cr0, [r0], {134}	; 0x86
     b98:	12000003 	andne	r0, r0, #3
     b9c:	02000004 	andeq	r0, r0, #4
     ba0:	00f20801 	rscseq	r0, r2, r1, lsl #16
     ba4:	02020000 	andeq	r0, r2, #0
     ba8:	00015005 	andeq	r5, r1, r5
     bac:	05040300 	streq	r0, [r4, #-768]	; 0x300
     bb0:	00746e69 	rsbseq	r6, r4, r9, ror #28
     bb4:	00050802 	andeq	r0, r5, r2, lsl #16
     bb8:	04000000 	streq	r0, [r0], #-0
     bbc:	000000e1 	andeq	r0, r0, r1, ror #1
     bc0:	004c1602 	subeq	r1, ip, r2, lsl #12
     bc4:	01020000 	mrseq	r0, (UNDEF: 2)
     bc8:	0000e908 	andeq	lr, r0, r8, lsl #18
     bcc:	07020200 	streq	r0, [r2, -r0, lsl #4]
     bd0:	0000012b 	andeq	r0, r0, fp, lsr #2
     bd4:	00001c04 	andeq	r1, r0, r4, lsl #24
     bd8:	651a0200 	ldrvs	r0, [sl, #-512]	; 0x200
     bdc:	02000000 	andeq	r0, r0, #0
     be0:	003d0704 	eorseq	r0, sp, r4, lsl #14
     be4:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     be8:	00003307 	andeq	r3, r0, r7, lsl #6
     bec:	03a20500 			; <UNDEFINED> instruction: 0x03a20500
     bf0:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
     bf4:	000086e8 	andeq	r8, r0, r8, ror #13
     bf8:	00000020 	andeq	r0, r0, r0, lsr #32
     bfc:	00989c01 	addseq	r9, r8, r1, lsl #24
     c00:	c3060000 	movwgt	r0, #24576	; 0x6000
     c04:	01000003 	tsteq	r0, r3
     c08:	00005a08 	andeq	r5, r0, r8, lsl #20
     c0c:	00056300 	andeq	r6, r5, r0, lsl #6
     c10:	ad070000 	stcge	0, cr0, [r7, #-0]
     c14:	01000001 	tsteq	r0, r1
     c18:	00004110 	andeq	r4, r0, r0, lsl r1
     c1c:	00870800 	addeq	r0, r7, r0, lsl #16
     c20:	00004400 	andeq	r4, r0, r0, lsl #8
     c24:	ee9c0100 	fmle	f0, f4, f0
     c28:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     c2c:	00776f72 	rsbseq	r6, r7, r2, ror pc
     c30:	005a1001 	subseq	r1, sl, r1
     c34:	05810000 	streq	r0, [r1]
     c38:	63080000 	movwvs	r0, #32768	; 0x8000
     c3c:	01006c6f 	tsteq	r0, pc, ror #24
     c40:	00005a10 	andeq	r5, r0, r0, lsl sl
     c44:	0005c800 	andeq	ip, r5, r0, lsl #16
     c48:	015a0900 	cmpeq	sl, r0, lsl #18
     c4c:	12010000 	andne	r0, r1, #0
     c50:	00000033 	andeq	r0, r0, r3, lsr r0
     c54:	00000612 	andeq	r0, r0, r2, lsl r6
     c58:	00041a09 	andeq	r1, r4, r9, lsl #20
     c5c:	33120100 	tstcc	r2, #0, 2
     c60:	46000000 	strmi	r0, [r0], -r0
     c64:	00000006 	andeq	r0, r0, r6
     c68:	0001da07 	andeq	sp, r1, r7, lsl #20
     c6c:	411c0100 	tstmi	ip, r0, lsl #2
     c70:	4c000000 	stcmi	0, cr0, [r0], {-0}
     c74:	44000087 	strmi	r0, [r0], #-135	; 0x87
     c78:	01000000 	mrseq	r0, (UNDEF: 0)
     c7c:	0001449c 	muleq	r1, ip, r4
     c80:	6f720800 	svcvs	0x00720800
     c84:	1c010077 	stcne	0, cr0, [r1], {119}	; 0x77
     c88:	0000005a 	andeq	r0, r0, sl, asr r0
     c8c:	00000659 	andeq	r0, r0, r9, asr r6
     c90:	6c6f6308 	stclvs	3, cr6, [pc], #-32	; c78 <__start-0x7388>
     c94:	5a1c0100 	bpl	70109c <__user_program+0x40109c>
     c98:	a0000000 	andge	r0, r0, r0
     c9c:	09000006 	stmdbeq	r0, {r1, r2}
     ca0:	0000015a 	andeq	r0, r0, sl, asr r1
     ca4:	00331e01 	eorseq	r1, r3, r1, lsl #28
     ca8:	06ea0000 	strbteq	r0, [sl], r0
     cac:	1a090000 	bne	240cb4 <__end+0x113cb4>
     cb0:	01000004 	tsteq	r0, r4
     cb4:	0000331e 	andeq	r3, r0, lr, lsl r3
     cb8:	00071e00 	andeq	r1, r7, r0, lsl #28
     cbc:	740a0000 	strvc	r0, [sl], #-0
     cc0:	01000001 	tsteq	r0, r1
     cc4:	00004129 	andeq	r4, r0, r9, lsr #2
     cc8:	00879000 	addeq	r9, r7, r0
     ccc:	00002400 	andeq	r2, r0, r0, lsl #8
     cd0:	6b9c0100 	blvs	fe7010d8 <__user_program+0xfe4010d8>
     cd4:	0b000001 	bleq	ce0 <__start-0x7320>
     cd8:	2b010069 	blcs	40e84 <__bss_end+0x34e84>
     cdc:	00000033 	andeq	r0, r0, r3, lsr r0
     ce0:	00000731 	andeq	r0, r0, r1, lsr r7
     ce4:	04470500 	strbeq	r0, [r7], #-1280	; 0x500
     ce8:	3f010000 	svccc	0x00010000
     cec:	000087b4 			; <UNDEFINED> instruction: 0x000087b4
     cf0:	00000034 	andeq	r0, r0, r4, lsr r0
     cf4:	01ee9c01 	mvneq	r9, r1, lsl #24
     cf8:	52060000 	andpl	r0, r6, #0
     cfc:	01000004 	tsteq	r0, r4
     d00:	00004c3f 	andeq	r4, r0, pc, lsr ip
     d04:	00075800 	andeq	r5, r7, r0, lsl #16
     d08:	87c40c00 	strbhi	r0, [r4, r0, lsl #24]
     d0c:	07a10000 	streq	r0, [r1, r0]!
     d10:	01a20000 			; <UNDEFINED> instruction: 0x01a20000
     d14:	010d0000 	mrseq	r0, (UNDEF: 13)
     d18:	00390150 	eorseq	r0, r9, r0, asr r1
     d1c:	0087cc0c 	addeq	ip, r7, ip, lsl #24
     d20:	00007300 	andeq	r7, r0, r0, lsl #6
     d24:	0001b700 	andeq	fp, r1, r0, lsl #14
     d28:	50010d00 	andpl	r0, r1, r0, lsl #26
     d2c:	03e80a03 	mvneq	r0, #12288	; 0x3000
     d30:	87d80c00 	ldrbhi	r0, [r8, r0, lsl #24]
     d34:	07b20000 	ldreq	r0, [r2, r0]!
     d38:	01d00000 	bicseq	r0, r0, r0
     d3c:	010d0000 	mrseq	r0, (UNDEF: 13)
     d40:	40080251 	andmi	r0, r8, r1, asr r2
     d44:	0150010d 	cmpeq	r0, sp, lsl #2
     d48:	e00c0030 	and	r0, ip, r0, lsr r0
     d4c:	c8000087 	stmdagt	r0, {r0, r1, r2, r7}
     d50:	e4000007 	str	r0, [r0], #-7
     d54:	0d000001 	stceq	0, cr0, [r0, #-4]
     d58:	74025001 	strvc	r5, [r2], #-1
     d5c:	e40e0000 	str	r0, [lr], #-0
     d60:	dd000087 	stcle	0, cr0, [r0, #-540]	; 0xfffffde4
     d64:	00000007 	andeq	r0, r0, r7
     d68:	0003c905 	andeq	ip, r3, r5, lsl #18
     d6c:	e8490100 	stmda	r9, {r8}^
     d70:	34000087 	strcc	r0, [r0], #-135	; 0x87
     d74:	01000000 	mrseq	r0, (UNDEF: 0)
     d78:	0002719c 	muleq	r2, ip, r1
     d7c:	03d40600 	bicseq	r0, r4, #0, 12
     d80:	49010000 	stmdbmi	r1, {}	; <UNPREDICTABLE>
     d84:	0000004c 	andeq	r0, r0, ip, asr #32
     d88:	00000779 	andeq	r0, r0, r9, ror r7
     d8c:	0087f80c 	addeq	pc, r7, ip, lsl #16
     d90:	0007e400 	andeq	lr, r7, r0, lsl #8
     d94:	00022500 	andeq	r2, r2, r0, lsl #10
     d98:	50010d00 	andpl	r0, r1, r0, lsl #26
     d9c:	0c003901 	stceq	9, cr3, [r0], {1}
     da0:	00008800 	andeq	r8, r0, r0, lsl #16
     da4:	00000073 	andeq	r0, r0, r3, ror r0
     da8:	0000023a 	andeq	r0, r0, sl, lsr r2
     dac:	0350010d 	cmpeq	r0, #1073741827	; 0x40000003
     db0:	0003e80a 	andeq	lr, r3, sl, lsl #16
     db4:	00880c0c 	addeq	r0, r8, ip, lsl #24
     db8:	0007b200 	andeq	fp, r7, r0, lsl #4
     dbc:	00025300 	andeq	r5, r2, r0, lsl #6
     dc0:	51010d00 	tstpl	r1, r0, lsl #26
     dc4:	0d200802 	stceq	8, cr0, [r0, #-8]!
     dc8:	30015001 	andcc	r5, r1, r1
     dcc:	88140c00 	ldmdahi	r4, {sl, fp}
     dd0:	07c80000 	strbeq	r0, [r8, r0]
     dd4:	02670000 	rsbeq	r0, r7, #0
     dd8:	010d0000 	mrseq	r0, (UNDEF: 13)
     ddc:	00740250 	rsbseq	r0, r4, r0, asr r2
     de0:	88180e00 	ldmdahi	r8, {r9, sl, fp}
     de4:	07dd0000 	ldrbeq	r0, [sp, r0]
     de8:	05000000 	streq	r0, [r0, #-0]
     dec:	0000045a 	andeq	r0, r0, sl, asr r4
     df0:	881c5201 	ldmdahi	ip, {r0, r9, ip, lr}
     df4:	00400000 	subeq	r0, r0, r0
     df8:	9c010000 	stcls	0, cr0, [r1], {-0}
     dfc:	000002f2 	strdeq	r0, [r0], -r2
     e00:	00882c0c 	addeq	r2, r8, ip, lsl #24
     e04:	0007f500 	andeq	pc, r7, r0, lsl #10
     e08:	00029e00 	andeq	r9, r2, r0, lsl #28
     e0c:	51010d00 	tstpl	r1, r0, lsl #26
     e10:	010d3101 	tsteq	sp, r1, lsl #2
     e14:	00400150 	subeq	r0, r0, r0, asr r1
     e18:	0088340c 	addeq	r3, r8, ip, lsl #8
     e1c:	0007e400 	andeq	lr, r7, r0, lsl #8
     e20:	0002b100 	andeq	fp, r2, r0, lsl #2
     e24:	50010d00 	andpl	r0, r1, r0, lsl #26
     e28:	0e004001 	cdpeq	0, 0, cr4, cr0, cr1, {0}
     e2c:	00008840 	andeq	r8, r0, r0, asr #16
     e30:	00000073 	andeq	r0, r0, r3, ror r0
     e34:	0088480c 	addeq	r4, r8, ip, lsl #16
     e38:	0007a100 	andeq	sl, r7, r0, lsl #2
     e3c:	0002cd00 	andeq	ip, r2, r0, lsl #26
     e40:	50010d00 	andpl	r0, r1, r0, lsl #26
     e44:	0c004001 	stceq	0, cr4, [r0], {1}
     e48:	00008850 	andeq	r8, r0, r0, asr r8
     e4c:	00000073 	andeq	r0, r0, r3, ror r0
     e50:	000002e2 	andeq	r0, r0, r2, ror #5
     e54:	0350010d 	cmpeq	r0, #1073741827	; 0x40000003
     e58:	00c3500a 	sbceq	r5, r3, sl
     e5c:	0088580f 	addeq	r5, r8, pc, lsl #16
     e60:	0007e400 	andeq	lr, r7, r0, lsl #8
     e64:	50010d00 	andpl	r0, r1, r0, lsl #26
     e68:	00004001 	andeq	r4, r0, r1
     e6c:	0001ed05 	andeq	lr, r1, r5, lsl #26
     e70:	5c710100 	ldfple	f0, [r1], #-0
     e74:	10000088 	andne	r0, r0, r8, lsl #1
     e78:	01000001 	tsteq	r0, r1
     e7c:	0005809c 	muleq	r5, ip, r0
     e80:	88640e00 	stmdahi	r4!, {r9, sl, fp}^
     e84:	02710000 	rsbseq	r0, r1, #0
     e88:	700c0000 	andvc	r0, ip, r0
     e8c:	f5000088 			; <UNDEFINED> instruction: 0xf5000088
     e90:	28000007 	stmdacs	r0, {r0, r1, r2}
     e94:	0d000003 	stceq	0, cr0, [r0, #-12]
     e98:	31015101 	tstcc	r1, r1, lsl #2
     e9c:	0150010d 	cmpeq	r0, sp, lsl #2
     ea0:	7c0c0040 	stcvc	0, cr0, [ip], {64}	; 0x40
     ea4:	f5000088 			; <UNDEFINED> instruction: 0xf5000088
     ea8:	40000007 	andmi	r0, r0, r7
     eac:	0d000003 	stceq	0, cr0, [r0, #-12]
     eb0:	31015101 	tstcc	r1, r1, lsl #2
     eb4:	0150010d 	cmpeq	r0, sp, lsl #2
     eb8:	840c0039 	strhi	r0, [ip], #-57	; 0x39
     ebc:	e4000088 	str	r0, [r0], #-136	; 0x88
     ec0:	53000007 	movwpl	r0, #7
     ec4:	0d000003 	stceq	0, cr0, [r0, #-12]
     ec8:	40015001 	andmi	r5, r1, r1
     ecc:	888c0c00 	stmhi	ip, {sl, fp}
     ed0:	07a10000 	streq	r0, [r1, r0]!
     ed4:	03660000 	cmneq	r6, #0
     ed8:	010d0000 	mrseq	r0, (UNDEF: 13)
     edc:	00390150 	eorseq	r0, r9, r0, asr r1
     ee0:	0088940c 	addeq	r9, r8, ip, lsl #8
     ee4:	00007300 	andeq	r7, r0, r0, lsl #6
     ee8:	00037b00 	andeq	r7, r3, r0, lsl #22
     eec:	50010d00 	andpl	r0, r1, r0, lsl #26
     ef0:	27100a03 	ldrcs	r0, [r0, -r3, lsl #20]
     ef4:	88a00c00 	stmiahi	r0!, {sl, fp}
     ef8:	080b0000 	stmdaeq	fp, {}	; <UNPREDICTABLE>
     efc:	03940000 	orrseq	r0, r4, #0
     f00:	010d0000 	mrseq	r0, (UNDEF: 13)
     f04:	20080251 	andcs	r0, r8, r1, asr r2
     f08:	0150010d 	cmpeq	r0, sp, lsl #2
     f0c:	a80c0030 	stmdage	ip, {r4, r5}
     f10:	6b000088 	blvs	1138 <__start-0x6ec8>
     f14:	a8000001 	stmdage	r0, {r0}
     f18:	0d000003 	stceq	0, cr0, [r0, #-12]
     f1c:	09025001 	stmdbeq	r2, {r0, ip, lr}
     f20:	b00c00ae 	andlt	r0, ip, lr, lsr #1
     f24:	6b000088 	blvs	114c <__start-0x6eb4>
     f28:	bc000001 	stclt	0, cr0, [r0], {1}
     f2c:	0d000003 	stceq	0, cr0, [r0, #-12]
     f30:	09025001 	stmdbeq	r2, {r0, ip, lr}
     f34:	b80c00d5 	stmdalt	ip, {r0, r2, r4, r6, r7}
     f38:	6b000088 	blvs	1160 <__start-0x6ea0>
     f3c:	d0000001 	andle	r0, r0, r1
     f40:	0d000003 	stceq	0, cr0, [r0, #-12]
     f44:	09025001 	stmdbeq	r2, {r0, ip, lr}
     f48:	c00c0080 	andgt	r0, ip, r0, lsl #1
     f4c:	6b000088 	blvs	1174 <__start-0x6e8c>
     f50:	e4000001 	str	r0, [r0], #-1
     f54:	0d000003 	stceq	0, cr0, [r0, #-12]
     f58:	09025001 	stmdbeq	r2, {r0, ip, lr}
     f5c:	c80c00a8 	stmdagt	ip, {r3, r5, r7}
     f60:	6b000088 	blvs	1188 <__start-0x6e78>
     f64:	f7000001 			; <UNDEFINED> instruction: 0xf7000001
     f68:	0d000003 	stceq	0, cr0, [r0, #-12]
     f6c:	4f015001 	svcmi	0x00015001
     f70:	88d00c00 	ldmhi	r0, {sl, fp}^
     f74:	016b0000 	cmneq	fp, r0
     f78:	040b0000 	streq	r0, [fp], #-0
     f7c:	010d0000 	mrseq	r0, (UNDEF: 13)
     f80:	d3090250 	movwle	r0, #37456	; 0x9250
     f84:	88d80c00 	ldmhi	r8, {sl, fp}^
     f88:	016b0000 	cmneq	fp, r0
     f8c:	041e0000 	ldreq	r0, [lr], #-0
     f90:	010d0000 	mrseq	r0, (UNDEF: 13)
     f94:	00300150 	eorseq	r0, r0, r0, asr r1
     f98:	0088e00c 	addeq	lr, r8, ip
     f9c:	00016b00 	andeq	r6, r1, r0, lsl #22
     fa0:	00043200 	andeq	r3, r4, r0, lsl #4
     fa4:	50010d00 	andpl	r0, r1, r0, lsl #26
     fa8:	00400802 	subeq	r0, r0, r2, lsl #16
     fac:	0088e80c 	addeq	lr, r8, ip, lsl #16
     fb0:	00016b00 	andeq	r6, r1, r0, lsl #22
     fb4:	00044600 	andeq	r4, r4, r0, lsl #12
     fb8:	50010d00 	andpl	r0, r1, r0, lsl #26
     fbc:	008d0902 	addeq	r0, sp, r2, lsl #18
     fc0:	0088f00c 	addeq	pc, r8, ip
     fc4:	00016b00 	andeq	r6, r1, r0, lsl #22
     fc8:	00045900 	andeq	r5, r4, r0, lsl #18
     fcc:	50010d00 	andpl	r0, r1, r0, lsl #26
     fd0:	0c004401 	cfstrseq	mvf4, [r0], {1}
     fd4:	000088f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
     fd8:	0000016b 	andeq	r0, r0, fp, ror #2
     fdc:	0000046d 	andeq	r0, r0, sp, ror #8
     fe0:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     fe4:	0c002008 	stceq	0, cr2, [r0], {8}
     fe8:	00008900 	andeq	r8, r0, r0, lsl #18
     fec:	0000016b 	andeq	r0, r0, fp, ror #2
     ff0:	00000480 	andeq	r0, r0, r0, lsl #9
     ff4:	0150010d 	cmpeq	r0, sp, lsl #2
     ff8:	080c0030 	stmdaeq	ip, {r4, r5}
     ffc:	6b000089 	blvs	1228 <__start-0x6dd8>
    1000:	94000001 	strls	r0, [r0], #-1
    1004:	0d000004 	stceq	0, cr0, [r0, #-16]
    1008:	09025001 	stmdbeq	r2, {r0, ip, lr}
    100c:	100c00a1 	andne	r0, ip, r1, lsr #1
    1010:	6b000089 	blvs	123c <__start-0x6dc4>
    1014:	a8000001 	stmdage	r0, {r0}
    1018:	0d000004 	stceq	0, cr0, [r0, #-16]
    101c:	09025001 	stmdbeq	r2, {r0, ip, lr}
    1020:	180c00c8 	stmdane	ip, {r3, r6, r7}
    1024:	6b000089 	blvs	1250 <__start-0x6db0>
    1028:	bc000001 	stclt	0, cr0, [r0], {1}
    102c:	0d000004 	stceq	0, cr0, [r0, #-16]
    1030:	09025001 	stmdbeq	r2, {r0, ip, lr}
    1034:	200c00da 	ldrdcs	r0, [ip], -sl
    1038:	6b000089 	blvs	1264 <__start-0x6d9c>
    103c:	cf000001 	svcgt	0x00000001
    1040:	0d000004 	stceq	0, cr0, [r0, #-16]
    1044:	32015001 	andcc	r5, r1, #1
    1048:	89280c00 	stmdbhi	r8!, {sl, fp}
    104c:	016b0000 	cmneq	fp, r0
    1050:	04e30000 	strbteq	r0, [r3], #0
    1054:	010d0000 	mrseq	r0, (UNDEF: 13)
    1058:	81090250 	tsthi	r9, r0, asr r2
    105c:	89300c00 	ldmdbhi	r0!, {sl, fp}
    1060:	016b0000 	cmneq	fp, r0
    1064:	04f70000 	ldrbteq	r0, [r7], #0
    1068:	010d0000 	mrseq	r0, (UNDEF: 13)
    106c:	8f090250 	svchi	0x00090250
    1070:	89380c00 	ldmdbhi	r8!, {sl, fp}
    1074:	016b0000 	cmneq	fp, r0
    1078:	050b0000 	streq	r0, [fp, #-0]
    107c:	010d0000 	mrseq	r0, (UNDEF: 13)
    1080:	d9090250 	stmdble	r9, {r4, r6, r9}
    1084:	89400c00 	stmdbhi	r0, {sl, fp}^
    1088:	016b0000 	cmneq	fp, r0
    108c:	051f0000 	ldreq	r0, [pc, #-0]	; 1094 <__start-0x6f6c>
    1090:	010d0000 	mrseq	r0, (UNDEF: 13)
    1094:	f1090250 			; <UNDEFINED> instruction: 0xf1090250
    1098:	89480c00 	stmdbhi	r8, {sl, fp}^
    109c:	016b0000 	cmneq	fp, r0
    10a0:	05330000 	ldreq	r0, [r3, #-0]!
    10a4:	010d0000 	mrseq	r0, (UNDEF: 13)
    10a8:	db090250 	blle	2419f0 <__end+0x1149f0>
    10ac:	89500c00 	ldmdbhi	r0, {sl, fp}^
    10b0:	016b0000 	cmneq	fp, r0
    10b4:	05470000 	strbeq	r0, [r7, #-0]
    10b8:	010d0000 	mrseq	r0, (UNDEF: 13)
    10bc:	40080250 	andmi	r0, r8, r0, asr r2
    10c0:	89580c00 	ldmdbhi	r8, {sl, fp}^
    10c4:	016b0000 	cmneq	fp, r0
    10c8:	055b0000 	ldrbeq	r0, [fp, #-0]
    10cc:	010d0000 	mrseq	r0, (UNDEF: 13)
    10d0:	a4090250 	strge	r0, [r9], #-592	; 0x250
    10d4:	89600c00 	stmdbhi	r0!, {sl, fp}^
    10d8:	016b0000 	cmneq	fp, r0
    10dc:	056f0000 	strbeq	r0, [pc, #-0]!	; 10e4 <__start-0x6f1c>
    10e0:	010d0000 	mrseq	r0, (UNDEF: 13)
    10e4:	a6090250 			; <UNDEFINED> instruction: 0xa6090250
    10e8:	89680f00 	stmdbhi	r8!, {r8, r9, sl, fp}^
    10ec:	016b0000 	cmneq	fp, r0
    10f0:	010d0000 	mrseq	r0, (UNDEF: 13)
    10f4:	af090250 	svcge	0x00090250
    10f8:	33050000 	movwcc	r0, #20480	; 0x5000
    10fc:	01000004 	tsteq	r0, r4
    1100:	00896c97 	umulleq	r6, r9, r7, ip
    1104:	00003800 	andeq	r3, r0, r0, lsl #16
    1108:	079c0100 	ldreq	r0, [ip, r0, lsl #2]
    110c:	0c000006 	stceq	0, cr0, [r0], {6}
    1110:	00008978 	andeq	r8, r0, r8, ror r9
    1114:	0000016b 	andeq	r0, r0, fp, ror #2
    1118:	000005a9 	andeq	r0, r0, r9, lsr #11
    111c:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
    1120:	0c002108 	stfeqs	f2, [r0], {8}
    1124:	00008980 	andeq	r8, r0, r0, lsl #19
    1128:	0000016b 	andeq	r0, r0, fp, ror #2
    112c:	000005bc 			; <UNDEFINED> instruction: 0x000005bc
    1130:	0150010d 	cmpeq	r0, sp, lsl #2
    1134:	880c0030 	stmdahi	ip, {r4, r5}
    1138:	6b000089 	blvs	1364 <__start-0x6c9c>
    113c:	d0000001 	andle	r0, r0, r1
    1140:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    1144:	08025001 	stmdaeq	r2, {r0, ip, lr}
    1148:	900c007f 	andls	r0, ip, pc, ror r0
    114c:	6b000089 	blvs	1378 <__start-0x6c88>
    1150:	e4000001 	str	r0, [r0], #-1
    1154:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    1158:	08025001 	stmdaeq	r2, {r0, ip, lr}
    115c:	980c0022 	stmdals	ip, {r1, r5}
    1160:	6b000089 	blvs	138c <__start-0x6c74>
    1164:	f7000001 			; <UNDEFINED> instruction: 0xf7000001
    1168:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    116c:	30015001 	andcc	r5, r1, r1
    1170:	89a00f00 	stmibhi	r0!, {r8, r9, sl, fp}
    1174:	016b0000 	cmneq	fp, r0
    1178:	010d0000 	mrseq	r0, (UNDEF: 13)
    117c:	00330150 	eorseq	r0, r3, r0, asr r1
    1180:	01cc0a00 	biceq	r0, ip, r0, lsl #20
    1184:	30010000 	andcc	r0, r1, r0
    1188:	00000041 	andeq	r0, r0, r1, asr #32
    118c:	000089a4 	andeq	r8, r0, r4, lsr #19
    1190:	00000044 	andeq	r0, r0, r4, asr #32
    1194:	06779c01 	ldrbteq	r9, [r7], -r1, lsl #24
    1198:	1a090000 	bne	2411a0 <__end+0x1141a0>
    119c:	01000004 	tsteq	r0, r4
    11a0:	00003332 	andeq	r3, r0, r2, lsr r3
    11a4:	00079a00 	andeq	r9, r7, r0, lsl #20
    11a8:	89ac0e00 	stmibhi	ip!, {r9, sl, fp}
    11ac:	05800000 	streq	r0, [r0]
    11b0:	b40c0000 	strlt	r0, [ip], #-0
    11b4:	e4000089 	str	r0, [r0], #-137	; 0x89
    11b8:	4b000007 	blmi	11dc <__start-0x6e24>
    11bc:	0d000006 	stceq	0, cr0, [r0, #-24]	; 0xffffffe8
    11c0:	39015001 	stmdbcc	r1, {r0, ip, lr}
    11c4:	89c00c00 	stmibhi	r0, {sl, fp}^
    11c8:	07b20000 	ldreq	r0, [r2, r0]!
    11cc:	06640000 	strbteq	r0, [r4], -r0
    11d0:	010d0000 	mrseq	r0, (UNDEF: 13)
    11d4:	20080251 	andcs	r0, r8, r1, asr r2
    11d8:	0150010d 	cmpeq	r0, sp, lsl #2
    11dc:	d00e0030 	andle	r0, lr, r0, lsr r0
    11e0:	c8000089 	stmdagt	r0, {r0, r3, r7}
    11e4:	0e000007 	cdpeq	0, 0, cr0, cr0, cr7, {0}
    11e8:	000089dc 	ldrdeq	r8, [r0], -ip
    11ec:	000007dd 	ldrdeq	r0, [r0], -sp
    11f0:	03d90500 	bicseq	r0, r9, #0, 10
    11f4:	5b010000 	blpl	411fc <__bss_end+0x351fc>
    11f8:	000089e8 	andeq	r8, r0, r8, ror #19
    11fc:	00000060 	andeq	r0, r0, r0, rrx
    1200:	06f29c01 	ldrbteq	r9, [r2], r1, lsl #24
    1204:	690b0000 	stmdbvs	fp, {}	; <UNPREDICTABLE>
    1208:	335c0100 	cmpcc	ip, #0, 2
    120c:	e7000000 	str	r0, [r0, -r0]
    1210:	10000007 	andne	r0, r0, r7
    1214:	00746e63 	rsbseq	r6, r4, r3, ror #28
    1218:	00335d01 	eorseq	r5, r3, r1, lsl #26
    121c:	03050000 	movweq	r0, #20480	; 0x5000
    1220:	0000b000 	andeq	fp, r0, r0
    1224:	0089f00e 	addeq	pc, r9, lr
    1228:	00058000 	andeq	r8, r5, r0
    122c:	89f80c00 	ldmibhi	r8!, {sl, fp}^
    1230:	07e40000 	strbeq	r0, [r4, r0]!
    1234:	06c60000 	strbeq	r0, [r6], r0
    1238:	010d0000 	mrseq	r0, (UNDEF: 13)
    123c:	00390150 	eorseq	r0, r9, r0, asr r1
    1240:	008a040c 	addeq	r0, sl, ip, lsl #8
    1244:	0007b200 	andeq	fp, r7, r0, lsl #4
    1248:	0006df00 	andeq	sp, r6, r0, lsl #30
    124c:	51010d00 	tstpl	r1, r0, lsl #26
    1250:	0d200802 	stceq	8, cr0, [r0, #-8]!
    1254:	30015001 	andcc	r5, r1, r1
    1258:	8a240e00 	bhi	904a60 <__user_program+0x604a60>
    125c:	07c80000 	strbeq	r0, [r8, r0]
    1260:	300e0000 	andcc	r0, lr, r0
    1264:	dd00008a 	stcle	0, cr0, [r0, #-552]	; 0xfffffdd8
    1268:	00000007 	andeq	r0, r0, r7
    126c:	0003ea05 	andeq	lr, r3, r5, lsl #20
    1270:	48670100 	stmdami	r7!, {r8}^
    1274:	3c00008a 	stccc	0, cr0, [r0], {138}	; 0x8a
    1278:	01000000 	mrseq	r0, (UNDEF: 0)
    127c:	0007679c 	muleq	r7, ip, r7
    1280:	00690b00 	rsbeq	r0, r9, r0, lsl #22
    1284:	00336801 	eorseq	r6, r3, r1, lsl #16
    1288:	082e0000 	stmdaeq	lr!, {}	; <UNPREDICTABLE>
    128c:	500e0000 	andpl	r0, lr, r0
    1290:	8000008a 	andhi	r0, r0, sl, lsl #1
    1294:	0c000005 	stceq	0, cr0, [r0], {5}
    1298:	00008a58 	andeq	r8, r0, r8, asr sl
    129c:	000007e4 	andeq	r0, r0, r4, ror #15
    12a0:	00000730 	andeq	r0, r0, r0, lsr r7
    12a4:	0150010d 	cmpeq	r0, sp, lsl #2
    12a8:	640c0039 	strvs	r0, [ip], #-57	; 0x39
    12ac:	b200008a 	andlt	r0, r0, #138	; 0x8a
    12b0:	49000007 	stmdbmi	r0, {r0, r1, r2}
    12b4:	0d000007 	stceq	0, cr0, [r0, #-28]	; 0xffffffe4
    12b8:	08025101 	stmdaeq	r2, {r0, r8, ip, lr}
    12bc:	50010d20 	andpl	r0, r1, r0, lsr #26
    12c0:	0c003001 	stceq	0, cr3, [r0], {1}
    12c4:	00008a74 	andeq	r8, r0, r4, ror sl
    12c8:	000007c8 	andeq	r0, r0, r8, asr #15
    12cc:	0000075d 	andeq	r0, r0, sp, asr r7
    12d0:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
    12d4:	0e000075 	mcreq	0, 0, r0, cr0, cr5, {3}
    12d8:	00008a80 	andeq	r8, r0, r0, lsl #21
    12dc:	000007dd 	ldrdeq	r0, [r0], -sp
    12e0:	6e631100 	powvss	f1, f3, f0
    12e4:	06010074 			; <UNDEFINED> instruction: 0x06010074
    12e8:	00000041 	andeq	r0, r0, r1, asr #32
    12ec:	a0000305 	andge	r0, r0, r5, lsl #6
    12f0:	41120000 	tstmi	r2, r0
    12f4:	89000000 	stmdbhi	r0, {}	; <UNPREDICTABLE>
    12f8:	13000007 	movwne	r0, #7
    12fc:	00000789 	andeq	r0, r0, r9, lsl #15
    1300:	020001ff 	andeq	r0, r0, #-1073741761	; 0xc000003f
    1304:	02860704 	addeq	r0, r6, #4, 14	; 0x100000
    1308:	20140000 	andscs	r0, r4, r0
    130c:	01000004 	tsteq	r0, r4
    1310:	0007780e 	andeq	r7, r7, lr, lsl #16
    1314:	04030500 	streq	r0, [r3], #-1280	; 0x500
    1318:	150000b0 	strne	r0, [r0, #-176]	; 0xb0
    131c:	0000004a 	andeq	r0, r0, sl, asr #32
    1320:	07b24303 	ldreq	r4, [r2, r3, lsl #6]!
    1324:	41160000 	tstmi	r6, r0
    1328:	00000000 	andeq	r0, r0, r0
    132c:	00036b15 	andeq	r6, r3, r5, lsl fp
    1330:	c8740400 	ldmdagt	r4!, {sl}^
    1334:	16000007 	strne	r0, [r0], -r7
    1338:	00000041 	andeq	r0, r0, r1, asr #32
    133c:	00005a16 	andeq	r5, r0, r6, lsl sl
    1340:	75170000 	ldrvc	r0, [r7, #-0]
    1344:	04000003 	streq	r0, [r0], #-3
    1348:	00004182 	andeq	r4, r0, r2, lsl #3
    134c:	0007dd00 	andeq	sp, r7, r0, lsl #26
    1350:	00411600 	subeq	r1, r1, r0, lsl #12
    1354:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    1358:	00000392 	muleq	r0, r2, r3
    135c:	2a157a04 	bcs	55fb74 <__user_program+0x25fb74>
    1360:	03000000 	movweq	r0, #0
    1364:	0007f53d 	andeq	pc, r7, sp, lsr r5	; <UNPREDICTABLE>
    1368:	00411600 	subeq	r1, r1, r0, lsl #12
    136c:	15000000 	strne	r0, [r0, #-0]
    1370:	00000144 	andeq	r0, r0, r4, asr #2
    1374:	080b3703 	stmdaeq	fp, {r0, r1, r8, r9, sl, ip, sp}
    1378:	41160000 	tstmi	r6, r0
    137c:	16000000 	strne	r0, [r0], -r0
    1380:	00000041 	andeq	r0, r0, r1, asr #32
    1384:	03821900 	orreq	r1, r2, #0, 18
    1388:	6e040000 	cdpvs	0, 0, cr0, cr4, cr0, {0}
    138c:	00005a16 	andeq	r5, r0, r6, lsl sl
    1390:	005a1600 	subseq	r1, sl, r0, lsl #12
    1394:	00000000 	andeq	r0, r0, r0
    1398:	0000005e 	andeq	r0, r0, lr, asr r0
    139c:	07c40002 	strbeq	r0, [r4, r2]
    13a0:	01040000 	mrseq	r0, (UNDEF: 4)
    13a4:	00000546 	andeq	r0, r0, r6, asr #10
    13a8:	00008000 	andeq	r8, r0, r0
    13ac:	00008054 	andeq	r8, r0, r4, asr r0
    13b0:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
    13b4:	2f6b6269 	svccs	0x006b6269
    13b8:	2f637273 	svccs	0x00637273
    13bc:	746f6f62 	strbtvc	r6, [pc], #-3938	; 13c4 <__start-0x6c3c>
    13c0:	2f00532e 	svccs	0x0000532e
    13c4:	2f746e6d 	svccs	0x00746e6d
    13c8:	73666768 	cmnvc	r6, #104, 14	; 0x1a00000
    13cc:	3934332f 	ldmdbcc	r4!, {r0, r1, r2, r3, r5, r8, r9, ip, sp}
    13d0:	3731662f 	ldrcc	r6, [r1, -pc, lsr #12]!
    13d4:	62616c2d 	rsbvs	r6, r1, #11520	; 0x2d00
    13d8:	61642d33 	cmnvs	r4, r3, lsr sp
    13dc:	6a646976 	bvs	191b9bc <__user_program+0x161b9bc>
    13e0:	73656d61 	cmnvc	r5, #6208	; 0x1840
    13e4:	646f632f 	strbtvs	r6, [pc], #-815	; 13ec <__start-0x6c14>
    13e8:	4e470065 	cdpmi	0, 4, cr0, cr7, cr5, {3}
    13ec:	53412055 	movtpl	r2, #4181	; 0x1055
    13f0:	322e3220 	eorcc	r3, lr, #32, 4
    13f4:	00302e34 	eorseq	r2, r0, r4, lsr lr
    13f8:	005d8001 	subseq	r8, sp, r1
    13fc:	00020000 	andeq	r0, r2, r0
    1400:	000007d8 	ldrdeq	r0, [r0], -r8
    1404:	059e0104 	ldreq	r0, [lr, #260]	; 0x104
    1408:	8a840000 	bhi	fe101410 <__user_program+0xfde01410>
    140c:	8ac80000 	bhi	ff201414 <__user_program+0xfef01414>
    1410:	34330000 	ldrtcc	r0, [r3], #-0
    1414:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
    1418:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
    141c:	72612f63 	rsbvc	r2, r1, #396	; 0x18c
    1420:	00532e6d 	subseq	r2, r3, sp, ror #28
    1424:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xd2f
    1428:	6667682f 	strbtvs	r6, [r7], -pc, lsr #16
    142c:	34332f73 	ldrtcc	r2, [r3], #-3955	; 0xf73
    1430:	31662f39 	cmncc	r6, r9, lsr pc
    1434:	616c2d37 	cmnvs	ip, r7, lsr sp
    1438:	642d3362 	strtvs	r3, [sp], #-866	; 0x362
    143c:	64697661 	strbtvs	r7, [r9], #-1633	; 0x661
    1440:	656d616a 	strbvs	r6, [sp, #-362]!	; 0x16a
    1444:	6f632f73 	svcvs	0x00632f73
    1448:	47006564 	strmi	r6, [r0, -r4, ror #10]
    144c:	4120554e 	teqmi	r0, lr, asr #10
    1450:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
    1454:	302e3432 	eorcc	r3, lr, r2, lsr r4
    1458:	Address 0x00001458 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <__end+0x1930ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	16030000 	strne	r0, [r3], -r0
  20:	3a0e0300 	bcc	380c28 <__user_program+0x80c28>
  24:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  28:	04000013 	streq	r0, [r0], #-19
  2c:	0b0b0024 	bleq	2c00c4 <__end+0x1930c4>
  30:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x1a187c>
  40:	1119270b 	tstne	r9, fp, lsl #14
  44:	40061201 	andmi	r1, r6, r1, lsl #4
  48:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  4c:	00001301 	andeq	r1, r0, r1, lsl #6
  50:	03000506 	movweq	r0, #1286	; 0x506
  54:	3b0b3a08 	blcc	2ce87c <__end+0x1a187c>
  58:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  5c:	07000017 	smladeq	r0, r7, r0, r0
  60:	08030005 	stmdaeq	r3, {r0, r2}
  64:	0b3b0b3a 	bleq	ec2d54 <__user_program+0xbc2d54>
  68:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  6c:	34080000 	strcc	r0, [r8], #-0
  70:	3a080300 	bcc	200c78 <__end+0xd3c78>
  74:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  78:	00170213 	andseq	r0, r7, r3, lsl r2
  7c:	00340900 	eorseq	r0, r4, r0, lsl #18
  80:	0b3a0e03 	bleq	e83894 <__user_program+0xb83894>
  84:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  88:	00001702 	andeq	r1, r0, r2, lsl #14
  8c:	0300050a 	movweq	r0, #1290	; 0x50a
  90:	3b0b3a0e 	blcc	2ce8d0 <__end+0x1a18d0>
  94:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  98:	0b000017 	bleq	fc <__start-0x7f04>
  9c:	01018289 	smlabbeq	r1, r9, r2, r8
  a0:	13310111 	teqne	r1, #1073741828	; 0x40000004
  a4:	00001301 	andeq	r1, r0, r1, lsl #6
  a8:	01828a0c 	orreq	r8, r2, ip, lsl #20
  ac:	91180200 	tstls	r8, r0, lsl #4
  b0:	00001842 	andeq	r1, r0, r2, asr #16
  b4:	0182890d 	orreq	r8, r2, sp, lsl #18
  b8:	31011101 	tstcc	r1, r1, lsl #2
  bc:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
  c0:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
  c4:	0b3a0e03 	bleq	e838d8 <__user_program+0xb838d8>
  c8:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
  cc:	01111349 	tsteq	r1, r9, asr #6
  d0:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
  d4:	01194297 			; <UNDEFINED> instruction: 0x01194297
  d8:	0f000013 	svceq	0x00000013
  dc:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  e0:	0b3b0b3a 	bleq	ec2dd0 <__user_program+0xbc2dd0>
  e4:	061c1349 	ldreq	r1, [ip], -r9, asr #6
  e8:	26100000 	ldrcs	r0, [r0], -r0
  ec:	00134900 	andseq	r4, r3, r0, lsl #18
  f0:	000f1100 	andeq	r1, pc, r0, lsl #2
  f4:	13490b0b 	movtne	r0, #39691	; 0x9b0b
  f8:	35120000 	ldrcc	r0, [r2, #-0]
  fc:	00134900 	andseq	r4, r3, r0, lsl #18
 100:	012e1300 	teqeq	lr, r0, lsl #6
 104:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 108:	0b3b0b3a 	bleq	ec2df8 <__user_program+0xbc2df8>
 10c:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 110:	05140000 	ldreq	r0, [r4, #-0]
 114:	00134900 	andseq	r4, r3, r0, lsl #18
 118:	11010000 	mrsne	r0, (UNDEF: 1)
 11c:	130e2501 	movwne	r2, #58625	; 0xe501
 120:	1b0e030b 	blne	380d54 <__user_program+0x80d54>
 124:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 128:	00171006 	andseq	r1, r7, r6
 12c:	00240200 	eoreq	r0, r4, r0, lsl #4
 130:	0b3e0b0b 	bleq	f82d64 <__user_program+0xc82d64>
 134:	00000e03 	andeq	r0, r0, r3, lsl #28
 138:	0b002403 	bleq	914c <__rodata_start+0x14c>
 13c:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 140:	04000008 	streq	r0, [r0], #-8
 144:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 148:	0b3b0b3a 	bleq	ec2e38 <__user_program+0xbc2e38>
 14c:	00001349 	andeq	r1, r0, r9, asr #6
 150:	3f012e05 	svccc	0x00012e05
 154:	3a0e0319 	bcc	380dc0 <__user_program+0x80dc0>
 158:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 15c:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 160:	97184006 	ldrls	r4, [r8, -r6]
 164:	13011942 	movwne	r1, #6466	; 0x1942
 168:	34060000 	strcc	r0, [r6], #-0
 16c:	3a080300 	bcc	200d74 <__end+0xd3d74>
 170:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 174:	00170213 	andseq	r0, r7, r3, lsl r2
 178:	82890700 	addhi	r0, r9, #0, 14
 17c:	01110001 	tsteq	r1, r1
 180:	00001331 	andeq	r1, r0, r1, lsr r3
 184:	01828908 	orreq	r8, r2, r8, lsl #18
 188:	31011101 	tstcc	r1, r1, lsl #2
 18c:	00130113 	andseq	r0, r3, r3, lsl r1
 190:	828a0900 	addhi	r0, sl, #0, 18
 194:	18020001 	stmdane	r2, {r0}
 198:	00184291 	mulseq	r8, r1, r2
 19c:	82890a00 	addhi	r0, r9, #0, 20
 1a0:	01110101 	tsteq	r1, r1, lsl #2
 1a4:	00001331 	andeq	r1, r0, r1, lsr r3
 1a8:	3f002e0b 	svccc	0x00002e0b
 1ac:	3a0e0319 	bcc	380e18 <__user_program+0x80e18>
 1b0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 1b4:	00193c19 	andseq	r3, r9, r9, lsl ip
 1b8:	012e0c00 	teqeq	lr, r0, lsl #24
 1bc:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 1c0:	0b3b0b3a 	bleq	ec2eb0 <__user_program+0xbc2eb0>
 1c4:	193c1349 	ldmdbne	ip!, {r0, r3, r6, r8, r9, ip}
 1c8:	00001301 	andeq	r1, r0, r1, lsl #6
 1cc:	0000180d 	andeq	r1, r0, sp, lsl #16
 1d0:	012e0e00 	teqeq	lr, r0, lsl #28
 1d4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 1d8:	0b3b0b3a 	bleq	ec2ec8 <__user_program+0xbc2ec8>
 1dc:	13491927 	movtne	r1, #39207	; 0x9927
 1e0:	1301193c 	movwne	r1, #6460	; 0x193c
 1e4:	050f0000 	streq	r0, [pc, #-0]	; 1ec <__start-0x7e14>
 1e8:	00134900 	andseq	r4, r3, r0, lsl #18
 1ec:	012e1000 	teqeq	lr, r0
 1f0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 1f4:	0b3b0b3a 	bleq	ec2ee4 <__user_program+0xbc2ee4>
 1f8:	13491927 	movtne	r1, #39207	; 0x9927
 1fc:	0000193c 	andeq	r1, r0, ip, lsr r9
 200:	01110100 	tsteq	r1, r0, lsl #2
 204:	0b130e25 	bleq	4c3aa0 <__user_program+0x1c3aa0>
 208:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 20c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 210:	00001710 	andeq	r1, r0, r0, lsl r7
 214:	03001602 	movweq	r1, #1538	; 0x602
 218:	3b0b3a0e 	blcc	2cea58 <__end+0x1a1a58>
 21c:	0013490b 	andseq	r4, r3, fp, lsl #18
 220:	00240300 	eoreq	r0, r4, r0, lsl #6
 224:	0b3e0b0b 	bleq	f82e58 <__user_program+0xc82e58>
 228:	00000e03 	andeq	r0, r0, r3, lsl #28
 22c:	0b002404 	bleq	9244 <__rodata_start+0x244>
 230:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 234:	05000008 	streq	r0, [r0, #-8]
 238:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 23c:	0b3a0b0b 	bleq	e82e70 <__user_program+0xb82e70>
 240:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 244:	0d060000 	stceq	0, cr0, [r6, #-0]
 248:	490e0300 	stmdbmi	lr, {r8, r9}
 24c:	340b3813 	strcc	r3, [fp], #-2067	; 0x813
 250:	07000019 	smladeq	r0, r9, r0, r0
 254:	0b0b000f 	bleq	2c0298 <__end+0x193298>
 258:	2e080000 	cdpcs	0, 0, cr0, cr8, cr0, {0}
 25c:	3a0e0301 	bcc	380e68 <__user_program+0x80e68>
 260:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 264:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 268:	96184006 	ldrls	r4, [r8], -r6
 26c:	13011942 	movwne	r1, #6466	; 0x1942
 270:	05090000 	streq	r0, [r9, #-0]
 274:	3a0e0300 	bcc	380e7c <__user_program+0x80e7c>
 278:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 27c:	00170213 	andseq	r0, r7, r3, lsl r2
 280:	00050a00 	andeq	r0, r5, r0, lsl #20
 284:	0b3a0803 	bleq	e82298 <__user_program+0xb82298>
 288:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 28c:	00001702 	andeq	r1, r0, r2, lsl #14
 290:	0300340b 	movweq	r3, #1035	; 0x40b
 294:	3b0b3a0e 	blcc	2cead4 <__end+0x1a1ad4>
 298:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 29c:	0c000017 	stceq	0, cr0, [r0], {23}
 2a0:	08030034 	stmdaeq	r3, {r2, r4, r5}
 2a4:	0b3b0b3a 	bleq	ec2f94 <__user_program+0xbc2f94>
 2a8:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 2ac:	340d0000 	strcc	r0, [sp], #-0
 2b0:	3a080300 	bcc	200eb8 <__end+0xd3eb8>
 2b4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2b8:	00170213 	andseq	r0, r7, r3, lsl r2
 2bc:	82890e00 	addhi	r0, r9, #0, 28
 2c0:	01110001 	tsteq	r1, r1
 2c4:	00001331 	andeq	r1, r0, r1, lsr r3
 2c8:	0b000f0f 	bleq	3f0c <__start-0x40f4>
 2cc:	0013490b 	andseq	r4, r3, fp, lsl #18
 2d0:	01011000 	mrseq	r1, (UNDEF: 1)
 2d4:	13011349 	movwne	r1, #4937	; 0x1349
 2d8:	21110000 	tstcs	r1, r0
 2dc:	2f134900 	svccs	0x00134900
 2e0:	1200000b 	andne	r0, r0, #11
 2e4:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 2e8:	0b3a0e03 	bleq	e83afc <__user_program+0xb83afc>
 2ec:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 2f0:	01111349 	tsteq	r1, r9, asr #6
 2f4:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 2f8:	01194297 			; <UNDEFINED> instruction: 0x01194297
 2fc:	13000013 	movwne	r0, #19
 300:	00000018 	andeq	r0, r0, r8, lsl r0
 304:	03003414 	movweq	r3, #1044	; 0x414
 308:	3b0b3a0e 	blcc	2ceb48 <__end+0x1a1b48>
 30c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 310:	15000018 	strne	r0, [r0, #-24]
 314:	1755010b 	ldrbne	r0, [r5, -fp, lsl #2]
 318:	00001301 	andeq	r1, r0, r1, lsl #6
 31c:	01828916 	orreq	r8, r2, r6, lsl r9
 320:	31011101 	tstcc	r1, r1, lsl #2
 324:	17000013 	smladne	r0, r3, r0, r0
 328:	0001828a 	andeq	r8, r1, sl, lsl #5
 32c:	42911802 	addsmi	r1, r1, #131072	; 0x20000
 330:	18000018 	stmdane	r0, {r3, r4}
 334:	0111010b 	tsteq	r1, fp, lsl #2
 338:	13010612 	movwne	r0, #5650	; 0x1612
 33c:	89190000 	ldmdbhi	r9, {}	; <UNPREDICTABLE>
 340:	11010182 	smlabbne	r1, r2, r1, r0
 344:	01133101 	tsteq	r3, r1, lsl #2
 348:	1a000013 	bne	39c <__start-0x7c64>
 34c:	13490026 	movtne	r0, #36902	; 0x9026
 350:	2e1b0000 	cdpcs	0, 1, cr0, cr11, cr0, {0}
 354:	03193f01 	tsteq	r9, #1, 30
 358:	3b0b3a0e 	blcc	2ceb98 <__end+0x1a1b98>
 35c:	3c19270b 	ldccc	7, cr2, [r9], {11}
 360:	1c000019 	stcne	0, cr0, [r0], {25}
 364:	13490005 	movtne	r0, #36869	; 0x9005
 368:	01000000 	mrseq	r0, (UNDEF: 0)
 36c:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 370:	0e030b13 	vmoveq.32	d3[0], r0
 374:	01110e1b 	tsteq	r1, fp, lsl lr
 378:	17100612 			; <UNDEFINED> instruction: 0x17100612
 37c:	24020000 	strcs	r0, [r2], #-0
 380:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 384:	000e030b 	andeq	r0, lr, fp, lsl #6
 388:	00240300 	eoreq	r0, r4, r0, lsl #6
 38c:	0b3e0b0b 	bleq	f82fc0 <__user_program+0xc82fc0>
 390:	00000803 	andeq	r0, r0, r3, lsl #16
 394:	03001604 	movweq	r1, #1540	; 0x604
 398:	3b0b3a0e 	blcc	2cebd8 <__end+0x1a1bd8>
 39c:	0013490b 	andseq	r4, r3, fp, lsl #18
 3a0:	002e0500 	eoreq	r0, lr, r0, lsl #10
 3a4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 3a8:	0b3b0b3a 	bleq	ec3098 <__user_program+0xbc3098>
 3ac:	01111927 	tsteq	r1, r7, lsr #18
 3b0:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 3b4:	00194297 	mulseq	r9, r7, r2
 3b8:	012e0600 	teqeq	lr, r0, lsl #12
 3bc:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 3c0:	0b3b0b3a 	bleq	ec30b0 <__user_program+0xbc30b0>
 3c4:	01111927 	tsteq	r1, r7, lsr #18
 3c8:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 3cc:	01194297 			; <UNDEFINED> instruction: 0x01194297
 3d0:	07000013 	smladeq	r0, r3, r0, r0
 3d4:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 3d8:	0b3b0b3a 	bleq	ec30c8 <__user_program+0xbc30c8>
 3dc:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 3e0:	2e080000 	cdpcs	0, 0, cr0, cr8, cr0, {0}
 3e4:	03193f00 	tsteq	r9, #0, 30
 3e8:	3b0b3a0e 	blcc	2cec28 <__end+0x1a1c28>
 3ec:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 3f0:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 3f4:	97184006 	ldrls	r4, [r8, -r6]
 3f8:	00001942 	andeq	r1, r0, r2, asr #18
 3fc:	01110100 	tsteq	r1, r0, lsl #2
 400:	0b130e25 	bleq	4c3c9c <__user_program+0x1c3c9c>
 404:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 408:	06120111 			; <UNDEFINED> instruction: 0x06120111
 40c:	00001710 	andeq	r1, r0, r0, lsl r7
 410:	0b002402 	bleq	9420 <__rodata_start+0x420>
 414:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 418:	0300000e 	movweq	r0, #14
 41c:	0b0b0024 	bleq	2c04b4 <__end+0x1934b4>
 420:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 424:	16040000 	strne	r0, [r4], -r0
 428:	3a0e0300 	bcc	381030 <__user_program+0x81030>
 42c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 430:	05000013 	streq	r0, [r0, #-19]
 434:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 438:	0b3a0e03 	bleq	e83c4c <__user_program+0xb83c4c>
 43c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 440:	06120111 			; <UNDEFINED> instruction: 0x06120111
 444:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 448:	00130119 	andseq	r0, r3, r9, lsl r1
 44c:	00050600 	andeq	r0, r5, r0, lsl #12
 450:	0b3a0803 	bleq	e82464 <__user_program+0xb82464>
 454:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 458:	00001802 	andeq	r1, r0, r2, lsl #16
 45c:	3f012e07 	svccc	0x00012e07
 460:	3a0e0319 	bcc	3810cc <__user_program+0x810cc>
 464:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 468:	11134919 	tstne	r3, r9, lsl r9
 46c:	40061201 	andmi	r1, r6, r1, lsl #4
 470:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 474:	00001301 	andeq	r1, r0, r1, lsl #6
 478:	03000508 	movweq	r0, #1288	; 0x508
 47c:	3b0b3a08 	blcc	2ceca4 <__end+0x1a1ca4>
 480:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 484:	09000017 	stmdbeq	r0, {r0, r1, r2, r4}
 488:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 48c:	0b3b0b3a 	bleq	ec317c <__user_program+0xbc317c>
 490:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 494:	0f0a0000 	svceq	0x000a0000
 498:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 49c:	0b000013 	bleq	4f0 <__start-0x7b10>
 4a0:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 4a4:	0b3a0e03 	bleq	e83cb8 <__user_program+0xb83cb8>
 4a8:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 4ac:	01111349 	tsteq	r1, r9, asr #6
 4b0:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 4b4:	00194297 	mulseq	r9, r7, r2
 4b8:	11010000 	mrsne	r0, (UNDEF: 1)
 4bc:	130e2501 	movwne	r2, #58625	; 0xe501
 4c0:	1b0e030b 	blne	3810f4 <__user_program+0x810f4>
 4c4:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 4c8:	00171006 	andseq	r1, r7, r6
 4cc:	00240200 	eoreq	r0, r4, r0, lsl #4
 4d0:	0b3e0b0b 	bleq	f83104 <__user_program+0xc83104>
 4d4:	00000e03 	andeq	r0, r0, r3, lsl #28
 4d8:	0b002403 	bleq	94ec <__rodata_start+0x4ec>
 4dc:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 4e0:	04000008 	streq	r0, [r0], #-8
 4e4:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 4e8:	0b3b0b3a 	bleq	ec31d8 <__user_program+0xbc31d8>
 4ec:	00001349 	andeq	r1, r0, r9, asr #6
 4f0:	3f002e05 	svccc	0x00002e05
 4f4:	3a0e0319 	bcc	381160 <__user_program+0x81160>
 4f8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 4fc:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 500:	97184006 	ldrls	r4, [r8, -r6]
 504:	00001942 	andeq	r1, r0, r2, asr #18
 508:	3f012e06 	svccc	0x00012e06
 50c:	3a0e0319 	bcc	381178 <__user_program+0x81178>
 510:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 514:	11134919 	tstne	r3, r9, lsl r9
 518:	40061201 	andmi	r1, r6, r1, lsl #4
 51c:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 520:	05070000 	streq	r0, [r7, #-0]
 524:	3a0e0300 	bcc	38112c <__user_program+0x8112c>
 528:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 52c:	00170213 	andseq	r0, r7, r3, lsl r2
 530:	11010000 	mrsne	r0, (UNDEF: 1)
 534:	130e2501 	movwne	r2, #58625	; 0xe501
 538:	1b0e030b 	blne	38116c <__user_program+0x8116c>
 53c:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 540:	00171006 	andseq	r1, r7, r6
 544:	00240200 	eoreq	r0, r4, r0, lsl #4
 548:	0b3e0b0b 	bleq	f8317c <__user_program+0xc8317c>
 54c:	00000e03 	andeq	r0, r0, r3, lsl #28
 550:	0b002403 	bleq	9564 <__rodata_start+0x564>
 554:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 558:	04000008 	streq	r0, [r0], #-8
 55c:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 560:	0b3b0b3a 	bleq	ec3250 <__user_program+0xbc3250>
 564:	00001349 	andeq	r1, r0, r9, asr #6
 568:	3f012e05 	svccc	0x00012e05
 56c:	3a0e0319 	bcc	3811d8 <__user_program+0x811d8>
 570:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 574:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 578:	97184006 	ldrls	r4, [r8, -r6]
 57c:	13011942 	movwne	r1, #6466	; 0x1942
 580:	05060000 	streq	r0, [r6, #-0]
 584:	3a0e0300 	bcc	38118c <__user_program+0x8118c>
 588:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 58c:	00170213 	andseq	r0, r7, r3, lsl r2
 590:	00050700 	andeq	r0, r5, r0, lsl #14
 594:	0b3a0803 	bleq	e825a8 <__user_program+0xb825a8>
 598:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 59c:	00001702 	andeq	r1, r0, r2, lsl #14
 5a0:	03003408 	movweq	r3, #1032	; 0x408
 5a4:	3b0b3a08 	blcc	2cedcc <__end+0x1a1dcc>
 5a8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 5ac:	09000017 	stmdbeq	r0, {r0, r1, r2, r4}
 5b0:	01018289 	smlabbeq	r1, r9, r2, r8
 5b4:	13310111 	teqne	r1, #1073741828	; 0x40000004
 5b8:	00001301 	andeq	r1, r0, r1, lsl #6
 5bc:	01828a0a 	orreq	r8, r2, sl, lsl #20
 5c0:	91180200 	tstls	r8, r0, lsl #4
 5c4:	00001842 	andeq	r1, r0, r2, asr #16
 5c8:	0182890b 	orreq	r8, r2, fp, lsl #18
 5cc:	31011101 	tstcc	r1, r1, lsl #2
 5d0:	0c000013 	stceq	0, cr0, [r0], {19}
 5d4:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 5d8:	0b3b0b3a 	bleq	ec32c8 <__user_program+0xbc32c8>
 5dc:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 5e0:	050d0000 	streq	r0, [sp, #-0]
 5e4:	3a080300 	bcc	2011ec <__end+0xd41ec>
 5e8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 5ec:	00180213 	andseq	r0, r8, r3, lsl r2
 5f0:	002e0e00 	eoreq	r0, lr, r0, lsl #28
 5f4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 5f8:	0b3b0b3a 	bleq	ec32e8 <__user_program+0xbc32e8>
 5fc:	01111927 	tsteq	r1, r7, lsr #18
 600:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 604:	00194297 	mulseq	r9, r7, r2
 608:	012e0f00 	teqeq	lr, r0, lsl #30
 60c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 610:	0b3b0b3a 	bleq	ec3300 <__user_program+0xbc3300>
 614:	13491927 	movtne	r1, #39207	; 0x9927
 618:	06120111 			; <UNDEFINED> instruction: 0x06120111
 61c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 620:	00130119 	andseq	r0, r3, r9, lsl r1
 624:	012e1000 	teqeq	lr, r0
 628:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 62c:	0b3b0b3a 	bleq	ec331c <__user_program+0xbc331c>
 630:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 634:	05110000 	ldreq	r0, [r1, #-0]
 638:	00134900 	andseq	r4, r3, r0, lsl #18
 63c:	11010000 	mrsne	r0, (UNDEF: 1)
 640:	130e2501 	movwne	r2, #58625	; 0xe501
 644:	1b0e030b 	blne	381278 <__user_program+0x81278>
 648:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 64c:	00171006 	andseq	r1, r7, r6
 650:	00240200 	eoreq	r0, r4, r0, lsl #4
 654:	0b3e0b0b 	bleq	f83288 <__user_program+0xc83288>
 658:	00000e03 	andeq	r0, r0, r3, lsl #28
 65c:	0b002403 	bleq	9670 <__rodata_start+0x670>
 660:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 664:	04000008 	streq	r0, [r0], #-8
 668:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 66c:	0b3b0b3a 	bleq	ec335c <__user_program+0xbc335c>
 670:	00001349 	andeq	r1, r0, r9, asr #6
 674:	3f012e05 	svccc	0x00012e05
 678:	3a0e0319 	bcc	3812e4 <__user_program+0x812e4>
 67c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 680:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 684:	97184006 	ldrls	r4, [r8, -r6]
 688:	13011942 	movwne	r1, #6466	; 0x1942
 68c:	05060000 	streq	r0, [r6, #-0]
 690:	3a0e0300 	bcc	381298 <__user_program+0x81298>
 694:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 698:	00170213 	andseq	r0, r7, r3, lsl r2
 69c:	012e0700 	teqeq	lr, r0, lsl #14
 6a0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 6a4:	0b3b0b3a 	bleq	ec3394 <__user_program+0xbc3394>
 6a8:	13491927 	movtne	r1, #39207	; 0x9927
 6ac:	06120111 			; <UNDEFINED> instruction: 0x06120111
 6b0:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 6b4:	00130119 	andseq	r0, r3, r9, lsl r1
 6b8:	00050800 	andeq	r0, r5, r0, lsl #16
 6bc:	0b3a0803 	bleq	e826d0 <__user_program+0xb826d0>
 6c0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6c4:	00001702 	andeq	r1, r0, r2, lsl #14
 6c8:	03003409 	movweq	r3, #1033	; 0x409
 6cc:	3b0b3a0e 	blcc	2cef0c <__end+0x1a1f0c>
 6d0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 6d4:	0a000017 	beq	738 <__start-0x78c8>
 6d8:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 6dc:	0b3a0e03 	bleq	e83ef0 <__user_program+0xb83ef0>
 6e0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6e4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 6e8:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 6ec:	00130119 	andseq	r0, r3, r9, lsl r1
 6f0:	00340b00 	eorseq	r0, r4, r0, lsl #22
 6f4:	0b3a0803 	bleq	e82708 <__user_program+0xb82708>
 6f8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6fc:	00001702 	andeq	r1, r0, r2, lsl #14
 700:	0182890c 	orreq	r8, r2, ip, lsl #18
 704:	31011101 	tstcc	r1, r1, lsl #2
 708:	00130113 	andseq	r0, r3, r3, lsl r1
 70c:	828a0d00 	addhi	r0, sl, #0, 26
 710:	18020001 	stmdane	r2, {r0}
 714:	00184291 	mulseq	r8, r1, r2
 718:	82890e00 	addhi	r0, r9, #0, 28
 71c:	01110001 	tsteq	r1, r1
 720:	00001331 	andeq	r1, r0, r1, lsr r3
 724:	0182890f 	orreq	r8, r2, pc, lsl #18
 728:	31011101 	tstcc	r1, r1, lsl #2
 72c:	10000013 	andne	r0, r0, r3, lsl r0
 730:	08030034 	stmdaeq	r3, {r2, r4, r5}
 734:	0b3b0b3a 	bleq	ec3424 <__user_program+0xbc3424>
 738:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 73c:	34110000 	ldrcc	r0, [r1], #-0
 740:	3a080300 	bcc	201348 <__end+0xd4348>
 744:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 748:	02193f13 	andseq	r3, r9, #19, 30	; 0x4c
 74c:	12000018 	andne	r0, r0, #24
 750:	13490101 	movtne	r0, #37121	; 0x9101
 754:	00001301 	andeq	r1, r0, r1, lsl #6
 758:	49002113 	stmdbmi	r0, {r0, r1, r4, r8, sp}
 75c:	00052f13 	andeq	r2, r5, r3, lsl pc
 760:	00341400 	eorseq	r1, r4, r0, lsl #8
 764:	0b3a0e03 	bleq	e83f78 <__user_program+0xb83f78>
 768:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 76c:	1802193f 	stmdane	r2, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 770:	2e150000 	cdpcs	0, 1, cr0, cr5, cr0, {0}
 774:	03193f01 	tsteq	r9, #1, 30
 778:	3b0b3a0e 	blcc	2cefb8 <__end+0x1a1fb8>
 77c:	3c19270b 	ldccc	7, cr2, [r9], {11}
 780:	00130119 	andseq	r0, r3, r9, lsl r1
 784:	00051600 	andeq	r1, r5, r0, lsl #12
 788:	00001349 	andeq	r1, r0, r9, asr #6
 78c:	3f012e17 	svccc	0x00012e17
 790:	3a0e0319 	bcc	3813fc <__user_program+0x813fc>
 794:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 798:	3c134919 	ldccc	9, cr4, [r3], {25}
 79c:	00130119 	andseq	r0, r3, r9, lsl r1
 7a0:	002e1800 	eoreq	r1, lr, r0, lsl #16
 7a4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 7a8:	0b3b0b3a 	bleq	ec3498 <__user_program+0xbc3498>
 7ac:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 7b0:	2e190000 	cdpcs	0, 1, cr0, cr9, cr0, {0}
 7b4:	03193f01 	tsteq	r9, #1, 30
 7b8:	3b0b3a0e 	blcc	2ceff8 <__end+0x1a1ff8>
 7bc:	3c19270b 	ldccc	7, cr2, [r9], {11}
 7c0:	00000019 	andeq	r0, r0, r9, lsl r0
 7c4:	10001101 	andne	r1, r0, r1, lsl #2
 7c8:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 7cc:	1b080301 	blne	2013d8 <__end+0xd43d8>
 7d0:	13082508 	movwne	r2, #34056	; 0x8508
 7d4:	00000005 	andeq	r0, r0, r5
 7d8:	10001101 	andne	r1, r0, r1, lsl #2
 7dc:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 7e0:	1b080301 	blne	2013ec <__end+0xd43ec>
 7e4:	13082508 	movwne	r2, #34056	; 0x8508
 7e8:	00000005 	andeq	r0, r0, r5

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
 198:	00000400 	andeq	r0, r0, r0, lsl #8
 19c:	00002000 	andeq	r2, r0, r0
 1a0:	30000200 	andcc	r0, r0, r0, lsl #4
 1a4:	0000209f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 1a8:	0000b400 	andeq	fp, r0, r0, lsl #8
 1ac:	55000100 	strpl	r0, [r0, #-256]	; 0x100
	...
 1b8:	00000004 	andeq	r0, r0, r4
 1bc:	00000020 	andeq	r0, r0, r0, lsr #32
 1c0:	9f300002 	svcls	0x00300002
 1c4:	00000020 	andeq	r0, r0, r0, lsr #32
 1c8:	00000024 	andeq	r0, r0, r4, lsr #32
 1cc:	24540001 	ldrbcs	r0, [r4], #-1
 1d0:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
 1d4:	03000000 	movweq	r0, #0
 1d8:	9f017700 	svcls	0x00017700
 1dc:	00000028 	andeq	r0, r0, r8, lsr #32
 1e0:	00000030 	andeq	r0, r0, r0, lsr r0
 1e4:	34540001 	ldrbcc	r0, [r4], #-1
 1e8:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
 1ec:	01000000 	mrseq	r0, (UNDEF: 0)
 1f0:	00485400 	subeq	r5, r8, r0, lsl #8
 1f4:	00a40000 	adceq	r0, r4, r0
 1f8:	00010000 	andeq	r0, r1, r0
 1fc:	0000a457 	andeq	sl, r0, r7, asr r4
 200:	0000b400 	andeq	fp, r0, r0, lsl #8
 204:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
 214:	00000048 	andeq	r0, r0, r8, asr #32
 218:	48500001 	ldmdami	r0, {r0}^
 21c:	e0000000 	and	r0, r0, r0
 220:	04000000 	streq	r0, [r0], #-0
 224:	5001f300 	andpl	pc, r1, r0, lsl #6
 228:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
	...
 234:	00004800 	andeq	r4, r0, r0, lsl #16
 238:	52000600 	andpl	r0, r0, #0, 12
 23c:	93530493 	cmpls	r3, #-1828716544	; 0x93000000
 240:	00004804 	andeq	r4, r0, r4, lsl #16
 244:	00007c00 	andeq	r7, r0, r0, lsl #24
 248:	56000600 	strpl	r0, [r0], -r0, lsl #12
 24c:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
 250:	00008004 	andeq	r8, r0, r4
 254:	0000e000 	andeq	lr, r0, r0
 258:	56000600 	strpl	r0, [r0], -r0, lsl #12
 25c:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
 260:	00000004 	andeq	r0, r0, r4
 264:	00000000 	andeq	r0, r0, r0
 268:	00001000 	andeq	r1, r0, r0
 26c:	00004800 	andeq	r4, r0, r0, lsl #16
 270:	30000200 	andcc	r0, r0, r0, lsl #4
 274:	0000909f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 278:	00009c00 	andeq	r9, r0, r0, lsl #24
 27c:	58000100 	stmdapl	r0, {r8}
 280:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 284:	000000b8 	strheq	r0, [r0], -r8
 288:	b8580001 	ldmdalt	r8, {r0}^
 28c:	c4000000 	strgt	r0, [r0], #-0
 290:	03000000 	movweq	r0, #0
 294:	9f7f7800 	svcls	0x007f7800
	...
 2a0:	00000010 	andeq	r0, r0, r0, lsl r0
 2a4:	00000038 	andeq	r0, r0, r8, lsr r0
 2a8:	57910003 	ldrpl	r0, [r1, r3]
 2ac:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 2b0:	00006400 	andeq	r6, r0, r0, lsl #8
 2b4:	54000100 	strpl	r0, [r0], #-256	; 0x100
 2b8:	00000064 	andeq	r0, r0, r4, rrx
 2bc:	0000009c 	muleq	r0, ip, r0
 2c0:	01740003 	cmneq	r4, r3
 2c4:	00009c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 2c8:	0000b000 	andeq	fp, r0, r0
 2cc:	54000100 	strpl	r0, [r0], #-256	; 0x100
 2d0:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 2d4:	000000c4 	andeq	r0, r0, r4, asr #1
 2d8:	01740003 	cmneq	r4, r3
 2dc:	0000c49f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
 2e0:	0000c800 	andeq	ip, r0, r0, lsl #16
 2e4:	54000100 	strpl	r0, [r0], #-256	; 0x100
 2e8:	000000c8 	andeq	r0, r0, r8, asr #1
 2ec:	000000cc 	andeq	r0, r0, ip, asr #1
 2f0:	7f740003 	svcvc	0x00740003
 2f4:	0000cc9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 2f8:	0000e000 	andeq	lr, r0, r0
 2fc:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
 308:	000000e0 	andeq	r0, r0, r0, ror #1
 30c:	00000108 	andeq	r0, r0, r8, lsl #2
 310:	70910002 	addsvc	r0, r1, r2
 314:	00000108 	andeq	r0, r0, r8, lsl #2
 318:	0000011c 	andeq	r0, r0, ip, lsl r1
 31c:	1c540001 	mrrcne	0, 0, r0, r4, cr1
 320:	7c000001 	stcvc	0, cr0, [r0], {1}
 324:	03000002 	movweq	r0, #2
 328:	9f017400 	svcls	0x00017400
 32c:	0000027c 	andeq	r0, r0, ip, ror r2
 330:	00000288 	andeq	r0, r0, r8, lsl #5
 334:	00540001 	subseq	r0, r4, r1
 338:	00000000 	andeq	r0, r0, r0
 33c:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
 340:	f4000001 	vst4.8	{d0-d3}, [r0], r1
 344:	02000001 	andeq	r0, r0, #1
 348:	f4007300 	vst2.8	{d7-d10}, [r0], r0
 34c:	f7000001 			; <UNDEFINED> instruction: 0xf7000001
 350:	01000001 	tsteq	r0, r1
 354:	00005200 	andeq	r5, r0, r0, lsl #4
 358:	00000000 	andeq	r0, r0, r0
 35c:	02080000 	andeq	r0, r8, #0
 360:	02140000 	andseq	r0, r4, #0
 364:	00020000 	andeq	r0, r2, r0
 368:	02140073 	andseq	r0, r4, #115	; 0x73
 36c:	02170000 	andseq	r0, r7, #0
 370:	00010000 	andeq	r0, r1, r0
 374:	00000052 	andeq	r0, r0, r2, asr r0
 378:	00000000 	andeq	r0, r0, r0
 37c:	00018400 	andeq	r8, r1, r0, lsl #8
 380:	0001bc00 	andeq	fp, r1, r0, lsl #24
 384:	55000100 	strpl	r0, [r0, #-256]	; 0x100
	...
 390:	000001c8 	andeq	r0, r0, r8, asr #3
 394:	000001d4 	ldrdeq	r0, [r0], -r4
 398:	00730002 	rsbseq	r0, r3, r2
 39c:	000001d4 	ldrdeq	r0, [r0], -r4
 3a0:	000001d7 	ldrdeq	r0, [r0], -r7
 3a4:	00520001 	subseq	r0, r2, r1
 3a8:	00000000 	andeq	r0, r0, r0
 3ac:	2c000000 	stccs	0, cr0, [r0], {-0}
 3b0:	40000002 	andmi	r0, r0, r2
 3b4:	01000002 	tsteq	r0, r2
 3b8:	02405500 	subeq	r5, r0, #0, 10
 3bc:	024c0000 	subeq	r0, ip, #0
 3c0:	00030000 	andeq	r0, r3, r0
 3c4:	009f7f75 	addseq	r7, pc, r5, ror pc	; <UNPREDICTABLE>
 3c8:	00000000 	andeq	r0, r0, r0
 3cc:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
 3d0:	5f000002 	svcpl	0x00000002
 3d4:	02000002 	andeq	r0, r0, #2
 3d8:	00007300 	andeq	r7, r0, r0, lsl #6
 3dc:	00000000 	andeq	r0, r0, r0
 3e0:	04000000 	streq	r0, [r0], #-0
 3e4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 3e8:	01000000 	mrseq	r0, (UNDEF: 0)
 3ec:	00085000 	andeq	r5, r8, r0
 3f0:	000c0000 	andeq	r0, ip, r0
 3f4:	00040000 	andeq	r0, r4, r0
 3f8:	9f5001f3 	svcls	0x005001f3
	...
 404:	0000000c 	andeq	r0, r0, ip
 408:	00000010 	andeq	r0, r0, r0, lsl r0
 40c:	10500001 	subsne	r0, r0, r1
 410:	14000000 	strne	r0, [r0], #-0
 414:	04000000 	streq	r0, [r0], #-0
 418:	5001f300 	andpl	pc, r1, r0, lsl #6
 41c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 420:	00000000 	andeq	r0, r0, r0
 424:	00000400 	andeq	r0, r0, r0, lsl #8
 428:	00000800 	andeq	r0, r0, r0, lsl #16
 42c:	50000100 	andpl	r0, r0, r0, lsl #2
 430:	00000008 	andeq	r0, r0, r8
 434:	0000000c 	andeq	r0, r0, ip
 438:	01f30004 	mvnseq	r0, r4
 43c:	00009f50 	andeq	r9, r0, r0, asr pc
	...
 448:	00040000 	andeq	r0, r4, r0
 44c:	00010000 	andeq	r0, r1, r0
 450:	00000450 	andeq	r0, r0, r0, asr r4
 454:	00002000 	andeq	r2, r0, r0
 458:	53000100 	movwpl	r0, #256	; 0x100
	...
 464:	00000020 	andeq	r0, r0, r0, lsr #32
 468:	0000002c 	andeq	r0, r0, ip, lsr #32
 46c:	2c500001 	mrrccs	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
 470:	94000000 	strls	r0, [r0], #-0
 474:	04000000 	streq	r0, [r0], #-0
 478:	5001f300 	andpl	pc, r1, r0, lsl #6
 47c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 480:	00000000 	andeq	r0, r0, r0
 484:	00002000 	andeq	r2, r0, r0
 488:	00003000 	andeq	r3, r0, r0
 48c:	51000100 	mrspl	r0, (UNDEF: 16)
 490:	00000030 	andeq	r0, r0, r0, lsr r0
 494:	00000094 	muleq	r0, r4, r0
 498:	00540001 	subseq	r0, r4, r1
 49c:	00000000 	andeq	r0, r0, r0
 4a0:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
 4a4:	7c000000 	stcvc	0, cr0, [r0], {-0}
 4a8:	06000000 	streq	r0, [r0], -r0
 4ac:	09007200 	stmdbeq	r0, {r9, ip, sp, lr}
 4b0:	7c9f1af3 	vldmiavc	pc, {s2-s244}
 4b4:	8f000000 	svchi	0x00000000
 4b8:	01000000 	mrseq	r0, (UNDEF: 0)
 4bc:	00005200 	andeq	r5, r0, r0, lsl #4
 4c0:	00000000 	andeq	r0, r0, r0
 4c4:	00b40000 	adcseq	r0, r4, r0
 4c8:	00b80000 	adcseq	r0, r8, r0
 4cc:	00060000 	andeq	r0, r6, r0
 4d0:	f3090072 	vqadd.u8	q0, <illegal reg q4.5>, q9
 4d4:	00b89f1a 	adcseq	r9, r8, sl, lsl pc
 4d8:	00c80000 	sbceq	r0, r8, r0
 4dc:	00010000 	andeq	r0, r1, r0
 4e0:	00000052 	andeq	r0, r0, r2, asr r0
 4e4:	00000000 	andeq	r0, r0, r0
 4e8:	0000e000 	andeq	lr, r0, r0
 4ec:	00011400 	andeq	r1, r1, r0, lsl #8
 4f0:	50000100 	andpl	r0, r0, r0, lsl #2
 4f4:	00000114 	andeq	r0, r0, r4, lsl r1
 4f8:	00000180 	andeq	r0, r0, r0, lsl #3
 4fc:	01f30004 	mvnseq	r0, r4
 500:	00009f50 	andeq	r9, r0, r0, asr pc
 504:	00000000 	andeq	r0, r0, r0
 508:	00e80000 	rsceq	r0, r8, r0
 50c:	00f40000 	rscseq	r0, r4, r0
 510:	00020000 	andeq	r0, r2, r0
 514:	00f49f30 	rscseq	r9, r4, r0, lsr pc
 518:	00f80000 	rscseq	r0, r8, r0
 51c:	00060000 	andeq	r0, r6, r0
 520:	30080072 	andcc	r0, r8, r2, ror r0
 524:	00f89f21 	rscseq	r9, r8, r1, lsr #30
 528:	01140000 	tsteq	r4, r0
 52c:	00010000 	andeq	r0, r1, r0
 530:	00017052 	andeq	r7, r1, r2, asr r0
 534:	00018000 	andeq	r8, r1, r0
 538:	52000100 	andpl	r0, r0, #0, 2
	...
 544:	000000e8 	andeq	r0, r0, r8, ror #1
 548:	0000016c 	andeq	r0, r0, ip, ror #2
 54c:	9f300002 	svcls	0x00300002
 550:	0000016c 	andeq	r0, r0, ip, ror #2
 554:	0000017c 	andeq	r0, r0, ip, ror r1
 558:	00500001 	subseq	r0, r0, r1
	...
 564:	04000000 	streq	r0, [r0], #-0
 568:	01000000 	mrseq	r0, (UNDEF: 0)
 56c:	00045000 	andeq	r5, r4, r0
 570:	00200000 	eoreq	r0, r0, r0
 574:	00010000 	andeq	r0, r1, r0
 578:	00000053 	andeq	r0, r0, r3, asr r0
 57c:	00000000 	andeq	r0, r0, r0
 580:	00002000 	andeq	r2, r0, r0
 584:	00003000 	andeq	r3, r0, r0
 588:	50000100 	andpl	r0, r0, r0, lsl #2
 58c:	00000030 	andeq	r0, r0, r0, lsr r0
 590:	0000004c 	andeq	r0, r0, ip, asr #32
 594:	4c500001 	mrrcmi	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
 598:	5c000000 	stcpl	0, cr0, [r0], {-0}
 59c:	06000000 	streq	r0, [r0], -r0
 5a0:	01f34f00 	mvnseq	r4, r0, lsl #30
 5a4:	5c9f1c50 	ldcpl	12, cr1, [pc], {80}	; 0x50
 5a8:	60000000 	andvs	r0, r0, r0
 5ac:	01000000 	mrseq	r0, (UNDEF: 0)
 5b0:	00605000 	rsbeq	r5, r0, r0
 5b4:	00640000 	rsbeq	r0, r4, r0
 5b8:	00040000 	andeq	r0, r4, r0
 5bc:	9f5001f3 	svcls	0x005001f3
	...
 5c8:	00000020 	andeq	r0, r0, r0, lsr #32
 5cc:	0000002c 	andeq	r0, r0, ip, lsr #32
 5d0:	2c510001 	mrrccs	0, 0, r0, r1, cr1
 5d4:	34000000 	strcc	r0, [r0], #-0
 5d8:	06000000 	streq	r0, [r0], -r0
 5dc:	717f0800 	cmnvc	pc, r0, lsl #16
 5e0:	349f1c00 	ldrcc	r1, [pc], #3072	; 5e8 <__start-0x7a18>
 5e4:	3c000000 	stccc	0, cr0, [r0], {-0}
 5e8:	01000000 	mrseq	r0, (UNDEF: 0)
 5ec:	003c5100 	eorseq	r5, ip, r0, lsl #2
 5f0:	005c0000 	subseq	r0, ip, r0
 5f4:	00070000 	andeq	r0, r7, r0
 5f8:	01f37f08 	mvnseq	r7, r8, lsl #30
 5fc:	5c9f1c51 	ldcpl	12, cr1, [pc], {81}	; 0x51
 600:	64000000 	strvs	r0, [r0], #-0
 604:	01000000 	mrseq	r0, (UNDEF: 0)
 608:	00005100 	andeq	r5, r0, r0, lsl #2
 60c:	00000000 	andeq	r0, r0, r0
 610:	003c0000 	eorseq	r0, ip, r0
 614:	00480000 	subeq	r0, r8, r0
 618:	00050000 	andeq	r0, r5, r0
 61c:	1a370070 	bne	dc07e4 <__user_program+0xac07e4>
 620:	0000489f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 624:	00005400 	andeq	r5, r0, r0, lsl #8
 628:	53000100 	movwpl	r0, #256	; 0x100
 62c:	00000054 	andeq	r0, r0, r4, asr r0
 630:	0000005c 	andeq	r0, r0, ip, asr r0
 634:	f34f0008 	vhadd.u8	d16, d15, d8
 638:	371c5001 	ldrcc	r5, [ip, -r1]
 63c:	00009f1a 	andeq	r9, r0, sl, lsl pc
 640:	00000000 	andeq	r0, r0, r0
 644:	003c0000 	eorseq	r0, ip, r0
 648:	005c0000 	subseq	r0, ip, r0
 64c:	00010000 	andeq	r0, r1, r0
 650:	00000051 	andeq	r0, r0, r1, asr r0
 654:	00000000 	andeq	r0, r0, r0
 658:	00006400 	andeq	r6, r0, r0, lsl #8
 65c:	00007400 	andeq	r7, r0, r0, lsl #8
 660:	50000100 	andpl	r0, r0, r0, lsl #2
 664:	00000074 	andeq	r0, r0, r4, ror r0
 668:	00000090 	muleq	r0, r0, r0
 66c:	90500001 	subsls	r0, r0, r1
 670:	a0000000 	andge	r0, r0, r0
 674:	06000000 	streq	r0, [r0], -r0
 678:	01f34f00 	mvnseq	r4, r0, lsl #30
 67c:	a09f1c50 	addsge	r1, pc, r0, asr ip	; <UNPREDICTABLE>
 680:	a4000000 	strge	r0, [r0], #-0
 684:	01000000 	mrseq	r0, (UNDEF: 0)
 688:	00a45000 	adceq	r5, r4, r0
 68c:	00a80000 	adceq	r0, r8, r0
 690:	00040000 	andeq	r0, r4, r0
 694:	9f5001f3 	svcls	0x005001f3
	...
 6a0:	00000064 	andeq	r0, r0, r4, rrx
 6a4:	00000070 	andeq	r0, r0, r0, ror r0
 6a8:	70510001 	subsvc	r0, r1, r1
 6ac:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
 6b0:	06000000 	streq	r0, [r0], -r0
 6b4:	717f0800 	cmnvc	pc, r0, lsl #16
 6b8:	789f1c00 	ldmvc	pc, {sl, fp, ip}	; <UNPREDICTABLE>
 6bc:	80000000 	andhi	r0, r0, r0
 6c0:	01000000 	mrseq	r0, (UNDEF: 0)
 6c4:	00805100 	addeq	r5, r0, r0, lsl #2
 6c8:	00a00000 	adceq	r0, r0, r0
 6cc:	00070000 	andeq	r0, r7, r0
 6d0:	01f37f08 	mvnseq	r7, r8, lsl #30
 6d4:	a09f1c51 	addsge	r1, pc, r1, asr ip	; <UNPREDICTABLE>
 6d8:	a8000000 	stmdage	r0, {}	; <UNPREDICTABLE>
 6dc:	01000000 	mrseq	r0, (UNDEF: 0)
 6e0:	00005100 	andeq	r5, r0, r0, lsl #2
 6e4:	00000000 	andeq	r0, r0, r0
 6e8:	00800000 	addeq	r0, r0, r0
 6ec:	008c0000 	addeq	r0, ip, r0
 6f0:	00050000 	andeq	r0, r5, r0
 6f4:	1a370070 	bne	dc08bc <__user_program+0xac08bc>
 6f8:	00008c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 6fc:	00009800 	andeq	r9, r0, r0, lsl #16
 700:	53000100 	movwpl	r0, #256	; 0x100
 704:	00000098 	muleq	r0, r8, r0
 708:	000000a0 	andeq	r0, r0, r0, lsr #1
 70c:	f34f0008 	vhadd.u8	d16, d15, d8
 710:	371c5001 	ldrcc	r5, [ip, -r1]
 714:	00009f1a 	andeq	r9, r0, sl, lsl pc
 718:	00000000 	andeq	r0, r0, r0
 71c:	00800000 	addeq	r0, r0, r0
 720:	00a00000 	adceq	r0, r0, r0
 724:	00010000 	andeq	r0, r1, r0
 728:	00000051 	andeq	r0, r0, r1, asr r0
 72c:	00000000 	andeq	r0, r0, r0
 730:	0000a800 	andeq	sl, r0, r0, lsl #16
 734:	0000b400 	andeq	fp, r0, r0, lsl #8
 738:	30000200 	andcc	r0, r0, r0, lsl #4
 73c:	0000b49f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
 740:	0000cc00 	andeq	ip, r0, r0, lsl #24
 744:	73000900 	movwvc	r0, #2304	; 0x900
 748:	b0030300 	andlt	r0, r3, r0, lsl #6
 74c:	9f1c0000 	svcls	0x001c0000
	...
 758:	000000cc 	andeq	r0, r0, ip, asr #1
 75c:	000000d8 	ldrdeq	r0, [r0], -r8
 760:	d8500001 	ldmdale	r0, {r0}^
 764:	00000000 	andeq	r0, r0, r0
 768:	04000001 	streq	r0, [r0], #-1
 76c:	5001f300 	andpl	pc, r1, r0, lsl #6
 770:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 774:	00000000 	andeq	r0, r0, r0
 778:	00010000 	andeq	r0, r1, r0
 77c:	00010c00 	andeq	r0, r1, r0, lsl #24
 780:	50000100 	andpl	r0, r0, r0, lsl #2
 784:	0000010c 	andeq	r0, r0, ip, lsl #2
 788:	00000134 	andeq	r0, r0, r4, lsr r1
 78c:	01f30004 	mvnseq	r0, r4
 790:	00009f50 	andeq	r9, r0, r0, asr pc
 794:	00000000 	andeq	r0, r0, r0
 798:	02d80000 	sbcseq	r0, r8, #0
 79c:	02e00000 	rsceq	r0, r0, #0
 7a0:	00020000 	andeq	r0, r2, r0
 7a4:	02e09f30 	rsceq	r9, r0, #48, 30	; 0xc0
 7a8:	02e40000 	rsceq	r0, r4, #0
 7ac:	00090000 	andeq	r0, r9, r0
 7b0:	03030074 	movweq	r0, #12404	; 0x3074
 7b4:	1c0000b0 	stcne	0, cr0, [r0], {176}	; 0xb0
 7b8:	0002e49f 	muleq	r2, pc, r4	; <UNPREDICTABLE>
 7bc:	0002e800 	andeq	lr, r2, r0, lsl #16
 7c0:	74000900 	strvc	r0, [r0], #-2304	; 0x900
 7c4:	b0040300 	andlt	r0, r4, r0, lsl #6
 7c8:	9f1c0000 	svcls	0x001c0000
 7cc:	000002e8 	andeq	r0, r0, r8, ror #5
 7d0:	00000300 	andeq	r0, r0, r0, lsl #6
 7d4:	00740009 	rsbseq	r0, r4, r9
 7d8:	00b00303 	adcseq	r0, r0, r3, lsl #6
 7dc:	009f1c00 	addseq	r1, pc, r0, lsl #24
 7e0:	00000000 	andeq	r0, r0, r0
 7e4:	1c000000 	stcne	0, cr0, [r0], {-0}
 7e8:	28000003 	stmdacs	r0, {r0, r1}
 7ec:	02000003 	andeq	r0, r0, #3
 7f0:	289f3000 	ldmcs	pc, {ip, sp}	; <UNPREDICTABLE>
 7f4:	3c000003 	stccc	0, cr0, [r0], {3}
 7f8:	07000003 	streq	r0, [r0, -r3]
 7fc:	02000a00 	andeq	r0, r0, #0, 20
 800:	9f1c0074 	svcls	0x001c0074
 804:	0000033c 	andeq	r0, r0, ip, lsr r3
 808:	00000340 	andeq	r0, r0, r0, asr #6
 80c:	010a0007 	tsteq	sl, r7
 810:	1c007402 	cfstrsne	mvf7, [r0], {2}
 814:	0003409f 	muleq	r3, pc, r0	; <UNPREDICTABLE>
 818:	00036000 	andeq	r6, r3, r0
 81c:	0a000700 	beq	2424 <__start-0x5bdc>
 820:	00740200 	rsbseq	r0, r4, r0, lsl #4
 824:	00009f1c 	andeq	r9, r0, ip, lsl pc
 828:	00000000 	andeq	r0, r0, r0
 82c:	037c0000 	cmneq	ip, #0
 830:	03840000 	orreq	r0, r4, #0
 834:	00020000 	andeq	r0, r2, r0
 838:	03849f30 	orreq	r9, r4, #48, 30	; 0xc0
 83c:	038c0000 	orreq	r0, ip, #0
 840:	00070000 	andeq	r0, r7, r0
 844:	7402000a 	strvc	r0, [r2], #-10
 848:	8c9f1c00 	ldchi	12, cr1, [pc], {0}
 84c:	90000003 	andls	r0, r0, r3
 850:	07000003 	streq	r0, [r0, -r3]
 854:	02010a00 	andeq	r0, r1, #0, 20
 858:	9f1c0074 	svcls	0x001c0074
 85c:	00000390 	muleq	r0, r0, r3
 860:	0000039c 	muleq	r0, ip, r3
 864:	000a0007 	andeq	r0, sl, r7
 868:	1c007402 	cfstrsne	mvf7, [r0], {2}
 86c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 870:	00000000 	andeq	r0, r0, r0
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008054 	andeq	r8, r0, r4, asr r0
  14:	00000194 	muleq	r0, r4, r1
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01f80002 	mvnseq	r0, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000081e8 	andeq	r8, r0, r8, ror #3
  34:	000000b4 	strheq	r0, [r0], -r4
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	03e00002 	mvneq	r0, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000829c 	muleq	r0, ip, r2
  54:	00000298 	muleq	r0, r8, r2
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	06d40002 	ldrbeq	r0, [r4], r2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008534 	andeq	r8, r0, r4, lsr r5
  74:	00000014 	andeq	r0, r0, r4, lsl r0
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	07970002 	ldreq	r0, [r7, r2]
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008548 	andeq	r8, r0, r8, asr #10
  94:	00000014 	andeq	r0, r0, r4, lsl r0
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	08b60002 	ldmeq	r6!, {r1}
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	0000855c 	andeq	r8, r0, ip, asr r5
  b4:	0000000c 	andeq	r0, r0, ip
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	09600002 	stmdbeq	r0!, {r1}^
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008568 	andeq	r8, r0, r8, ror #10
  d4:	00000180 	andeq	r0, r0, r0, lsl #3
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	0b7a0002 	bleq	1e800f4 <__user_program+0x1b800f4>
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	000086e8 	andeq	r8, r0, r8, ror #13
  f4:	0000039c 	muleq	r0, ip, r3
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	13980002 	orrsne	r0, r8, #2
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	00008000 	andeq	r8, r0, r0
 114:	00000054 	andeq	r0, r0, r4, asr r0
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	13fa0002 	mvnsne	r0, #2
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008a84 	andeq	r8, r0, r4, lsl #21
 134:	00000044 	andeq	r0, r0, r4, asr #32
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000090 	muleq	r0, r0, r0
   4:	004f0002 	subeq	r0, pc, r2
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
  38:	6f697067 	svcvs	0x00697067
  3c:	0100632e 	tsteq	r0, lr, lsr #6
  40:	736b0000 	cmnvc	fp, #0
  44:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  48:	00682e74 	rsbeq	r2, r8, r4, ror lr
  4c:	61000002 	tstvs	r0, r2
  50:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
  54:	00000200 	andeq	r0, r0, r0, lsl #4
  58:	02050000 	andeq	r0, r5, #0
  5c:	00008054 	andeq	r8, r0, r4, asr r0
  60:	0100d403 	tsteq	r0, r3, lsl #8
  64:	84a06a13 	strthi	r6, [r0], #2579	; 0xa13
  68:	4e2f4b83 	vmulmi.f64	d4, d31, d3
  6c:	d84b4d13 	stmdale	fp, {r0, r1, r4, r8, sl, fp, lr}^
  70:	4b4d13bf 	blmi	1344f74 <__user_program+0x1044f74>
  74:	6513bfd8 	ldrvs	fp, [r3, #-4056]	; 0xfd8
  78:	4b4b674f 	blmi	12d9dbc <__user_program+0xfd9dbc>
  7c:	9f684bbb 	svcls	0x00684bbb
  80:	4b146a4b 	blmi	51a9b4 <__user_program+0x21a9b4>
  84:	2f30672f 	svccs	0x0030672f
  88:	4a780330 	bmi	1e00d50 <__user_program+0x1b00d50>
  8c:	022e0903 	eoreq	r0, lr, #49152	; 0xc000
  90:	01010002 	tsteq	r1, r2
  94:	0000009d 	muleq	r0, sp, r0
  98:	00760002 	rsbseq	r0, r6, r2
  9c:	01020000 	mrseq	r0, (UNDEF: 2)
  a0:	000d0efb 	strdeq	r0, [sp], -fp
  a4:	01010101 	tsteq	r1, r1, lsl #2
  a8:	01000000 	mrseq	r0, (UNDEF: 0)
  ac:	6f010000 	svcvs	0x00010000
  b0:	5f64656c 	svcpl	0x0064656c
  b4:	65726373 	ldrbvs	r6, [r2, #-883]!	; 0x373
  b8:	745f6e65 	ldrbvc	r6, [pc], #-3685	; c0 <__start-0x7f40>
  bc:	2f747365 	svccs	0x00747365
  c0:	00637273 	rsbeq	r7, r3, r3, ror r2
  c4:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
  c8:	2f6b6269 	svccs	0x006b6269
  cc:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
  d0:	00656475 	rsbeq	r6, r5, r5, ror r4
  d4:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
  d8:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
  dc:	5f6e6565 	svcpl	0x006e6565
  e0:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0x574
  e4:	636e692f 	cmnvs	lr, #770048	; 0xbc000
  e8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
  ec:	656b0000 	strbvs	r0, [fp, #-0]!
  f0:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
  f4:	0100632e 	tsteq	r0, lr, lsr #6
  f8:	736b0000 	cmnvc	fp, #0
  fc:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 100:	00682e74 	rsbeq	r2, r8, r4, ror lr
 104:	73000002 	movwvc	r0, #2
 108:	65657263 	strbvs	r7, [r5, #-611]!	; 0x263
 10c:	00682e6e 	rsbeq	r2, r8, lr, ror #28
 110:	00000003 	andeq	r0, r0, r3
 114:	e8020500 	stmda	r2, {r8, sl}
 118:	03000081 	movweq	r0, #129	; 0x81
 11c:	30310110 	eorscc	r0, r1, r0, lsl r1
 120:	4b65512a 	blmi	19545d0 <__user_program+0x16545d0>
 124:	83838368 	orrhi	r8, r3, #104, 6	; 0xa0000001
 128:	67673068 	strbvs	r3, [r7, -r8, rrx]!
 12c:	66730367 	ldrbtvs	r0, [r3], -r7, ror #6
 130:	01000802 	tsteq	r0, r2, lsl #16
 134:	0000f401 	andeq	pc, r0, r1, lsl #8
 138:	8f000200 	svchi	0x00000200
 13c:	02000000 	andeq	r0, r0, #0
 140:	0d0efb01 	vstreq	d15, [lr, #-4]
 144:	01010100 	mrseq	r0, (UNDEF: 17)
 148:	00000001 	andeq	r0, r0, r1
 14c:	01000001 	tsteq	r0, r1
 150:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 154:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
 158:	5f6e6565 	svcpl	0x006e6565
 15c:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0x574
 160:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 164:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 168:	6b62696c 	blvs	189a720 <__user_program+0x159a720>
 16c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 170:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 174:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 178:	63735f64 	cmnvs	r3, #100, 30	; 0x190
 17c:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 180:	7365745f 	cmnvc	r5, #1593835520	; 0x5f000000
 184:	6e692f74 	mcrvs	15, 3, r2, cr9, cr4, {3}
 188:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 18c:	70000065 	andvc	r0, r0, r5, rrx
 190:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 194:	00632e6b 	rsbeq	r2, r3, fp, ror #28
 198:	6b000001 	blvs	1a4 <__start-0x7e5c>
 19c:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 1a0:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 1a4:	00000200 	andeq	r0, r0, r0, lsl #4
 1a8:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 1ac:	2e677261 	cdpcs	2, 6, cr7, cr7, cr1, {3}
 1b0:	00020068 	andeq	r0, r2, r8, rrx
 1b4:	75623c00 	strbvc	r3, [r2, #-3072]!	; 0xc00
 1b8:	2d746c69 	ldclcs	12, cr6, [r4, #-420]!	; 0xfffffe5c
 1bc:	003e6e69 	eorseq	r6, lr, r9, ror #28
 1c0:	75000000 	strvc	r0, [r0, #-0]
 1c4:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 1c8:	00030068 	andeq	r0, r3, r8, rrx
 1cc:	05000000 	streq	r0, [r0, #-0]
 1d0:	00829c02 	addeq	r9, r2, r2, lsl #24
 1d4:	01200300 	teqeq	r0, r0, lsl #6
 1d8:	009c4d88 	addseq	r4, ip, r8, lsl #27
 1dc:	4c010402 	cfstrsmi	mvf0, [r1], {2}
 1e0:	01040200 	mrseq	r0, R12_usr
 1e4:	04020033 	streq	r0, [r2], #-51	; 0x33
 1e8:	00590801 	subseq	r0, r9, r1, lsl #16
 1ec:	d7010402 	strle	r0, [r1, -r2, lsl #8]
 1f0:	9b6a4b4d 	blls	1a92f2c <__user_program+0x1792f2c>
 1f4:	6949872d 	stmdbvs	r9, {r0, r2, r3, r5, r8, r9, sl, pc}^
 1f8:	2003854d 	andcs	r8, r3, sp, asr #10
 1fc:	5c03514a 	stfpls	f5, [r3], {74}	; 0x4a
 200:	4b4b302e 	blmi	12cc2c0 <__user_program+0xfcc2c0>
 204:	152c0232 	strne	r0, [ip, #-562]!	; 0x232
 208:	a04b4b83 	subge	r4, fp, r3, lsl #23
 20c:	328367a4 	addcc	r6, r3, #164, 14	; 0x2900000
 210:	67338367 	ldrvs	r8, [r3, -r7, ror #6]!
 214:	67833283 	strvs	r3, [r3, r3, lsl #5]
 218:	4b678a2d 	blmi	19e2ad4 <__user_program+0x16e2ad4>
 21c:	4d334b32 	vldmdbmi	r3!, {d4-d28}
 220:	2e7fbf03 	cdpcs	15, 7, cr11, cr15, cr3, {0}
 224:	6600c603 	strvs	ip, [r0], -r3, lsl #12
 228:	01000802 	tsteq	r0, r2, lsl #16
 22c:	00006801 	andeq	r6, r0, r1, lsl #16
 230:	4f000200 	svcmi	0x00000200
 234:	02000000 	andeq	r0, r0, #0
 238:	0d0efb01 	vstreq	d15, [lr, #-4]
 23c:	01010100 	mrseq	r0, (UNDEF: 17)
 240:	00000001 	andeq	r0, r0, r1
 244:	01000001 	tsteq	r0, r1
 248:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 24c:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
 250:	5f6e6565 	svcpl	0x006e6565
 254:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0x574
 258:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 25c:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 260:	6b62696c 	blvs	189a818 <__user_program+0x159a818>
 264:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 268:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 26c:	61750000 	cmnvs	r5, r0
 270:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 274:	00000100 	andeq	r0, r0, r0, lsl #2
 278:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 27c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 280:	00020068 	andeq	r0, r2, r8, rrx
 284:	05000000 	streq	r0, [r0, #-0]
 288:	00853402 	addeq	r3, r5, r2, lsl #8
 28c:	010c0300 	mrseq	r0, LR_mon
 290:	14323232 	ldrtne	r3, [r2], #-562	; 0x232
 294:	01000402 	tsteq	r0, r2, lsl #8
 298:	00006701 	andeq	r6, r0, r1, lsl #14
 29c:	4e000200 	cdpmi	2, 0, cr0, cr0, cr0, {0}
 2a0:	02000000 	andeq	r0, r0, #0
 2a4:	0d0efb01 	vstreq	d15, [lr, #-4]
 2a8:	01010100 	mrseq	r0, (UNDEF: 17)
 2ac:	00000001 	andeq	r0, r0, r1
 2b0:	01000001 	tsteq	r0, r1
 2b4:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 2b8:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
 2bc:	5f6e6565 	svcpl	0x006e6565
 2c0:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0x574
 2c4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 2c8:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 2cc:	6b62696c 	blvs	189a884 <__user_program+0x159a884>
 2d0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 2d4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 2d8:	32690000 	rsbcc	r0, r9, #0
 2dc:	00632e63 	rsbeq	r2, r3, r3, ror #28
 2e0:	6b000001 	blvs	2ec <__start-0x7d14>
 2e4:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 2e8:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 2ec:	00000200 	andeq	r0, r0, r0, lsl #4
 2f0:	02050000 	andeq	r0, r5, #0
 2f4:	00008548 	andeq	r8, r0, r8, asr #10
 2f8:	32010c03 	andcc	r0, r1, #768	; 0x300
 2fc:	02144c14 	andseq	r4, r4, #20, 24	; 0x1400
 300:	01010004 	tsteq	r1, r4
 304:	00000069 	andeq	r0, r0, r9, rrx
 308:	00520002 	subseq	r0, r2, r2
 30c:	01020000 	mrseq	r0, (UNDEF: 2)
 310:	000d0efb 	strdeq	r0, [sp], -fp
 314:	01010101 	tsteq	r1, r1, lsl #2
 318:	01000000 	mrseq	r0, (UNDEF: 0)
 31c:	6f010000 	svcvs	0x00010000
 320:	5f64656c 	svcpl	0x0064656c
 324:	65726373 	ldrbvs	r6, [r2, #-883]!	; 0x373
 328:	745f6e65 	ldrbvc	r6, [pc], #-3685	; 330 <__start-0x7cd0>
 32c:	2f747365 	svccs	0x00747365
 330:	00637273 	rsbeq	r7, r3, r3, ror r2
 334:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 338:	2f6b6269 	svccs	0x006b6269
 33c:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 340:	00656475 	rsbeq	r6, r5, r5, ror r4
 344:	73646100 	cmnvc	r4, #0, 2
 348:	35313031 	ldrcc	r3, [r1, #-49]!	; 0x31
 34c:	0100632e 	tsteq	r0, lr, lsr #6
 350:	736b0000 	cmnvc	fp, #0
 354:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 358:	00682e74 	rsbeq	r2, r8, r4, ror lr
 35c:	00000002 	andeq	r0, r0, r2
 360:	5c020500 	cfstr32pl	mvfx0, [r2], {-0}
 364:	03000085 	movweq	r0, #133	; 0x85
 368:	1432010c 	ldrtne	r0, [r2], #-268	; 0x10c
 36c:	01000402 	tsteq	r0, r2, lsl #8
 370:	00009d01 	andeq	r9, r0, r1, lsl #26
 374:	58000200 	stmdapl	r0, {r9}
 378:	02000000 	andeq	r0, r0, #0
 37c:	0d0efb01 	vstreq	d15, [lr, #-4]
 380:	01010100 	mrseq	r0, (UNDEF: 17)
 384:	00000001 	andeq	r0, r0, r1
 388:	01000001 	tsteq	r0, r1
 38c:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 390:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
 394:	5f6e6565 	svcpl	0x006e6565
 398:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0x574
 39c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 3a0:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 3a4:	6b62696c 	blvs	189a95c <__user_program+0x159a95c>
 3a8:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 3ac:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 3b0:	70730000 	rsbsvc	r0, r3, r0
 3b4:	00632e69 	rsbeq	r2, r3, r9, ror #28
 3b8:	6b000001 	blvs	3c4 <__start-0x7c3c>
 3bc:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 3c0:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 3c4:	00000200 	andeq	r0, r0, r0, lsl #4
 3c8:	6f697067 	svcvs	0x00697067
 3cc:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 3d0:	00000000 	andeq	r0, r0, r0
 3d4:	85680205 	strbhi	r0, [r8, #-517]!	; 0x205
 3d8:	35030000 	strcc	r0, [r3, #-0]
 3dc:	2d671301 	stclcs	3, cr1, [r7, #-4]!
 3e0:	67674e87 	strbvs	r4, [r7, -r7, lsl #29]!
 3e4:	68856a68 	stmvs	r5, {r3, r5, r6, r9, fp, sp, lr}
 3e8:	31303134 	teqcc	r0, r4, lsr r1
 3ec:	0d03692f 	stceq	9, cr6, [r3, #-188]	; 0xffffff44
 3f0:	34688501 	strbtcc	r8, [r8], #-1281	; 0x501
 3f4:	4e313031 	mrcmi	0, 1, r3, cr1, cr1, {1}
 3f8:	6a4ebe14 	bvs	13afc50 <__user_program+0x10afc50>
 3fc:	2d67312f 	stfcse	f3, [r7, #-188]!	; 0xffffff44
 400:	696b494b 	stmdbvs	fp!, {r0, r1, r3, r6, r8, fp, lr}^
 404:	494b2d67 	stmdbmi	fp, {r0, r1, r2, r5, r6, r8, sl, fp, sp}^
 408:	2f2f696b 	svccs	0x002f696b
 40c:	00040232 	andeq	r0, r4, r2, lsr r2
 410:	01300101 	teqeq	r0, r1, lsl #2
 414:	00020000 	andeq	r0, r2, r0
 418:	0000007d 	andeq	r0, r0, sp, ror r0
 41c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 420:	0101000d 	tsteq	r1, sp
 424:	00000101 	andeq	r0, r0, r1, lsl #2
 428:	00000100 	andeq	r0, r0, r0, lsl #2
 42c:	656c6f01 	strbvs	r6, [ip, #-3841]!	; 0xf01
 430:	63735f64 	cmnvs	r3, #100, 30	; 0x190
 434:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 438:	7365745f 	cmnvc	r5, #1593835520	; 0x5f000000
 43c:	72732f74 	rsbsvc	r2, r3, #116, 30	; 0x1d0
 440:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 444:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 448:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 44c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 450:	6c6f0065 	stclvs	0, cr0, [pc], #-404	; 2c4 <__start-0x7d3c>
 454:	735f6465 	cmpvc	pc, #1694498816	; 0x65000000
 458:	65657263 	strbvs	r7, [r5, #-611]!	; 0x263
 45c:	65745f6e 	ldrbvs	r5, [r4, #-3950]!	; 0xf6e
 460:	692f7473 	stmdbvs	pc!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}	; <UNPREDICTABLE>
 464:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 468:	00006564 	andeq	r6, r0, r4, ror #10
 46c:	65726373 	ldrbvs	r6, [r2, #-883]!	; 0x373
 470:	632e6e65 	teqvs	lr, #1616	; 0x650
 474:	00000100 	andeq	r0, r0, r0, lsl #2
 478:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 47c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 480:	00020068 	andeq	r0, r2, r8, rrx
 484:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
 488:	00682e6f 	rsbeq	r2, r8, pc, ror #28
 48c:	73000002 	movwvc	r0, #2
 490:	682e6970 	stmdavs	lr!, {r4, r5, r6, r8, fp, sp, lr}
 494:	00000300 	andeq	r0, r0, r0, lsl #6
 498:	02050000 	andeq	r0, r5, #0
 49c:	000086e8 	andeq	r8, r0, r8, ror #13
 4a0:	2d671319 	stclcs	3, cr1, [r7, #-100]!	; 0xffffff9c
 4a4:	2d68148a 	cfstrdcs	mvd1, [r8, #-552]!	; 0xfffffdd8
 4a8:	2f494c30 	svccs	0x00494c30
 4ac:	2e7a0383 	cdpcs	3, 7, cr0, cr10, cr3, {4}
 4b0:	68143135 	ldmdavs	r4, {r0, r2, r4, r5, r8, ip, sp}
 4b4:	494c302d 	stmdbmi	ip, {r0, r2, r3, r5, ip, sp}^
 4b8:	7a03832f 	bvc	e117c <__bss_end+0xd517c>
 4bc:	4c32352e 	cfldr32mi	mvfx3, [r2], #-184	; 0xffffff48
 4c0:	03040200 	movweq	r0, #16896	; 0x4200
 4c4:	68062e06 	stmdavs	r6, {r1, r2, r9, sl, fp, sp}
 4c8:	4c661103 	stfmie	f1, [r6], #-12
 4cc:	4b674b4b 	blmi	19d3200 <__user_program+0x16d3200>
 4d0:	4b4b4c4e 	blmi	12d3610 <__user_program+0xfd3610>
 4d4:	2f4d4b67 	svccs	0x004d4b67
 4d8:	4b674b67 	blmi	19d327c <__user_program+0x16d327c>
 4dc:	6619034b 	ldrvs	r0, [r9], -fp, asr #6
 4e0:	67672f2f 	strbvs	r2, [r7, -pc, lsr #30]!
 4e4:	694c4b4b 	stmdbvs	ip, {r0, r1, r3, r6, r8, r9, fp, lr}^
 4e8:	4b4b4b4b 	blmi	12d321c <__user_program+0xfd321c>
 4ec:	4b4b4b4b 	blmi	12d3220 <__user_program+0xfd3220>
 4f0:	4b4b4b4b 	blmi	12d3224 <__user_program+0xfd3224>
 4f4:	4b4b4b4b 	blmi	12d3228 <__user_program+0xfd3228>
 4f8:	4b4b4b4b 	blmi	12d322c <__user_program+0xfd322c>
 4fc:	4b4b4b4b 	blmi	12d3230 <__user_program+0xfd3230>
 500:	4b4b2f69 	blmi	12cc2ac <__user_program+0xfcc2ac>
 504:	034b4b4b 	movteq	r4, #47947	; 0xbb4b
 508:	31667f94 			; <UNDEFINED> instruction: 0x31667f94
 50c:	02004b2f 	andeq	r4, r0, #48128	; 0xbc00
 510:	00a10304 	adceq	r0, r1, r4, lsl #6
 514:	49030402 	stmdbmi	r3, {r1, sl}
 518:	1e03304d 	cdpne	0, 0, cr3, cr3, cr13, {2}
 51c:	4b2f3166 	blmi	bccabc <__user_program+0x8ccabc>
 520:	04020084 	streq	r0, [r2], #-132	; 0x84
 524:	004a0603 	subeq	r0, sl, r3, lsl #12
 528:	06030402 	streq	r0, [r3], -r2, lsl #8
 52c:	bd2f4c9d 	stclt	12, cr4, [pc, #-628]!	; 2c0 <__start-0x7d40>
 530:	844b2f30 	strbhi	r2, [fp], #-3888	; 0xf30
 534:	03040200 	movweq	r0, #16896	; 0x4200
 538:	02002e06 	andeq	r2, r0, #6, 28	; 0x60
 53c:	49060304 	stmdbmi	r6, {r2, r8, r9}
 540:	0004024c 	andeq	r0, r4, ip, asr #4
 544:	00540101 	subseq	r0, r4, r1, lsl #2
 548:	00020000 	andeq	r0, r2, r0
 54c:	00000029 	andeq	r0, r0, r9, lsr #32
 550:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 554:	0101000d 	tsteq	r1, sp
 558:	00000101 	andeq	r0, r0, r1, lsl #2
 55c:	00000100 	andeq	r0, r0, r0, lsl #2
 560:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 564:	6b62696c 	blvs	189ab1c <__user_program+0x159ab1c>
 568:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 56c:	6f620000 	svcvs	0x00620000
 570:	532e746f 	teqpl	lr, #1862270976	; 0x6f000000
 574:	00000100 	andeq	r0, r0, r0, lsl #2
 578:	02050000 	andeq	r0, r5, #0
 57c:	00008000 	andeq	r8, r0, r0
 580:	2f011b03 	svccs	0x00011b03
 584:	2f302f2f 	svccs	0x00302f2f
 588:	2f2f2f2f 	svccs	0x002f2f2f
 58c:	2f2f312f 	svccs	0x002f312f
 590:	032f3331 	teqeq	pc, #-1006632960	; 0xc4000000
 594:	2f312e69 	svccs	0x00312e69
 598:	0002022f 	andeq	r0, r2, pc, lsr #4
 59c:	004d0101 	subeq	r0, sp, r1, lsl #2
 5a0:	00020000 	andeq	r0, r2, r0
 5a4:	00000028 	andeq	r0, r0, r8, lsr #32
 5a8:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 5ac:	0101000d 	tsteq	r1, sp
 5b0:	00000101 	andeq	r0, r0, r1, lsl #2
 5b4:	00000100 	andeq	r0, r0, r0, lsl #2
 5b8:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 5bc:	6b62696c 	blvs	189ab74 <__user_program+0x159ab74>
 5c0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 5c4:	72610000 	rsbvc	r0, r1, #0
 5c8:	00532e6d 	subseq	r2, r3, sp, ror #28
 5cc:	00000001 	andeq	r0, r0, r1
 5d0:	84020500 	strhi	r0, [r2], #-1280	; 0x500
 5d4:	0300008a 	movweq	r0, #138	; 0x8a
 5d8:	2f2f0110 	svccs	0x002f0110
 5dc:	2f332f33 	svccs	0x00332f33
 5e0:	2f2f2f33 	svccs	0x002f2f33
 5e4:	2f2f332f 	svccs	0x002f332f
 5e8:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 5ec:	Address 0x000005ec is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	70670074 	rsbvc	r0, r7, r4, ror r0
  10:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  14:	705f7465 	subsvc	r7, pc, r5, ror #8
  18:	006c6c75 	rsbeq	r6, ip, r5, ror ip
  1c:	746e6975 	strbtvc	r6, [lr], #-2421	; 0x975
  20:	745f3233 	ldrbvc	r3, [pc], #-563	; 28 <__start-0x7fd8>
  24:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  28:	7067006f 	rsbvc	r0, r7, pc, rrx
  2c:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  30:	6c007465 	cfstrsvs	mvf7, [r0], {101}	; 0x65
  34:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  38:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
  3c:	736e7520 	cmnvc	lr, #32, 10	; 0x8000000
  40:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
  44:	6e692064 	cdpvs	0, 6, cr2, cr9, cr4, {3}
  48:	70670074 	rsbvc	r0, r7, r4, ror r0
  4c:	635f6f69 	cmpvs	pc, #420	; 0x1a4
  50:	4700726c 	strmi	r7, [r0, -ip, ror #4]
  54:	4320554e 	teqmi	r0, #327155712	; 0x13800000
  58:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  5c:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  60:	30353130 	eorscc	r3, r5, r0, lsr r1
  64:	20393235 	eorscs	r3, r9, r5, lsr r2
  68:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  6c:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  70:	415b2029 	cmpmi	fp, r9, lsr #32
  74:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff32a <__user_program+0xffcff32a>
  78:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  7c:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  80:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  84:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  88:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  8c:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  90:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  94:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  98:	205d3838 	subscs	r3, sp, r8, lsr r8
  9c:	6c666d2d 	stclvs	13, cr6, [r6], #-180	; 0xffffff4c
  a0:	2d74616f 	ldfcse	f6, [r4, #-444]!	; 0xfffffe44
  a4:	3d696261 	sfmcc	f6, 2, [r9, #-388]!	; 0xfffffe7c
  a8:	74666f73 	strbtvc	r6, [r6], #-3955	; 0xf73
  ac:	616d2d20 	cmnvs	sp, r0, lsr #26
  b0:	3d686372 	stclcc	3, cr6, [r8, #-456]!	; 0xfffffe38
  b4:	766d7261 	strbtvc	r7, [sp], -r1, ror #4
  b8:	20612d37 	rsbcs	r2, r1, r7, lsr sp
  bc:	2d20672d 	stccs	7, cr6, [r0, #-180]!	; 0xffffff4c
  c0:	2d20314f 	stfcss	f3, [r0, #-316]!	; 0xfffffec4
  c4:	65726666 	ldrbvs	r6, [r2, #-1638]!	; 0x666
  c8:	61747365 	cmnvs	r4, r5, ror #6
  cc:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
  d0:	70670067 	rsbvc	r0, r7, r7, rrx
  d4:	675f6f69 	ldrbvs	r6, [pc, -r9, ror #30]
  d8:	6c5f7465 	cfldrdvs	mvd7, [pc], {101}	; 0x65
  dc:	6c657665 	stclvs	6, cr7, [r5], #-404	; 0xfffffe6c
  e0:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
  e4:	745f3874 	ldrbvc	r3, [pc], #-2164	; ec <__start-0x7f14>
  e8:	736e7500 	cmnvc	lr, #0, 10
  ec:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
  f0:	68632064 	stmdavs	r3!, {r2, r5, r6, sp}^
  f4:	64007261 	strvs	r7, [r0], #-609	; 0x261
  f8:	79616c65 	stmdbvc	r1!, {r0, r2, r5, r6, sl, fp, sp, lr}^
  fc:	6379635f 	cmnvs	r9, #2080374785	; 0x7c000001
 100:	0073656c 	rsbseq	r6, r3, ip, ror #10
 104:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xd2f
 108:	6667682f 	strbtvs	r6, [r7], -pc, lsr #16
 10c:	34332f73 	ldrtcc	r2, [r3], #-3955	; 0xf73
 110:	31662f39 	cmncc	r6, r9, lsr pc
 114:	616c2d37 	cmnvs	ip, r7, lsr sp
 118:	642d3362 	strtvs	r3, [sp], #-866	; 0x362
 11c:	64697661 	strbtvs	r7, [r9], #-1633	; 0x661
 120:	656d616a 	strbvs	r6, [sp, #-362]!	; 0x16a
 124:	6f632f73 	svcvs	0x00632f73
 128:	73006564 	movwvc	r6, #1380	; 0x564
 12c:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xf68
 130:	736e7520 	cmnvc	lr, #32, 10	; 0x8000000
 134:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
 138:	6e692064 	cdpvs	0, 6, cr2, cr9, cr4, {3}
 13c:	74730074 	ldrbtvc	r0, [r3], #-116	; 0x74
 140:	00657461 	rsbeq	r7, r5, r1, ror #8
 144:	6f697067 	svcvs	0x00697067
 148:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 14c:	00676966 	rsbeq	r6, r7, r6, ror #18
 150:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
 154:	6e692074 	mcrvs	0, 3, r2, cr9, cr4, {3}
 158:	666f0074 			; <UNDEFINED> instruction: 0x666f0074
 15c:	74657366 	strbtvc	r7, [r5], #-870	; 0x366
 160:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 164:	6b62696c 	blvs	189a71c <__user_program+0x159a71c>
 168:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 16c:	6970672f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r8, r9, sl, sp, lr}^
 170:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 174:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 178:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 17c:	726c635f 	rsbvc	r6, ip, #2080374785	; 0x7c000001
 180:	6f682f00 	svcvs	0x00682f00
 184:	652f656d 	strvs	r6, [pc, #-1389]!	; fffffc1f <__user_program+0xffcffc1f>
 188:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
 18c:	34332f39 	ldrtcc	r2, [r3], #-3897	; 0xf39
 190:	2f332f39 	svccs	0x00332f39
 194:	2d373166 	ldfcss	f3, [r7, #-408]!	; 0xfffffe68
 198:	3362616c 	cmncc	r2, #108, 2
 19c:	7661642d 	strbtvc	r6, [r1], -sp, lsr #8
 1a0:	616a6469 	cmnvs	sl, r9, ror #8
 1a4:	2f73656d 	svccs	0x0073656d
 1a8:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 1ac:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 1b0:	75625f64 	strbvc	r5, [r2, #-3940]!	; 0xf64
 1b4:	69705f66 	ldmdbvs	r0!, {r1, r2, r5, r6, r8, r9, sl, fp, ip, lr}^
 1b8:	5f6c6578 	svcpl	0x006c6578
 1bc:	00746573 	rsbseq	r6, r4, r3, ror r5
 1c0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 1c4:	6d5f6c65 	ldclvs	12, cr6, [pc, #-404]	; 38 <__start-0x7fc8>
 1c8:	006e6961 	rsbeq	r6, lr, r1, ror #18
 1cc:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 1d0:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 1d4:	6172645f 	cmnvs	r2, pc, asr r4
 1d8:	6c6f0077 	stclvs	0, cr0, [pc], #-476	; 4 <__start-0x7ffc>
 1dc:	625f6465 	subsvs	r6, pc, #1694498816	; 0x65000000
 1e0:	705f6675 	subsvc	r6, pc, r5, ror r6	; <UNPREDICTABLE>
 1e4:	6c657869 	stclvs	8, cr7, [r5], #-420	; 0xfffffe5c
 1e8:	726c635f 	rsbvc	r6, ip, #2080374785	; 0x7c000001
 1ec:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 1f0:	6e695f64 	cdpvs	15, 6, cr5, cr9, cr4, {3}
 1f4:	6f007469 	svcvs	0x00007469
 1f8:	5f64656c 	svcpl	0x0064656c
 1fc:	65726373 	ldrbvs	r6, [r2, #-883]!	; 0x373
 200:	745f6e65 	ldrbvc	r6, [pc], #-3685	; 208 <__start-0x7df8>
 204:	2f747365 	svccs	0x00747365
 208:	2f637273 	svccs	0x00637273
 20c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 210:	632e6c65 	teqvs	lr, #25856	; 0x6500
 214:	74796200 	ldrbtvc	r6, [r9], #-512	; 0x200
 218:	74705f65 	ldrbtvc	r5, [r0], #-3941	; 0xf65
 21c:	6c6f0072 	stclvs	0, cr0, [pc], #-456	; 5c <__start-0x7fa4>
 220:	735f6465 	cmpvc	pc, #1694498816	; 0x65000000
 224:	65657263 	strbvs	r7, [r5, #-611]!	; 0x263
 228:	65745f6e 	ldrbvs	r5, [r4, #-3950]!	; 0xf6e
 22c:	732f7473 	teqvc	pc, #1929379840	; 0x73000000
 230:	702f6372 	eorvc	r6, pc, r2, ror r3	; <UNPREDICTABLE>
 234:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 238:	00632e6b 	rsbeq	r2, r3, fp, ror #28
 23c:	746e6975 	strbtvc	r6, [lr], #-2421	; 0x975
 240:	745f3436 	ldrbvc	r3, [pc], #-1078	; 248 <__start-0x7db8>
 244:	765f5f00 	ldrbvc	r5, [pc], -r0, lsl #30
 248:	696c5f61 	stmdbvs	ip!, {r0, r5, r6, r8, r9, sl, fp, ip, lr}^
 24c:	75007473 	strvc	r7, [r0, #-1139]	; 0x473
 250:	5f747261 	svcpl	0x00747261
 254:	5f747570 	svcpl	0x00747570
 258:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0x962
 25c:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 260:	756e746e 	strbvc	r7, [lr, #-1134]!	; 0x46e
 264:	64006b6d 	strvs	r6, [r0], #-2925	; 0xb6d
 268:	74696769 	strbtvc	r6, [r9], #-1897	; 0x769
 26c:	72700073 	rsbsvc	r0, r0, #115	; 0x73
 270:	78696665 	stmdavc	r9!, {r0, r2, r5, r6, r9, sl, sp, lr}^
 274:	73616200 	cmnvc	r1, #0, 4
 278:	72700065 	rsbsvc	r0, r0, #101	; 0x65
 27c:	6b746e69 	blvs	1d1bc28 <__user_program+0x1a1bc28>
 280:	67726100 	ldrbvs	r6, [r2, -r0, lsl #2]!
 284:	69730073 	ldmdbvs	r3!, {r0, r1, r4, r5, r6}^
 288:	7974657a 	ldmdbvc	r4!, {r1, r3, r4, r5, r6, r8, sl, sp, lr}^
 28c:	5f006570 	svcpl	0x00006570
 290:	0070615f 	rsbseq	r6, r0, pc, asr r1
 294:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 298:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
 29c:	5f6e6565 	svcpl	0x006e6565
 2a0:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0x574
 2a4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 2a8:	7261752f 	rsbvc	r7, r1, #197132288	; 0xbc00000
 2ac:	00632e74 	rsbeq	r2, r3, r4, ror lr
 2b0:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 2b4:	7465675f 	strbtvc	r6, [r5], #-1887	; 0x75f
 2b8:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0x25f
 2bc:	61750065 	cmnvs	r5, r5, rrx
 2c0:	695f7472 	ldmdbvs	pc, {r1, r4, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 2c4:	0074696e 	rsbseq	r6, r4, lr, ror #18
 2c8:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 2cc:	6f6c635f 	svcvs	0x006c635f
 2d0:	69006573 	stmdbvs	r0, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 2d4:	6d5f6332 	ldclvs	3, cr6, [pc, #-200]	; 214 <__start-0x7dec>
 2d8:	65747361 	ldrbvs	r7, [r4, #-865]!	; 0x361
 2dc:	6e695f72 	mcrvs	15, 3, r5, cr9, cr2, {3}
 2e0:	61007469 	tstvs	r0, r9, ror #8
 2e4:	00726464 	rsbseq	r6, r2, r4, ror #8
 2e8:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 2ec:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
 2f0:	5f6e6565 	svcpl	0x006e6565
 2f4:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0x574
 2f8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 2fc:	6332692f 	teqvs	r2, #770048	; 0xbc000
 300:	6900632e 	stmdbvs	r0, {r1, r2, r3, r5, r8, r9, sp, lr}
 304:	6d5f6332 	ldclvs	3, cr6, [pc, #-200]	; 244 <__start-0x7dbc>
 308:	65747361 	ldrbvs	r7, [r4, #-865]!	; 0x361
 30c:	65725f72 	ldrbvs	r5, [r2, #-3954]!	; 0xf72
 310:	75006461 	strvc	r6, [r0, #-1121]	; 0x461
 314:	31746e69 	cmncc	r4, r9, ror #28
 318:	00745f36 	rsbseq	r5, r4, r6, lsr pc
 31c:	5f633269 	svcpl	0x00633269
 320:	7473616d 	ldrbtvc	r6, [r3], #-365	; 0x16d
 324:	775f7265 	ldrbvc	r7, [pc, -r5, ror #4]
 328:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0x972
 32c:	61686300 	cmnvs	r8, r0, lsl #6
 330:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 334:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 338:	63735f64 	cmnvs	r3, #100, 30	; 0x190
 33c:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 340:	7365745f 	cmnvc	r5, #1593835520	; 0x5f000000
 344:	72732f74 	rsbsvc	r2, r3, #116, 30	; 0x1d0
 348:	64612f63 	strbtvs	r2, [r1], #-3939	; 0xf63
 34c:	31303173 	teqcc	r0, r3, ror r1
 350:	00632e35 	rsbeq	r2, r3, r5, lsr lr
 354:	5f636461 	svcpl	0x00636461
 358:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 35c:	63646100 	cmnvs	r4, #0, 2
 360:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 364:	6f6d0074 	svcvs	0x006d0074
 368:	73006564 	movwvc	r6, #1380	; 0x564
 36c:	625f6970 	subsvs	r6, pc, #112, 18	; 0x1c0000
 370:	6e696765 	cdpvs	7, 6, cr6, cr9, cr5, {3}
 374:	69707300 	ldmdbvs	r0!, {r8, r9, ip, sp, lr}^
 378:	6172745f 	cmnvs	r2, pc, asr r4
 37c:	6566736e 	strbvs	r7, [r6, #-878]!	; 0x36e
 380:	70730072 	rsbsvc	r0, r3, r2, ror r0
 384:	616d5f69 	cmnvs	sp, r9, ror #30
 388:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
 38c:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 390:	70730074 	rsbsvc	r0, r3, r4, ror r0
 394:	6e655f69 	cdpvs	15, 6, cr5, cr5, cr9, {3}
 398:	6d630064 	stclvs	0, cr0, [r3, #-400]!	; 0xfffffe70
 39c:	646f4d64 	strbtvs	r4, [pc], #-3428	; 3a4 <__start-0x7c5c>
 3a0:	65640065 	strbvs	r0, [r4, #-101]!	; 0x65
 3a4:	0079616c 	rsbseq	r6, r9, ip, ror #2
 3a8:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 3ac:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
 3b0:	5f6e6565 	svcpl	0x006e6565
 3b4:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0x574
 3b8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 3bc:	6970732f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r8, r9, ip, sp, lr}^
 3c0:	7400632e 	strvc	r6, [r0], #-814	; 0x32e
 3c4:	74696177 	strbtvc	r6, [r9], #-375	; 0x177
 3c8:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 3cc:	72775f64 	rsbsvc	r5, r7, #100, 30	; 0x190
 3d0:	5f657469 	svcpl	0x00657469
 3d4:	61746164 	cmnvs	r4, r4, ror #2
 3d8:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 3dc:	63735f64 	cmnvs	r3, #100, 30	; 0x190
 3e0:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
 3e4:	7365745f 	cmnvc	r5, #1593835520	; 0x5f000000
 3e8:	6c6f0074 	stclvs	0, cr0, [pc], #-464	; 220 <__start-0x7de0>
 3ec:	635f6465 	cmpvs	pc, #1694498816	; 0x65000000
 3f0:	7261656c 	rsbvc	r6, r1, #108, 10	; 0x1b000000
 3f4:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
 3f8:	006e6565 	rsbeq	r6, lr, r5, ror #10
 3fc:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 400:	7263735f 	rsbvc	r7, r3, #2080374785	; 0x7c000001
 404:	5f6e6565 	svcpl	0x006e6565
 408:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0x574
 40c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 410:	7263732f 	rsbvc	r7, r3, #-1140850688	; 0xbc000000
 414:	2e6e6565 	cdpcs	5, 6, cr6, cr14, cr5, {3}
 418:	6e690063 	cdpvs	0, 6, cr0, cr9, cr3, {3}
 41c:	00786564 	rsbseq	r6, r8, r4, ror #10
 420:	656c6f5f 	strbvs	r6, [ip, #-3935]!	; 0xf5f
 424:	72665f64 	rsbvc	r5, r6, #100, 30	; 0x190
 428:	5f656d61 	svcpl	0x00656d61
 42c:	66667562 	strbtvs	r7, [r6], -r2, ror #10
 430:	6f007265 	svcvs	0x00007265
 434:	5f64656c 	svcpl	0x0064656c
 438:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
 43c:	65735f74 	ldrbvs	r5, [r3, #-3956]!	; 0xf74
 440:	6e657571 	mcrvs	5, 3, r7, cr5, cr1, {3}
 444:	6f006563 	svcvs	0x00006563
 448:	5f64656c 	svcpl	0x0064656c
 44c:	74697277 	strbtvc	r7, [r9], #-631	; 0x277
 450:	6f635f65 	svcvs	0x00635f65
 454:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
 458:	6c6f0064 	stclvs	0, cr0, [pc], #-400	; 2d0 <__start-0x7d30>
 45c:	725f6465 	subsvc	r6, pc, #1694498816	; 0x65000000
 460:	74657365 	strbtvc	r7, [r5], #-869	; 0x365
	...

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
  24:	1a011803 	bne	46038 <__bss_end+0x3a038>
  28:	22011e01 	andcs	r1, r1, #1, 28
  2c:	Address 0x0000002c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000000c 	andeq	r0, r0, ip
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000054 	andeq	r0, r0, r4, asr r0
  20:	0000000c 	andeq	r0, r0, ip
  24:	00000000 	andeq	r0, r0, r0
  28:	000080a8 	andeq	r8, r0, r8, lsr #1
  2c:	00000044 	andeq	r0, r0, r4, asr #32
  30:	0000000c 	andeq	r0, r0, ip
  34:	00000000 	andeq	r0, r0, r0
  38:	000080ec 	andeq	r8, r0, ip, ror #1
  3c:	00000044 	andeq	r0, r0, r4, asr #32
  40:	00000018 	andeq	r0, r0, r8, lsl r0
  44:	00000000 	andeq	r0, r0, r0
  48:	00008130 	andeq	r8, r0, r0, lsr r1
  4c:	00000084 	andeq	r0, r0, r4, lsl #1
  50:	83100e48 	tsthi	r0, #72, 28	; 0x480
  54:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
  58:	00018e02 	andeq	r8, r1, r2, lsl #28
  5c:	0000000c 	andeq	r0, r0, ip
  60:	00000000 	andeq	r0, r0, r0
  64:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  68:	00000034 	andeq	r0, r0, r4, lsr r0
  6c:	0000000c 	andeq	r0, r0, ip
  70:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  74:	7c020001 	stcvc	0, cr0, [r2], {1}
  78:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  7c:	00000020 	andeq	r0, r0, r0, lsr #32
  80:	0000006c 	andeq	r0, r0, ip, rrx
  84:	000081e8 	andeq	r8, r0, r8, ror #3
  88:	000000b4 	strheq	r0, [r0], -r4
  8c:	83200e42 	teqhi	r0, #1056	; 0x420
  90:	85078408 	strhi	r8, [r7, #-1032]	; 0x408
  94:	87058606 	strhi	r8, [r5, -r6, lsl #12]
  98:	89038804 	stmdbhi	r3, {r2, fp, pc}
  9c:	00018e02 	andeq	r8, r1, r2, lsl #28
  a0:	0000000c 	andeq	r0, r0, ip
  a4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  a8:	7c020001 	stcvc	0, cr0, [r2], {1}
  ac:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  b0:	00000028 	andeq	r0, r0, r8, lsr #32
  b4:	000000a0 	andeq	r0, r0, r0, lsr #1
  b8:	0000829c 	muleq	r0, ip, r2
  bc:	000000e0 	andeq	r0, r0, r0, ror #1
  c0:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
  c4:	86078508 	strhi	r8, [r7], -r8, lsl #10
  c8:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
  cc:	8a038904 	bhi	e24e4 <__bss_end+0xd64e4>
  d0:	42018e02 	andmi	r8, r1, #2, 28
  d4:	6a02280e 	bvs	8a114 <__bss_end+0x7e114>
  d8:	0000200e 	andeq	r2, r0, lr
  dc:	00000040 	andeq	r0, r0, r0, asr #32
  e0:	000000a0 	andeq	r0, r0, r0, lsr #1
  e4:	0000837c 	andeq	r8, r0, ip, ror r3
  e8:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
  ec:	80100e42 	andshi	r0, r0, r2, asr #28
  f0:	82038104 	andhi	r8, r3, #4, 2
  f4:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
  f8:	0a84280e 	beq	fe10a138 <__user_program+0xfde0a138>
  fc:	08860985 	stmeq	r6, {r0, r2, r7, r8, fp}
 100:	06880787 	streq	r0, [r8], r7, lsl #15
 104:	0e42058e 	cdpeq	5, 4, cr0, cr2, cr14, {4}
 108:	0ed00230 	mrceq	2, 6, r0, cr0, cr0, {1}
 10c:	c8ce4228 	stmiagt	lr, {r3, r5, r9, lr}^
 110:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 114:	c342100e 	movtgt	r1, #8206	; 0x200e
 118:	0ec0c1c2 	acseqdm	f4, f2
 11c:	00000000 	andeq	r0, r0, r0
 120:	0000000c 	andeq	r0, r0, ip
 124:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 128:	7c020001 	stcvc	0, cr0, [r2], {1}
 12c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 130:	0000000c 	andeq	r0, r0, ip
 134:	00000120 	andeq	r0, r0, r0, lsr #2
 138:	00008534 	andeq	r8, r0, r4, lsr r5
 13c:	00000004 	andeq	r0, r0, r4
 140:	0000000c 	andeq	r0, r0, ip
 144:	00000120 	andeq	r0, r0, r0, lsr #2
 148:	00008538 	andeq	r8, r0, r8, lsr r5
 14c:	00000004 	andeq	r0, r0, r4
 150:	0000000c 	andeq	r0, r0, ip
 154:	00000120 	andeq	r0, r0, r0, lsr #2
 158:	0000853c 	andeq	r8, r0, ip, lsr r5
 15c:	00000004 	andeq	r0, r0, r4
 160:	0000000c 	andeq	r0, r0, ip
 164:	00000120 	andeq	r0, r0, r0, lsr #2
 168:	00008540 	andeq	r8, r0, r0, asr #10
 16c:	00000008 	andeq	r0, r0, r8
 170:	0000000c 	andeq	r0, r0, ip
 174:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 178:	7c020001 	stcvc	0, cr0, [r2], {1}
 17c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 180:	0000000c 	andeq	r0, r0, ip
 184:	00000170 	andeq	r0, r0, r0, ror r1
 188:	00008548 	andeq	r8, r0, r8, asr #10
 18c:	00000004 	andeq	r0, r0, r4
 190:	0000000c 	andeq	r0, r0, ip
 194:	00000170 	andeq	r0, r0, r0, ror r1
 198:	0000854c 	andeq	r8, r0, ip, asr #10
 19c:	00000008 	andeq	r0, r0, r8
 1a0:	0000000c 	andeq	r0, r0, ip
 1a4:	00000170 	andeq	r0, r0, r0, ror r1
 1a8:	00008554 	andeq	r8, r0, r4, asr r5
 1ac:	00000008 	andeq	r0, r0, r8
 1b0:	0000000c 	andeq	r0, r0, ip
 1b4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1b8:	7c020001 	stcvc	0, cr0, [r2], {1}
 1bc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1c0:	0000000c 	andeq	r0, r0, ip
 1c4:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
 1c8:	0000855c 	andeq	r8, r0, ip, asr r5
 1cc:	00000004 	andeq	r0, r0, r4
 1d0:	0000000c 	andeq	r0, r0, ip
 1d4:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
 1d8:	00008560 	andeq	r8, r0, r0, ror #10
 1dc:	00000008 	andeq	r0, r0, r8
 1e0:	0000000c 	andeq	r0, r0, ip
 1e4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1e8:	7c020001 	stcvc	0, cr0, [r2], {1}
 1ec:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1f0:	0000000c 	andeq	r0, r0, ip
 1f4:	000001e0 	andeq	r0, r0, r0, ror #3
 1f8:	00008568 	andeq	r8, r0, r8, ror #10
 1fc:	00000020 	andeq	r0, r0, r0, lsr #32
 200:	00000014 	andeq	r0, r0, r4, lsl r0
 204:	000001e0 	andeq	r0, r0, r0, ror #3
 208:	00008588 	andeq	r8, r0, r8, lsl #11
 20c:	00000074 	andeq	r0, r0, r4, ror r0
 210:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 214:	00018e02 	andeq	r8, r1, r2, lsl #28
 218:	0000000c 	andeq	r0, r0, ip
 21c:	000001e0 	andeq	r0, r0, r0, ror #3
 220:	000085fc 	strdeq	r8, [r0], -ip
 224:	00000034 	andeq	r0, r0, r4, lsr r0
 228:	0000000c 	andeq	r0, r0, ip
 22c:	000001e0 	andeq	r0, r0, r0, ror #3
 230:	00008630 	andeq	r8, r0, r0, lsr r6
 234:	00000018 	andeq	r0, r0, r8, lsl r0
 238:	00000018 	andeq	r0, r0, r8, lsl r0
 23c:	000001e0 	andeq	r0, r0, r0, ror #3
 240:	00008648 	andeq	r8, r0, r8, asr #12
 244:	000000a0 	andeq	r0, r0, r0, lsr #1
 248:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xe42
 24c:	86038504 	strhi	r8, [r3], -r4, lsl #10
 250:	00018e02 	andeq	r8, r1, r2, lsl #28
 254:	0000000c 	andeq	r0, r0, ip
 258:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 25c:	7c020001 	stcvc	0, cr0, [r2], {1}
 260:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 264:	0000000c 	andeq	r0, r0, ip
 268:	00000254 	andeq	r0, r0, r4, asr r2
 26c:	000086e8 	andeq	r8, r0, r8, ror #13
 270:	00000020 	andeq	r0, r0, r0, lsr #32
 274:	0000000c 	andeq	r0, r0, ip
 278:	00000254 	andeq	r0, r0, r4, asr r2
 27c:	00008708 	andeq	r8, r0, r8, lsl #14
 280:	00000044 	andeq	r0, r0, r4, asr #32
 284:	0000000c 	andeq	r0, r0, ip
 288:	00000254 	andeq	r0, r0, r4, asr r2
 28c:	0000874c 	andeq	r8, r0, ip, asr #14
 290:	00000044 	andeq	r0, r0, r4, asr #32
 294:	0000000c 	andeq	r0, r0, ip
 298:	00000254 	andeq	r0, r0, r4, asr r2
 29c:	00008790 	muleq	r0, r0, r7
 2a0:	00000024 	andeq	r0, r0, r4, lsr #32
 2a4:	00000014 	andeq	r0, r0, r4, lsl r0
 2a8:	00000254 	andeq	r0, r0, r4, asr r2
 2ac:	000087b4 			; <UNDEFINED> instruction: 0x000087b4
 2b0:	00000034 	andeq	r0, r0, r4, lsr r0
 2b4:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 2b8:	00018e02 	andeq	r8, r1, r2, lsl #28
 2bc:	00000014 	andeq	r0, r0, r4, lsl r0
 2c0:	00000254 	andeq	r0, r0, r4, asr r2
 2c4:	000087e8 	andeq	r8, r0, r8, ror #15
 2c8:	00000034 	andeq	r0, r0, r4, lsr r0
 2cc:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 2d0:	00018e02 	andeq	r8, r1, r2, lsl #28
 2d4:	00000014 	andeq	r0, r0, r4, lsl r0
 2d8:	00000254 	andeq	r0, r0, r4, asr r2
 2dc:	0000881c 	andeq	r8, r0, ip, lsl r8
 2e0:	00000040 	andeq	r0, r0, r0, asr #32
 2e4:	83080e42 	movwhi	r0, #36418	; 0x8e42
 2e8:	00018e02 	andeq	r8, r1, r2, lsl #28
 2ec:	00000014 	andeq	r0, r0, r4, lsl r0
 2f0:	00000254 	andeq	r0, r0, r4, asr r2
 2f4:	0000885c 	andeq	r8, r0, ip, asr r8
 2f8:	00000110 	andeq	r0, r0, r0, lsl r1
 2fc:	83080e42 	movwhi	r0, #36418	; 0x8e42
 300:	00018e02 	andeq	r8, r1, r2, lsl #28
 304:	00000014 	andeq	r0, r0, r4, lsl r0
 308:	00000254 	andeq	r0, r0, r4, asr r2
 30c:	0000896c 	andeq	r8, r0, ip, ror #18
 310:	00000038 	andeq	r0, r0, r8, lsr r0
 314:	83080e42 	movwhi	r0, #36418	; 0x8e42
 318:	00018e02 	andeq	r8, r1, r2, lsl #28
 31c:	00000018 	andeq	r0, r0, r8, lsl r0
 320:	00000254 	andeq	r0, r0, r4, asr r2
 324:	000089a4 	andeq	r8, r0, r4, lsr #19
 328:	00000044 	andeq	r0, r0, r4, asr #32
 32c:	83100e42 	tsthi	r0, #1056	; 0x420
 330:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 334:	00018e02 	andeq	r8, r1, r2, lsl #28
 338:	00000018 	andeq	r0, r0, r8, lsl r0
 33c:	00000254 	andeq	r0, r0, r4, asr r2
 340:	000089e8 	andeq	r8, r0, r8, ror #19
 344:	00000060 	andeq	r0, r0, r0, rrx
 348:	83100e42 	tsthi	r0, #1056	; 0x420
 34c:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 350:	00018e02 	andeq	r8, r1, r2, lsl #28
 354:	00000018 	andeq	r0, r0, r8, lsl r0
 358:	00000254 	andeq	r0, r0, r4, asr r2
 35c:	00008a48 	andeq	r8, r0, r8, asr #20
 360:	0000003c 	andeq	r0, r0, ip, lsr r0
 364:	83100e42 	tsthi	r0, #1056	; 0x420
 368:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 36c:	00018e02 	andeq	r8, r1, r2, lsl #28
 370:	0000000c 	andeq	r0, r0, ip
 374:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 378:	7c010001 	stcvc	0, cr0, [r1], {1}
 37c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 380:	00000014 	andeq	r0, r0, r4, lsl r0
 384:	00000370 	andeq	r0, r0, r0, ror r3
 388:	00008ac8 	andeq	r8, r0, r8, asr #21
 38c:	0000003c 	andeq	r0, r0, ip, lsr r0
 390:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 394:	00000010 	andeq	r0, r0, r0, lsl r0
 398:	0000000c 	andeq	r0, r0, ip
 39c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3a0:	7c020001 	stcvc	0, cr0, [r2], {1}
 3a4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3a8:	0000002c 	andeq	r0, r0, ip, lsr #32
 3ac:	00000398 	muleq	r0, r8, r3
 3b0:	00008b04 	andeq	r8, r0, r4, lsl #22
 3b4:	00000044 	andeq	r0, r0, r4, asr #32
 3b8:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 3bc:	86078508 	strhi	r8, [r7], -r8, lsl #10
 3c0:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 3c4:	8a038904 	bhi	e27dc <__bss_end+0xd67dc>
 3c8:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 3cc:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 3d0:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 3d4:	0000000e 	andeq	r0, r0, lr
 3d8:	00000024 	andeq	r0, r0, r4, lsr #32
 3dc:	00000398 	muleq	r0, r8, r3
 3e0:	00008b48 	andeq	r8, r0, r8, asr #22
 3e4:	00000040 	andeq	r0, r0, r0, asr #32
 3e8:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 3ec:	86058506 	strhi	r8, [r5], -r6, lsl #10
 3f0:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 3f4:	5c018e02 	stcpl	14, cr8, [r1], {2}
 3f8:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 3fc:	000ec4c5 	andeq	ip, lr, r5, asr #9
 400:	0000000c 	andeq	r0, r0, ip
 404:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 408:	7c020001 	stcvc	0, cr0, [r2], {1}
 40c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 410:	00000034 	andeq	r0, r0, r4, lsr r0
 414:	00000400 	andeq	r0, r0, r0, lsl #8
 418:	00008b8c 	andeq	r8, r0, ip, lsl #23
 41c:	00000178 	andeq	r0, r0, r8, ror r1
 420:	83280e44 	teqhi	r8, #68, 28	; 0x440
 424:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 428:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 42c:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 430:	8b038a04 	blhi	e2c48 <__bss_end+0xd6c48>
 434:	02018e02 	andeq	r8, r1, #2, 28
 438:	cbce0aa6 	blgt	ff382ed8 <__user_program+0xff082ed8>
 43c:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 440:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 444:	0b42000e 	bleq	1080484 <__user_program+0xd80484>
 448:	0000000c 	andeq	r0, r0, ip
 44c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 450:	7c020001 	stcvc	0, cr0, [r2], {1}
 454:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 458:	0000002c 	andeq	r0, r0, ip, lsr #32
 45c:	00000448 	andeq	r0, r0, r8, asr #8
 460:	00008d04 	andeq	r8, r0, r4, lsl #26
 464:	00000120 	andeq	r0, r0, r0, lsr #2
 468:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 46c:	86078508 	strhi	r8, [r7], -r8, lsl #10
 470:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 474:	8a038904 	bhi	e288c <__bss_end+0xd688c>
 478:	02018e02 	andeq	r8, r1, #2, 28
 47c:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 480:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 484:	00000ec4 	andeq	r0, r0, r4, asr #29

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
