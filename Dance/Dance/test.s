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
   7:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define SIMULATOR 
   8:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  
   9:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  
  10:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_RS 	 0x01 
  11:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_RW	 0x02
  12:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_SELECT 0x04
  13:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_CS1 	 0x08
  14:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_CS2 	 0x10
  15:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_RST 	 0x20
  16:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define B_E 	 0x40
  17:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  18:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  19:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  20:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_ON			0x3F
  21:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_OFF			0x3E
  22:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_set_addr	0x40
  23:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_set_page	0xB8
  24:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define LCD_disp_start	0xC0
  25:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  26:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define GPIO_E 0x40021000 /* MD407 port E */
  27:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portModer ((volatile unsigned long *) (GPIO_E))
  28:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portOtyper ((volatile unsigned short *) (GPIO_E+0x4)) 
  29:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portIdr ((volatile unsigned short *)(GPIO_E+0x10)) 
  30:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  31:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portIdrLow ((volatile unsigned char *) (GPIO_E+0x10))
  32:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portIdrHigh ((volatile unsigned char *) (GPIO_E+0x10+1)) 
  33:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portOdrLow ((volatile unsigned char*) (GPIO_E+0x14))
  34:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** #define portOdrHigh ((volatile unsigned char*) (GPIO_E+0x15))
  35:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  36:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unsigned long STK_CTRL = 0xE000E010;
  37:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unsigned long STK_LOAD = 0xE000E014;
  38:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unsigned volatile long STK_VAL = 0xE000E018;
  39:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  
  40:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	typedef unsigned char  unit_8;
  41:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	typedef unsigned short unit_16;
  42:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	typedef unsigned long  unit_32;
  43:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  44:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  
  45:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  46:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  47:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void startup ( void )
  48:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** {
  47              		.loc 1 48 0
  48              		.cfi_startproc
  49              		@ Naked Function: prologue and epilogue provided by programmer.
  50              		@ args = 0, pretend = 0, frame = 0
  51              		@ frame_needed = 1, uses_anonymous_args = 0
  49:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** asm volatile(
  52              		.loc 1 49 0
  53              		.syntax divided
  54              	@ 49 "/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c" 1
  55 0000 0248     		 LDR R0,=0x2001C000
  56 0002 8546     	 MOV SP,R0
  57 0004 FFF7FEFF 	 BL main
  58 0008 FEE7     	.L1: B .L1
  59              	
  60              	@ 0 "" 2
  50:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  51:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	" MOV SP,R0\n"
  52:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	" BL main\n"				/* call main */
  53:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	".L1: B .L1\n"				/* never return */
  54:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	) ;
  55:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
  61              		.loc 1 55 0
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
  56:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  57:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  58:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void delay_250ns(){
  76              		.loc 1 58 0
  77              		.cfi_startproc
  78              		@ args = 0, pretend = 0, frame = 0
  79              		@ frame_needed = 1, uses_anonymous_args = 0
  80 0000 80B5     		push	{r7, lr}
  81              		.cfi_def_cfa_offset 8
  82              		.cfi_offset 7, -8
  83              		.cfi_offset 14, -4
  84 0002 00AF     		add	r7, sp, #0
  85              		.cfi_def_cfa_register 7
  59:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  60:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  61:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_CTRL) = 0x00;
  86              		.loc 1 61 0
  87 0004 0E4B     		ldr	r3, .L4
  88 0006 1B68     		ldr	r3, [r3]
  89 0008 0022     		movs	r2, #0
  90 000a 1A60     		str	r2, [r3]
  62:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_LOAD )=1;
  91              		.loc 1 62 0
  92 000c 0D4B     		ldr	r3, .L4+4
  93 000e 1B68     		ldr	r3, [r3]
  94 0010 0122     		movs	r2, #1
  95 0012 1A60     		str	r2, [r3]
  63:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_VAL )=0;
  96              		.loc 1 63 0
  97 0014 0C4B     		ldr	r3, .L4+8
  98 0016 1B68     		ldr	r3, [r3]
  99 0018 0022     		movs	r2, #0
 100 001a 1A60     		str	r2, [r3]
  64:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_CTRL) =5;
 101              		.loc 1 64 0
 102 001c 084B     		ldr	r3, .L4
 103 001e 1B68     		ldr	r3, [r3]
 104 0020 0522     		movs	r2, #5
 105 0022 1A60     		str	r2, [r3]
  65:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	while(*((unsigned long *)STK_CTRL) < 0x8){
 106              		.loc 1 65 0
 107 0024 C046     		nop
 108              	.L3:
 109              		.loc 1 65 0 is_stmt 0 discriminator 1
 110 0026 064B     		ldr	r3, .L4
 111 0028 1B68     		ldr	r3, [r3]
 112 002a 1B68     		ldr	r3, [r3]
 113 002c 072B     		cmp	r3, #7
 114 002e FAD9     		bls	.L3
  66:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
  67:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*((unsigned long *)STK_CTRL) = 0;
 115              		.loc 1 67 0 is_stmt 1
 116 0030 034B     		ldr	r3, .L4
 117 0032 1B68     		ldr	r3, [r3]
 118 0034 0022     		movs	r2, #0
 119 0036 1A60     		str	r2, [r3]
  68:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 120              		.loc 1 68 0
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
  69:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void delay_500ns(){
 141              		.loc 1 69 0
 142              		.cfi_startproc
 143              		@ args = 0, pretend = 0, frame = 0
 144              		@ frame_needed = 1, uses_anonymous_args = 0
 145 004c 80B5     		push	{r7, lr}
 146              		.cfi_def_cfa_offset 8
 147              		.cfi_offset 7, -8
 148              		.cfi_offset 14, -4
 149 004e 00AF     		add	r7, sp, #0
 150              		.cfi_def_cfa_register 7
  70:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  71:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_250ns();
 151              		.loc 1 71 0
 152 0050 FFF7FEFF 		bl	delay_250ns
  72:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_250ns();
 153              		.loc 1 72 0
 154 0054 FFF7FEFF 		bl	delay_250ns
  73:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  74:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 155              		.loc 1 74 0
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
  75:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void delay_mikro(unsigned int ms){
 170              		.loc 1 75 0
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
  76:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for (unsigned int j = ms/4; j > 0 ; j--){
 184              		.loc 1 76 0
 185 0068 7B68     		ldr	r3, [r7, #4]
 186 006a 9B08     		lsrs	r3, r3, #2
 187 006c FB60     		str	r3, [r7, #12]
 188 006e 04E0     		b	.L8
 189              	.L9:
  77:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_250ns();
 190              		.loc 1 77 0 discriminator 3
 191 0070 FFF7FEFF 		bl	delay_250ns
  76:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for (unsigned int j = ms/4; j > 0 ; j--){
 192              		.loc 1 76 0 discriminator 3
 193 0074 FB68     		ldr	r3, [r7, #12]
 194 0076 013B     		subs	r3, r3, #1
 195 0078 FB60     		str	r3, [r7, #12]
 196              	.L8:
  76:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for (unsigned int j = ms/4; j > 0 ; j--){
 197              		.loc 1 76 0 is_stmt 0 discriminator 1
 198 007a FB68     		ldr	r3, [r7, #12]
 199 007c 002B     		cmp	r3, #0
 200 007e F7D1     		bne	.L9
 201              	.LBE2:
  78:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  79:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
  80:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  81:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 202              		.loc 1 81 0 is_stmt 1
 203 0080 C046     		nop
 204 0082 BD46     		mov	sp, r7
 205 0084 04B0     		add	sp, sp, #16
 206              		@ sp needed
 207 0086 80BD     		pop	{r7, pc}
 208              		.cfi_endproc
 209              	.LFE3:
 211              		.global	__aeabi_uidiv
 212              		.align	2
 213              		.global	delay_milli
 214              		.code	16
 215              		.thumb_func
 217              	delay_milli:
 218              	.LFB4:
  82:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void delay_milli(unsigned int ms){
 219              		.loc 1 82 0
 220              		.cfi_startproc
 221              		@ args = 0, pretend = 0, frame = 16
 222              		@ frame_needed = 1, uses_anonymous_args = 0
 223 0088 80B5     		push	{r7, lr}
 224              		.cfi_def_cfa_offset 8
 225              		.cfi_offset 7, -8
 226              		.cfi_offset 14, -4
 227 008a 84B0     		sub	sp, sp, #16
 228              		.cfi_def_cfa_offset 24
 229 008c 00AF     		add	r7, sp, #0
 230              		.cfi_def_cfa_register 7
 231 008e 7860     		str	r0, [r7, #4]
  83:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  84:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
  85:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	#ifdef SIMULATOR
  86:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ms=ms/1000;
 232              		.loc 1 86 0
 233 0090 7A68     		ldr	r2, [r7, #4]
 234 0092 FA23     		movs	r3, #250
 235 0094 9900     		lsls	r1, r3, #2
 236 0096 1000     		movs	r0, r2
 237 0098 FFF7FEFF 		bl	__aeabi_uidiv
 238 009c 0300     		movs	r3, r0
 239 009e 7B60     		str	r3, [r7, #4]
  87:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ms++;
 240              		.loc 1 87 0
 241 00a0 7B68     		ldr	r3, [r7, #4]
 242 00a2 0133     		adds	r3, r3, #1
 243 00a4 7B60     		str	r3, [r7, #4]
 244              	.LBB3:
  88:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	#endif
  89:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for(unsigned int i= ms*500; i > 0; i--){
 245              		.loc 1 89 0
 246 00a6 7B68     		ldr	r3, [r7, #4]
 247 00a8 FA22     		movs	r2, #250
 248 00aa 5200     		lsls	r2, r2, #1
 249 00ac 5343     		muls	r3, r2
 250 00ae FB60     		str	r3, [r7, #12]
 251 00b0 05E0     		b	.L11
 252              	.L12:
  90:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_mikro(2);
 253              		.loc 1 90 0 discriminator 3
 254 00b2 0220     		movs	r0, #2
 255 00b4 FFF7FEFF 		bl	delay_mikro
  89:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_mikro(2);
 256              		.loc 1 89 0 discriminator 3
 257 00b8 FB68     		ldr	r3, [r7, #12]
 258 00ba 013B     		subs	r3, r3, #1
 259 00bc FB60     		str	r3, [r7, #12]
 260              	.L11:
  89:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_mikro(2);
 261              		.loc 1 89 0 is_stmt 0 discriminator 1
 262 00be FB68     		ldr	r3, [r7, #12]
 263 00c0 002B     		cmp	r3, #0
 264 00c2 F6D1     		bne	.L12
 265              	.LBE3:
  91:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
  92:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 266              		.loc 1 92 0 is_stmt 1
 267 00c4 C046     		nop
 268 00c6 BD46     		mov	sp, r7
 269 00c8 04B0     		add	sp, sp, #16
 270              		@ sp needed
 271 00ca 80BD     		pop	{r7, pc}
 272              		.cfi_endproc
 273              	.LFE4:
 275              		.align	2
 276              		.global	graphic_ctrl_bit_set
 277              		.code	16
 278              		.thumb_func
 280              	graphic_ctrl_bit_set:
 281              	.LFB5:
  93:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  94:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  95:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
  96:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_ctrl_bit_set( unit_8 x ) { /* Funktion för att 1-ställa bitar */
 282              		.loc 1 96 0
 283              		.cfi_startproc
 284              		@ args = 0, pretend = 0, frame = 16
 285              		@ frame_needed = 1, uses_anonymous_args = 0
 286 00cc 80B5     		push	{r7, lr}
 287              		.cfi_def_cfa_offset 8
 288              		.cfi_offset 7, -8
 289              		.cfi_offset 14, -4
 290 00ce 84B0     		sub	sp, sp, #16
 291              		.cfi_def_cfa_offset 24
 292 00d0 00AF     		add	r7, sp, #0
 293              		.cfi_def_cfa_register 7
 294 00d2 0200     		movs	r2, r0
 295 00d4 FB1D     		adds	r3, r7, #7
 296 00d6 1A70     		strb	r2, [r3]
  97:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 c;
  98:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c = *portOdrLow;
 297              		.loc 1 98 0
 298 00d8 124A     		ldr	r2, .L14
 299 00da 0F23     		movs	r3, #15
 300 00dc FB18     		adds	r3, r7, r3
 301 00de 1278     		ldrb	r2, [r2]
 302 00e0 1A70     		strb	r2, [r3]
  99:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c &= ~B_SELECT;
 303              		.loc 1 99 0
 304 00e2 0F23     		movs	r3, #15
 305 00e4 FB18     		adds	r3, r7, r3
 306 00e6 0F22     		movs	r2, #15
 307 00e8 BA18     		adds	r2, r7, r2
 308 00ea 1278     		ldrb	r2, [r2]
 309 00ec 0421     		movs	r1, #4
 310 00ee 8A43     		bics	r2, r1
 311 00f0 1A70     		strb	r2, [r3]
 100:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c |= (~B_SELECT & x);
 312              		.loc 1 100 0
 313 00f2 FB1D     		adds	r3, r7, #7
 314 00f4 1B78     		ldrb	r3, [r3]
 315 00f6 5BB2     		sxtb	r3, r3
 316 00f8 0422     		movs	r2, #4
 317 00fa 9343     		bics	r3, r2
 318 00fc 5AB2     		sxtb	r2, r3
 319 00fe 0F23     		movs	r3, #15
 320 0100 FB18     		adds	r3, r7, r3
 321 0102 1B78     		ldrb	r3, [r3]
 322 0104 5BB2     		sxtb	r3, r3
 323 0106 1343     		orrs	r3, r2
 324 0108 5AB2     		sxtb	r2, r3
 325 010a 0F23     		movs	r3, #15
 326 010c FB18     		adds	r3, r7, r3
 327 010e 1A70     		strb	r2, [r3]
 101:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow = c;
 328              		.loc 1 101 0
 329 0110 044A     		ldr	r2, .L14
 330 0112 0F23     		movs	r3, #15
 331 0114 FB18     		adds	r3, r7, r3
 332 0116 1B78     		ldrb	r3, [r3]
 333 0118 1370     		strb	r3, [r2]
 102:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 334              		.loc 1 102 0
 335 011a C046     		nop
 336 011c BD46     		mov	sp, r7
 337 011e 04B0     		add	sp, sp, #16
 338              		@ sp needed
 339 0120 80BD     		pop	{r7, pc}
 340              	.L15:
 341 0122 C046     		.align	2
 342              	.L14:
 343 0124 14100240 		.word	1073877012
 344              		.cfi_endproc
 345              	.LFE5:
 347              		.align	2
 348              		.global	graphic_ctrl_bit_clear
 349              		.code	16
 350              		.thumb_func
 352              	graphic_ctrl_bit_clear:
 353              	.LFB6:
 103:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_ctrl_bit_clear( unit_8 x ){
 354              		.loc 1 103 0
 355              		.cfi_startproc
 356              		@ args = 0, pretend = 0, frame = 16
 357              		@ frame_needed = 1, uses_anonymous_args = 0
 358 0128 80B5     		push	{r7, lr}
 359              		.cfi_def_cfa_offset 8
 360              		.cfi_offset 7, -8
 361              		.cfi_offset 14, -4
 362 012a 84B0     		sub	sp, sp, #16
 363              		.cfi_def_cfa_offset 24
 364 012c 00AF     		add	r7, sp, #0
 365              		.cfi_def_cfa_register 7
 366 012e 0200     		movs	r2, r0
 367 0130 FB1D     		adds	r3, r7, #7
 368 0132 1A70     		strb	r2, [r3]
 104:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 c;
 105:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c =*portOdrLow;
 369              		.loc 1 105 0
 370 0134 114A     		ldr	r2, .L17
 371 0136 0F23     		movs	r3, #15
 372 0138 FB18     		adds	r3, r7, r3
 373 013a 1278     		ldrb	r2, [r2]
 374 013c 1A70     		strb	r2, [r3]
 106:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c &=~B_SELECT;
 375              		.loc 1 106 0
 376 013e 0F23     		movs	r3, #15
 377 0140 FB18     		adds	r3, r7, r3
 378 0142 0F22     		movs	r2, #15
 379 0144 BA18     		adds	r2, r7, r2
 380 0146 1278     		ldrb	r2, [r2]
 381 0148 0421     		movs	r1, #4
 382 014a 8A43     		bics	r2, r1
 383 014c 1A70     		strb	r2, [r3]
 107:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c &=~x;
 384              		.loc 1 107 0
 385 014e FB1D     		adds	r3, r7, #7
 386 0150 1B78     		ldrb	r3, [r3]
 387 0152 5BB2     		sxtb	r3, r3
 388 0154 DB43     		mvns	r3, r3
 389 0156 5BB2     		sxtb	r3, r3
 390 0158 0F22     		movs	r2, #15
 391 015a BA18     		adds	r2, r7, r2
 392 015c 1278     		ldrb	r2, [r2]
 393 015e 52B2     		sxtb	r2, r2
 394 0160 1340     		ands	r3, r2
 395 0162 5AB2     		sxtb	r2, r3
 396 0164 0F23     		movs	r3, #15
 397 0166 FB18     		adds	r3, r7, r3
 398 0168 1A70     		strb	r2, [r3]
 108:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow=c;
 399              		.loc 1 108 0
 400 016a 044A     		ldr	r2, .L17
 401 016c 0F23     		movs	r3, #15
 402 016e FB18     		adds	r3, r7, r3
 403 0170 1B78     		ldrb	r3, [r3]
 404 0172 1370     		strb	r3, [r2]
 109:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** } 
 405              		.loc 1 109 0
 406 0174 C046     		nop
 407 0176 BD46     		mov	sp, r7
 408 0178 04B0     		add	sp, sp, #16
 409              		@ sp needed
 410 017a 80BD     		pop	{r7, pc}
 411              	.L18:
 412              		.align	2
 413              	.L17:
 414 017c 14100240 		.word	1073877012
 415              		.cfi_endproc
 416              	.LFE6:
 418              		.align	2
 419              		.global	select_controller
 420              		.code	16
 421              		.thumb_func
 423              	select_controller:
 424              	.LFB7:
 110:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 111:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void select_controller(unit_8 s){
 425              		.loc 1 111 0
 426              		.cfi_startproc
 427              		@ args = 0, pretend = 0, frame = 8
 428              		@ frame_needed = 1, uses_anonymous_args = 0
 429 0180 80B5     		push	{r7, lr}
 430              		.cfi_def_cfa_offset 8
 431              		.cfi_offset 7, -8
 432              		.cfi_offset 14, -4
 433 0182 82B0     		sub	sp, sp, #8
 434              		.cfi_def_cfa_offset 16
 435 0184 00AF     		add	r7, sp, #0
 436              		.cfi_def_cfa_register 7
 437 0186 0200     		movs	r2, r0
 438 0188 FB1D     		adds	r3, r7, #7
 439 018a 1A70     		strb	r2, [r3]
 112:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	switch(s){
 440              		.loc 1 112 0
 441 018c FB1D     		adds	r3, r7, #7
 442 018e 1B78     		ldrb	r3, [r3]
 443 0190 082B     		cmp	r3, #8
 444 0192 08D0     		beq	.L21
 445 0194 02DC     		bgt	.L22
 446 0196 002B     		cmp	r3, #0
 447 0198 17D0     		beq	.L23
 113:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS1 :
 114:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_clear(B_CS2);
 115:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS1);
 116:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 117:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS2 :
 118:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_clear(B_CS1);
 119:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS2);
 120:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 121:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS1|B_CS2 :
 122:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS1|B_CS2);
 123:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 124:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case 0:
 125:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_clear(B_CS1|B_CS2);
 126:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 127:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 128:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 448              		.loc 1 128 0
 449 019a 1AE0     		b	.L26
 450              	.L22:
 112:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	switch(s){
 451              		.loc 1 112 0
 452 019c 102B     		cmp	r3, #16
 453 019e 09D0     		beq	.L24
 454 01a0 182B     		cmp	r3, #24
 455 01a2 0ED0     		beq	.L25
 456              		.loc 1 128 0
 457 01a4 15E0     		b	.L26
 458              	.L21:
 114:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS1);
 459              		.loc 1 114 0
 460 01a6 1020     		movs	r0, #16
 461 01a8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 115:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 462              		.loc 1 115 0
 463 01ac 0820     		movs	r0, #8
 464 01ae FFF7FEFF 		bl	graphic_ctrl_bit_set
 116:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS2 :
 465              		.loc 1 116 0
 466 01b2 0EE0     		b	.L20
 467              	.L24:
 118:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_CS2);
 468              		.loc 1 118 0
 469 01b4 0820     		movs	r0, #8
 470 01b6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 119:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 471              		.loc 1 119 0
 472 01ba 1020     		movs	r0, #16
 473 01bc FFF7FEFF 		bl	graphic_ctrl_bit_set
 120:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case B_CS1|B_CS2 :
 474              		.loc 1 120 0
 475 01c0 07E0     		b	.L20
 476              	.L25:
 122:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 477              		.loc 1 122 0
 478 01c2 1820     		movs	r0, #24
 479 01c4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 123:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	case 0:
 480              		.loc 1 123 0
 481 01c8 03E0     		b	.L20
 482              	.L23:
 125:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		break;
 483              		.loc 1 125 0
 484 01ca 1820     		movs	r0, #24
 485 01cc FFF7FEFF 		bl	graphic_ctrl_bit_clear
 126:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 486              		.loc 1 126 0
 487 01d0 C046     		nop
 488              	.L20:
 489              	.L26:
 490              		.loc 1 128 0
 491 01d2 C046     		nop
 492 01d4 BD46     		mov	sp, r7
 493 01d6 02B0     		add	sp, sp, #8
 494              		@ sp needed
 495 01d8 80BD     		pop	{r7, pc}
 496              		.cfi_endproc
 497              	.LFE7:
 499 01da C046     		.align	2
 500              		.global	graphic_wait_ready
 501              		.code	16
 502              		.thumb_func
 504              	graphic_wait_ready:
 505              	.LFB8:
 129:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_wait_ready(void){
 506              		.loc 1 129 0
 507              		.cfi_startproc
 508              		@ args = 0, pretend = 0, frame = 8
 509              		@ frame_needed = 1, uses_anonymous_args = 0
 510 01dc 80B5     		push	{r7, lr}
 511              		.cfi_def_cfa_offset 8
 512              		.cfi_offset 7, -8
 513              		.cfi_offset 14, -4
 514 01de 82B0     		sub	sp, sp, #8
 515              		.cfi_def_cfa_offset 16
 516 01e0 00AF     		add	r7, sp, #0
 517              		.cfi_def_cfa_register 7
 130:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 c;
 131:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_E);
 518              		.loc 1 131 0
 519 01e2 4020     		movs	r0, #64
 520 01e4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 132:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer= (0x00005555); //sets port 15-8 to inputs and 7-0 to outputs
 521              		.loc 1 132 0
 522 01e8 174B     		ldr	r3, .L33
 523 01ea 184A     		ldr	r2, .L33+4
 524 01ec 1A60     		str	r2, [r3]
 133:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = ((*portOdrLow & ~0x01)| 0x02); //turns off RS and RW on
 525              		.loc 1 133 0
 526 01ee 184A     		ldr	r2, .L33+8
 527 01f0 174B     		ldr	r3, .L33+8
 528 01f2 1B78     		ldrb	r3, [r3]
 529 01f4 DBB2     		uxtb	r3, r3
 530 01f6 5BB2     		sxtb	r3, r3
 531 01f8 0321     		movs	r1, #3
 532 01fa 8B43     		bics	r3, r1
 533 01fc 5BB2     		sxtb	r3, r3
 534 01fe 0221     		movs	r1, #2
 535 0200 0B43     		orrs	r3, r1
 536 0202 5BB2     		sxtb	r3, r3
 537 0204 DBB2     		uxtb	r3, r3
 538 0206 1370     		strb	r3, [r2]
 134:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_500ns();
 539              		.loc 1 134 0
 540 0208 FFF7FEFF 		bl	delay_500ns
 541              	.L30:
 135:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 136:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	while(1){
 137:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_set(B_E);
 542              		.loc 1 137 0
 543 020c 4020     		movs	r0, #64
 544 020e FFF7FEFF 		bl	graphic_ctrl_bit_set
 138:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_500ns();
 545              		.loc 1 138 0
 546 0212 FFF7FEFF 		bl	delay_500ns
 139:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		c =*portIdrHigh & 0x80;
 547              		.loc 1 139 0
 548 0216 0F4B     		ldr	r3, .L33+12
 549 0218 1B78     		ldrb	r3, [r3]
 550 021a DAB2     		uxtb	r2, r3
 551 021c FB1D     		adds	r3, r7, #7
 552 021e 7F21     		movs	r1, #127
 553 0220 8A43     		bics	r2, r1
 554 0222 1A70     		strb	r2, [r3]
 140:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_ctrl_bit_clear(B_E);
 555              		.loc 1 140 0
 556 0224 4020     		movs	r0, #64
 557 0226 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 141:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_500ns();
 558              		.loc 1 141 0
 559 022a FFF7FEFF 		bl	delay_500ns
 142:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		if(c == 0){
 560              		.loc 1 142 0
 561 022e FB1D     		adds	r3, r7, #7
 562 0230 1B78     		ldrb	r3, [r3]
 563 0232 002B     		cmp	r3, #0
 564 0234 00D0     		beq	.L32
 143:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			break;
 144:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		}
 145:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 565              		.loc 1 145 0
 566 0236 E9E7     		b	.L30
 567              	.L32:
 143:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			break;
 568              		.loc 1 143 0
 569 0238 C046     		nop
 146:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 147:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer= (0x55555555); //sets port 15-8 to outputs
 570              		.loc 1 147 0
 571 023a 034B     		ldr	r3, .L33
 572 023c 064A     		ldr	r2, .L33+16
 573 023e 1A60     		str	r2, [r3]
 148:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 149:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 574              		.loc 1 149 0
 575 0240 C046     		nop
 576 0242 BD46     		mov	sp, r7
 577 0244 02B0     		add	sp, sp, #8
 578              		@ sp needed
 579 0246 80BD     		pop	{r7, pc}
 580              	.L34:
 581              		.align	2
 582              	.L33:
 583 0248 00100240 		.word	1073876992
 584 024c 55550000 		.word	21845
 585 0250 14100240 		.word	1073877012
 586 0254 11100240 		.word	1073877009
 587 0258 55555555 		.word	1431655765
 588              		.cfi_endproc
 589              	.LFE8:
 591              		.align	2
 592              		.global	graphic_read_controller
 593              		.code	16
 594              		.thumb_func
 596              	graphic_read_controller:
 597              	.LFB9:
 150:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 151:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 graphic_read_controller( unit_8 controller ){
 598              		.loc 1 151 0
 599              		.cfi_startproc
 600              		@ args = 0, pretend = 0, frame = 16
 601              		@ frame_needed = 1, uses_anonymous_args = 0
 602 025c 80B5     		push	{r7, lr}
 603              		.cfi_def_cfa_offset 8
 604              		.cfi_offset 7, -8
 605              		.cfi_offset 14, -4
 606 025e 84B0     		sub	sp, sp, #16
 607              		.cfi_def_cfa_offset 24
 608 0260 00AF     		add	r7, sp, #0
 609              		.cfi_def_cfa_register 7
 610 0262 0200     		movs	r2, r0
 611 0264 FB1D     		adds	r3, r7, #7
 612 0266 1A70     		strb	r2, [r3]
 152:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_clear( B_E );
 613              		.loc 1 152 0
 614 0268 4020     		movs	r0, #64
 615 026a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 153:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portModer= (0x00005555);
 616              		.loc 1 153 0
 617 026e 1E4B     		ldr	r3, .L39
 618 0270 1E4A     		ldr	r2, .L39+4
 619 0272 1A60     		str	r2, [r3]
 154:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW
 620              		.loc 1 154 0
 621 0274 1E4A     		ldr	r2, .L39+8
 622 0276 1E4B     		ldr	r3, .L39+8
 623 0278 1B78     		ldrb	r3, [r3]
 624 027a DBB2     		uxtb	r3, r3
 625 027c 0321     		movs	r1, #3
 626 027e 0B43     		orrs	r3, r1
 627 0280 DBB2     		uxtb	r3, r3
 628 0282 1370     		strb	r3, [r2]
 155:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** select_controller(controller);
 629              		.loc 1 155 0
 630 0284 FB1D     		adds	r3, r7, #7
 631 0286 1B78     		ldrb	r3, [r3]
 632 0288 1800     		movs	r0, r3
 633 028a FFF7FEFF 		bl	select_controller
 156:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_500ns();
 634              		.loc 1 156 0
 635 028e FFF7FEFF 		bl	delay_500ns
 157:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_set(B_E);
 636              		.loc 1 157 0
 637 0292 4020     		movs	r0, #64
 638 0294 FFF7FEFF 		bl	graphic_ctrl_bit_set
 158:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_500ns();
 639              		.loc 1 158 0
 640 0298 FFF7FEFF 		bl	delay_500ns
 159:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 rv = *portIdrHigh;
 641              		.loc 1 159 0
 642 029c 154A     		ldr	r2, .L39+12
 643 029e 0F23     		movs	r3, #15
 644 02a0 FB18     		adds	r3, r7, r3
 645 02a2 1278     		ldrb	r2, [r2]
 646 02a4 1A70     		strb	r2, [r3]
 160:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_clear(B_E);
 647              		.loc 1 160 0
 648 02a6 4020     		movs	r0, #64
 649 02a8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 161:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portModer= (0x55555555);
 650              		.loc 1 161 0
 651 02ac 0E4B     		ldr	r3, .L39
 652 02ae 124A     		ldr	r2, .L39+16
 653 02b0 1A60     		str	r2, [r3]
 162:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 163:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(controller & B_CS1){
 654              		.loc 1 163 0
 655 02b2 FB1D     		adds	r3, r7, #7
 656 02b4 1B78     		ldrb	r3, [r3]
 657 02b6 0822     		movs	r2, #8
 658 02b8 1340     		ands	r3, r2
 659 02ba 04D0     		beq	.L36
 164:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		select_controller(B_CS1);
 660              		.loc 1 164 0
 661 02bc 0820     		movs	r0, #8
 662 02be FFF7FEFF 		bl	select_controller
 165:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_wait_ready();
 663              		.loc 1 165 0
 664 02c2 FFF7FEFF 		bl	graphic_wait_ready
 665              	.L36:
 166:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 167:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if (controller & B_CS2){
 666              		.loc 1 167 0
 667 02c6 FB1D     		adds	r3, r7, #7
 668 02c8 1B78     		ldrb	r3, [r3]
 669 02ca 1022     		movs	r2, #16
 670 02cc 1340     		ands	r3, r2
 671 02ce 04D0     		beq	.L37
 168:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		select_controller(B_CS2);
 672              		.loc 1 168 0
 673 02d0 1020     		movs	r0, #16
 674 02d2 FFF7FEFF 		bl	select_controller
 169:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_wait_ready();
 675              		.loc 1 169 0
 676 02d6 FFF7FEFF 		bl	graphic_wait_ready
 677              	.L37:
 170:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 171:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** return rv;
 678              		.loc 1 171 0
 679 02da 0F23     		movs	r3, #15
 680 02dc FB18     		adds	r3, r7, r3
 681 02de 1B78     		ldrb	r3, [r3]
 172:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** } 
 682              		.loc 1 172 0
 683 02e0 1800     		movs	r0, r3
 684 02e2 BD46     		mov	sp, r7
 685 02e4 04B0     		add	sp, sp, #16
 686              		@ sp needed
 687 02e6 80BD     		pop	{r7, pc}
 688              	.L40:
 689              		.align	2
 690              	.L39:
 691 02e8 00100240 		.word	1073876992
 692 02ec 55550000 		.word	21845
 693 02f0 14100240 		.word	1073877012
 694 02f4 11100240 		.word	1073877009
 695 02f8 55555555 		.word	1431655765
 696              		.cfi_endproc
 697              	.LFE9:
 699              		.align	2
 700              		.global	graphic_read_data
 701              		.code	16
 702              		.thumb_func
 704              	graphic_read_data:
 705              	.LFB10:
 173:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 graphic_read_data(unit_8 controller){
 706              		.loc 1 173 0
 707              		.cfi_startproc
 708              		@ args = 0, pretend = 0, frame = 16
 709              		@ frame_needed = 1, uses_anonymous_args = 0
 710 02fc 80B5     		push	{r7, lr}
 711              		.cfi_def_cfa_offset 8
 712              		.cfi_offset 7, -8
 713              		.cfi_offset 14, -4
 714 02fe 84B0     		sub	sp, sp, #16
 715              		.cfi_def_cfa_offset 24
 716 0300 00AF     		add	r7, sp, #0
 717              		.cfi_def_cfa_register 7
 718 0302 0200     		movs	r2, r0
 719 0304 FB1D     		adds	r3, r7, #7
 720 0306 1A70     		strb	r2, [r3]
 721              	.LBB4:
 174:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 rv;
 175:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for(unit_8 i=0;i<2;i++){ //so that it executes it two times
 722              		.loc 1 175 0
 723 0308 0E23     		movs	r3, #14
 724 030a FB18     		adds	r3, r7, r3
 725 030c 0022     		movs	r2, #0
 726 030e 1A70     		strb	r2, [r3]
 727 0310 3FE0     		b	.L42
 728              	.L45:
 176:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 							 //nessecary for some reason
 177:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 178:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_clear( B_E );
 729              		.loc 1 178 0
 730 0312 4020     		movs	r0, #64
 731 0314 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 179:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portModer= (0x00005555);
 732              		.loc 1 179 0
 733 0318 244B     		ldr	r3, .L47
 734 031a 254A     		ldr	r2, .L47+4
 735 031c 1A60     		str	r2, [r3]
 180:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW
 736              		.loc 1 180 0
 737 031e 254A     		ldr	r2, .L47+8
 738 0320 244B     		ldr	r3, .L47+8
 739 0322 1B78     		ldrb	r3, [r3]
 740 0324 DBB2     		uxtb	r3, r3
 741 0326 0321     		movs	r1, #3
 742 0328 0B43     		orrs	r3, r1
 743 032a DBB2     		uxtb	r3, r3
 744 032c 1370     		strb	r3, [r2]
 181:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** select_controller(controller);
 745              		.loc 1 181 0
 746 032e FB1D     		adds	r3, r7, #7
 747 0330 1B78     		ldrb	r3, [r3]
 748 0332 1800     		movs	r0, r3
 749 0334 FFF7FEFF 		bl	select_controller
 182:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_500ns();
 750              		.loc 1 182 0
 751 0338 FFF7FEFF 		bl	delay_500ns
 183:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_set(B_E);
 752              		.loc 1 183 0
 753 033c 4020     		movs	r0, #64
 754 033e FFF7FEFF 		bl	graphic_ctrl_bit_set
 184:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_500ns();
 755              		.loc 1 184 0
 756 0342 FFF7FEFF 		bl	delay_500ns
 185:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 186:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** rv = *portIdrHigh;
 757              		.loc 1 186 0
 758 0346 1C4A     		ldr	r2, .L47+12
 759 0348 0F23     		movs	r3, #15
 760 034a FB18     		adds	r3, r7, r3
 761 034c 1278     		ldrb	r2, [r2]
 762 034e 1A70     		strb	r2, [r3]
 187:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** graphic_ctrl_bit_clear(B_E);
 763              		.loc 1 187 0
 764 0350 4020     		movs	r0, #64
 765 0352 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 188:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portModer= (0x55555555);
 766              		.loc 1 188 0
 767 0356 154B     		ldr	r3, .L47
 768 0358 184A     		ldr	r2, .L47+16
 769 035a 1A60     		str	r2, [r3]
 189:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 190:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(controller & B_CS1){
 770              		.loc 1 190 0
 771 035c FB1D     		adds	r3, r7, #7
 772 035e 1B78     		ldrb	r3, [r3]
 773 0360 0822     		movs	r2, #8
 774 0362 1340     		ands	r3, r2
 775 0364 04D0     		beq	.L43
 191:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		select_controller(B_CS1);
 776              		.loc 1 191 0
 777 0366 0820     		movs	r0, #8
 778 0368 FFF7FEFF 		bl	select_controller
 192:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_wait_ready();
 779              		.loc 1 192 0
 780 036c FFF7FEFF 		bl	graphic_wait_ready
 781              	.L43:
 193:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 194:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if (controller & B_CS2){
 782              		.loc 1 194 0
 783 0370 FB1D     		adds	r3, r7, #7
 784 0372 1B78     		ldrb	r3, [r3]
 785 0374 1022     		movs	r2, #16
 786 0376 1340     		ands	r3, r2
 787 0378 04D0     		beq	.L44
 195:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		select_controller(B_CS2);
 788              		.loc 1 195 0
 789 037a 1020     		movs	r0, #16
 790 037c FFF7FEFF 		bl	select_controller
 196:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_wait_ready();
 791              		.loc 1 196 0
 792 0380 FFF7FEFF 		bl	graphic_wait_ready
 793              	.L44:
 175:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 							 //nessecary for some reason
 794              		.loc 1 175 0 discriminator 2
 795 0384 0E23     		movs	r3, #14
 796 0386 FB18     		adds	r3, r7, r3
 797 0388 1A78     		ldrb	r2, [r3]
 798 038a 0E23     		movs	r3, #14
 799 038c FB18     		adds	r3, r7, r3
 800 038e 0132     		adds	r2, r2, #1
 801 0390 1A70     		strb	r2, [r3]
 802              	.L42:
 175:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 							 //nessecary for some reason
 803              		.loc 1 175 0 is_stmt 0 discriminator 1
 804 0392 0E23     		movs	r3, #14
 805 0394 FB18     		adds	r3, r7, r3
 806 0396 1B78     		ldrb	r3, [r3]
 807 0398 012B     		cmp	r3, #1
 808 039a BAD9     		bls	.L45
 809              	.LBE4:
 197:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 198:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 199:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 200:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** return rv;
 810              		.loc 1 200 0 is_stmt 1
 811 039c 0F23     		movs	r3, #15
 812 039e FB18     		adds	r3, r7, r3
 813 03a0 1B78     		ldrb	r3, [r3]
 201:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 202:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 814              		.loc 1 202 0
 815 03a2 1800     		movs	r0, r3
 816 03a4 BD46     		mov	sp, r7
 817 03a6 04B0     		add	sp, sp, #16
 818              		@ sp needed
 819 03a8 80BD     		pop	{r7, pc}
 820              	.L48:
 821 03aa C046     		.align	2
 822              	.L47:
 823 03ac 00100240 		.word	1073876992
 824 03b0 55550000 		.word	21845
 825 03b4 14100240 		.word	1073877012
 826 03b8 11100240 		.word	1073877009
 827 03bc 55555555 		.word	1431655765
 828              		.cfi_endproc
 829              	.LFE10:
 831              		.align	2
 832              		.global	graphic_write
 833              		.code	16
 834              		.thumb_func
 836              	graphic_write:
 837              	.LFB11:
 203:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 204:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_write(unit_8 value, unit_8 controller){ 
 838              		.loc 1 204 0
 839              		.cfi_startproc
 840              		@ args = 0, pretend = 0, frame = 8
 841              		@ frame_needed = 1, uses_anonymous_args = 0
 842 03c0 80B5     		push	{r7, lr}
 843              		.cfi_def_cfa_offset 8
 844              		.cfi_offset 7, -8
 845              		.cfi_offset 14, -4
 846 03c2 82B0     		sub	sp, sp, #8
 847              		.cfi_def_cfa_offset 16
 848 03c4 00AF     		add	r7, sp, #0
 849              		.cfi_def_cfa_register 7
 850 03c6 0200     		movs	r2, r0
 851 03c8 FB1D     		adds	r3, r7, #7
 852 03ca 1A70     		strb	r2, [r3]
 853 03cc BB1D     		adds	r3, r7, #6
 854 03ce 0A1C     		adds	r2, r1, #0
 855 03d0 1A70     		strb	r2, [r3]
 205:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 206:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrHigh = value;
 856              		.loc 1 206 0
 857 03d2 134A     		ldr	r2, .L50
 858 03d4 FB1D     		adds	r3, r7, #7
 859 03d6 1B78     		ldrb	r3, [r3]
 860 03d8 1370     		strb	r3, [r2]
 207:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(controller);
 861              		.loc 1 207 0
 862 03da BB1D     		adds	r3, r7, #6
 863 03dc 1B78     		ldrb	r3, [r3]
 864 03de 1800     		movs	r0, r3
 865 03e0 FFF7FEFF 		bl	select_controller
 208:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_500ns();
 866              		.loc 1 208 0
 867 03e4 FFF7FEFF 		bl	delay_500ns
 209:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_set(B_E);
 868              		.loc 1 209 0
 869 03e8 4020     		movs	r0, #64
 870 03ea FFF7FEFF 		bl	graphic_ctrl_bit_set
 210:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_500ns();
 871              		.loc 1 210 0
 872 03ee FFF7FEFF 		bl	delay_500ns
 211:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_E);
 873              		.loc 1 211 0
 874 03f2 4020     		movs	r0, #64
 875 03f4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 212:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 213:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(controller);
 876              		.loc 1 213 0
 877 03f8 BB1D     		adds	r3, r7, #6
 878 03fa 1B78     		ldrb	r3, [r3]
 879 03fc 1800     		movs	r0, r3
 880 03fe FFF7FEFF 		bl	select_controller
 214:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_wait_ready();
 881              		.loc 1 214 0
 882 0402 FFF7FEFF 		bl	graphic_wait_ready
 215:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 216:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrHigh=0x00;
 883              		.loc 1 216 0
 884 0406 064B     		ldr	r3, .L50
 885 0408 0022     		movs	r2, #0
 886 040a 1A70     		strb	r2, [r3]
 217:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_set(B_E);
 887              		.loc 1 217 0
 888 040c 4020     		movs	r0, #64
 889 040e FFF7FEFF 		bl	graphic_ctrl_bit_set
 218:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(0x00);
 890              		.loc 1 218 0
 891 0412 0020     		movs	r0, #0
 892 0414 FFF7FEFF 		bl	select_controller
 219:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		
 220:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 893              		.loc 1 220 0
 894 0418 C046     		nop
 895 041a BD46     		mov	sp, r7
 896 041c 02B0     		add	sp, sp, #8
 897              		@ sp needed
 898 041e 80BD     		pop	{r7, pc}
 899              	.L51:
 900              		.align	2
 901              	.L50:
 902 0420 15100240 		.word	1073877013
 903              		.cfi_endproc
 904              	.LFE11:
 906              		.align	2
 907              		.global	graphic_write_command
 908              		.code	16
 909              		.thumb_func
 911              	graphic_write_command:
 912              	.LFB12:
 221:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_write_command(unit_8 cmd, unit_8 controller){
 913              		.loc 1 221 0
 914              		.cfi_startproc
 915              		@ args = 0, pretend = 0, frame = 8
 916              		@ frame_needed = 1, uses_anonymous_args = 0
 917 0424 80B5     		push	{r7, lr}
 918              		.cfi_def_cfa_offset 8
 919              		.cfi_offset 7, -8
 920              		.cfi_offset 14, -4
 921 0426 82B0     		sub	sp, sp, #8
 922              		.cfi_def_cfa_offset 16
 923 0428 00AF     		add	r7, sp, #0
 924              		.cfi_def_cfa_register 7
 925 042a 0200     		movs	r2, r0
 926 042c FB1D     		adds	r3, r7, #7
 927 042e 1A70     		strb	r2, [r3]
 928 0430 BB1D     		adds	r3, r7, #6
 929 0432 0A1C     		adds	r2, r1, #0
 930 0434 1A70     		strb	r2, [r3]
 222:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 223:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_E);
 931              		.loc 1 223 0
 932 0436 4020     		movs	r0, #64
 933 0438 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 224:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	//select_controller(controller);
 225:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = (*portOdrLow & ~0x03); //turns off RS and RW
 934              		.loc 1 225 0
 935 043c 094A     		ldr	r2, .L53
 936 043e 094B     		ldr	r3, .L53
 937 0440 1B78     		ldrb	r3, [r3]
 938 0442 DBB2     		uxtb	r3, r3
 939 0444 0321     		movs	r1, #3
 940 0446 8B43     		bics	r3, r1
 941 0448 DBB2     		uxtb	r3, r3
 942 044a 1370     		strb	r3, [r2]
 226:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write(cmd , controller);
 943              		.loc 1 226 0
 944 044c BB1D     		adds	r3, r7, #6
 945 044e 1A78     		ldrb	r2, [r3]
 946 0450 FB1D     		adds	r3, r7, #7
 947 0452 1B78     		ldrb	r3, [r3]
 948 0454 1100     		movs	r1, r2
 949 0456 1800     		movs	r0, r3
 950 0458 FFF7FEFF 		bl	graphic_write
 227:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 951              		.loc 1 227 0
 952 045c C046     		nop
 953 045e BD46     		mov	sp, r7
 954 0460 02B0     		add	sp, sp, #8
 955              		@ sp needed
 956 0462 80BD     		pop	{r7, pc}
 957              	.L54:
 958              		.align	2
 959              	.L53:
 960 0464 14100240 		.word	1073877012
 961              		.cfi_endproc
 962              	.LFE12:
 964              		.align	2
 965              		.global	graphic_write_data
 966              		.code	16
 967              		.thumb_func
 969              	graphic_write_data:
 970              	.LFB13:
 228:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_write_data(unit_8 data, unit_8 controller){
 971              		.loc 1 228 0
 972              		.cfi_startproc
 973              		@ args = 0, pretend = 0, frame = 8
 974              		@ frame_needed = 1, uses_anonymous_args = 0
 975 0468 80B5     		push	{r7, lr}
 976              		.cfi_def_cfa_offset 8
 977              		.cfi_offset 7, -8
 978              		.cfi_offset 14, -4
 979 046a 82B0     		sub	sp, sp, #8
 980              		.cfi_def_cfa_offset 16
 981 046c 00AF     		add	r7, sp, #0
 982              		.cfi_def_cfa_register 7
 983 046e 0200     		movs	r2, r0
 984 0470 FB1D     		adds	r3, r7, #7
 985 0472 1A70     		strb	r2, [r3]
 986 0474 BB1D     		adds	r3, r7, #6
 987 0476 0A1C     		adds	r2, r1, #0
 988 0478 1A70     		strb	r2, [r3]
 229:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 230:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_E);
 989              		.loc 1 230 0
 990 047a 4020     		movs	r0, #64
 991 047c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 231:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(controller);
 992              		.loc 1 231 0
 993 0480 BB1D     		adds	r3, r7, #6
 994 0482 1B78     		ldrb	r3, [r3]
 995 0484 1800     		movs	r0, r3
 996 0486 FFF7FEFF 		bl	select_controller
 232:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = ((*portOdrLow & ~0x02)| 0x01); //turns off RW and RS on
 997              		.loc 1 232 0
 998 048a 0C4A     		ldr	r2, .L56
 999 048c 0B4B     		ldr	r3, .L56
 1000 048e 1B78     		ldrb	r3, [r3]
 1001 0490 DBB2     		uxtb	r3, r3
 1002 0492 5BB2     		sxtb	r3, r3
 1003 0494 0321     		movs	r1, #3
 1004 0496 8B43     		bics	r3, r1
 1005 0498 5BB2     		sxtb	r3, r3
 1006 049a 0121     		movs	r1, #1
 1007 049c 0B43     		orrs	r3, r1
 1008 049e 5BB2     		sxtb	r3, r3
 1009 04a0 DBB2     		uxtb	r3, r3
 1010 04a2 1370     		strb	r3, [r2]
 233:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write(data , controller);
 1011              		.loc 1 233 0
 1012 04a4 BB1D     		adds	r3, r7, #6
 1013 04a6 1A78     		ldrb	r2, [r3]
 1014 04a8 FB1D     		adds	r3, r7, #7
 1015 04aa 1B78     		ldrb	r3, [r3]
 1016 04ac 1100     		movs	r1, r2
 1017 04ae 1800     		movs	r0, r3
 1018 04b0 FFF7FEFF 		bl	graphic_write
 234:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 1019              		.loc 1 234 0
 1020 04b4 C046     		nop
 1021 04b6 BD46     		mov	sp, r7
 1022 04b8 02B0     		add	sp, sp, #8
 1023              		@ sp needed
 1024 04ba 80BD     		pop	{r7, pc}
 1025              	.L57:
 1026              		.align	2
 1027              	.L56:
 1028 04bc 14100240 		.word	1073877012
 1029              		.cfi_endproc
 1030              	.LFE13:
 1032              		.align	2
 1033              		.global	graphic_clear_screen
 1034              		.code	16
 1035              		.thumb_func
 1037              	graphic_clear_screen:
 1038              	.LFB14:
 235:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 236:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_clear_screen(){
 1039              		.loc 1 236 0
 1040              		.cfi_startproc
 1041              		@ args = 0, pretend = 0, frame = 8
 1042              		@ frame_needed = 1, uses_anonymous_args = 0
 1043 04c0 80B5     		push	{r7, lr}
 1044              		.cfi_def_cfa_offset 8
 1045              		.cfi_offset 7, -8
 1046              		.cfi_offset 14, -4
 1047 04c2 82B0     		sub	sp, sp, #8
 1048              		.cfi_def_cfa_offset 16
 1049 04c4 00AF     		add	r7, sp, #0
 1050              		.cfi_def_cfa_register 7
 237:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 238:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page,B_CS1|B_CS2);
 1051              		.loc 1 238 0
 1052 04c6 1821     		movs	r1, #24
 1053 04c8 B820     		movs	r0, #184
 1054 04ca FFF7FEFF 		bl	graphic_write_command
 239:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr,B_CS1|B_CS2);
 1055              		.loc 1 239 0
 1056 04ce 1821     		movs	r1, #24
 1057 04d0 4020     		movs	r0, #64
 1058 04d2 FFF7FEFF 		bl	graphic_write_command
 1059              	.LBB5:
 240:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	for(unit_8 i=0;i<7;i++){
 1060              		.loc 1 240 0
 1061 04d6 FB1D     		adds	r3, r7, #7
 1062 04d8 0022     		movs	r2, #0
 1063 04da 1A70     		strb	r2, [r3]
 1064 04dc 28E0     		b	.L59
 1065              	.L62:
 241:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_write_command(LCD_set_page | i,B_CS1|B_CS2);
 1066              		.loc 1 241 0
 1067 04de FB1D     		adds	r3, r7, #7
 1068 04e0 1B78     		ldrb	r3, [r3]
 1069 04e2 4822     		movs	r2, #72
 1070 04e4 5242     		rsbs	r2, r2, #0
 1071 04e6 1343     		orrs	r3, r2
 1072 04e8 DBB2     		uxtb	r3, r3
 1073 04ea 1821     		movs	r1, #24
 1074 04ec 1800     		movs	r0, r3
 1075 04ee FFF7FEFF 		bl	graphic_write_command
 1076              	.LBB6:
 242:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		for(unit_8 j=0;j<63;j++){
 1077              		.loc 1 242 0
 1078 04f2 BB1D     		adds	r3, r7, #6
 1079 04f4 0022     		movs	r2, #0
 1080 04f6 1A70     		strb	r2, [r3]
 1081 04f8 11E0     		b	.L60
 1082              	.L61:
 243:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			graphic_write_command(LCD_set_addr | j,B_CS1|B_CS2);
 1083              		.loc 1 243 0 discriminator 3
 1084 04fa BB1D     		adds	r3, r7, #6
 1085 04fc 1B78     		ldrb	r3, [r3]
 1086 04fe 4022     		movs	r2, #64
 1087 0500 1343     		orrs	r3, r2
 1088 0502 DBB2     		uxtb	r3, r3
 1089 0504 1821     		movs	r1, #24
 1090 0506 1800     		movs	r0, r3
 1091 0508 FFF7FEFF 		bl	graphic_write_command
 244:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			graphic_write_data(0,B_CS1|B_CS2);
 1092              		.loc 1 244 0 discriminator 3
 1093 050c 1821     		movs	r1, #24
 1094 050e 0020     		movs	r0, #0
 1095 0510 FFF7FEFF 		bl	graphic_write_data
 242:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		for(unit_8 j=0;j<63;j++){
 1096              		.loc 1 242 0 discriminator 3
 1097 0514 BB1D     		adds	r3, r7, #6
 1098 0516 1A78     		ldrb	r2, [r3]
 1099 0518 BB1D     		adds	r3, r7, #6
 1100 051a 0132     		adds	r2, r2, #1
 1101 051c 1A70     		strb	r2, [r3]
 1102              	.L60:
 242:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		for(unit_8 j=0;j<63;j++){
 1103              		.loc 1 242 0 is_stmt 0 discriminator 1
 1104 051e BB1D     		adds	r3, r7, #6
 1105 0520 1B78     		ldrb	r3, [r3]
 1106 0522 3E2B     		cmp	r3, #62
 1107 0524 E9D9     		bls	.L61
 1108              	.LBE6:
 240:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_write_command(LCD_set_page | i,B_CS1|B_CS2);
 1109              		.loc 1 240 0 is_stmt 1 discriminator 2
 1110 0526 FB1D     		adds	r3, r7, #7
 1111 0528 1A78     		ldrb	r2, [r3]
 1112 052a FB1D     		adds	r3, r7, #7
 1113 052c 0132     		adds	r2, r2, #1
 1114 052e 1A70     		strb	r2, [r3]
 1115              	.L59:
 240:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		graphic_write_command(LCD_set_page | i,B_CS1|B_CS2);
 1116              		.loc 1 240 0 is_stmt 0 discriminator 1
 1117 0530 FB1D     		adds	r3, r7, #7
 1118 0532 1B78     		ldrb	r3, [r3]
 1119 0534 062B     		cmp	r3, #6
 1120 0536 D2D9     		bls	.L62
 1121              	.LBE5:
 245:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		}
 246:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 247:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1122              		.loc 1 247 0 is_stmt 1
 1123 0538 C046     		nop
 1124 053a BD46     		mov	sp, r7
 1125 053c 02B0     		add	sp, sp, #8
 1126              		@ sp needed
 1127 053e 80BD     		pop	{r7, pc}
 1128              		.cfi_endproc
 1129              	.LFE14:
 1131              		.align	2
 1132              		.global	lcd_set_data
 1133              		.code	16
 1134              		.thumb_func
 1136              	lcd_set_data:
 1137              	.LFB15:
 248:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void lcd_set_data(unit_8 page,unit_8 adress,unit_8 data){
 1138              		.loc 1 248 0
 1139              		.cfi_startproc
 1140              		@ args = 0, pretend = 0, frame = 16
 1141              		@ frame_needed = 1, uses_anonymous_args = 0
 1142 0540 90B5     		push	{r4, r7, lr}
 1143              		.cfi_def_cfa_offset 12
 1144              		.cfi_offset 4, -12
 1145              		.cfi_offset 7, -8
 1146              		.cfi_offset 14, -4
 1147 0542 85B0     		sub	sp, sp, #20
 1148              		.cfi_def_cfa_offset 32
 1149 0544 00AF     		add	r7, sp, #0
 1150              		.cfi_def_cfa_register 7
 1151 0546 0400     		movs	r4, r0
 1152 0548 0800     		movs	r0, r1
 1153 054a 1100     		movs	r1, r2
 1154 054c FB1D     		adds	r3, r7, #7
 1155 054e 221C     		adds	r2, r4, #0
 1156 0550 1A70     		strb	r2, [r3]
 1157 0552 BB1D     		adds	r3, r7, #6
 1158 0554 021C     		adds	r2, r0, #0
 1159 0556 1A70     		strb	r2, [r3]
 1160 0558 7B1D     		adds	r3, r7, #5
 1161 055a 0A1C     		adds	r2, r1, #0
 1162 055c 1A70     		strb	r2, [r3]
 249:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 cs = B_CS1;
 1163              		.loc 1 249 0
 1164 055e 0F23     		movs	r3, #15
 1165 0560 FB18     		adds	r3, r7, r3
 1166 0562 0822     		movs	r2, #8
 1167 0564 1A70     		strb	r2, [r3]
 250:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(adress>64){
 1168              		.loc 1 250 0
 1169 0566 BB1D     		adds	r3, r7, #6
 1170 0568 1B78     		ldrb	r3, [r3]
 1171 056a 402B     		cmp	r3, #64
 1172 056c 03D9     		bls	.L64
 251:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		cs= B_CS2;
 1173              		.loc 1 251 0
 1174 056e 0F23     		movs	r3, #15
 1175 0570 FB18     		adds	r3, r7, r3
 1176 0572 1022     		movs	r2, #16
 1177 0574 1A70     		strb	r2, [r3]
 1178              	.L64:
 252:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 253:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr|(adress % 64),cs);
 1179              		.loc 1 253 0
 1180 0576 BB1D     		adds	r3, r7, #6
 1181 0578 1B78     		ldrb	r3, [r3]
 1182 057a 3F22     		movs	r2, #63
 1183 057c 1340     		ands	r3, r2
 1184 057e DBB2     		uxtb	r3, r3
 1185 0580 4022     		movs	r2, #64
 1186 0582 1343     		orrs	r3, r2
 1187 0584 DAB2     		uxtb	r2, r3
 1188 0586 0F23     		movs	r3, #15
 1189 0588 FB18     		adds	r3, r7, r3
 1190 058a 1B78     		ldrb	r3, [r3]
 1191 058c 1900     		movs	r1, r3
 1192 058e 1000     		movs	r0, r2
 1193 0590 FFF7FEFF 		bl	graphic_write_command
 254:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page|page,cs);
 1194              		.loc 1 254 0
 1195 0594 FB1D     		adds	r3, r7, #7
 1196 0596 1B78     		ldrb	r3, [r3]
 1197 0598 4822     		movs	r2, #72
 1198 059a 5242     		rsbs	r2, r2, #0
 1199 059c 1343     		orrs	r3, r2
 1200 059e DAB2     		uxtb	r2, r3
 1201 05a0 0F23     		movs	r3, #15
 1202 05a2 FB18     		adds	r3, r7, r3
 1203 05a4 1B78     		ldrb	r3, [r3]
 1204 05a6 1900     		movs	r1, r3
 1205 05a8 1000     		movs	r0, r2
 1206 05aa FFF7FEFF 		bl	graphic_write_command
 255:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_data(data,cs);
 1207              		.loc 1 255 0
 1208 05ae 0F23     		movs	r3, #15
 1209 05b0 FB18     		adds	r3, r7, r3
 1210 05b2 1A78     		ldrb	r2, [r3]
 1211 05b4 7B1D     		adds	r3, r7, #5
 1212 05b6 1B78     		ldrb	r3, [r3]
 1213 05b8 1100     		movs	r1, r2
 1214 05ba 1800     		movs	r0, r3
 1215 05bc FFF7FEFF 		bl	graphic_write_data
 256:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 1216              		.loc 1 256 0
 1217 05c0 C046     		nop
 1218 05c2 BD46     		mov	sp, r7
 1219 05c4 05B0     		add	sp, sp, #20
 1220              		@ sp needed
 1221 05c6 90BD     		pop	{r4, r7, pc}
 1222              		.cfi_endproc
 1223              	.LFE15:
 1225              		.align	2
 1226              		.global	lcd_read_data
 1227              		.code	16
 1228              		.thumb_func
 1230              	lcd_read_data:
 1231              	.LFB16:
 257:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unit_8 lcd_read_data(unit_8 page,unit_8 adress){
 1232              		.loc 1 257 0
 1233              		.cfi_startproc
 1234              		@ args = 0, pretend = 0, frame = 16
 1235              		@ frame_needed = 1, uses_anonymous_args = 0
 1236 05c8 80B5     		push	{r7, lr}
 1237              		.cfi_def_cfa_offset 8
 1238              		.cfi_offset 7, -8
 1239              		.cfi_offset 14, -4
 1240 05ca 84B0     		sub	sp, sp, #16
 1241              		.cfi_def_cfa_offset 24
 1242 05cc 00AF     		add	r7, sp, #0
 1243              		.cfi_def_cfa_register 7
 1244 05ce 0200     		movs	r2, r0
 1245 05d0 FB1D     		adds	r3, r7, #7
 1246 05d2 1A70     		strb	r2, [r3]
 1247 05d4 BB1D     		adds	r3, r7, #6
 1248 05d6 0A1C     		adds	r2, r1, #0
 1249 05d8 1A70     		strb	r2, [r3]
 258:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 cs = B_CS1;
 1250              		.loc 1 258 0
 1251 05da 0F23     		movs	r3, #15
 1252 05dc FB18     		adds	r3, r7, r3
 1253 05de 0822     		movs	r2, #8
 1254 05e0 1A70     		strb	r2, [r3]
 259:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(adress>64){
 1255              		.loc 1 259 0
 1256 05e2 BB1D     		adds	r3, r7, #6
 1257 05e4 1B78     		ldrb	r3, [r3]
 1258 05e6 402B     		cmp	r3, #64
 1259 05e8 03D9     		bls	.L66
 260:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		cs= B_CS2;
 1260              		.loc 1 260 0
 1261 05ea 0F23     		movs	r3, #15
 1262 05ec FB18     		adds	r3, r7, r3
 1263 05ee 1022     		movs	r2, #16
 1264 05f0 1A70     		strb	r2, [r3]
 1265              	.L66:
 261:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 262:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr|(adress % 64),cs);
 1266              		.loc 1 262 0
 1267 05f2 BB1D     		adds	r3, r7, #6
 1268 05f4 1B78     		ldrb	r3, [r3]
 1269 05f6 3F22     		movs	r2, #63
 1270 05f8 1340     		ands	r3, r2
 1271 05fa DBB2     		uxtb	r3, r3
 1272 05fc 4022     		movs	r2, #64
 1273 05fe 1343     		orrs	r3, r2
 1274 0600 DAB2     		uxtb	r2, r3
 1275 0602 0F23     		movs	r3, #15
 1276 0604 FB18     		adds	r3, r7, r3
 1277 0606 1B78     		ldrb	r3, [r3]
 1278 0608 1900     		movs	r1, r3
 1279 060a 1000     		movs	r0, r2
 1280 060c FFF7FEFF 		bl	graphic_write_command
 263:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page|page,cs);
 1281              		.loc 1 263 0
 1282 0610 FB1D     		adds	r3, r7, #7
 1283 0612 1B78     		ldrb	r3, [r3]
 1284 0614 4822     		movs	r2, #72
 1285 0616 5242     		rsbs	r2, r2, #0
 1286 0618 1343     		orrs	r3, r2
 1287 061a DAB2     		uxtb	r2, r3
 1288 061c 0F23     		movs	r3, #15
 1289 061e FB18     		adds	r3, r7, r3
 1290 0620 1B78     		ldrb	r3, [r3]
 1291 0622 1900     		movs	r1, r3
 1292 0624 1000     		movs	r0, r2
 1293 0626 FFF7FEFF 		bl	graphic_write_command
 264:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	return graphic_read_data(cs);
 1294              		.loc 1 264 0
 1295 062a 0F23     		movs	r3, #15
 1296 062c FB18     		adds	r3, r7, r3
 1297 062e 1B78     		ldrb	r3, [r3]
 1298 0630 1800     		movs	r0, r3
 1299 0632 FFF7FEFF 		bl	graphic_read_data
 1300 0636 0300     		movs	r3, r0
 265:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 1301              		.loc 1 265 0
 1302 0638 1800     		movs	r0, r3
 1303 063a BD46     		mov	sp, r7
 1304 063c 04B0     		add	sp, sp, #16
 1305              		@ sp needed
 1306 063e 80BD     		pop	{r7, pc}
 1307              		.cfi_endproc
 1308              	.LFE16:
 1310              		.align	2
 1311              		.global	pixel
 1312              		.code	16
 1313              		.thumb_func
 1315              	pixel:
 1316              	.LFB17:
 266:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 267:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 268:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void pixel(unit_8 x,unit_8 y, unit_8 set){
 1317              		.loc 1 268 0
 1318              		.cfi_startproc
 1319              		@ args = 0, pretend = 0, frame = 24
 1320              		@ frame_needed = 1, uses_anonymous_args = 0
 1321 0640 90B5     		push	{r4, r7, lr}
 1322              		.cfi_def_cfa_offset 12
 1323              		.cfi_offset 4, -12
 1324              		.cfi_offset 7, -8
 1325              		.cfi_offset 14, -4
 1326 0642 87B0     		sub	sp, sp, #28
 1327              		.cfi_def_cfa_offset 40
 1328 0644 00AF     		add	r7, sp, #0
 1329              		.cfi_def_cfa_register 7
 1330 0646 0400     		movs	r4, r0
 1331 0648 0800     		movs	r0, r1
 1332 064a 1100     		movs	r1, r2
 1333 064c FB1D     		adds	r3, r7, #7
 1334 064e 221C     		adds	r2, r4, #0
 1335 0650 1A70     		strb	r2, [r3]
 1336 0652 BB1D     		adds	r3, r7, #6
 1337 0654 021C     		adds	r2, r0, #0
 1338 0656 1A70     		strb	r2, [r3]
 1339 0658 7B1D     		adds	r3, r7, #5
 1340 065a 0A1C     		adds	r2, r1, #0
 1341 065c 1A70     		strb	r2, [r3]
 269:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if((x<1)||(y<1)||(x>128)||(y>64)) return;
 1342              		.loc 1 269 0
 1343 065e FB1D     		adds	r3, r7, #7
 1344 0660 1B78     		ldrb	r3, [r3]
 1345 0662 002B     		cmp	r3, #0
 1346 0664 00D1     		bne	.LCB1115
 1347 0666 9EE0     		b	.L79	@long jump
 1348              	.LCB1115:
 1349              		.loc 1 269 0 is_stmt 0 discriminator 1
 1350 0668 BB1D     		adds	r3, r7, #6
 1351 066a 1B78     		ldrb	r3, [r3]
 1352 066c 002B     		cmp	r3, #0
 1353 066e 00D1     		bne	.LCB1119
 1354 0670 99E0     		b	.L79	@long jump
 1355              	.LCB1119:
 1356              		.loc 1 269 0 discriminator 2
 1357 0672 FB1D     		adds	r3, r7, #7
 1358 0674 1B78     		ldrb	r3, [r3]
 1359 0676 802B     		cmp	r3, #128
 1360 0678 00D9     		bls	.LCB1123
 1361 067a 94E0     		b	.L79	@long jump
 1362              	.LCB1123:
 1363              		.loc 1 269 0 discriminator 3
 1364 067c BB1D     		adds	r3, r7, #6
 1365 067e 1B78     		ldrb	r3, [r3]
 1366 0680 402B     		cmp	r3, #64
 1367 0682 00D9     		bls	.LCB1127
 1368 0684 8FE0     		b	.L79	@long jump
 1369              	.LCB1127:
 270:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 mask, controller,c;
 271:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	int index;
 272:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	index = (y-1)/8;
 1370              		.loc 1 272 0 is_stmt 1
 1371 0686 BB1D     		adds	r3, r7, #6
 1372 0688 1B78     		ldrb	r3, [r3]
 1373 068a 013B     		subs	r3, r3, #1
 1374 068c 002B     		cmp	r3, #0
 1375 068e 00DA     		bge	.L72
 1376 0690 0733     		adds	r3, r3, #7
 1377              	.L72:
 1378 0692 DB10     		asrs	r3, r3, #3
 1379 0694 3B61     		str	r3, [r7, #16]
 273:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	mask = 1 << ((y-1)%8);
 1380              		.loc 1 273 0
 1381 0696 BB1D     		adds	r3, r7, #6
 1382 0698 1B78     		ldrb	r3, [r3]
 1383 069a 013B     		subs	r3, r3, #1
 1384 069c 444A     		ldr	r2, .L80
 1385 069e 1340     		ands	r3, r2
 1386 06a0 04D5     		bpl	.L73
 1387 06a2 013B     		subs	r3, r3, #1
 1388 06a4 0822     		movs	r2, #8
 1389 06a6 5242     		rsbs	r2, r2, #0
 1390 06a8 1343     		orrs	r3, r2
 1391 06aa 0133     		adds	r3, r3, #1
 1392              	.L73:
 1393 06ac 1A00     		movs	r2, r3
 1394 06ae 0123     		movs	r3, #1
 1395 06b0 9340     		lsls	r3, r3, r2
 1396 06b2 1A00     		movs	r2, r3
 1397 06b4 1723     		movs	r3, #23
 1398 06b6 FB18     		adds	r3, r7, r3
 1399 06b8 1A70     		strb	r2, [r3]
 274:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(set == 0){ mask = ~mask;
 1400              		.loc 1 274 0
 1401 06ba 7B1D     		adds	r3, r7, #5
 1402 06bc 1B78     		ldrb	r3, [r3]
 1403 06be 002B     		cmp	r3, #0
 1404 06c0 06D1     		bne	.L74
 1405              		.loc 1 274 0 is_stmt 0 discriminator 1
 1406 06c2 1723     		movs	r3, #23
 1407 06c4 FB18     		adds	r3, r7, r3
 1408 06c6 1722     		movs	r2, #23
 1409 06c8 BA18     		adds	r2, r7, r2
 1410 06ca 1278     		ldrb	r2, [r2]
 1411 06cc D243     		mvns	r2, r2
 1412 06ce 1A70     		strb	r2, [r3]
 1413              	.L74:
 275:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 276:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 277:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(x >64){
 1414              		.loc 1 277 0 is_stmt 1
 1415 06d0 FB1D     		adds	r3, r7, #7
 1416 06d2 1B78     		ldrb	r3, [r3]
 1417 06d4 402B     		cmp	r3, #64
 1418 06d6 09D9     		bls	.L75
 278:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		controller =B_CS2;
 1419              		.loc 1 278 0
 1420 06d8 1623     		movs	r3, #22
 1421 06da FB18     		adds	r3, r7, r3
 1422 06dc 1022     		movs	r2, #16
 1423 06de 1A70     		strb	r2, [r3]
 279:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		x =x-65;
 1424              		.loc 1 279 0
 1425 06e0 FB1D     		adds	r3, r7, #7
 1426 06e2 FA1D     		adds	r2, r7, #7
 1427 06e4 1278     		ldrb	r2, [r2]
 1428 06e6 413A     		subs	r2, r2, #65
 1429 06e8 1A70     		strb	r2, [r3]
 1430 06ea 08E0     		b	.L76
 1431              	.L75:
 280:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	} else {
 281:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		controller =B_CS1;
 1432              		.loc 1 281 0
 1433 06ec 1623     		movs	r3, #22
 1434 06ee FB18     		adds	r3, r7, r3
 1435 06f0 0822     		movs	r2, #8
 1436 06f2 1A70     		strb	r2, [r3]
 282:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		x =x-1;
 1437              		.loc 1 282 0
 1438 06f4 FB1D     		adds	r3, r7, #7
 1439 06f6 FA1D     		adds	r2, r7, #7
 1440 06f8 1278     		ldrb	r2, [r2]
 1441 06fa 013A     		subs	r2, r2, #1
 1442 06fc 1A70     		strb	r2, [r3]
 1443              	.L76:
 283:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 284:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr |x,controller );
 1444              		.loc 1 284 0
 1445 06fe FB1D     		adds	r3, r7, #7
 1446 0700 1B78     		ldrb	r3, [r3]
 1447 0702 4022     		movs	r2, #64
 1448 0704 1343     		orrs	r3, r2
 1449 0706 DAB2     		uxtb	r2, r3
 1450 0708 1623     		movs	r3, #22
 1451 070a FB18     		adds	r3, r7, r3
 1452 070c 1B78     		ldrb	r3, [r3]
 1453 070e 1900     		movs	r1, r3
 1454 0710 1000     		movs	r0, r2
 1455 0712 FFF7FEFF 		bl	graphic_write_command
 285:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page |index,controller );
 1456              		.loc 1 285 0
 1457 0716 3B69     		ldr	r3, [r7, #16]
 1458 0718 5BB2     		sxtb	r3, r3
 1459 071a 4822     		movs	r2, #72
 1460 071c 5242     		rsbs	r2, r2, #0
 1461 071e 1343     		orrs	r3, r2
 1462 0720 5BB2     		sxtb	r3, r3
 1463 0722 DAB2     		uxtb	r2, r3
 1464 0724 1623     		movs	r3, #22
 1465 0726 FB18     		adds	r3, r7, r3
 1466 0728 1B78     		ldrb	r3, [r3]
 1467 072a 1900     		movs	r1, r3
 1468 072c 1000     		movs	r0, r2
 1469 072e FFF7FEFF 		bl	graphic_write_command
 286:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 287:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	c =graphic_read_data(controller);
 1470              		.loc 1 287 0
 1471 0732 0F23     		movs	r3, #15
 1472 0734 FC18     		adds	r4, r7, r3
 1473 0736 1623     		movs	r3, #22
 1474 0738 FB18     		adds	r3, r7, r3
 1475 073a 1B78     		ldrb	r3, [r3]
 1476 073c 1800     		movs	r0, r3
 1477 073e FFF7FEFF 		bl	graphic_read_data
 1478 0742 0300     		movs	r3, r0
 1479 0744 2370     		strb	r3, [r4]
 288:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr |x,controller);
 1480              		.loc 1 288 0
 1481 0746 FB1D     		adds	r3, r7, #7
 1482 0748 1B78     		ldrb	r3, [r3]
 1483 074a 4022     		movs	r2, #64
 1484 074c 1343     		orrs	r3, r2
 1485 074e DAB2     		uxtb	r2, r3
 1486 0750 1623     		movs	r3, #22
 1487 0752 FB18     		adds	r3, r7, r3
 1488 0754 1B78     		ldrb	r3, [r3]
 1489 0756 1900     		movs	r1, r3
 1490 0758 1000     		movs	r0, r2
 1491 075a FFF7FEFF 		bl	graphic_write_command
 289:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	if(set){mask = mask | c;
 1492              		.loc 1 289 0
 1493 075e 7B1D     		adds	r3, r7, #5
 1494 0760 1B78     		ldrb	r3, [r3]
 1495 0762 002B     		cmp	r3, #0
 1496 0764 0AD0     		beq	.L77
 1497              		.loc 1 289 0 is_stmt 0 discriminator 1
 1498 0766 1723     		movs	r3, #23
 1499 0768 FB18     		adds	r3, r7, r3
 1500 076a 1722     		movs	r2, #23
 1501 076c B918     		adds	r1, r7, r2
 1502 076e 0F22     		movs	r2, #15
 1503 0770 BA18     		adds	r2, r7, r2
 1504 0772 0978     		ldrb	r1, [r1]
 1505 0774 1278     		ldrb	r2, [r2]
 1506 0776 0A43     		orrs	r2, r1
 1507 0778 1A70     		strb	r2, [r3]
 1508 077a 09E0     		b	.L78
 1509              	.L77:
 290:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 291:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	else   {mask = mask & c;
 1510              		.loc 1 291 0 is_stmt 1
 1511 077c 1723     		movs	r3, #23
 1512 077e FB18     		adds	r3, r7, r3
 1513 0780 1722     		movs	r2, #23
 1514 0782 BA18     		adds	r2, r7, r2
 1515 0784 0F21     		movs	r1, #15
 1516 0786 7918     		adds	r1, r7, r1
 1517 0788 1278     		ldrb	r2, [r2]
 1518 078a 0978     		ldrb	r1, [r1]
 1519 078c 0A40     		ands	r2, r1
 1520 078e 1A70     		strb	r2, [r3]
 1521              	.L78:
 292:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 293:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 294:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_data(mask,controller);
 1522              		.loc 1 294 0
 1523 0790 1623     		movs	r3, #22
 1524 0792 FB18     		adds	r3, r7, r3
 1525 0794 1A78     		ldrb	r2, [r3]
 1526 0796 1723     		movs	r3, #23
 1527 0798 FB18     		adds	r3, r7, r3
 1528 079a 1B78     		ldrb	r3, [r3]
 1529 079c 1100     		movs	r1, r2
 1530 079e 1800     		movs	r0, r3
 1531 07a0 FFF7FEFF 		bl	graphic_write_data
 1532 07a4 00E0     		b	.L68
 1533              	.L79:
 269:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 mask, controller,c;
 1534              		.loc 1 269 0
 1535 07a6 C046     		nop
 1536              	.L68:
 295:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1537              		.loc 1 295 0
 1538 07a8 BD46     		mov	sp, r7
 1539 07aa 07B0     		add	sp, sp, #28
 1540              		@ sp needed
 1541 07ac 90BD     		pop	{r4, r7, pc}
 1542              	.L81:
 1543 07ae C046     		.align	2
 1544              	.L80:
 1545 07b0 07000080 		.word	-2147483641
 1546              		.cfi_endproc
 1547              	.LFE17:
 1549              		.align	2
 1550              		.global	ascii_ctrl_bit_set
 1551              		.code	16
 1552              		.thumb_func
 1554              	ascii_ctrl_bit_set:
 1555              	.LFB18:
 296:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 297:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 298:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void ascii_ctrl_bit_set( unsigned char x ) { /* Funktion fÃ¶r att 1-stÃ€lla bitar */
 1556              		.loc 1 298 0
 1557              		.cfi_startproc
 1558              		@ args = 0, pretend = 0, frame = 16
 1559              		@ frame_needed = 1, uses_anonymous_args = 0
 1560 07b4 80B5     		push	{r7, lr}
 1561              		.cfi_def_cfa_offset 8
 1562              		.cfi_offset 7, -8
 1563              		.cfi_offset 14, -4
 1564 07b6 84B0     		sub	sp, sp, #16
 1565              		.cfi_def_cfa_offset 24
 1566 07b8 00AF     		add	r7, sp, #0
 1567              		.cfi_def_cfa_register 7
 1568 07ba 0200     		movs	r2, r0
 1569 07bc FB1D     		adds	r3, r7, #7
 1570 07be 1A70     		strb	r2, [r3]
 299:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unsigned char c;
 300:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c = *portOdrLow;
 1571              		.loc 1 300 0
 1572 07c0 0C4A     		ldr	r2, .L83
 1573 07c2 0F23     		movs	r3, #15
 1574 07c4 FB18     		adds	r3, r7, r3
 1575 07c6 1278     		ldrb	r2, [r2]
 1576 07c8 1A70     		strb	r2, [r3]
 301:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c |= ( B_SELECT | x );
 1577              		.loc 1 301 0
 1578 07ca FA1D     		adds	r2, r7, #7
 1579 07cc 0F23     		movs	r3, #15
 1580 07ce FB18     		adds	r3, r7, r3
 1581 07d0 1278     		ldrb	r2, [r2]
 1582 07d2 1B78     		ldrb	r3, [r3]
 1583 07d4 1343     		orrs	r3, r2
 1584 07d6 DAB2     		uxtb	r2, r3
 1585 07d8 0F23     		movs	r3, #15
 1586 07da FB18     		adds	r3, r7, r3
 1587 07dc 0421     		movs	r1, #4
 1588 07de 0A43     		orrs	r2, r1
 1589 07e0 1A70     		strb	r2, [r3]
 302:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow = c;
 1590              		.loc 1 302 0
 1591 07e2 044A     		ldr	r2, .L83
 1592 07e4 0F23     		movs	r3, #15
 1593 07e6 FB18     		adds	r3, r7, r3
 1594 07e8 1B78     		ldrb	r3, [r3]
 1595 07ea 1370     		strb	r3, [r2]
 303:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1596              		.loc 1 303 0
 1597 07ec C046     		nop
 1598 07ee BD46     		mov	sp, r7
 1599 07f0 04B0     		add	sp, sp, #16
 1600              		@ sp needed
 1601 07f2 80BD     		pop	{r7, pc}
 1602              	.L84:
 1603              		.align	2
 1604              	.L83:
 1605 07f4 14100240 		.word	1073877012
 1606              		.cfi_endproc
 1607              	.LFE18:
 1609              		.align	2
 1610              		.global	ascii_ctrl_bit_clear
 1611              		.code	16
 1612              		.thumb_func
 1614              	ascii_ctrl_bit_clear:
 1615              	.LFB19:
 304:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 305:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void ascii_ctrl_bit_clear( unsigned char x ){
 1616              		.loc 1 305 0
 1617              		.cfi_startproc
 1618              		@ args = 0, pretend = 0, frame = 16
 1619              		@ frame_needed = 1, uses_anonymous_args = 0
 1620 07f8 80B5     		push	{r7, lr}
 1621              		.cfi_def_cfa_offset 8
 1622              		.cfi_offset 7, -8
 1623              		.cfi_offset 14, -4
 1624 07fa 84B0     		sub	sp, sp, #16
 1625              		.cfi_def_cfa_offset 24
 1626 07fc 00AF     		add	r7, sp, #0
 1627              		.cfi_def_cfa_register 7
 1628 07fe 0200     		movs	r2, r0
 1629 0800 FB1D     		adds	r3, r7, #7
 1630 0802 1A70     		strb	r2, [r3]
 306:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unsigned char c;
 307:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c = *portOdrLow;
 1631              		.loc 1 307 0
 1632 0804 0F4A     		ldr	r2, .L86
 1633 0806 0F23     		movs	r3, #15
 1634 0808 FB18     		adds	r3, r7, r3
 1635 080a 1278     		ldrb	r2, [r2]
 1636 080c 1A70     		strb	r2, [r3]
 308:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** c = B_SELECT | ( c & ~x );
 1637              		.loc 1 308 0
 1638 080e FB1D     		adds	r3, r7, #7
 1639 0810 1B78     		ldrb	r3, [r3]
 1640 0812 5BB2     		sxtb	r3, r3
 1641 0814 DB43     		mvns	r3, r3
 1642 0816 5BB2     		sxtb	r3, r3
 1643 0818 0F22     		movs	r2, #15
 1644 081a BA18     		adds	r2, r7, r2
 1645 081c 1278     		ldrb	r2, [r2]
 1646 081e 52B2     		sxtb	r2, r2
 1647 0820 1340     		ands	r3, r2
 1648 0822 5BB2     		sxtb	r3, r3
 1649 0824 0422     		movs	r2, #4
 1650 0826 1343     		orrs	r3, r2
 1651 0828 5AB2     		sxtb	r2, r3
 1652 082a 0F23     		movs	r3, #15
 1653 082c FB18     		adds	r3, r7, r3
 1654 082e 1A70     		strb	r2, [r3]
 309:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrLow = c;
 1655              		.loc 1 309 0
 1656 0830 044A     		ldr	r2, .L86
 1657 0832 0F23     		movs	r3, #15
 1658 0834 FB18     		adds	r3, r7, r3
 1659 0836 1B78     		ldrb	r3, [r3]
 1660 0838 1370     		strb	r3, [r2]
 310:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** } 
 1661              		.loc 1 310 0
 1662 083a C046     		nop
 1663 083c BD46     		mov	sp, r7
 1664 083e 04B0     		add	sp, sp, #16
 1665              		@ sp needed
 1666 0840 80BD     		pop	{r7, pc}
 1667              	.L87:
 1668 0842 C046     		.align	2
 1669              	.L86:
 1670 0844 14100240 		.word	1073877012
 1671              		.cfi_endproc
 1672              	.LFE19:
 1674              		.align	2
 1675              		.global	ascii_write_controller
 1676              		.code	16
 1677              		.thumb_func
 1679              	ascii_write_controller:
 1680              	.LFB20:
 311:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 312:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void ascii_write_controller( unsigned char c ){
 1681              		.loc 1 312 0
 1682              		.cfi_startproc
 1683              		@ args = 0, pretend = 0, frame = 8
 1684              		@ frame_needed = 1, uses_anonymous_args = 0
 1685 0848 80B5     		push	{r7, lr}
 1686              		.cfi_def_cfa_offset 8
 1687              		.cfi_offset 7, -8
 1688              		.cfi_offset 14, -4
 1689 084a 82B0     		sub	sp, sp, #8
 1690              		.cfi_def_cfa_offset 16
 1691 084c 00AF     		add	r7, sp, #0
 1692              		.cfi_def_cfa_register 7
 1693 084e 0200     		movs	r2, r0
 1694 0850 FB1D     		adds	r3, r7, #7
 1695 0852 1A70     		strb	r2, [r3]
 313:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** ascii_ctrl_bit_set( B_E );
 1696              		.loc 1 313 0
 1697 0854 4020     		movs	r0, #64
 1698 0856 FFF7FEFF 		bl	ascii_ctrl_bit_set
 314:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** *portOdrHigh = c;
 1699              		.loc 1 314 0
 1700 085a 064A     		ldr	r2, .L89
 1701 085c FB1D     		adds	r3, r7, #7
 1702 085e 1B78     		ldrb	r3, [r3]
 1703 0860 1370     		strb	r3, [r2]
 315:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_250ns();
 1704              		.loc 1 315 0
 1705 0862 FFF7FEFF 		bl	delay_250ns
 316:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** ascii_ctrl_bit_clear( B_E );
 1706              		.loc 1 316 0
 1707 0866 4020     		movs	r0, #64
 1708 0868 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 317:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1709              		.loc 1 317 0
 1710 086c C046     		nop
 1711 086e BD46     		mov	sp, r7
 1712 0870 02B0     		add	sp, sp, #8
 1713              		@ sp needed
 1714 0872 80BD     		pop	{r7, pc}
 1715              	.L90:
 1716              		.align	2
 1717              	.L89:
 1718 0874 15100240 		.word	1073877013
 1719              		.cfi_endproc
 1720              	.LFE20:
 1722              		.align	2
 1723              		.global	ascii_write_cmd
 1724              		.code	16
 1725              		.thumb_func
 1727              	ascii_write_cmd:
 1728              	.LFB21:
 318:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 319:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void ascii_write_cmd(char command){
 1729              		.loc 1 319 0
 1730              		.cfi_startproc
 1731              		@ args = 0, pretend = 0, frame = 8
 1732              		@ frame_needed = 1, uses_anonymous_args = 0
 1733 0878 80B5     		push	{r7, lr}
 1734              		.cfi_def_cfa_offset 8
 1735              		.cfi_offset 7, -8
 1736              		.cfi_offset 14, -4
 1737 087a 82B0     		sub	sp, sp, #8
 1738              		.cfi_def_cfa_offset 16
 1739 087c 00AF     		add	r7, sp, #0
 1740              		.cfi_def_cfa_register 7
 1741 087e 0200     		movs	r2, r0
 1742 0880 FB1D     		adds	r3, r7, #7
 1743 0882 1A70     		strb	r2, [r3]
 320:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = (*portOdrLow & ~0x03); //turns off RS and RW
 1744              		.loc 1 320 0
 1745 0884 084A     		ldr	r2, .L92
 1746 0886 084B     		ldr	r3, .L92
 1747 0888 1B78     		ldrb	r3, [r3]
 1748 088a DBB2     		uxtb	r3, r3
 1749 088c 0321     		movs	r1, #3
 1750 088e 8B43     		bics	r3, r1
 1751 0890 DBB2     		uxtb	r3, r3
 1752 0892 1370     		strb	r3, [r2]
 321:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ascii_write_controller(command);
 1753              		.loc 1 321 0
 1754 0894 FB1D     		adds	r3, r7, #7
 1755 0896 1B78     		ldrb	r3, [r3]
 1756 0898 1800     		movs	r0, r3
 1757 089a FFF7FEFF 		bl	ascii_write_controller
 322:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1758              		.loc 1 322 0
 1759 089e C046     		nop
 1760 08a0 BD46     		mov	sp, r7
 1761 08a2 02B0     		add	sp, sp, #8
 1762              		@ sp needed
 1763 08a4 80BD     		pop	{r7, pc}
 1764              	.L93:
 1765 08a6 C046     		.align	2
 1766              	.L92:
 1767 08a8 14100240 		.word	1073877012
 1768              		.cfi_endproc
 1769              	.LFE21:
 1771              		.align	2
 1772              		.global	ascii_write_data
 1773              		.code	16
 1774              		.thumb_func
 1776              	ascii_write_data:
 1777              	.LFB22:
 323:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 324:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void ascii_write_data(char command){
 1778              		.loc 1 324 0
 1779              		.cfi_startproc
 1780              		@ args = 0, pretend = 0, frame = 8
 1781              		@ frame_needed = 1, uses_anonymous_args = 0
 1782 08ac 80B5     		push	{r7, lr}
 1783              		.cfi_def_cfa_offset 8
 1784              		.cfi_offset 7, -8
 1785              		.cfi_offset 14, -4
 1786 08ae 82B0     		sub	sp, sp, #8
 1787              		.cfi_def_cfa_offset 16
 1788 08b0 00AF     		add	r7, sp, #0
 1789              		.cfi_def_cfa_register 7
 1790 08b2 0200     		movs	r2, r0
 1791 08b4 FB1D     		adds	r3, r7, #7
 1792 08b6 1A70     		strb	r2, [r3]
 325:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = ((*portOdrLow & ~0x02)| 0x01); //turns off RW and RS on
 1793              		.loc 1 325 0
 1794 08b8 0A4A     		ldr	r2, .L95
 1795 08ba 0A4B     		ldr	r3, .L95
 1796 08bc 1B78     		ldrb	r3, [r3]
 1797 08be DBB2     		uxtb	r3, r3
 1798 08c0 5BB2     		sxtb	r3, r3
 1799 08c2 0321     		movs	r1, #3
 1800 08c4 8B43     		bics	r3, r1
 1801 08c6 5BB2     		sxtb	r3, r3
 1802 08c8 0121     		movs	r1, #1
 1803 08ca 0B43     		orrs	r3, r1
 1804 08cc 5BB2     		sxtb	r3, r3
 1805 08ce DBB2     		uxtb	r3, r3
 1806 08d0 1370     		strb	r3, [r2]
 326:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c ****  	ascii_write_controller(command);
 1807              		.loc 1 326 0
 1808 08d2 FB1D     		adds	r3, r7, #7
 1809 08d4 1B78     		ldrb	r3, [r3]
 1810 08d6 1800     		movs	r0, r3
 1811 08d8 FFF7FEFF 		bl	ascii_write_controller
 327:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1812              		.loc 1 327 0
 1813 08dc C046     		nop
 1814 08de BD46     		mov	sp, r7
 1815 08e0 02B0     		add	sp, sp, #8
 1816              		@ sp needed
 1817 08e2 80BD     		pop	{r7, pc}
 1818              	.L96:
 1819              		.align	2
 1820              	.L95:
 1821 08e4 14100240 		.word	1073877012
 1822              		.cfi_endproc
 1823              	.LFE22:
 1825              		.align	2
 1826              		.global	ascii_read_controller
 1827              		.code	16
 1828              		.thumb_func
 1830              	ascii_read_controller:
 1831              	.LFB23:
 328:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 329:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unsigned char ascii_read_controller( void ){
 1832              		.loc 1 329 0
 1833              		.cfi_startproc
 1834              		@ args = 0, pretend = 0, frame = 8
 1835              		@ frame_needed = 1, uses_anonymous_args = 0
 1836 08e8 80B5     		push	{r7, lr}
 1837              		.cfi_def_cfa_offset 8
 1838              		.cfi_offset 7, -8
 1839              		.cfi_offset 14, -4
 1840 08ea 82B0     		sub	sp, sp, #8
 1841              		.cfi_def_cfa_offset 16
 1842 08ec 00AF     		add	r7, sp, #0
 1843              		.cfi_def_cfa_register 7
 330:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** ascii_ctrl_bit_set( B_E );
 1844              		.loc 1 330 0
 1845 08ee 4020     		movs	r0, #64
 1846 08f0 FFF7FEFF 		bl	ascii_ctrl_bit_set
 331:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_250ns(); /* max 360 ns */
 1847              		.loc 1 331 0
 1848 08f4 FFF7FEFF 		bl	delay_250ns
 332:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** delay_250ns();
 1849              		.loc 1 332 0
 1850 08f8 FFF7FEFF 		bl	delay_250ns
 333:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unsigned char rv = *portIdrHigh;
 1851              		.loc 1 333 0
 1852 08fc 064A     		ldr	r2, .L99
 1853 08fe FB1D     		adds	r3, r7, #7
 1854 0900 1278     		ldrb	r2, [r2]
 1855 0902 1A70     		strb	r2, [r3]
 334:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** ascii_ctrl_bit_clear( B_E );
 1856              		.loc 1 334 0
 1857 0904 4020     		movs	r0, #64
 1858 0906 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 335:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** return rv;
 1859              		.loc 1 335 0
 1860 090a FB1D     		adds	r3, r7, #7
 1861 090c 1B78     		ldrb	r3, [r3]
 336:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** } 
 1862              		.loc 1 336 0
 1863 090e 1800     		movs	r0, r3
 1864 0910 BD46     		mov	sp, r7
 1865 0912 02B0     		add	sp, sp, #8
 1866              		@ sp needed
 1867 0914 80BD     		pop	{r7, pc}
 1868              	.L100:
 1869 0916 C046     		.align	2
 1870              	.L99:
 1871 0918 11100240 		.word	1073877009
 1872              		.cfi_endproc
 1873              	.LFE23:
 1875              		.align	2
 1876              		.global	ascii_read_status
 1877              		.code	16
 1878              		.thumb_func
 1880              	ascii_read_status:
 1881              	.LFB24:
 337:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 338:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unsigned char ascii_read_status(void){
 1882              		.loc 1 338 0
 1883              		.cfi_startproc
 1884              		@ args = 0, pretend = 0, frame = 8
 1885              		@ frame_needed = 1, uses_anonymous_args = 0
 1886 091c 90B5     		push	{r4, r7, lr}
 1887              		.cfi_def_cfa_offset 12
 1888              		.cfi_offset 4, -12
 1889              		.cfi_offset 7, -8
 1890              		.cfi_offset 14, -4
 1891 091e 83B0     		sub	sp, sp, #12
 1892              		.cfi_def_cfa_offset 24
 1893 0920 00AF     		add	r7, sp, #0
 1894              		.cfi_def_cfa_register 7
 339:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer= (0x0000FFFF & *portModer); //sets port 15-8 to inputs
 1895              		.loc 1 339 0
 1896 0922 124B     		ldr	r3, .L103
 1897 0924 114A     		ldr	r2, .L103
 1898 0926 1268     		ldr	r2, [r2]
 1899 0928 1204     		lsls	r2, r2, #16
 1900 092a 120C     		lsrs	r2, r2, #16
 1901 092c 1A60     		str	r2, [r3]
 340:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = ((*portOdrLow & ~0x01)| 0x02); //turns off RS and RW on
 1902              		.loc 1 340 0
 1903 092e 104A     		ldr	r2, .L103+4
 1904 0930 0F4B     		ldr	r3, .L103+4
 1905 0932 1B78     		ldrb	r3, [r3]
 1906 0934 DBB2     		uxtb	r3, r3
 1907 0936 5BB2     		sxtb	r3, r3
 1908 0938 0321     		movs	r1, #3
 1909 093a 8B43     		bics	r3, r1
 1910 093c 5BB2     		sxtb	r3, r3
 1911 093e 0221     		movs	r1, #2
 1912 0940 0B43     		orrs	r3, r1
 1913 0942 5BB2     		sxtb	r3, r3
 1914 0944 DBB2     		uxtb	r3, r3
 1915 0946 1370     		strb	r3, [r2]
 341:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unsigned char rv = ascii_read_controller();
 1916              		.loc 1 341 0
 1917 0948 FC1D     		adds	r4, r7, #7
 1918 094a FFF7FEFF 		bl	ascii_read_controller
 1919 094e 0300     		movs	r3, r0
 1920 0950 2370     		strb	r3, [r4]
 342:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer= (0x55550000 | *portModer); //sets port 15-8 to outputs
 1921              		.loc 1 342 0
 1922 0952 064B     		ldr	r3, .L103
 1923 0954 054A     		ldr	r2, .L103
 1924 0956 1268     		ldr	r2, [r2]
 1925 0958 0649     		ldr	r1, .L103+8
 1926 095a 0A43     		orrs	r2, r1
 1927 095c 1A60     		str	r2, [r3]
 343:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	return rv;
 1928              		.loc 1 343 0
 1929 095e FB1D     		adds	r3, r7, #7
 1930 0960 1B78     		ldrb	r3, [r3]
 344:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }	
 1931              		.loc 1 344 0
 1932 0962 1800     		movs	r0, r3
 1933 0964 BD46     		mov	sp, r7
 1934 0966 03B0     		add	sp, sp, #12
 1935              		@ sp needed
 1936 0968 90BD     		pop	{r4, r7, pc}
 1937              	.L104:
 1938 096a C046     		.align	2
 1939              	.L103:
 1940 096c 00100240 		.word	1073876992
 1941 0970 14100240 		.word	1073877012
 1942 0974 00005555 		.word	1431633920
 1943              		.cfi_endproc
 1944              	.LFE24:
 1946              		.align	2
 1947              		.global	ascii_read_data
 1948              		.code	16
 1949              		.thumb_func
 1951              	ascii_read_data:
 1952              	.LFB25:
 345:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 346:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** unsigned char ascii_read_data(void){
 1953              		.loc 1 346 0
 1954              		.cfi_startproc
 1955              		@ args = 0, pretend = 0, frame = 8
 1956              		@ frame_needed = 1, uses_anonymous_args = 0
 1957 0978 90B5     		push	{r4, r7, lr}
 1958              		.cfi_def_cfa_offset 12
 1959              		.cfi_offset 4, -12
 1960              		.cfi_offset 7, -8
 1961              		.cfi_offset 14, -4
 1962 097a 83B0     		sub	sp, sp, #12
 1963              		.cfi_def_cfa_offset 24
 1964 097c 00AF     		add	r7, sp, #0
 1965              		.cfi_def_cfa_register 7
 347:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer=  (0x0000FFFF & *portModer); //sets port 15-8 to inputs
 1966              		.loc 1 347 0
 1967 097e 0F4B     		ldr	r3, .L107
 1968 0980 0E4A     		ldr	r2, .L107
 1969 0982 1268     		ldr	r2, [r2]
 1970 0984 1204     		lsls	r2, r2, #16
 1971 0986 120C     		lsrs	r2, r2, #16
 1972 0988 1A60     		str	r2, [r3]
 348:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW on
 1973              		.loc 1 348 0
 1974 098a 0D4A     		ldr	r2, .L107+4
 1975 098c 0C4B     		ldr	r3, .L107+4
 1976 098e 1B78     		ldrb	r3, [r3]
 1977 0990 DBB2     		uxtb	r3, r3
 1978 0992 0321     		movs	r1, #3
 1979 0994 0B43     		orrs	r3, r1
 1980 0996 DBB2     		uxtb	r3, r3
 1981 0998 1370     		strb	r3, [r2]
 349:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unsigned char rv = ascii_read_controller();
 1982              		.loc 1 349 0
 1983 099a FC1D     		adds	r4, r7, #7
 1984 099c FFF7FEFF 		bl	ascii_read_controller
 1985 09a0 0300     		movs	r3, r0
 1986 09a2 2370     		strb	r3, [r4]
 350:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer=(0x55550000 | *portModer); //sets port 15-8 to outputs
 1987              		.loc 1 350 0
 1988 09a4 054B     		ldr	r3, .L107
 1989 09a6 054A     		ldr	r2, .L107
 1990 09a8 1268     		ldr	r2, [r2]
 1991 09aa 0649     		ldr	r1, .L107+8
 1992 09ac 0A43     		orrs	r2, r1
 1993 09ae 1A60     		str	r2, [r3]
 351:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	return rv;
 1994              		.loc 1 351 0
 1995 09b0 FB1D     		adds	r3, r7, #7
 1996 09b2 1B78     		ldrb	r3, [r3]
 352:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 1997              		.loc 1 352 0
 1998 09b4 1800     		movs	r0, r3
 1999 09b6 BD46     		mov	sp, r7
 2000 09b8 03B0     		add	sp, sp, #12
 2001              		@ sp needed
 2002 09ba 90BD     		pop	{r4, r7, pc}
 2003              	.L108:
 2004              		.align	2
 2005              	.L107:
 2006 09bc 00100240 		.word	1073876992
 2007 09c0 14100240 		.word	1073877012
 2008 09c4 00005555 		.word	1431633920
 2009              		.cfi_endproc
 2010              	.LFE25:
 2012              		.align	2
 2013              		.global	ascii_command
 2014              		.code	16
 2015              		.thumb_func
 2017              	ascii_command:
 2018              	.LFB26:
 353:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 354:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void ascii_command(char cmd){
 2019              		.loc 1 354 0
 2020              		.cfi_startproc
 2021              		@ args = 0, pretend = 0, frame = 8
 2022              		@ frame_needed = 1, uses_anonymous_args = 0
 2023 09c8 80B5     		push	{r7, lr}
 2024              		.cfi_def_cfa_offset 8
 2025              		.cfi_offset 7, -8
 2026              		.cfi_offset 14, -4
 2027 09ca 82B0     		sub	sp, sp, #8
 2028              		.cfi_def_cfa_offset 16
 2029 09cc 00AF     		add	r7, sp, #0
 2030              		.cfi_def_cfa_register 7
 2031 09ce 0200     		movs	r2, r0
 2032 09d0 FB1D     		adds	r3, r7, #7
 2033 09d2 1A70     		strb	r2, [r3]
 355:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	while((ascii_read_status() & 0x80) == 0x80){//Ã€ndrade frÃ¥n "ascii_read_status() & 0x80)"
 2034              		.loc 1 355 0
 2035 09d4 C046     		nop
 2036              	.L110:
 2037              		.loc 1 355 0 is_stmt 0 discriminator 1
 2038 09d6 FFF7FEFF 		bl	ascii_read_status
 2039 09da 0300     		movs	r3, r0
 2040 09dc 5BB2     		sxtb	r3, r3
 2041 09de 002B     		cmp	r3, #0
 2042 09e0 F9DB     		blt	.L110
 356:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		}
 357:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_mikro(8);
 2043              		.loc 1 357 0 is_stmt 1
 2044 09e2 0820     		movs	r0, #8
 2045 09e4 FFF7FEFF 		bl	delay_mikro
 358:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		ascii_write_cmd(cmd);
 2046              		.loc 1 358 0
 2047 09e8 FB1D     		adds	r3, r7, #7
 2048 09ea 1B78     		ldrb	r3, [r3]
 2049 09ec 1800     		movs	r0, r3
 2050 09ee FFF7FEFF 		bl	ascii_write_cmd
 359:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		
 360:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		if(~((~cmd) & 0x03)){
 361:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			delay_milli(2);
 2051              		.loc 1 361 0
 2052 09f2 0220     		movs	r0, #2
 2053 09f4 FFF7FEFF 		bl	delay_milli
 362:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			}
 363:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		else{
 364:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			delay_mikro(40);
 365:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			}			
 366:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 2054              		.loc 1 366 0
 2055 09f8 C046     		nop
 2056 09fa BD46     		mov	sp, r7
 2057 09fc 02B0     		add	sp, sp, #8
 2058              		@ sp needed
 2059 09fe 80BD     		pop	{r7, pc}
 2060              		.cfi_endproc
 2061              	.LFE26:
 2063              		.align	2
 2064              		.global	ascii_gotoxy
 2065              		.code	16
 2066              		.thumb_func
 2068              	ascii_gotoxy:
 2069              	.LFB27:
 367:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 368:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 369:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 370:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void ascii_gotoxy(char row, char col){
 2070              		.loc 1 370 0
 2071              		.cfi_startproc
 2072              		@ args = 0, pretend = 0, frame = 16
 2073              		@ frame_needed = 1, uses_anonymous_args = 0
 2074 0a00 80B5     		push	{r7, lr}
 2075              		.cfi_def_cfa_offset 8
 2076              		.cfi_offset 7, -8
 2077              		.cfi_offset 14, -4
 2078 0a02 84B0     		sub	sp, sp, #16
 2079              		.cfi_def_cfa_offset 24
 2080 0a04 00AF     		add	r7, sp, #0
 2081              		.cfi_def_cfa_register 7
 2082 0a06 0200     		movs	r2, r0
 2083 0a08 FB1D     		adds	r3, r7, #7
 2084 0a0a 1A70     		strb	r2, [r3]
 2085 0a0c BB1D     		adds	r3, r7, #6
 2086 0a0e 0A1C     		adds	r2, r1, #0
 2087 0a10 1A70     		strb	r2, [r3]
 371:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		unsigned char adress= row-1;
 2088              		.loc 1 371 0
 2089 0a12 0F23     		movs	r3, #15
 2090 0a14 FB18     		adds	r3, r7, r3
 2091 0a16 FA1D     		adds	r2, r7, #7
 2092 0a18 1278     		ldrb	r2, [r2]
 2093 0a1a 013A     		subs	r2, r2, #1
 2094 0a1c 1A70     		strb	r2, [r3]
 372:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		switch (col){
 2095              		.loc 1 372 0
 2096 0a1e BB1D     		adds	r3, r7, #6
 2097 0a20 1B78     		ldrb	r3, [r3]
 2098 0a22 012B     		cmp	r3, #1
 2099 0a24 09D0     		beq	.L115
 2100 0a26 022B     		cmp	r3, #2
 2101 0a28 08D1     		bne	.L112
 373:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			case 1:
 374:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			break;
 375:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			case 2:
 376:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			adress = adress + 0x40;
 2102              		.loc 1 376 0
 2103 0a2a 0F23     		movs	r3, #15
 2104 0a2c FB18     		adds	r3, r7, r3
 2105 0a2e 0F22     		movs	r2, #15
 2106 0a30 BA18     		adds	r2, r7, r2
 2107 0a32 1278     		ldrb	r2, [r2]
 2108 0a34 4032     		adds	r2, r2, #64
 2109 0a36 1A70     		strb	r2, [r3]
 377:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			break;
 2110              		.loc 1 377 0
 2111 0a38 00E0     		b	.L112
 2112              	.L115:
 374:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 			case 2:
 2113              		.loc 1 374 0
 2114 0a3a C046     		nop
 2115              	.L112:
 378:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		}
 379:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		ascii_write_cmd(0x80|adress);
 2116              		.loc 1 379 0
 2117 0a3c 0F23     		movs	r3, #15
 2118 0a3e FB18     		adds	r3, r7, r3
 2119 0a40 1B78     		ldrb	r3, [r3]
 2120 0a42 8022     		movs	r2, #128
 2121 0a44 5242     		rsbs	r2, r2, #0
 2122 0a46 1343     		orrs	r3, r2
 2123 0a48 DBB2     		uxtb	r3, r3
 2124 0a4a 1800     		movs	r0, r3
 2125 0a4c FFF7FEFF 		bl	ascii_write_cmd
 380:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 2126              		.loc 1 380 0
 2127 0a50 C046     		nop
 2128 0a52 BD46     		mov	sp, r7
 2129 0a54 04B0     		add	sp, sp, #16
 2130              		@ sp needed
 2131 0a56 80BD     		pop	{r7, pc}
 2132              		.cfi_endproc
 2133              	.LFE27:
 2135              		.align	2
 2136              		.global	ascii_init
 2137              		.code	16
 2138              		.thumb_func
 2140              	ascii_init:
 2141              	.LFB28:
 381:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 382:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void ascii_init(void){
 2142              		.loc 1 382 0
 2143              		.cfi_startproc
 2144              		@ args = 0, pretend = 0, frame = 0
 2145              		@ frame_needed = 1, uses_anonymous_args = 0
 2146 0a58 80B5     		push	{r7, lr}
 2147              		.cfi_def_cfa_offset 8
 2148              		.cfi_offset 7, -8
 2149              		.cfi_offset 14, -4
 2150 0a5a 00AF     		add	r7, sp, #0
 2151              		.cfi_def_cfa_register 7
 383:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_milli(40); //ifall ifall
 2152              		.loc 1 383 0
 2153 0a5c 2820     		movs	r0, #40
 2154 0a5e FFF7FEFF 		bl	delay_milli
 384:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portOdrLow = 0x04;
 2155              		.loc 1 384 0
 2156 0a62 094B     		ldr	r3, .L117
 2157 0a64 0422     		movs	r2, #4
 2158 0a66 1A70     		strb	r2, [r3]
 385:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ascii_command(0x38);//sätter antal rader = 2, sätter storlek = 5x8
 2159              		.loc 1 385 0
 2160 0a68 3820     		movs	r0, #56
 2161 0a6a FFF7FEFF 		bl	ascii_command
 386:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ascii_command(1);			//clear display
 2162              		.loc 1 386 0
 2163 0a6e 0120     		movs	r0, #1
 2164 0a70 FFF7FEFF 		bl	ascii_command
 387:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ascii_command(0xe);//display på,markör,konstant
 2165              		.loc 1 387 0
 2166 0a74 0E20     		movs	r0, #14
 2167 0a76 FFF7FEFF 		bl	ascii_command
 388:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ascii_command(0x4);// Set entry mode
 2168              		.loc 1 388 0
 2169 0a7a 0420     		movs	r0, #4
 2170 0a7c FFF7FEFF 		bl	ascii_command
 389:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		
 390:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 2171              		.loc 1 390 0
 2172 0a80 C046     		nop
 2173 0a82 BD46     		mov	sp, r7
 2174              		@ sp needed
 2175 0a84 80BD     		pop	{r7, pc}
 2176              	.L118:
 2177 0a86 C046     		.align	2
 2178              	.L117:
 2179 0a88 14100240 		.word	1073877012
 2180              		.cfi_endproc
 2181              	.LFE28:
 2183              		.align	2
 2184              		.global	ascii_write_char
 2185              		.code	16
 2186              		.thumb_func
 2188              	ascii_write_char:
 2189              	.LFB29:
 391:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void ascii_write_char(char c){
 2190              		.loc 1 391 0
 2191              		.cfi_startproc
 2192              		@ args = 0, pretend = 0, frame = 8
 2193              		@ frame_needed = 1, uses_anonymous_args = 0
 2194 0a8c 80B5     		push	{r7, lr}
 2195              		.cfi_def_cfa_offset 8
 2196              		.cfi_offset 7, -8
 2197              		.cfi_offset 14, -4
 2198 0a8e 82B0     		sub	sp, sp, #8
 2199              		.cfi_def_cfa_offset 16
 2200 0a90 00AF     		add	r7, sp, #0
 2201              		.cfi_def_cfa_register 7
 2202 0a92 0200     		movs	r2, r0
 2203 0a94 FB1D     		adds	r3, r7, #7
 2204 0a96 1A70     		strb	r2, [r3]
 392:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	while((ascii_read_status() & 0x80) == 0x80){
 2205              		.loc 1 392 0
 2206 0a98 01E0     		b	.L120
 2207              	.L121:
 393:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_250ns();
 2208              		.loc 1 393 0
 2209 0a9a FFF7FEFF 		bl	delay_250ns
 2210              	.L120:
 392:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	while((ascii_read_status() & 0x80) == 0x80){
 2211              		.loc 1 392 0
 2212 0a9e FFF7FEFF 		bl	ascii_read_status
 2213 0aa2 0300     		movs	r3, r0
 2214 0aa4 5BB2     		sxtb	r3, r3
 2215 0aa6 002B     		cmp	r3, #0
 2216 0aa8 F7DB     		blt	.L121
 394:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		}
 395:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_mikro(8);
 2217              		.loc 1 395 0
 2218 0aaa 0820     		movs	r0, #8
 2219 0aac FFF7FEFF 		bl	delay_mikro
 396:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		ascii_write_data(c);
 2220              		.loc 1 396 0
 2221 0ab0 FB1D     		adds	r3, r7, #7
 2222 0ab2 1B78     		ldrb	r3, [r3]
 2223 0ab4 1800     		movs	r0, r3
 2224 0ab6 FFF7FEFF 		bl	ascii_write_data
 397:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 		delay_mikro(40);
 2225              		.loc 1 397 0
 2226 0aba 2820     		movs	r0, #40
 2227 0abc FFF7FEFF 		bl	delay_mikro
 398:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 2228              		.loc 1 398 0
 2229 0ac0 C046     		nop
 2230 0ac2 BD46     		mov	sp, r7
 2231 0ac4 02B0     		add	sp, sp, #8
 2232              		@ sp needed
 2233 0ac6 80BD     		pop	{r7, pc}
 2234              		.cfi_endproc
 2235              	.LFE29:
 2237              		.align	2
 2238              		.global	init_app
 2239              		.code	16
 2240              		.thumb_func
 2242              	init_app:
 2243              	.LFB30:
 399:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void init_app(void){
 2244              		.loc 1 399 0
 2245              		.cfi_startproc
 2246              		@ args = 0, pretend = 0, frame = 0
 2247              		@ frame_needed = 1, uses_anonymous_args = 0
 2248 0ac8 80B5     		push	{r7, lr}
 2249              		.cfi_def_cfa_offset 8
 2250              		.cfi_offset 7, -8
 2251              		.cfi_offset 14, -4
 2252 0aca 00AF     		add	r7, sp, #0
 2253              		.cfi_def_cfa_register 7
 400:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	*portModer  = 0x55555555;
 2254              		.loc 1 400 0
 2255 0acc 024B     		ldr	r3, .L123
 2256 0ace 034A     		ldr	r2, .L123+4
 2257 0ad0 1A60     		str	r2, [r3]
 401:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 2258              		.loc 1 401 0
 2259 0ad2 C046     		nop
 2260 0ad4 BD46     		mov	sp, r7
 2261              		@ sp needed
 2262 0ad6 80BD     		pop	{r7, pc}
 2263              	.L124:
 2264              		.align	2
 2265              	.L123:
 2266 0ad8 00100240 		.word	1073876992
 2267 0adc 55555555 		.word	1431655765
 2268              		.cfi_endproc
 2269              	.LFE30:
 2271              		.align	2
 2272              		.global	graphic_init
 2273              		.code	16
 2274              		.thumb_func
 2276              	graphic_init:
 2277              	.LFB31:
 402:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** void graphic_init(){
 2278              		.loc 1 402 0
 2279              		.cfi_startproc
 2280              		@ args = 0, pretend = 0, frame = 8
 2281              		@ frame_needed = 1, uses_anonymous_args = 0
 2282 0ae0 80B5     		push	{r7, lr}
 2283              		.cfi_def_cfa_offset 8
 2284              		.cfi_offset 7, -8
 2285              		.cfi_offset 14, -4
 2286 0ae2 82B0     		sub	sp, sp, #8
 2287              		.cfi_def_cfa_offset 16
 2288 0ae4 00AF     		add	r7, sp, #0
 2289              		.cfi_def_cfa_register 7
 403:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 404:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_set(B_E);
 2290              		.loc 1 404 0
 2291 0ae6 4020     		movs	r0, #64
 2292 0ae8 FFF7FEFF 		bl	graphic_ctrl_bit_set
 405:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_mikro(10);
 2293              		.loc 1 405 0
 2294 0aec 0A20     		movs	r0, #10
 2295 0aee FFF7FEFF 		bl	delay_mikro
 406:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 407:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 2296              		.loc 1 407 0
 2297 0af2 7820     		movs	r0, #120
 2298 0af4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 408:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_milli(30);
 2299              		.loc 1 408 0
 2300 0af8 1E20     		movs	r0, #30
 2301 0afa FFF7FEFF 		bl	delay_milli
 409:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_ctrl_bit_set(B_RST);
 2302              		.loc 1 409 0
 2303 0afe 2020     		movs	r0, #32
 2304 0b00 FFF7FEFF 		bl	graphic_ctrl_bit_set
 410:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	unit_8 d = 100;
 2305              		.loc 1 410 0
 2306 0b04 FB1D     		adds	r3, r7, #7
 2307 0b06 6422     		movs	r2, #100
 2308 0b08 1A70     		strb	r2, [r3]
 411:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	#ifdef SIMULATOR
 412:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	d = 10;
 2309              		.loc 1 412 0
 2310 0b0a FB1D     		adds	r3, r7, #7
 2311 0b0c 0A22     		movs	r2, #10
 2312 0b0e 1A70     		strb	r2, [r3]
 413:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	#endif
 414:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 415:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	delay_milli(d);
 2313              		.loc 1 415 0
 2314 0b10 FB1D     		adds	r3, r7, #7
 2315 0b12 1B78     		ldrb	r3, [r3]
 2316 0b14 1800     		movs	r0, r3
 2317 0b16 FFF7FEFF 		bl	delay_milli
 416:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 417:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_OFF,			B_CS1|B_CS2);//LCD off
 2318              		.loc 1 417 0
 2319 0b1a 1821     		movs	r1, #24
 2320 0b1c 3E20     		movs	r0, #62
 2321 0b1e FFF7FEFF 		bl	graphic_write_command
 418:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_ON,			B_CS1|B_CS2);//LCD on
 2322              		.loc 1 418 0
 2323 0b22 1821     		movs	r1, #24
 2324 0b24 3F20     		movs	r0, #63
 2325 0b26 FFF7FEFF 		bl	graphic_write_command
 419:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_disp_start,	B_CS1|B_CS2);//start=0
 2326              		.loc 1 419 0
 2327 0b2a 1821     		movs	r1, #24
 2328 0b2c C020     		movs	r0, #192
 2329 0b2e FFF7FEFF 		bl	graphic_write_command
 420:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_addr,		B_CS1|B_CS2);//startadress =0
 2330              		.loc 1 420 0
 2331 0b32 1821     		movs	r1, #24
 2332 0b34 4020     		movs	r0, #64
 2333 0b36 FFF7FEFF 		bl	graphic_write_command
 421:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_write_command(LCD_set_page,		B_CS1|B_CS2);//page = 0
 2334              		.loc 1 421 0
 2335 0b3a 1821     		movs	r1, #24
 2336 0b3c B820     		movs	r0, #184
 2337 0b3e FFF7FEFF 		bl	graphic_write_command
 422:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	select_controller(0x00);
 2338              		.loc 1 422 0
 2339 0b42 0020     		movs	r0, #0
 2340 0b44 FFF7FEFF 		bl	select_controller
 423:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 424:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	}
 2341              		.loc 1 424 0
 2342 0b48 C046     		nop
 2343 0b4a BD46     		mov	sp, r7
 2344 0b4c 02B0     		add	sp, sp, #8
 2345              		@ sp needed
 2346 0b4e 80BD     		pop	{r7, pc}
 2347              		.cfi_endproc
 2348              	.LFE31:
 2350              		.align	2
 2351              		.global	main
 2352              		.code	16
 2353              		.thumb_func
 2355              	main:
 2356              	.LFB32:
 425:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 426:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 
 427:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** int main(void){
 2357              		.loc 1 427 0
 2358              		.cfi_startproc
 2359              		@ args = 0, pretend = 0, frame = 0
 2360              		@ frame_needed = 1, uses_anonymous_args = 0
 2361 0b50 80B5     		push	{r7, lr}
 2362              		.cfi_def_cfa_offset 8
 2363              		.cfi_offset 7, -8
 2364              		.cfi_offset 14, -4
 2365 0b52 00AF     		add	r7, sp, #0
 2366              		.cfi_def_cfa_register 7
 428:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	init_app();
 2367              		.loc 1 428 0
 2368 0b54 FFF7FEFF 		bl	init_app
 429:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	graphic_init();
 2369              		.loc 1 429 0
 2370 0b58 FFF7FEFF 		bl	graphic_init
 430:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	ascii_init();
 2371              		.loc 1 430 0
 2372 0b5c FFF7FEFF 		bl	ascii_init
 431:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	
 432:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** 	return 0;
 2373              		.loc 1 432 0
 2374 0b60 0023     		movs	r3, #0
 433:/home/david/Documents/Codeliteshit/git/DanceDance/Dance/Dance/Dance_main.c **** }
 2375              		.loc 1 433 0
 2376 0b62 1800     		movs	r0, r3
 2377 0b64 BD46     		mov	sp, r7
 2378              		@ sp needed
 2379 0b66 80BD     		pop	{r7, pc}
 2380              		.cfi_endproc
 2381              	.LFE32:
 2383              	.Letext0:
