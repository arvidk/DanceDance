   1              		.syntax unified
   2              		.arch armv6-m
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 0
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.syntax unified
  15              		.file	"Dance_main.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.global	STK_CTRL
  20              		.data
  21              		.align	2
  24              	STK_CTRL:
  25 0000 10E000E0 		.word	-536813552
  26              		.global	STK_LOAD
  27              		.align	2
  30              	STK_LOAD:
  31 0004 14E000E0 		.word	-536813548
  32              		.global	STK_VAL
  33              		.align	2
  36              	STK_VAL:
  37 0008 18E000E0 		.word	-536813544
  38              		.section	.start_section,"ax",%progbits
  39              		.align	2
  40              		.global	startup
  41              		.code	16
  42              		.thumb_func
  44              	startup:
  45              	.LFB0:
  46              		.file 1 "/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c"
   1:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** /*
   2:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  * 	Dance_main.c
   3:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  * A part of the DanceDAnce project
   4:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  *
   5:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  */
   6:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  
   7:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  
   8:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_RS 	 0x01 
   9:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_RW	 0x02
  10:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_SELECT 0x04
  11:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_CS1 	 0x08
  12:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_CS2 	 0x10
  13:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_RST 	 0x20
  14:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_E 	 0x40
  15:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  16:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  17:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  18:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_ON			0x3F
  19:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_OFF			0x3E
  20:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_set_addr	0x40
  21:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_set_page	0xB8
  22:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_disp_start	0xC0
  23:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  24:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define GPIO_E 0x40021000 /* MD407 port E */
  25:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portModer ((volatile unsigned long *) (GPIO_E))
  26:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portOtyper ((volatile unsigned short *) (GPIO_E+0x4)) 
  27:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portIdr ((volatile unsigned short *)(GPIO_E+0x10)) 
  28:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  29:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portIdrLow ((volatile unsigned char *) (GPIO_E+0x10))
  30:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portIdrHigh ((volatile unsigned char *) (GPIO_E+0x10+1)) 
  31:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portOdrLow ((volatile unsigned char*) (GPIO_E+0x14))
  32:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portOdrHigh ((volatile unsigned char*) (GPIO_E+0x15))
  33:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  34:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unsigned long STK_CTRL = 0xE000E010;
  35:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unsigned long STK_LOAD = 0xE000E014;
  36:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unsigned volatile long STK_VAL = 0xE000E018;
  37:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  
  38:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	typedef unsigned char  unit_8;
  39:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	typedef unsigned short unit_16;
  40:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	typedef unsigned long  unit_32;
  41:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  42:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  
  43:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  44:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  45:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void startup ( void )
  46:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** {
  47              		.loc 1 46 0
  48              		.cfi_startproc
  49              		@ Naked Function: prologue and epilogue provided by programmer.
  50              		@ args = 0, pretend = 0, frame = 0
  51              		@ frame_needed = 1, uses_anonymous_args = 0
  47:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** asm volatile(
  52              		.loc 1 47 0
  53              		.syntax divided
  54              	@ 47 "/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c" 1
  55 0000 0248     		 LDR R0,=0x2001C000
  56 0002 8546     	 MOV SP,R0
  57 0004 FFF7FEFF 	 BL main
  58 0008 FEE7     	.L1: B .L1
  59              	
  60              	@ 0 "" 2
  48:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  49:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	" MOV SP,R0\n"
  50:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	" BL main\n"				/* call main */
  51:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	".L1: B .L1\n"				/* never return */
  52:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	) ;
  53:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
  61              		.loc 1 53 0
  62              		.thumb
  63              		.syntax unified
  64 000a C046     		nop
  65              		.cfi_endproc
  66              	.LFE0:
  68              		.text
  69              		.align	2
  70              		.global	delay_250ns
  71              		.code	16
  72              		.thumb_func
  74              	delay_250ns:
  75              	.LFB1:
  54:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  55:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  56:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void delay_250ns(){
  76              		.loc 1 56 0
  77              		.cfi_startproc
  78              		@ args = 0, pretend = 0, frame = 0
  79              		@ frame_needed = 1, uses_anonymous_args = 0
  80 0000 80B5     		push	{r7, lr}
  81              		.cfi_def_cfa_offset 8
  82              		.cfi_offset 7, -8
  83              		.cfi_offset 14, -4
  84 0002 00AF     		add	r7, sp, #0
  85              		.cfi_def_cfa_register 7
  57:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  58:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  59:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_CTRL) = 0x00;
  86              		.loc 1 59 0
  87 0004 0E4B     		ldr	r3, .L4
  88 0006 1B68     		ldr	r3, [r3]
  89 0008 0022     		movs	r2, #0
  90 000a 1A60     		str	r2, [r3]
  60:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_LOAD )=1;
  91              		.loc 1 60 0
  92 000c 0D4B     		ldr	r3, .L4+4
  93 000e 1B68     		ldr	r3, [r3]
  94 0010 0122     		movs	r2, #1
  95 0012 1A60     		str	r2, [r3]
  61:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_VAL )=0;
  96              		.loc 1 61 0
  97 0014 0C4B     		ldr	r3, .L4+8
  98 0016 1B68     		ldr	r3, [r3]
  99 0018 0022     		movs	r2, #0
 100 001a 1A60     		str	r2, [r3]
  62:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_CTRL) =5;
 101              		.loc 1 62 0
 102 001c 084B     		ldr	r3, .L4
 103 001e 1B68     		ldr	r3, [r3]
 104 0020 0522     		movs	r2, #5
 105 0022 1A60     		str	r2, [r3]
  63:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	while(*((unsigned long *)STK_CTRL) < 0x8){
 106              		.loc 1 63 0
 107 0024 C046     		nop
 108              	.L3:
 109              		.loc 1 63 0 is_stmt 0 discriminator 1
 110 0026 064B     		ldr	r3, .L4
 111 0028 1B68     		ldr	r3, [r3]
 112 002a 1B68     		ldr	r3, [r3]
 113 002c 072B     		cmp	r3, #7
 114 002e FAD9     		bls	.L3
  64:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
  65:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_CTRL) = 0;
 115              		.loc 1 65 0 is_stmt 1
 116 0030 034B     		ldr	r3, .L4
 117 0032 1B68     		ldr	r3, [r3]
 118 0034 0022     		movs	r2, #0
 119 0036 1A60     		str	r2, [r3]
  66:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 120              		.loc 1 66 0
 121 0038 C046     		nop
 122 003a BD46     		mov	sp, r7
 123              		@ sp needed
 124 003c 80BD     		pop	{r7, pc}
 125              	.L5:
 126 003e C046     		.align	2
 127              	.L4:
 128 0040 00000000 		.word	STK_CTRL
 129 0044 00000000 		.word	STK_LOAD
 130 0048 00000000 		.word	STK_VAL
 131              		.cfi_endproc
 132              	.LFE1:
 134              		.align	2
 135              		.global	delay_500ns
 136              		.code	16
 137              		.thumb_func
 139              	delay_500ns:
 140              	.LFB2:
  67:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void delay_500ns(){
 141              		.loc 1 67 0
 142              		.cfi_startproc
 143              		@ args = 0, pretend = 0, frame = 0
 144              		@ frame_needed = 1, uses_anonymous_args = 0
 145 004c 80B5     		push	{r7, lr}
 146              		.cfi_def_cfa_offset 8
 147              		.cfi_offset 7, -8
 148              		.cfi_offset 14, -4
 149 004e 00AF     		add	r7, sp, #0
 150              		.cfi_def_cfa_register 7
  68:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  69:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_250ns();
 151              		.loc 1 69 0
 152 0050 FFF7FEFF 		bl	delay_250ns
  70:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_250ns();
 153              		.loc 1 70 0
 154 0054 FFF7FEFF 		bl	delay_250ns
  71:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  72:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 155              		.loc 1 72 0
 156 0058 C046     		nop
 157 005a BD46     		mov	sp, r7
 158              		@ sp needed
 159 005c 80BD     		pop	{r7, pc}
 160              		.cfi_endproc
 161              	.LFE2:
 163 005e C046     		.align	2
 164              		.global	delay_mikro
 165              		.code	16
 166              		.thumb_func
 168              	delay_mikro:
 169              	.LFB3:
  73:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void delay_mikro(unsigned int ms){
 170              		.loc 1 73 0
 171              		.cfi_startproc
 172              		@ args = 0, pretend = 0, frame = 16
 173              		@ frame_needed = 1, uses_anonymous_args = 0
 174 0060 80B5     		push	{r7, lr}
 175              		.cfi_def_cfa_offset 8
 176              		.cfi_offset 7, -8
 177              		.cfi_offset 14, -4
 178 0062 84B0     		sub	sp, sp, #16
 179              		.cfi_def_cfa_offset 24
 180 0064 00AF     		add	r7, sp, #0
 181              		.cfi_def_cfa_register 7
 182 0066 7860     		str	r0, [r7, #4]
 183              	.LBB2:
  74:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for (unsigned int j = ms/4; j > 0 ; j--){
 184              		.loc 1 74 0
 185 0068 7B68     		ldr	r3, [r7, #4]
 186 006a 9B08     		lsrs	r3, r3, #2
 187 006c FB60     		str	r3, [r7, #12]
 188 006e 04E0     		b	.L8
 189              	.L9:
  75:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_250ns();
 190              		.loc 1 75 0 discriminator 3
 191 0070 FFF7FEFF 		bl	delay_250ns
  74:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for (unsigned int j = ms/4; j > 0 ; j--){
 192              		.loc 1 74 0 discriminator 3
 193 0074 FB68     		ldr	r3, [r7, #12]
 194 0076 013B     		subs	r3, r3, #1
 195 0078 FB60     		str	r3, [r7, #12]
 196              	.L8:
  74:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for (unsigned int j = ms/4; j > 0 ; j--){
 197              		.loc 1 74 0 is_stmt 0 discriminator 1
 198 007a FB68     		ldr	r3, [r7, #12]
 199 007c 002B     		cmp	r3, #0
 200 007e F7D1     		bne	.L9
 201              	.LBE2:
  76:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  77:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
  78:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  79:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 202              		.loc 1 79 0 is_stmt 1
 203 0080 C046     		nop
 204 0082 BD46     		mov	sp, r7
 205 0084 04B0     		add	sp, sp, #16
 206              		@ sp needed
 207 0086 80BD     		pop	{r7, pc}
 208              		.cfi_endproc
 209              	.LFE3:
 211              		.align	2
 212              		.global	delay_milli
 213              		.code	16
 214              		.thumb_func
 216              	delay_milli:
 217              	.LFB4:
  80:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void delay_milli(unsigned int ms){
 218              		.loc 1 80 0
 219              		.cfi_startproc
 220              		@ args = 0, pretend = 0, frame = 16
 221              		@ frame_needed = 1, uses_anonymous_args = 0
 222 0088 80B5     		push	{r7, lr}
 223              		.cfi_def_cfa_offset 8
 224              		.cfi_offset 7, -8
 225              		.cfi_offset 14, -4
 226 008a 84B0     		sub	sp, sp, #16
 227              		.cfi_def_cfa_offset 24
 228 008c 00AF     		add	r7, sp, #0
 229              		.cfi_def_cfa_register 7
 230 008e 7860     		str	r0, [r7, #4]
 231              	.LBB3:
  81:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  82:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  83:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	#ifdef SIMULATOR
  84:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ms=ms/1000;
  85:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ms++;
  86:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	#endif
  87:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for(unsigned int i= ms*500; i > 0; i--){
 232              		.loc 1 87 0
 233 0090 7B68     		ldr	r3, [r7, #4]
 234 0092 FA22     		movs	r2, #250
 235 0094 5200     		lsls	r2, r2, #1
 236 0096 5343     		muls	r3, r2
 237 0098 FB60     		str	r3, [r7, #12]
 238 009a 05E0     		b	.L11
 239              	.L12:
  88:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_mikro(2);
 240              		.loc 1 88 0 discriminator 3
 241 009c 0220     		movs	r0, #2
 242 009e FFF7FEFF 		bl	delay_mikro
  87:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_mikro(2);
 243              		.loc 1 87 0 discriminator 3
 244 00a2 FB68     		ldr	r3, [r7, #12]
 245 00a4 013B     		subs	r3, r3, #1
 246 00a6 FB60     		str	r3, [r7, #12]
 247              	.L11:
  87:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_mikro(2);
 248              		.loc 1 87 0 is_stmt 0 discriminator 1
 249 00a8 FB68     		ldr	r3, [r7, #12]
 250 00aa 002B     		cmp	r3, #0
 251 00ac F6D1     		bne	.L12
 252              	.LBE3:
  89:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
  90:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 253              		.loc 1 90 0 is_stmt 1
 254 00ae C046     		nop
 255 00b0 BD46     		mov	sp, r7
 256 00b2 04B0     		add	sp, sp, #16
 257              		@ sp needed
 258 00b4 80BD     		pop	{r7, pc}
 259              		.cfi_endproc
 260              	.LFE4:
 262 00b6 C046     		.align	2
 263              		.global	graphic_ctrl_bit_set
 264              		.code	16
 265              		.thumb_func
 267              	graphic_ctrl_bit_set:
 268              	.LFB5:
  91:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  92:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  93:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  94:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_ctrl_bit_set( unit_8 x ) { /* Funktion för att 1-ställa bitar */
 269              		.loc 1 94 0
 270              		.cfi_startproc
 271              		@ args = 0, pretend = 0, frame = 16
 272              		@ frame_needed = 1, uses_anonymous_args = 0
 273 00b8 80B5     		push	{r7, lr}
 274              		.cfi_def_cfa_offset 8
 275              		.cfi_offset 7, -8
 276              		.cfi_offset 14, -4
 277 00ba 84B0     		sub	sp, sp, #16
 278              		.cfi_def_cfa_offset 24
 279 00bc 00AF     		add	r7, sp, #0
 280              		.cfi_def_cfa_register 7
 281 00be 0200     		movs	r2, r0
 282 00c0 FB1D     		adds	r3, r7, #7
 283 00c2 1A70     		strb	r2, [r3]
  95:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 c;
  96:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c = *portOdrLow;
 284              		.loc 1 96 0
 285 00c4 124A     		ldr	r2, .L14
 286 00c6 0F23     		movs	r3, #15
 287 00c8 FB18     		adds	r3, r7, r3
 288 00ca 1278     		ldrb	r2, [r2]
 289 00cc 1A70     		strb	r2, [r3]
  97:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c &= ~B_SELECT;
 290              		.loc 1 97 0
 291 00ce 0F23     		movs	r3, #15
 292 00d0 FB18     		adds	r3, r7, r3
 293 00d2 0F22     		movs	r2, #15
 294 00d4 BA18     		adds	r2, r7, r2
 295 00d6 1278     		ldrb	r2, [r2]
 296 00d8 0421     		movs	r1, #4
 297 00da 8A43     		bics	r2, r1
 298 00dc 1A70     		strb	r2, [r3]
  98:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c |= (~B_SELECT & x);
 299              		.loc 1 98 0
 300 00de FB1D     		adds	r3, r7, #7
 301 00e0 1B78     		ldrb	r3, [r3]
 302 00e2 5BB2     		sxtb	r3, r3
 303 00e4 0422     		movs	r2, #4
 304 00e6 9343     		bics	r3, r2
 305 00e8 5AB2     		sxtb	r2, r3
 306 00ea 0F23     		movs	r3, #15
 307 00ec FB18     		adds	r3, r7, r3
 308 00ee 1B78     		ldrb	r3, [r3]
 309 00f0 5BB2     		sxtb	r3, r3
 310 00f2 1343     		orrs	r3, r2
 311 00f4 5AB2     		sxtb	r2, r3
 312 00f6 0F23     		movs	r3, #15
 313 00f8 FB18     		adds	r3, r7, r3
 314 00fa 1A70     		strb	r2, [r3]
  99:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow = c;
 315              		.loc 1 99 0
 316 00fc 044A     		ldr	r2, .L14
 317 00fe 0F23     		movs	r3, #15
 318 0100 FB18     		adds	r3, r7, r3
 319 0102 1B78     		ldrb	r3, [r3]
 320 0104 1370     		strb	r3, [r2]
 100:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 321              		.loc 1 100 0
 322 0106 C046     		nop
 323 0108 BD46     		mov	sp, r7
 324 010a 04B0     		add	sp, sp, #16
 325              		@ sp needed
 326 010c 80BD     		pop	{r7, pc}
 327              	.L15:
 328 010e C046     		.align	2
 329              	.L14:
 330 0110 14100240 		.word	1073877012
 331              		.cfi_endproc
 332              	.LFE5:
 334              		.align	2
 335              		.global	graphic_ctrl_bit_clear
 336              		.code	16
 337              		.thumb_func
 339              	graphic_ctrl_bit_clear:
 340              	.LFB6:
 101:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_ctrl_bit_clear( unit_8 x ){
 341              		.loc 1 101 0
 342              		.cfi_startproc
 343              		@ args = 0, pretend = 0, frame = 16
 344              		@ frame_needed = 1, uses_anonymous_args = 0
 345 0114 80B5     		push	{r7, lr}
 346              		.cfi_def_cfa_offset 8
 347              		.cfi_offset 7, -8
 348              		.cfi_offset 14, -4
 349 0116 84B0     		sub	sp, sp, #16
 350              		.cfi_def_cfa_offset 24
 351 0118 00AF     		add	r7, sp, #0
 352              		.cfi_def_cfa_register 7
 353 011a 0200     		movs	r2, r0
 354 011c FB1D     		adds	r3, r7, #7
 355 011e 1A70     		strb	r2, [r3]
 102:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 c;
 103:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c =*portOdrLow;
 356              		.loc 1 103 0
 357 0120 114A     		ldr	r2, .L17
 358 0122 0F23     		movs	r3, #15
 359 0124 FB18     		adds	r3, r7, r3
 360 0126 1278     		ldrb	r2, [r2]
 361 0128 1A70     		strb	r2, [r3]
 104:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c &=~B_SELECT;
 362              		.loc 1 104 0
 363 012a 0F23     		movs	r3, #15
 364 012c FB18     		adds	r3, r7, r3
 365 012e 0F22     		movs	r2, #15
 366 0130 BA18     		adds	r2, r7, r2
 367 0132 1278     		ldrb	r2, [r2]
 368 0134 0421     		movs	r1, #4
 369 0136 8A43     		bics	r2, r1
 370 0138 1A70     		strb	r2, [r3]
 105:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c &=~x;
 371              		.loc 1 105 0
 372 013a FB1D     		adds	r3, r7, #7
 373 013c 1B78     		ldrb	r3, [r3]
 374 013e 5BB2     		sxtb	r3, r3
 375 0140 DB43     		mvns	r3, r3
 376 0142 5BB2     		sxtb	r3, r3
 377 0144 0F22     		movs	r2, #15
 378 0146 BA18     		adds	r2, r7, r2
 379 0148 1278     		ldrb	r2, [r2]
 380 014a 52B2     		sxtb	r2, r2
 381 014c 1340     		ands	r3, r2
 382 014e 5AB2     		sxtb	r2, r3
 383 0150 0F23     		movs	r3, #15
 384 0152 FB18     		adds	r3, r7, r3
 385 0154 1A70     		strb	r2, [r3]
 106:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow=c;
 386              		.loc 1 106 0
 387 0156 044A     		ldr	r2, .L17
 388 0158 0F23     		movs	r3, #15
 389 015a FB18     		adds	r3, r7, r3
 390 015c 1B78     		ldrb	r3, [r3]
 391 015e 1370     		strb	r3, [r2]
 107:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** } 
 392              		.loc 1 107 0
 393 0160 C046     		nop
 394 0162 BD46     		mov	sp, r7
 395 0164 04B0     		add	sp, sp, #16
 396              		@ sp needed
 397 0166 80BD     		pop	{r7, pc}
 398              	.L18:
 399              		.align	2
 400              	.L17:
 401 0168 14100240 		.word	1073877012
 402              		.cfi_endproc
 403              	.LFE6:
 405              		.align	2
 406              		.global	select_controller
 407              		.code	16
 408              		.thumb_func
 410              	select_controller:
 411              	.LFB7:
 108:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 109:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void select_controller(unit_8 s){
 412              		.loc 1 109 0
 413              		.cfi_startproc
 414              		@ args = 0, pretend = 0, frame = 8
 415              		@ frame_needed = 1, uses_anonymous_args = 0
 416 016c 80B5     		push	{r7, lr}
 417              		.cfi_def_cfa_offset 8
 418              		.cfi_offset 7, -8
 419              		.cfi_offset 14, -4
 420 016e 82B0     		sub	sp, sp, #8
 421              		.cfi_def_cfa_offset 16
 422 0170 00AF     		add	r7, sp, #0
 423              		.cfi_def_cfa_register 7
 424 0172 0200     		movs	r2, r0
 425 0174 FB1D     		adds	r3, r7, #7
 426 0176 1A70     		strb	r2, [r3]
 110:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	switch(s){
 427              		.loc 1 110 0
 428 0178 FB1D     		adds	r3, r7, #7
 429 017a 1B78     		ldrb	r3, [r3]
 430 017c 082B     		cmp	r3, #8
 431 017e 08D0     		beq	.L21
 432 0180 02DC     		bgt	.L22
 433 0182 002B     		cmp	r3, #0
 434 0184 17D0     		beq	.L23
 111:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS1 :
 112:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_clear(B_CS2);
 113:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS1);
 114:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 115:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS2 :
 116:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_clear(B_CS1);
 117:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS2);
 118:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 119:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS1|B_CS2 :
 120:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS1|B_CS2);
 121:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 122:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case 0:
 123:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_clear(B_CS1|B_CS2);
 124:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 125:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 126:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 435              		.loc 1 126 0
 436 0186 1AE0     		b	.L26
 437              	.L22:
 110:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	switch(s){
 438              		.loc 1 110 0
 439 0188 102B     		cmp	r3, #16
 440 018a 09D0     		beq	.L24
 441 018c 182B     		cmp	r3, #24
 442 018e 0ED0     		beq	.L25
 443              		.loc 1 126 0
 444 0190 15E0     		b	.L26
 445              	.L21:
 112:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS1);
 446              		.loc 1 112 0
 447 0192 1020     		movs	r0, #16
 448 0194 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 113:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 449              		.loc 1 113 0
 450 0198 0820     		movs	r0, #8
 451 019a FFF7FEFF 		bl	graphic_ctrl_bit_set
 114:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS2 :
 452              		.loc 1 114 0
 453 019e 0EE0     		b	.L20
 454              	.L24:
 116:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS2);
 455              		.loc 1 116 0
 456 01a0 0820     		movs	r0, #8
 457 01a2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 117:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 458              		.loc 1 117 0
 459 01a6 1020     		movs	r0, #16
 460 01a8 FFF7FEFF 		bl	graphic_ctrl_bit_set
 118:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS1|B_CS2 :
 461              		.loc 1 118 0
 462 01ac 07E0     		b	.L20
 463              	.L25:
 120:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 464              		.loc 1 120 0
 465 01ae 1820     		movs	r0, #24
 466 01b0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 121:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case 0:
 467              		.loc 1 121 0
 468 01b4 03E0     		b	.L20
 469              	.L23:
 123:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 470              		.loc 1 123 0
 471 01b6 1820     		movs	r0, #24
 472 01b8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 124:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 473              		.loc 1 124 0
 474 01bc C046     		nop
 475              	.L20:
 476              	.L26:
 477              		.loc 1 126 0
 478 01be C046     		nop
 479 01c0 BD46     		mov	sp, r7
 480 01c2 02B0     		add	sp, sp, #8
 481              		@ sp needed
 482 01c4 80BD     		pop	{r7, pc}
 483              		.cfi_endproc
 484              	.LFE7:
 486 01c6 C046     		.align	2
 487              		.global	graphic_wait_ready
 488              		.code	16
 489              		.thumb_func
 491              	graphic_wait_ready:
 492              	.LFB8:
 127:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_wait_ready(void){
 493              		.loc 1 127 0
 494              		.cfi_startproc
 495              		@ args = 0, pretend = 0, frame = 8
 496              		@ frame_needed = 1, uses_anonymous_args = 0
 497 01c8 80B5     		push	{r7, lr}
 498              		.cfi_def_cfa_offset 8
 499              		.cfi_offset 7, -8
 500              		.cfi_offset 14, -4
 501 01ca 82B0     		sub	sp, sp, #8
 502              		.cfi_def_cfa_offset 16
 503 01cc 00AF     		add	r7, sp, #0
 504              		.cfi_def_cfa_register 7
 128:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 c;
 129:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_E);
 505              		.loc 1 129 0
 506 01ce 4020     		movs	r0, #64
 507 01d0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 130:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer= (0x00005555); //sets port 15-8 to inputs and 7-0 to outputs
 508              		.loc 1 130 0
 509 01d4 174B     		ldr	r3, .L33
 510 01d6 184A     		ldr	r2, .L33+4
 511 01d8 1A60     		str	r2, [r3]
 131:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = ((*portOdrLow & ~0x01)| 0x02); //turns off RS and RW on
 512              		.loc 1 131 0
 513 01da 184A     		ldr	r2, .L33+8
 514 01dc 174B     		ldr	r3, .L33+8
 515 01de 1B78     		ldrb	r3, [r3]
 516 01e0 DBB2     		uxtb	r3, r3
 517 01e2 5BB2     		sxtb	r3, r3
 518 01e4 0321     		movs	r1, #3
 519 01e6 8B43     		bics	r3, r1
 520 01e8 5BB2     		sxtb	r3, r3
 521 01ea 0221     		movs	r1, #2
 522 01ec 0B43     		orrs	r3, r1
 523 01ee 5BB2     		sxtb	r3, r3
 524 01f0 DBB2     		uxtb	r3, r3
 525 01f2 1370     		strb	r3, [r2]
 132:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_500ns();
 526              		.loc 1 132 0
 527 01f4 FFF7FEFF 		bl	delay_500ns
 528              	.L30:
 133:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 134:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	while(1){
 135:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_E);
 529              		.loc 1 135 0
 530 01f8 4020     		movs	r0, #64
 531 01fa FFF7FEFF 		bl	graphic_ctrl_bit_set
 136:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_500ns();
 532              		.loc 1 136 0
 533 01fe FFF7FEFF 		bl	delay_500ns
 137:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		c =*portIdrHigh & 0x80;
 534              		.loc 1 137 0
 535 0202 0F4B     		ldr	r3, .L33+12
 536 0204 1B78     		ldrb	r3, [r3]
 537 0206 DAB2     		uxtb	r2, r3
 538 0208 FB1D     		adds	r3, r7, #7
 539 020a 7F21     		movs	r1, #127
 540 020c 8A43     		bics	r2, r1
 541 020e 1A70     		strb	r2, [r3]
 138:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_clear(B_E);
 542              		.loc 1 138 0
 543 0210 4020     		movs	r0, #64
 544 0212 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 139:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_500ns();
 545              		.loc 1 139 0
 546 0216 FFF7FEFF 		bl	delay_500ns
 140:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		if(c == 0){
 547              		.loc 1 140 0
 548 021a FB1D     		adds	r3, r7, #7
 549 021c 1B78     		ldrb	r3, [r3]
 550 021e 002B     		cmp	r3, #0
 551 0220 00D0     		beq	.L32
 141:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			break;
 142:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		}
 143:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 552              		.loc 1 143 0
 553 0222 E9E7     		b	.L30
 554              	.L32:
 141:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			break;
 555              		.loc 1 141 0
 556 0224 C046     		nop
 144:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 145:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer= (0x55555555); //sets port 15-8 to outputs
 557              		.loc 1 145 0
 558 0226 034B     		ldr	r3, .L33
 559 0228 064A     		ldr	r2, .L33+16
 560 022a 1A60     		str	r2, [r3]
 146:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 147:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 561              		.loc 1 147 0
 562 022c C046     		nop
 563 022e BD46     		mov	sp, r7
 564 0230 02B0     		add	sp, sp, #8
 565              		@ sp needed
 566 0232 80BD     		pop	{r7, pc}
 567              	.L34:
 568              		.align	2
 569              	.L33:
 570 0234 00100240 		.word	1073876992
 571 0238 55550000 		.word	21845
 572 023c 14100240 		.word	1073877012
 573 0240 11100240 		.word	1073877009
 574 0244 55555555 		.word	1431655765
 575              		.cfi_endproc
 576              	.LFE8:
 578              		.align	2
 579              		.global	graphic_read_controller
 580              		.code	16
 581              		.thumb_func
 583              	graphic_read_controller:
 584              	.LFB9:
 148:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 149:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 graphic_read_controller( unit_8 controller ){
 585              		.loc 1 149 0
 586              		.cfi_startproc
 587              		@ args = 0, pretend = 0, frame = 16
 588              		@ frame_needed = 1, uses_anonymous_args = 0
 589 0248 80B5     		push	{r7, lr}
 590              		.cfi_def_cfa_offset 8
 591              		.cfi_offset 7, -8
 592              		.cfi_offset 14, -4
 593 024a 84B0     		sub	sp, sp, #16
 594              		.cfi_def_cfa_offset 24
 595 024c 00AF     		add	r7, sp, #0
 596              		.cfi_def_cfa_register 7
 597 024e 0200     		movs	r2, r0
 598 0250 FB1D     		adds	r3, r7, #7
 599 0252 1A70     		strb	r2, [r3]
 150:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_clear( B_E );
 600              		.loc 1 150 0
 601 0254 4020     		movs	r0, #64
 602 0256 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 151:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portModer= (0x00005555);
 603              		.loc 1 151 0
 604 025a 1E4B     		ldr	r3, .L39
 605 025c 1E4A     		ldr	r2, .L39+4
 606 025e 1A60     		str	r2, [r3]
 152:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW
 607              		.loc 1 152 0
 608 0260 1E4A     		ldr	r2, .L39+8
 609 0262 1E4B     		ldr	r3, .L39+8
 610 0264 1B78     		ldrb	r3, [r3]
 611 0266 DBB2     		uxtb	r3, r3
 612 0268 0321     		movs	r1, #3
 613 026a 0B43     		orrs	r3, r1
 614 026c DBB2     		uxtb	r3, r3
 615 026e 1370     		strb	r3, [r2]
 153:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** select_controller(controller);
 616              		.loc 1 153 0
 617 0270 FB1D     		adds	r3, r7, #7
 618 0272 1B78     		ldrb	r3, [r3]
 619 0274 1800     		movs	r0, r3
 620 0276 FFF7FEFF 		bl	select_controller
 154:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_500ns();
 621              		.loc 1 154 0
 622 027a FFF7FEFF 		bl	delay_500ns
 155:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_set(B_E);
 623              		.loc 1 155 0
 624 027e 4020     		movs	r0, #64
 625 0280 FFF7FEFF 		bl	graphic_ctrl_bit_set
 156:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_500ns();
 626              		.loc 1 156 0
 627 0284 FFF7FEFF 		bl	delay_500ns
 157:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 rv = *portIdrHigh;
 628              		.loc 1 157 0
 629 0288 154A     		ldr	r2, .L39+12
 630 028a 0F23     		movs	r3, #15
 631 028c FB18     		adds	r3, r7, r3
 632 028e 1278     		ldrb	r2, [r2]
 633 0290 1A70     		strb	r2, [r3]
 158:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_clear(B_E);
 634              		.loc 1 158 0
 635 0292 4020     		movs	r0, #64
 636 0294 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 159:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portModer= (0x55555555);
 637              		.loc 1 159 0
 638 0298 0E4B     		ldr	r3, .L39
 639 029a 124A     		ldr	r2, .L39+16
 640 029c 1A60     		str	r2, [r3]
 160:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 161:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(controller & B_CS1){
 641              		.loc 1 161 0
 642 029e FB1D     		adds	r3, r7, #7
 643 02a0 1B78     		ldrb	r3, [r3]
 644 02a2 0822     		movs	r2, #8
 645 02a4 1340     		ands	r3, r2
 646 02a6 04D0     		beq	.L36
 162:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		select_controller(B_CS1);
 647              		.loc 1 162 0
 648 02a8 0820     		movs	r0, #8
 649 02aa FFF7FEFF 		bl	select_controller
 163:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_wait_ready();
 650              		.loc 1 163 0
 651 02ae FFF7FEFF 		bl	graphic_wait_ready
 652              	.L36:
 164:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 165:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if (controller & B_CS2){
 653              		.loc 1 165 0
 654 02b2 FB1D     		adds	r3, r7, #7
 655 02b4 1B78     		ldrb	r3, [r3]
 656 02b6 1022     		movs	r2, #16
 657 02b8 1340     		ands	r3, r2
 658 02ba 04D0     		beq	.L37
 166:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		select_controller(B_CS2);
 659              		.loc 1 166 0
 660 02bc 1020     		movs	r0, #16
 661 02be FFF7FEFF 		bl	select_controller
 167:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_wait_ready();
 662              		.loc 1 167 0
 663 02c2 FFF7FEFF 		bl	graphic_wait_ready
 664              	.L37:
 168:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 169:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** return rv;
 665              		.loc 1 169 0
 666 02c6 0F23     		movs	r3, #15
 667 02c8 FB18     		adds	r3, r7, r3
 668 02ca 1B78     		ldrb	r3, [r3]
 170:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** } 
 669              		.loc 1 170 0
 670 02cc 1800     		movs	r0, r3
 671 02ce BD46     		mov	sp, r7
 672 02d0 04B0     		add	sp, sp, #16
 673              		@ sp needed
 674 02d2 80BD     		pop	{r7, pc}
 675              	.L40:
 676              		.align	2
 677              	.L39:
 678 02d4 00100240 		.word	1073876992
 679 02d8 55550000 		.word	21845
 680 02dc 14100240 		.word	1073877012
 681 02e0 11100240 		.word	1073877009
 682 02e4 55555555 		.word	1431655765
 683              		.cfi_endproc
 684              	.LFE9:
 686              		.align	2
 687              		.global	graphic_read_data
 688              		.code	16
 689              		.thumb_func
 691              	graphic_read_data:
 692              	.LFB10:
 171:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 graphic_read_data(unit_8 controller){
 693              		.loc 1 171 0
 694              		.cfi_startproc
 695              		@ args = 0, pretend = 0, frame = 16
 696              		@ frame_needed = 1, uses_anonymous_args = 0
 697 02e8 80B5     		push	{r7, lr}
 698              		.cfi_def_cfa_offset 8
 699              		.cfi_offset 7, -8
 700              		.cfi_offset 14, -4
 701 02ea 84B0     		sub	sp, sp, #16
 702              		.cfi_def_cfa_offset 24
 703 02ec 00AF     		add	r7, sp, #0
 704              		.cfi_def_cfa_register 7
 705 02ee 0200     		movs	r2, r0
 706 02f0 FB1D     		adds	r3, r7, #7
 707 02f2 1A70     		strb	r2, [r3]
 708              	.LBB4:
 172:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 rv;
 173:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for(unit_8 i=0;i<2;i++){ //so that it executes it two times
 709              		.loc 1 173 0
 710 02f4 0E23     		movs	r3, #14
 711 02f6 FB18     		adds	r3, r7, r3
 712 02f8 0022     		movs	r2, #0
 713 02fa 1A70     		strb	r2, [r3]
 714 02fc 3FE0     		b	.L42
 715              	.L45:
 174:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 							 //nessecary for some reason
 175:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 176:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_clear( B_E );
 716              		.loc 1 176 0
 717 02fe 4020     		movs	r0, #64
 718 0300 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 177:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portModer= (0x00005555);
 719              		.loc 1 177 0
 720 0304 244B     		ldr	r3, .L47
 721 0306 254A     		ldr	r2, .L47+4
 722 0308 1A60     		str	r2, [r3]
 178:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW
 723              		.loc 1 178 0
 724 030a 254A     		ldr	r2, .L47+8
 725 030c 244B     		ldr	r3, .L47+8
 726 030e 1B78     		ldrb	r3, [r3]
 727 0310 DBB2     		uxtb	r3, r3
 728 0312 0321     		movs	r1, #3
 729 0314 0B43     		orrs	r3, r1
 730 0316 DBB2     		uxtb	r3, r3
 731 0318 1370     		strb	r3, [r2]
 179:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** select_controller(controller);
 732              		.loc 1 179 0
 733 031a FB1D     		adds	r3, r7, #7
 734 031c 1B78     		ldrb	r3, [r3]
 735 031e 1800     		movs	r0, r3
 736 0320 FFF7FEFF 		bl	select_controller
 180:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_500ns();
 737              		.loc 1 180 0
 738 0324 FFF7FEFF 		bl	delay_500ns
 181:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_set(B_E);
 739              		.loc 1 181 0
 740 0328 4020     		movs	r0, #64
 741 032a FFF7FEFF 		bl	graphic_ctrl_bit_set
 182:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_500ns();
 742              		.loc 1 182 0
 743 032e FFF7FEFF 		bl	delay_500ns
 183:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 184:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** rv = *portIdrHigh;
 744              		.loc 1 184 0
 745 0332 1C4A     		ldr	r2, .L47+12
 746 0334 0F23     		movs	r3, #15
 747 0336 FB18     		adds	r3, r7, r3
 748 0338 1278     		ldrb	r2, [r2]
 749 033a 1A70     		strb	r2, [r3]
 185:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_clear(B_E);
 750              		.loc 1 185 0
 751 033c 4020     		movs	r0, #64
 752 033e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 186:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portModer= (0x55555555);
 753              		.loc 1 186 0
 754 0342 154B     		ldr	r3, .L47
 755 0344 184A     		ldr	r2, .L47+16
 756 0346 1A60     		str	r2, [r3]
 187:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 188:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(controller & B_CS1){
 757              		.loc 1 188 0
 758 0348 FB1D     		adds	r3, r7, #7
 759 034a 1B78     		ldrb	r3, [r3]
 760 034c 0822     		movs	r2, #8
 761 034e 1340     		ands	r3, r2
 762 0350 04D0     		beq	.L43
 189:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		select_controller(B_CS1);
 763              		.loc 1 189 0
 764 0352 0820     		movs	r0, #8
 765 0354 FFF7FEFF 		bl	select_controller
 190:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_wait_ready();
 766              		.loc 1 190 0
 767 0358 FFF7FEFF 		bl	graphic_wait_ready
 768              	.L43:
 191:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 192:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if (controller & B_CS2){
 769              		.loc 1 192 0
 770 035c FB1D     		adds	r3, r7, #7
 771 035e 1B78     		ldrb	r3, [r3]
 772 0360 1022     		movs	r2, #16
 773 0362 1340     		ands	r3, r2
 774 0364 04D0     		beq	.L44
 193:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		select_controller(B_CS2);
 775              		.loc 1 193 0
 776 0366 1020     		movs	r0, #16
 777 0368 FFF7FEFF 		bl	select_controller
 194:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_wait_ready();
 778              		.loc 1 194 0
 779 036c FFF7FEFF 		bl	graphic_wait_ready
 780              	.L44:
 173:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 							 //nessecary for some reason
 781              		.loc 1 173 0 discriminator 2
 782 0370 0E23     		movs	r3, #14
 783 0372 FB18     		adds	r3, r7, r3
 784 0374 1A78     		ldrb	r2, [r3]
 785 0376 0E23     		movs	r3, #14
 786 0378 FB18     		adds	r3, r7, r3
 787 037a 0132     		adds	r2, r2, #1
 788 037c 1A70     		strb	r2, [r3]
 789              	.L42:
 173:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 							 //nessecary for some reason
 790              		.loc 1 173 0 is_stmt 0 discriminator 1
 791 037e 0E23     		movs	r3, #14
 792 0380 FB18     		adds	r3, r7, r3
 793 0382 1B78     		ldrb	r3, [r3]
 794 0384 012B     		cmp	r3, #1
 795 0386 BAD9     		bls	.L45
 796              	.LBE4:
 195:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 196:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 197:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 198:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** return rv;
 797              		.loc 1 198 0 is_stmt 1
 798 0388 0F23     		movs	r3, #15
 799 038a FB18     		adds	r3, r7, r3
 800 038c 1B78     		ldrb	r3, [r3]
 199:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 200:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 801              		.loc 1 200 0
 802 038e 1800     		movs	r0, r3
 803 0390 BD46     		mov	sp, r7
 804 0392 04B0     		add	sp, sp, #16
 805              		@ sp needed
 806 0394 80BD     		pop	{r7, pc}
 807              	.L48:
 808 0396 C046     		.align	2
 809              	.L47:
 810 0398 00100240 		.word	1073876992
 811 039c 55550000 		.word	21845
 812 03a0 14100240 		.word	1073877012
 813 03a4 11100240 		.word	1073877009
 814 03a8 55555555 		.word	1431655765
 815              		.cfi_endproc
 816              	.LFE10:
 818              		.align	2
 819              		.global	graphic_write
 820              		.code	16
 821              		.thumb_func
 823              	graphic_write:
 824              	.LFB11:
 201:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 202:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_write(unit_8 value, unit_8 controller){ 
 825              		.loc 1 202 0
 826              		.cfi_startproc
 827              		@ args = 0, pretend = 0, frame = 8
 828              		@ frame_needed = 1, uses_anonymous_args = 0
 829 03ac 80B5     		push	{r7, lr}
 830              		.cfi_def_cfa_offset 8
 831              		.cfi_offset 7, -8
 832              		.cfi_offset 14, -4
 833 03ae 82B0     		sub	sp, sp, #8
 834              		.cfi_def_cfa_offset 16
 835 03b0 00AF     		add	r7, sp, #0
 836              		.cfi_def_cfa_register 7
 837 03b2 0200     		movs	r2, r0
 838 03b4 FB1D     		adds	r3, r7, #7
 839 03b6 1A70     		strb	r2, [r3]
 840 03b8 BB1D     		adds	r3, r7, #6
 841 03ba 0A1C     		adds	r2, r1, #0
 842 03bc 1A70     		strb	r2, [r3]
 203:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 204:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrHigh = value;
 843              		.loc 1 204 0
 844 03be 134A     		ldr	r2, .L50
 845 03c0 FB1D     		adds	r3, r7, #7
 846 03c2 1B78     		ldrb	r3, [r3]
 847 03c4 1370     		strb	r3, [r2]
 205:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(controller);
 848              		.loc 1 205 0
 849 03c6 BB1D     		adds	r3, r7, #6
 850 03c8 1B78     		ldrb	r3, [r3]
 851 03ca 1800     		movs	r0, r3
 852 03cc FFF7FEFF 		bl	select_controller
 206:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_500ns();
 853              		.loc 1 206 0
 854 03d0 FFF7FEFF 		bl	delay_500ns
 207:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_set(B_E);
 855              		.loc 1 207 0
 856 03d4 4020     		movs	r0, #64
 857 03d6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 208:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_500ns();
 858              		.loc 1 208 0
 859 03da FFF7FEFF 		bl	delay_500ns
 209:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_E);
 860              		.loc 1 209 0
 861 03de 4020     		movs	r0, #64
 862 03e0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 210:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 211:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(controller);
 863              		.loc 1 211 0
 864 03e4 BB1D     		adds	r3, r7, #6
 865 03e6 1B78     		ldrb	r3, [r3]
 866 03e8 1800     		movs	r0, r3
 867 03ea FFF7FEFF 		bl	select_controller
 212:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_wait_ready();
 868              		.loc 1 212 0
 869 03ee FFF7FEFF 		bl	graphic_wait_ready
 213:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 214:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrHigh=0x00;
 870              		.loc 1 214 0
 871 03f2 064B     		ldr	r3, .L50
 872 03f4 0022     		movs	r2, #0
 873 03f6 1A70     		strb	r2, [r3]
 215:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_set(B_E);
 874              		.loc 1 215 0
 875 03f8 4020     		movs	r0, #64
 876 03fa FFF7FEFF 		bl	graphic_ctrl_bit_set
 216:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(0x00);
 877              		.loc 1 216 0
 878 03fe 0020     		movs	r0, #0
 879 0400 FFF7FEFF 		bl	select_controller
 217:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		
 218:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 880              		.loc 1 218 0
 881 0404 C046     		nop
 882 0406 BD46     		mov	sp, r7
 883 0408 02B0     		add	sp, sp, #8
 884              		@ sp needed
 885 040a 80BD     		pop	{r7, pc}
 886              	.L51:
 887              		.align	2
 888              	.L50:
 889 040c 15100240 		.word	1073877013
 890              		.cfi_endproc
 891              	.LFE11:
 893              		.align	2
 894              		.global	graphic_write_command
 895              		.code	16
 896              		.thumb_func
 898              	graphic_write_command:
 899              	.LFB12:
 219:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_write_command(unit_8 cmd, unit_8 controller){
 900              		.loc 1 219 0
 901              		.cfi_startproc
 902              		@ args = 0, pretend = 0, frame = 8
 903              		@ frame_needed = 1, uses_anonymous_args = 0
 904 0410 80B5     		push	{r7, lr}
 905              		.cfi_def_cfa_offset 8
 906              		.cfi_offset 7, -8
 907              		.cfi_offset 14, -4
 908 0412 82B0     		sub	sp, sp, #8
 909              		.cfi_def_cfa_offset 16
 910 0414 00AF     		add	r7, sp, #0
 911              		.cfi_def_cfa_register 7
 912 0416 0200     		movs	r2, r0
 913 0418 FB1D     		adds	r3, r7, #7
 914 041a 1A70     		strb	r2, [r3]
 915 041c BB1D     		adds	r3, r7, #6
 916 041e 0A1C     		adds	r2, r1, #0
 917 0420 1A70     		strb	r2, [r3]
 220:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 221:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_E);
 918              		.loc 1 221 0
 919 0422 4020     		movs	r0, #64
 920 0424 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 222:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	//select_controller(controller);
 223:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = (*portOdrLow & ~0x03); //turns off RS and RW
 921              		.loc 1 223 0
 922 0428 094A     		ldr	r2, .L53
 923 042a 094B     		ldr	r3, .L53
 924 042c 1B78     		ldrb	r3, [r3]
 925 042e DBB2     		uxtb	r3, r3
 926 0430 0321     		movs	r1, #3
 927 0432 8B43     		bics	r3, r1
 928 0434 DBB2     		uxtb	r3, r3
 929 0436 1370     		strb	r3, [r2]
 224:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write(cmd , controller);
 930              		.loc 1 224 0
 931 0438 BB1D     		adds	r3, r7, #6
 932 043a 1A78     		ldrb	r2, [r3]
 933 043c FB1D     		adds	r3, r7, #7
 934 043e 1B78     		ldrb	r3, [r3]
 935 0440 1100     		movs	r1, r2
 936 0442 1800     		movs	r0, r3
 937 0444 FFF7FEFF 		bl	graphic_write
 225:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 938              		.loc 1 225 0
 939 0448 C046     		nop
 940 044a BD46     		mov	sp, r7
 941 044c 02B0     		add	sp, sp, #8
 942              		@ sp needed
 943 044e 80BD     		pop	{r7, pc}
 944              	.L54:
 945              		.align	2
 946              	.L53:
 947 0450 14100240 		.word	1073877012
 948              		.cfi_endproc
 949              	.LFE12:
 951              		.align	2
 952              		.global	graphic_write_data
 953              		.code	16
 954              		.thumb_func
 956              	graphic_write_data:
 957              	.LFB13:
 226:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_write_data(unit_8 data, unit_8 controller){
 958              		.loc 1 226 0
 959              		.cfi_startproc
 960              		@ args = 0, pretend = 0, frame = 8
 961              		@ frame_needed = 1, uses_anonymous_args = 0
 962 0454 80B5     		push	{r7, lr}
 963              		.cfi_def_cfa_offset 8
 964              		.cfi_offset 7, -8
 965              		.cfi_offset 14, -4
 966 0456 82B0     		sub	sp, sp, #8
 967              		.cfi_def_cfa_offset 16
 968 0458 00AF     		add	r7, sp, #0
 969              		.cfi_def_cfa_register 7
 970 045a 0200     		movs	r2, r0
 971 045c FB1D     		adds	r3, r7, #7
 972 045e 1A70     		strb	r2, [r3]
 973 0460 BB1D     		adds	r3, r7, #6
 974 0462 0A1C     		adds	r2, r1, #0
 975 0464 1A70     		strb	r2, [r3]
 227:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 228:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_E);
 976              		.loc 1 228 0
 977 0466 4020     		movs	r0, #64
 978 0468 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 229:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(controller);
 979              		.loc 1 229 0
 980 046c BB1D     		adds	r3, r7, #6
 981 046e 1B78     		ldrb	r3, [r3]
 982 0470 1800     		movs	r0, r3
 983 0472 FFF7FEFF 		bl	select_controller
 230:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = ((*portOdrLow & ~0x02)| 0x01); //turns off RW and RS on
 984              		.loc 1 230 0
 985 0476 0C4A     		ldr	r2, .L56
 986 0478 0B4B     		ldr	r3, .L56
 987 047a 1B78     		ldrb	r3, [r3]
 988 047c DBB2     		uxtb	r3, r3
 989 047e 5BB2     		sxtb	r3, r3
 990 0480 0321     		movs	r1, #3
 991 0482 8B43     		bics	r3, r1
 992 0484 5BB2     		sxtb	r3, r3
 993 0486 0121     		movs	r1, #1
 994 0488 0B43     		orrs	r3, r1
 995 048a 5BB2     		sxtb	r3, r3
 996 048c DBB2     		uxtb	r3, r3
 997 048e 1370     		strb	r3, [r2]
 231:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write(data , controller);
 998              		.loc 1 231 0
 999 0490 BB1D     		adds	r3, r7, #6
 1000 0492 1A78     		ldrb	r2, [r3]
 1001 0494 FB1D     		adds	r3, r7, #7
 1002 0496 1B78     		ldrb	r3, [r3]
 1003 0498 1100     		movs	r1, r2
 1004 049a 1800     		movs	r0, r3
 1005 049c FFF7FEFF 		bl	graphic_write
 232:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 1006              		.loc 1 232 0
 1007 04a0 C046     		nop
 1008 04a2 BD46     		mov	sp, r7
 1009 04a4 02B0     		add	sp, sp, #8
 1010              		@ sp needed
 1011 04a6 80BD     		pop	{r7, pc}
 1012              	.L57:
 1013              		.align	2
 1014              	.L56:
 1015 04a8 14100240 		.word	1073877012
 1016              		.cfi_endproc
 1017              	.LFE13:
 1019              		.align	2
 1020              		.global	graphic_clear_screen
 1021              		.code	16
 1022              		.thumb_func
 1024              	graphic_clear_screen:
 1025              	.LFB14:
 233:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 234:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_clear_screen(){
 1026              		.loc 1 234 0
 1027              		.cfi_startproc
 1028              		@ args = 0, pretend = 0, frame = 8
 1029              		@ frame_needed = 1, uses_anonymous_args = 0
 1030 04ac 80B5     		push	{r7, lr}
 1031              		.cfi_def_cfa_offset 8
 1032              		.cfi_offset 7, -8
 1033              		.cfi_offset 14, -4
 1034 04ae 82B0     		sub	sp, sp, #8
 1035              		.cfi_def_cfa_offset 16
 1036 04b0 00AF     		add	r7, sp, #0
 1037              		.cfi_def_cfa_register 7
 235:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 236:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page,B_CS1|B_CS2);
 1038              		.loc 1 236 0
 1039 04b2 1821     		movs	r1, #24
 1040 04b4 B820     		movs	r0, #184
 1041 04b6 FFF7FEFF 		bl	graphic_write_command
 237:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr,B_CS1|B_CS2);
 1042              		.loc 1 237 0
 1043 04ba 1821     		movs	r1, #24
 1044 04bc 4020     		movs	r0, #64
 1045 04be FFF7FEFF 		bl	graphic_write_command
 1046              	.LBB5:
 238:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for(unit_8 i=0;i<7;i++){
 1047              		.loc 1 238 0
 1048 04c2 FB1D     		adds	r3, r7, #7
 1049 04c4 0022     		movs	r2, #0
 1050 04c6 1A70     		strb	r2, [r3]
 1051 04c8 28E0     		b	.L59
 1052              	.L62:
 239:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_write_command(LCD_set_page | i,B_CS1|B_CS2);
 1053              		.loc 1 239 0
 1054 04ca FB1D     		adds	r3, r7, #7
 1055 04cc 1B78     		ldrb	r3, [r3]
 1056 04ce 4822     		movs	r2, #72
 1057 04d0 5242     		rsbs	r2, r2, #0
 1058 04d2 1343     		orrs	r3, r2
 1059 04d4 DBB2     		uxtb	r3, r3
 1060 04d6 1821     		movs	r1, #24
 1061 04d8 1800     		movs	r0, r3
 1062 04da FFF7FEFF 		bl	graphic_write_command
 1063              	.LBB6:
 240:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		for(unit_8 j=0;j<63;j++){
 1064              		.loc 1 240 0
 1065 04de BB1D     		adds	r3, r7, #6
 1066 04e0 0022     		movs	r2, #0
 1067 04e2 1A70     		strb	r2, [r3]
 1068 04e4 11E0     		b	.L60
 1069              	.L61:
 241:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			graphic_write_command(LCD_set_addr | j,B_CS1|B_CS2);
 1070              		.loc 1 241 0 discriminator 3
 1071 04e6 BB1D     		adds	r3, r7, #6
 1072 04e8 1B78     		ldrb	r3, [r3]
 1073 04ea 4022     		movs	r2, #64
 1074 04ec 1343     		orrs	r3, r2
 1075 04ee DBB2     		uxtb	r3, r3
 1076 04f0 1821     		movs	r1, #24
 1077 04f2 1800     		movs	r0, r3
 1078 04f4 FFF7FEFF 		bl	graphic_write_command
 242:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			graphic_write_data(0,B_CS1|B_CS2);
 1079              		.loc 1 242 0 discriminator 3
 1080 04f8 1821     		movs	r1, #24
 1081 04fa 0020     		movs	r0, #0
 1082 04fc FFF7FEFF 		bl	graphic_write_data
 240:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		for(unit_8 j=0;j<63;j++){
 1083              		.loc 1 240 0 discriminator 3
 1084 0500 BB1D     		adds	r3, r7, #6
 1085 0502 1A78     		ldrb	r2, [r3]
 1086 0504 BB1D     		adds	r3, r7, #6
 1087 0506 0132     		adds	r2, r2, #1
 1088 0508 1A70     		strb	r2, [r3]
 1089              	.L60:
 240:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		for(unit_8 j=0;j<63;j++){
 1090              		.loc 1 240 0 is_stmt 0 discriminator 1
 1091 050a BB1D     		adds	r3, r7, #6
 1092 050c 1B78     		ldrb	r3, [r3]
 1093 050e 3E2B     		cmp	r3, #62
 1094 0510 E9D9     		bls	.L61
 1095              	.LBE6:
 238:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_write_command(LCD_set_page | i,B_CS1|B_CS2);
 1096              		.loc 1 238 0 is_stmt 1 discriminator 2
 1097 0512 FB1D     		adds	r3, r7, #7
 1098 0514 1A78     		ldrb	r2, [r3]
 1099 0516 FB1D     		adds	r3, r7, #7
 1100 0518 0132     		adds	r2, r2, #1
 1101 051a 1A70     		strb	r2, [r3]
 1102              	.L59:
 238:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_write_command(LCD_set_page | i,B_CS1|B_CS2);
 1103              		.loc 1 238 0 is_stmt 0 discriminator 1
 1104 051c FB1D     		adds	r3, r7, #7
 1105 051e 1B78     		ldrb	r3, [r3]
 1106 0520 062B     		cmp	r3, #6
 1107 0522 D2D9     		bls	.L62
 1108              	.LBE5:
 243:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		}
 244:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 245:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1109              		.loc 1 245 0 is_stmt 1
 1110 0524 C046     		nop
 1111 0526 BD46     		mov	sp, r7
 1112 0528 02B0     		add	sp, sp, #8
 1113              		@ sp needed
 1114 052a 80BD     		pop	{r7, pc}
 1115              		.cfi_endproc
 1116              	.LFE14:
 1118              		.align	2
 1119              		.global	lcd_set_data
 1120              		.code	16
 1121              		.thumb_func
 1123              	lcd_set_data:
 1124              	.LFB15:
 246:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void lcd_set_data(unit_8 page,unit_8 adress,unit_8 data){
 1125              		.loc 1 246 0
 1126              		.cfi_startproc
 1127              		@ args = 0, pretend = 0, frame = 16
 1128              		@ frame_needed = 1, uses_anonymous_args = 0
 1129 052c 90B5     		push	{r4, r7, lr}
 1130              		.cfi_def_cfa_offset 12
 1131              		.cfi_offset 4, -12
 1132              		.cfi_offset 7, -8
 1133              		.cfi_offset 14, -4
 1134 052e 85B0     		sub	sp, sp, #20
 1135              		.cfi_def_cfa_offset 32
 1136 0530 00AF     		add	r7, sp, #0
 1137              		.cfi_def_cfa_register 7
 1138 0532 0400     		movs	r4, r0
 1139 0534 0800     		movs	r0, r1
 1140 0536 1100     		movs	r1, r2
 1141 0538 FB1D     		adds	r3, r7, #7
 1142 053a 221C     		adds	r2, r4, #0
 1143 053c 1A70     		strb	r2, [r3]
 1144 053e BB1D     		adds	r3, r7, #6
 1145 0540 021C     		adds	r2, r0, #0
 1146 0542 1A70     		strb	r2, [r3]
 1147 0544 7B1D     		adds	r3, r7, #5
 1148 0546 0A1C     		adds	r2, r1, #0
 1149 0548 1A70     		strb	r2, [r3]
 247:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 cs = B_CS1;
 1150              		.loc 1 247 0
 1151 054a 0F23     		movs	r3, #15
 1152 054c FB18     		adds	r3, r7, r3
 1153 054e 0822     		movs	r2, #8
 1154 0550 1A70     		strb	r2, [r3]
 248:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(adress>64){
 1155              		.loc 1 248 0
 1156 0552 BB1D     		adds	r3, r7, #6
 1157 0554 1B78     		ldrb	r3, [r3]
 1158 0556 402B     		cmp	r3, #64
 1159 0558 03D9     		bls	.L64
 249:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		cs= B_CS2;
 1160              		.loc 1 249 0
 1161 055a 0F23     		movs	r3, #15
 1162 055c FB18     		adds	r3, r7, r3
 1163 055e 1022     		movs	r2, #16
 1164 0560 1A70     		strb	r2, [r3]
 1165              	.L64:
 250:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 251:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr|(adress % 64),cs);
 1166              		.loc 1 251 0
 1167 0562 BB1D     		adds	r3, r7, #6
 1168 0564 1B78     		ldrb	r3, [r3]
 1169 0566 3F22     		movs	r2, #63
 1170 0568 1340     		ands	r3, r2
 1171 056a DBB2     		uxtb	r3, r3
 1172 056c 4022     		movs	r2, #64
 1173 056e 1343     		orrs	r3, r2
 1174 0570 DAB2     		uxtb	r2, r3
 1175 0572 0F23     		movs	r3, #15
 1176 0574 FB18     		adds	r3, r7, r3
 1177 0576 1B78     		ldrb	r3, [r3]
 1178 0578 1900     		movs	r1, r3
 1179 057a 1000     		movs	r0, r2
 1180 057c FFF7FEFF 		bl	graphic_write_command
 252:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page|page,cs);
 1181              		.loc 1 252 0
 1182 0580 FB1D     		adds	r3, r7, #7
 1183 0582 1B78     		ldrb	r3, [r3]
 1184 0584 4822     		movs	r2, #72
 1185 0586 5242     		rsbs	r2, r2, #0
 1186 0588 1343     		orrs	r3, r2
 1187 058a DAB2     		uxtb	r2, r3
 1188 058c 0F23     		movs	r3, #15
 1189 058e FB18     		adds	r3, r7, r3
 1190 0590 1B78     		ldrb	r3, [r3]
 1191 0592 1900     		movs	r1, r3
 1192 0594 1000     		movs	r0, r2
 1193 0596 FFF7FEFF 		bl	graphic_write_command
 253:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_data(data,cs);
 1194              		.loc 1 253 0
 1195 059a 0F23     		movs	r3, #15
 1196 059c FB18     		adds	r3, r7, r3
 1197 059e 1A78     		ldrb	r2, [r3]
 1198 05a0 7B1D     		adds	r3, r7, #5
 1199 05a2 1B78     		ldrb	r3, [r3]
 1200 05a4 1100     		movs	r1, r2
 1201 05a6 1800     		movs	r0, r3
 1202 05a8 FFF7FEFF 		bl	graphic_write_data
 254:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 1203              		.loc 1 254 0
 1204 05ac C046     		nop
 1205 05ae BD46     		mov	sp, r7
 1206 05b0 05B0     		add	sp, sp, #20
 1207              		@ sp needed
 1208 05b2 90BD     		pop	{r4, r7, pc}
 1209              		.cfi_endproc
 1210              	.LFE15:
 1212              		.align	2
 1213              		.global	lcd_read_data
 1214              		.code	16
 1215              		.thumb_func
 1217              	lcd_read_data:
 1218              	.LFB16:
 255:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 lcd_read_data(unit_8 page,unit_8 adress){
 1219              		.loc 1 255 0
 1220              		.cfi_startproc
 1221              		@ args = 0, pretend = 0, frame = 16
 1222              		@ frame_needed = 1, uses_anonymous_args = 0
 1223 05b4 80B5     		push	{r7, lr}
 1224              		.cfi_def_cfa_offset 8
 1225              		.cfi_offset 7, -8
 1226              		.cfi_offset 14, -4
 1227 05b6 84B0     		sub	sp, sp, #16
 1228              		.cfi_def_cfa_offset 24
 1229 05b8 00AF     		add	r7, sp, #0
 1230              		.cfi_def_cfa_register 7
 1231 05ba 0200     		movs	r2, r0
 1232 05bc FB1D     		adds	r3, r7, #7
 1233 05be 1A70     		strb	r2, [r3]
 1234 05c0 BB1D     		adds	r3, r7, #6
 1235 05c2 0A1C     		adds	r2, r1, #0
 1236 05c4 1A70     		strb	r2, [r3]
 256:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 cs = B_CS1;
 1237              		.loc 1 256 0
 1238 05c6 0F23     		movs	r3, #15
 1239 05c8 FB18     		adds	r3, r7, r3
 1240 05ca 0822     		movs	r2, #8
 1241 05cc 1A70     		strb	r2, [r3]
 257:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(adress>64){
 1242              		.loc 1 257 0
 1243 05ce BB1D     		adds	r3, r7, #6
 1244 05d0 1B78     		ldrb	r3, [r3]
 1245 05d2 402B     		cmp	r3, #64
 1246 05d4 03D9     		bls	.L66
 258:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		cs= B_CS2;
 1247              		.loc 1 258 0
 1248 05d6 0F23     		movs	r3, #15
 1249 05d8 FB18     		adds	r3, r7, r3
 1250 05da 1022     		movs	r2, #16
 1251 05dc 1A70     		strb	r2, [r3]
 1252              	.L66:
 259:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 260:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr|(adress % 64),cs);
 1253              		.loc 1 260 0
 1254 05de BB1D     		adds	r3, r7, #6
 1255 05e0 1B78     		ldrb	r3, [r3]
 1256 05e2 3F22     		movs	r2, #63
 1257 05e4 1340     		ands	r3, r2
 1258 05e6 DBB2     		uxtb	r3, r3
 1259 05e8 4022     		movs	r2, #64
 1260 05ea 1343     		orrs	r3, r2
 1261 05ec DAB2     		uxtb	r2, r3
 1262 05ee 0F23     		movs	r3, #15
 1263 05f0 FB18     		adds	r3, r7, r3
 1264 05f2 1B78     		ldrb	r3, [r3]
 1265 05f4 1900     		movs	r1, r3
 1266 05f6 1000     		movs	r0, r2
 1267 05f8 FFF7FEFF 		bl	graphic_write_command
 261:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page|page,cs);
 1268              		.loc 1 261 0
 1269 05fc FB1D     		adds	r3, r7, #7
 1270 05fe 1B78     		ldrb	r3, [r3]
 1271 0600 4822     		movs	r2, #72
 1272 0602 5242     		rsbs	r2, r2, #0
 1273 0604 1343     		orrs	r3, r2
 1274 0606 DAB2     		uxtb	r2, r3
 1275 0608 0F23     		movs	r3, #15
 1276 060a FB18     		adds	r3, r7, r3
 1277 060c 1B78     		ldrb	r3, [r3]
 1278 060e 1900     		movs	r1, r3
 1279 0610 1000     		movs	r0, r2
 1280 0612 FFF7FEFF 		bl	graphic_write_command
 262:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	return graphic_read_data(cs);
 1281              		.loc 1 262 0
 1282 0616 0F23     		movs	r3, #15
 1283 0618 FB18     		adds	r3, r7, r3
 1284 061a 1B78     		ldrb	r3, [r3]
 1285 061c 1800     		movs	r0, r3
 1286 061e FFF7FEFF 		bl	graphic_read_data
 1287 0622 0300     		movs	r3, r0
 263:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 1288              		.loc 1 263 0
 1289 0624 1800     		movs	r0, r3
 1290 0626 BD46     		mov	sp, r7
 1291 0628 04B0     		add	sp, sp, #16
 1292              		@ sp needed
 1293 062a 80BD     		pop	{r7, pc}
 1294              		.cfi_endproc
 1295              	.LFE16:
 1297              		.align	2
 1298              		.global	pixel
 1299              		.code	16
 1300              		.thumb_func
 1302              	pixel:
 1303              	.LFB17:
 264:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 265:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 266:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void pixel(unit_8 x,unit_8 y, unit_8 set){
 1304              		.loc 1 266 0
 1305              		.cfi_startproc
 1306              		@ args = 0, pretend = 0, frame = 24
 1307              		@ frame_needed = 1, uses_anonymous_args = 0
 1308 062c 90B5     		push	{r4, r7, lr}
 1309              		.cfi_def_cfa_offset 12
 1310              		.cfi_offset 4, -12
 1311              		.cfi_offset 7, -8
 1312              		.cfi_offset 14, -4
 1313 062e 87B0     		sub	sp, sp, #28
 1314              		.cfi_def_cfa_offset 40
 1315 0630 00AF     		add	r7, sp, #0
 1316              		.cfi_def_cfa_register 7
 1317 0632 0400     		movs	r4, r0
 1318 0634 0800     		movs	r0, r1
 1319 0636 1100     		movs	r1, r2
 1320 0638 FB1D     		adds	r3, r7, #7
 1321 063a 221C     		adds	r2, r4, #0
 1322 063c 1A70     		strb	r2, [r3]
 1323 063e BB1D     		adds	r3, r7, #6
 1324 0640 021C     		adds	r2, r0, #0
 1325 0642 1A70     		strb	r2, [r3]
 1326 0644 7B1D     		adds	r3, r7, #5
 1327 0646 0A1C     		adds	r2, r1, #0
 1328 0648 1A70     		strb	r2, [r3]
 267:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if((x<1)||(y<1)||(x>128)||(y>64)) return;
 1329              		.loc 1 267 0
 1330 064a FB1D     		adds	r3, r7, #7
 1331 064c 1B78     		ldrb	r3, [r3]
 1332 064e 002B     		cmp	r3, #0
 1333 0650 00D1     		bne	.LCB1105
 1334 0652 9EE0     		b	.L79	@long jump
 1335              	.LCB1105:
 1336              		.loc 1 267 0 is_stmt 0 discriminator 1
 1337 0654 BB1D     		adds	r3, r7, #6
 1338 0656 1B78     		ldrb	r3, [r3]
 1339 0658 002B     		cmp	r3, #0
 1340 065a 00D1     		bne	.LCB1109
 1341 065c 99E0     		b	.L79	@long jump
 1342              	.LCB1109:
 1343              		.loc 1 267 0 discriminator 2
 1344 065e FB1D     		adds	r3, r7, #7
 1345 0660 1B78     		ldrb	r3, [r3]
 1346 0662 802B     		cmp	r3, #128
 1347 0664 00D9     		bls	.LCB1113
 1348 0666 94E0     		b	.L79	@long jump
 1349              	.LCB1113:
 1350              		.loc 1 267 0 discriminator 3
 1351 0668 BB1D     		adds	r3, r7, #6
 1352 066a 1B78     		ldrb	r3, [r3]
 1353 066c 402B     		cmp	r3, #64
 1354 066e 00D9     		bls	.LCB1117
 1355 0670 8FE0     		b	.L79	@long jump
 1356              	.LCB1117:
 268:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 mask, controller,c;
 269:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	int index;
 270:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	index = (y-1)/8;
 1357              		.loc 1 270 0 is_stmt 1
 1358 0672 BB1D     		adds	r3, r7, #6
 1359 0674 1B78     		ldrb	r3, [r3]
 1360 0676 013B     		subs	r3, r3, #1
 1361 0678 002B     		cmp	r3, #0
 1362 067a 00DA     		bge	.L72
 1363 067c 0733     		adds	r3, r3, #7
 1364              	.L72:
 1365 067e DB10     		asrs	r3, r3, #3
 1366 0680 3B61     		str	r3, [r7, #16]
 271:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	mask = 1 << ((y-1)%8);
 1367              		.loc 1 271 0
 1368 0682 BB1D     		adds	r3, r7, #6
 1369 0684 1B78     		ldrb	r3, [r3]
 1370 0686 013B     		subs	r3, r3, #1
 1371 0688 444A     		ldr	r2, .L80
 1372 068a 1340     		ands	r3, r2
 1373 068c 04D5     		bpl	.L73
 1374 068e 013B     		subs	r3, r3, #1
 1375 0690 0822     		movs	r2, #8
 1376 0692 5242     		rsbs	r2, r2, #0
 1377 0694 1343     		orrs	r3, r2
 1378 0696 0133     		adds	r3, r3, #1
 1379              	.L73:
 1380 0698 1A00     		movs	r2, r3
 1381 069a 0123     		movs	r3, #1
 1382 069c 9340     		lsls	r3, r3, r2
 1383 069e 1A00     		movs	r2, r3
 1384 06a0 1723     		movs	r3, #23
 1385 06a2 FB18     		adds	r3, r7, r3
 1386 06a4 1A70     		strb	r2, [r3]
 272:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(set == 0){ mask = ~mask;
 1387              		.loc 1 272 0
 1388 06a6 7B1D     		adds	r3, r7, #5
 1389 06a8 1B78     		ldrb	r3, [r3]
 1390 06aa 002B     		cmp	r3, #0
 1391 06ac 06D1     		bne	.L74
 1392              		.loc 1 272 0 is_stmt 0 discriminator 1
 1393 06ae 1723     		movs	r3, #23
 1394 06b0 FB18     		adds	r3, r7, r3
 1395 06b2 1722     		movs	r2, #23
 1396 06b4 BA18     		adds	r2, r7, r2
 1397 06b6 1278     		ldrb	r2, [r2]
 1398 06b8 D243     		mvns	r2, r2
 1399 06ba 1A70     		strb	r2, [r3]
 1400              	.L74:
 273:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 274:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 275:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(x >64){
 1401              		.loc 1 275 0 is_stmt 1
 1402 06bc FB1D     		adds	r3, r7, #7
 1403 06be 1B78     		ldrb	r3, [r3]
 1404 06c0 402B     		cmp	r3, #64
 1405 06c2 09D9     		bls	.L75
 276:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		controller =B_CS2;
 1406              		.loc 1 276 0
 1407 06c4 1623     		movs	r3, #22
 1408 06c6 FB18     		adds	r3, r7, r3
 1409 06c8 1022     		movs	r2, #16
 1410 06ca 1A70     		strb	r2, [r3]
 277:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		x =x-65;
 1411              		.loc 1 277 0
 1412 06cc FB1D     		adds	r3, r7, #7
 1413 06ce FA1D     		adds	r2, r7, #7
 1414 06d0 1278     		ldrb	r2, [r2]
 1415 06d2 413A     		subs	r2, r2, #65
 1416 06d4 1A70     		strb	r2, [r3]
 1417 06d6 08E0     		b	.L76
 1418              	.L75:
 278:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	} else {
 279:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		controller =B_CS1;
 1419              		.loc 1 279 0
 1420 06d8 1623     		movs	r3, #22
 1421 06da FB18     		adds	r3, r7, r3
 1422 06dc 0822     		movs	r2, #8
 1423 06de 1A70     		strb	r2, [r3]
 280:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		x =x-1;
 1424              		.loc 1 280 0
 1425 06e0 FB1D     		adds	r3, r7, #7
 1426 06e2 FA1D     		adds	r2, r7, #7
 1427 06e4 1278     		ldrb	r2, [r2]
 1428 06e6 013A     		subs	r2, r2, #1
 1429 06e8 1A70     		strb	r2, [r3]
 1430              	.L76:
 281:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 282:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr |x,controller );
 1431              		.loc 1 282 0
 1432 06ea FB1D     		adds	r3, r7, #7
 1433 06ec 1B78     		ldrb	r3, [r3]
 1434 06ee 4022     		movs	r2, #64
 1435 06f0 1343     		orrs	r3, r2
 1436 06f2 DAB2     		uxtb	r2, r3
 1437 06f4 1623     		movs	r3, #22
 1438 06f6 FB18     		adds	r3, r7, r3
 1439 06f8 1B78     		ldrb	r3, [r3]
 1440 06fa 1900     		movs	r1, r3
 1441 06fc 1000     		movs	r0, r2
 1442 06fe FFF7FEFF 		bl	graphic_write_command
 283:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page |index,controller );
 1443              		.loc 1 283 0
 1444 0702 3B69     		ldr	r3, [r7, #16]
 1445 0704 5BB2     		sxtb	r3, r3
 1446 0706 4822     		movs	r2, #72
 1447 0708 5242     		rsbs	r2, r2, #0
 1448 070a 1343     		orrs	r3, r2
 1449 070c 5BB2     		sxtb	r3, r3
 1450 070e DAB2     		uxtb	r2, r3
 1451 0710 1623     		movs	r3, #22
 1452 0712 FB18     		adds	r3, r7, r3
 1453 0714 1B78     		ldrb	r3, [r3]
 1454 0716 1900     		movs	r1, r3
 1455 0718 1000     		movs	r0, r2
 1456 071a FFF7FEFF 		bl	graphic_write_command
 284:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 285:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	c =graphic_read_data(controller);
 1457              		.loc 1 285 0
 1458 071e 0F23     		movs	r3, #15
 1459 0720 FC18     		adds	r4, r7, r3
 1460 0722 1623     		movs	r3, #22
 1461 0724 FB18     		adds	r3, r7, r3
 1462 0726 1B78     		ldrb	r3, [r3]
 1463 0728 1800     		movs	r0, r3
 1464 072a FFF7FEFF 		bl	graphic_read_data
 1465 072e 0300     		movs	r3, r0
 1466 0730 2370     		strb	r3, [r4]
 286:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr |x,controller);
 1467              		.loc 1 286 0
 1468 0732 FB1D     		adds	r3, r7, #7
 1469 0734 1B78     		ldrb	r3, [r3]
 1470 0736 4022     		movs	r2, #64
 1471 0738 1343     		orrs	r3, r2
 1472 073a DAB2     		uxtb	r2, r3
 1473 073c 1623     		movs	r3, #22
 1474 073e FB18     		adds	r3, r7, r3
 1475 0740 1B78     		ldrb	r3, [r3]
 1476 0742 1900     		movs	r1, r3
 1477 0744 1000     		movs	r0, r2
 1478 0746 FFF7FEFF 		bl	graphic_write_command
 287:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(set){mask = mask | c;
 1479              		.loc 1 287 0
 1480 074a 7B1D     		adds	r3, r7, #5
 1481 074c 1B78     		ldrb	r3, [r3]
 1482 074e 002B     		cmp	r3, #0
 1483 0750 0AD0     		beq	.L77
 1484              		.loc 1 287 0 is_stmt 0 discriminator 1
 1485 0752 1723     		movs	r3, #23
 1486 0754 FB18     		adds	r3, r7, r3
 1487 0756 1722     		movs	r2, #23
 1488 0758 B918     		adds	r1, r7, r2
 1489 075a 0F22     		movs	r2, #15
 1490 075c BA18     		adds	r2, r7, r2
 1491 075e 0978     		ldrb	r1, [r1]
 1492 0760 1278     		ldrb	r2, [r2]
 1493 0762 0A43     		orrs	r2, r1
 1494 0764 1A70     		strb	r2, [r3]
 1495 0766 09E0     		b	.L78
 1496              	.L77:
 288:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 289:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	else   {mask = mask & c;
 1497              		.loc 1 289 0 is_stmt 1
 1498 0768 1723     		movs	r3, #23
 1499 076a FB18     		adds	r3, r7, r3
 1500 076c 1722     		movs	r2, #23
 1501 076e BA18     		adds	r2, r7, r2
 1502 0770 0F21     		movs	r1, #15
 1503 0772 7918     		adds	r1, r7, r1
 1504 0774 1278     		ldrb	r2, [r2]
 1505 0776 0978     		ldrb	r1, [r1]
 1506 0778 0A40     		ands	r2, r1
 1507 077a 1A70     		strb	r2, [r3]
 1508              	.L78:
 290:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 291:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 292:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_data(mask,controller);
 1509              		.loc 1 292 0
 1510 077c 1623     		movs	r3, #22
 1511 077e FB18     		adds	r3, r7, r3
 1512 0780 1A78     		ldrb	r2, [r3]
 1513 0782 1723     		movs	r3, #23
 1514 0784 FB18     		adds	r3, r7, r3
 1515 0786 1B78     		ldrb	r3, [r3]
 1516 0788 1100     		movs	r1, r2
 1517 078a 1800     		movs	r0, r3
 1518 078c FFF7FEFF 		bl	graphic_write_data
 1519 0790 00E0     		b	.L68
 1520              	.L79:
 267:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 mask, controller,c;
 1521              		.loc 1 267 0
 1522 0792 C046     		nop
 1523              	.L68:
 293:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1524              		.loc 1 293 0
 1525 0794 BD46     		mov	sp, r7
 1526 0796 07B0     		add	sp, sp, #28
 1527              		@ sp needed
 1528 0798 90BD     		pop	{r4, r7, pc}
 1529              	.L81:
 1530 079a C046     		.align	2
 1531              	.L80:
 1532 079c 07000080 		.word	-2147483641
 1533              		.cfi_endproc
 1534              	.LFE17:
 1536              		.align	2
 1537              		.global	init_app
 1538              		.code	16
 1539              		.thumb_func
 1541              	init_app:
 1542              	.LFB18:
 294:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 295:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void init_app(void){
 1543              		.loc 1 295 0
 1544              		.cfi_startproc
 1545              		@ args = 0, pretend = 0, frame = 0
 1546              		@ frame_needed = 1, uses_anonymous_args = 0
 1547 07a0 80B5     		push	{r7, lr}
 1548              		.cfi_def_cfa_offset 8
 1549              		.cfi_offset 7, -8
 1550              		.cfi_offset 14, -4
 1551 07a2 00AF     		add	r7, sp, #0
 1552              		.cfi_def_cfa_register 7
 296:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer  = 0x55555555;
 1553              		.loc 1 296 0
 1554 07a4 024B     		ldr	r3, .L83
 1555 07a6 034A     		ldr	r2, .L83+4
 1556 07a8 1A60     		str	r2, [r3]
 297:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1557              		.loc 1 297 0
 1558 07aa C046     		nop
 1559 07ac BD46     		mov	sp, r7
 1560              		@ sp needed
 1561 07ae 80BD     		pop	{r7, pc}
 1562              	.L84:
 1563              		.align	2
 1564              	.L83:
 1565 07b0 00100240 		.word	1073876992
 1566 07b4 55555555 		.word	1431655765
 1567              		.cfi_endproc
 1568              	.LFE18:
 1570              		.align	2
 1571              		.global	graphic_init
 1572              		.code	16
 1573              		.thumb_func
 1575              	graphic_init:
 1576              	.LFB19:
 298:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_init(){
 1577              		.loc 1 298 0
 1578              		.cfi_startproc
 1579              		@ args = 0, pretend = 0, frame = 0
 1580              		@ frame_needed = 1, uses_anonymous_args = 0
 1581 07b8 80B5     		push	{r7, lr}
 1582              		.cfi_def_cfa_offset 8
 1583              		.cfi_offset 7, -8
 1584              		.cfi_offset 14, -4
 1585 07ba 00AF     		add	r7, sp, #0
 1586              		.cfi_def_cfa_register 7
 299:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 300:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_set(B_E);
 1587              		.loc 1 300 0
 1588 07bc 4020     		movs	r0, #64
 1589 07be FFF7FEFF 		bl	graphic_ctrl_bit_set
 301:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_mikro(10);
 1590              		.loc 1 301 0
 1591 07c2 0A20     		movs	r0, #10
 1592 07c4 FFF7FEFF 		bl	delay_mikro
 302:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 303:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 1593              		.loc 1 303 0
 1594 07c8 7820     		movs	r0, #120
 1595 07ca FFF7FEFF 		bl	graphic_ctrl_bit_clear
 304:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_milli(30);
 1596              		.loc 1 304 0
 1597 07ce 1E20     		movs	r0, #30
 1598 07d0 FFF7FEFF 		bl	delay_milli
 305:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_set(B_RST);
 1599              		.loc 1 305 0
 1600 07d4 2020     		movs	r0, #32
 1601 07d6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 306:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	//delay_milli(100);
 307:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_milli(10);
 1602              		.loc 1 307 0
 1603 07da 0A20     		movs	r0, #10
 1604 07dc FFF7FEFF 		bl	delay_milli
 308:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_OFF,			B_CS1|B_CS2);//LCD off
 1605              		.loc 1 308 0
 1606 07e0 1821     		movs	r1, #24
 1607 07e2 3E20     		movs	r0, #62
 1608 07e4 FFF7FEFF 		bl	graphic_write_command
 309:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_ON,			B_CS1|B_CS2);//LCD on
 1609              		.loc 1 309 0
 1610 07e8 1821     		movs	r1, #24
 1611 07ea 3F20     		movs	r0, #63
 1612 07ec FFF7FEFF 		bl	graphic_write_command
 310:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_disp_start,	B_CS1|B_CS2);//start=0
 1613              		.loc 1 310 0
 1614 07f0 1821     		movs	r1, #24
 1615 07f2 C020     		movs	r0, #192
 1616 07f4 FFF7FEFF 		bl	graphic_write_command
 311:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr,		B_CS1|B_CS2);//startadress =0
 1617              		.loc 1 311 0
 1618 07f8 1821     		movs	r1, #24
 1619 07fa 4020     		movs	r0, #64
 1620 07fc FFF7FEFF 		bl	graphic_write_command
 312:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page,		B_CS1|B_CS2);//page = 0
 1621              		.loc 1 312 0
 1622 0800 1821     		movs	r1, #24
 1623 0802 B820     		movs	r0, #184
 1624 0804 FFF7FEFF 		bl	graphic_write_command
 313:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(0x00);
 1625              		.loc 1 313 0
 1626 0808 0020     		movs	r0, #0
 1627 080a FFF7FEFF 		bl	select_controller
 314:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 315:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 1628              		.loc 1 315 0
 1629 080e C046     		nop
 1630 0810 BD46     		mov	sp, r7
 1631              		@ sp needed
 1632 0812 80BD     		pop	{r7, pc}
 1633              		.cfi_endproc
 1634              	.LFE19:
 1636              		.align	2
 1637              		.global	main
 1638              		.code	16
 1639              		.thumb_func
 1641              	main:
 1642              	.LFB20:
 316:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 317:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 318:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** int main(void){
 1643              		.loc 1 318 0
 1644              		.cfi_startproc
 1645              		@ args = 0, pretend = 0, frame = 0
 1646              		@ frame_needed = 1, uses_anonymous_args = 0
 1647 0814 80B5     		push	{r7, lr}
 1648              		.cfi_def_cfa_offset 8
 1649              		.cfi_offset 7, -8
 1650              		.cfi_offset 14, -4
 1651 0816 00AF     		add	r7, sp, #0
 1652              		.cfi_def_cfa_register 7
 319:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	init_app();
 1653              		.loc 1 319 0
 1654 0818 FFF7FEFF 		bl	init_app
 320:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_init();
 1655              		.loc 1 320 0
 1656 081c FFF7FEFF 		bl	graphic_init
 321:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 322:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	return 0;
 1657              		.loc 1 322 0
 1658 0820 0023     		movs	r3, #0
 323:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1659              		.loc 1 323 0
 1660 0822 1800     		movs	r0, r3
 1661 0824 BD46     		mov	sp, r7
 1662              		@ sp needed
 1663 0826 80BD     		pop	{r7, pc}
 1664              		.cfi_endproc
 1665              	.LFE20:
 1667              	.Letext0:
