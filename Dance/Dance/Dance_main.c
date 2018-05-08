/*
 * 	Dance_main.c
 * A part of the DanceDAnce project
 *
 */
 
#define SIMULATOR 

#define GPIO_D 			0x40020C00 /* MD407 port D */
#define portModer_D 	((volatile unit_32*) (GPIO_D))
#define portOtyper_D 	((volatile unit_16*) (GPIO_D+0x4)) 
#define portIdr_D 		((volatile unit_16*) (GPIO_D+0x10)) 
#define portIdrLow_D 	((volatile unit_8 *) (GPIO_D+0x10))
#define portIdrHigh_D 	((volatile unit_8 *) (GPIO_D+0x10+1)) 
#define portOdrLow_D 	((volatile unit_8 *) (GPIO_D+0x14))
#define portOdrHigh_D 	((volatile unit_8 *) (GPIO_D+0x15))

#define GPIO_E 			0x40021000 /* MD407 port E */
#define portModer_E 	((volatile unit_32*) (GPIO_E))
#define portOtyper_E 	((volatile unit_16*) (GPIO_E+0x4)) 
#define portIdr_E 		((volatile unit_16*) (GPIO_E+0x10)) 
#define portIdrLow_E 	((volatile unit_8 *) (GPIO_E+0x10))
#define portIdrHigh_E 	((volatile unit_8 *) (GPIO_E+0x10+1)) 
#define portOdrLow_E 	((volatile unit_8 *) (GPIO_E+0x14))
#define portOdrHigh_E 	((volatile unit_8 *) (GPIO_E+0x15))

#define EXTI 		0x40013C00 
#define EXTI_IMR 	((volatile unit_32 *) (EXTI+0x00 ))
#define EXTI_EMR 	((volatile unit_32 *) (EXTI+0x04 ))
#define EXTI_RTSR 	((volatile unit_32 *) (EXTI+0x08 ))
#define EXTI_FTSR 	((volatile unit_32 *) (EXTI+0x0C ))
#define EXTI_SWIER 	((volatile unit_32 *) (EXTI+0x10 ))
#define EXTI_PR 	((volatile unit_32 *) (EXTI+0x14 ))

#define SYSCFG 								0x40013800
#define SYSCFG_MEMRMP 	((volatile unit_32 *) (SYSCFG 	   ))
#define SYSCFG_PMC	 	((volatile unit_32 *) (SYSCFG+0x04 ))
#define SYSCFG_EXTICR1 	((volatile unit_32 *) (SYSCFG+0x08 ))
#define SYSCFG_EXTICR2 	((volatile unit_32 *) (SYSCFG+0x0C ))
#define SYSCFG_EXTICR3 	((volatile unit_32 *) (SYSCFG+0x10 ))
#define SYSCFG_EXTICR4 	((volatile unit_32 *) (SYSCFG+0x14 ))

#define NVIC 									0xE000E100
#define NVIC_ISER0	 	((volatile unit_32 *) (NVIC+0x00 ))
#define NVIC_ISER1	 	((volatile unit_32 *) (NVIC+0x04 ))
#define NVIC_ISER2	 	((volatile unit_32 *) (NVIC+0x08 ))

#define NVIC_CER0	 	((volatile unit_32 *) (NVIC+0x80 ))
#define NVIC_CER1	 	((volatile unit_32 *) (NVIC+0x84 ))
#define NVIC_CER2	 	((volatile unit_32 *) (NVIC+0x88 ))

#define NVIC_ISPR0	 	((volatile unit_32 *) (NVIC+0x100 ))
#define NVIC_ISPR1	 	((volatile unit_32 *) (NVIC+0x104 ))
#define NVIC_ISPR2	 	((volatile unit_32 *) (NVIC+0x108 ))

#define NVIC_ICPR0	 	((volatile unit_32 *) (NVIC+0x180 ))
#define NVIC_ICPR1	 	((volatile unit_32 *) (NVIC+0x184 ))
#define NVIC_ICPR2	 	((volatile unit_32 *) (NVIC+0x188 ))

#define NVIC_IABR0	 	((volatile unit_32 *) (NVIC+0x200 ))
#define NVIC_IABR1	 	((volatile unit_32 *) (NVIC+0x204 ))
#define NVIC_IABR2	 	((volatile unit_32 *) (NVIC+0x208 ))

#define B_RS 	 0x01 
#define B_RW	 0x02
#define B_SELECT 0x04
#define B_CS1 	 0x08
#define B_CS2 	 0x10
#define B_RST 	 0x20
#define B_E 	 0x40

#define LCD_ON			0x3F
#define LCD_OFF			0x3E
#define LCD_set_addr	0x40
#define LCD_set_page	0xB8
#define LCD_disp_start	0xC0


	unsigned long STK_CTRL = 0xE000E010;
	unsigned long STK_LOAD = 0xE000E014;
	unsigned volatile long STK_VAL = 0xE000E018;
 
	typedef unsigned char  unit_8;
	typedef unsigned short unit_16;
	typedef unsigned long  unit_32;

 
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}


void delay_250ns(){
	
	
	*((unsigned long *)STK_CTRL) = 0x00;
	*((unsigned long *)STK_LOAD )=1;
	*((unsigned long *)STK_VAL )=0;
	*((unsigned long *)STK_CTRL) =5;
	while(*((unsigned long *)STK_CTRL) < 0x8){
	}
	*((unsigned long *)STK_CTRL) = 0;
}
void delay_500ns(){
	
	delay_250ns();
	delay_250ns();

}
void delay_mikro(unsigned int ms){
	for (unsigned int j = ms/4; j > 0 ; j--){
		delay_250ns();

	}

}
void delay_milli(unsigned int ms){
	
	
	#ifdef SIMULATOR
	ms=ms/1000;
	ms++;
	#endif
	for(unsigned int i= ms*500; i > 0; i--){
	delay_mikro(2);
	}
}



void graphic_ctrl_bit_set( unit_8 x ) { /* Funktion för att 1-ställa bitar */
unit_8 c;
c = *portOdrLow;
c &= ~B_SELECT;
c |= (~B_SELECT & x);
*portOdrLow = c;
}
void graphic_ctrl_bit_clear( unit_8 x ){
unit_8 c;
c =*portOdrLow;
c &=~B_SELECT;
c &=~x;
*portOdrLow=c;
} 

void select_controller(unit_8 s){
	switch(s){
	case B_CS1 :
		graphic_ctrl_bit_clear(B_CS2);
		graphic_ctrl_bit_set(B_CS1);
		break;
	case B_CS2 :
		graphic_ctrl_bit_clear(B_CS1);
		graphic_ctrl_bit_set(B_CS2);
		break;
	case B_CS1|B_CS2 :
		graphic_ctrl_bit_set(B_CS1|B_CS2);
		break;
	case 0:
		graphic_ctrl_bit_clear(B_CS1|B_CS2);
		break;
	}
}
void graphic_wait_ready(void){
	unit_8 c;
	graphic_ctrl_bit_clear(B_E);
	*portModer= (0x00005555); //sets port 15-8 to inputs and 7-0 to outputs
	*portOdrLow = ((*portOdrLow & ~0x01)| 0x02); //turns off RS and RW on
	delay_500ns();
	
	while(1){
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		c =*portIdrHigh & 0x80;
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
		if(c == 0){
			break;
		}
	}
	
	*portModer= (0x55555555); //sets port 15-8 to outputs
	
}

unit_8 graphic_read_controller( unit_8 controller ){
graphic_ctrl_bit_clear( B_E );
*portModer= (0x00005555);
*portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW
select_controller(controller);
delay_500ns();
graphic_ctrl_bit_set(B_E);
delay_500ns();
unit_8 rv = *portIdrHigh;
graphic_ctrl_bit_clear(B_E);
*portModer= (0x55555555);

	if(controller & B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if (controller & B_CS2){
		select_controller(B_CS2);
		graphic_wait_ready();
	}
return rv;
} 
unit_8 graphic_read_data(unit_8 controller){
	unit_8 rv;
	for(unit_8 i=0;i<2;i++){ //so that it executes it two times
							 //nessecary for some reason
	
graphic_ctrl_bit_clear( B_E );
*portModer= (0x00005555);
*portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW
select_controller(controller);
delay_500ns();
graphic_ctrl_bit_set(B_E);
delay_500ns();

rv = *portIdrHigh;
graphic_ctrl_bit_clear(B_E);
*portModer= (0x55555555);

	if(controller & B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if (controller & B_CS2){
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	
	}
return rv;
	
	}

void graphic_write(unit_8 value, unit_8 controller){ 
	
	*portOdrHigh = value;
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);
	
	select_controller(controller);
	graphic_wait_ready();

	*portOdrHigh=0x00;
	graphic_ctrl_bit_set(B_E);
	select_controller(0x00);
		
	}
void graphic_write_command(unit_8 cmd, unit_8 controller){
	
	graphic_ctrl_bit_clear(B_E);
	//select_controller(controller);
	*portOdrLow = (*portOdrLow & ~0x03); //turns off RS and RW
	graphic_write(cmd , controller);
	}
void graphic_write_data(unit_8 data, unit_8 controller){
	
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	*portOdrLow = ((*portOdrLow & ~0x02)| 0x01); //turns off RW and RS on
	graphic_write(data , controller);
	}

void graphic_clear_screen(){
	
	graphic_write_command(LCD_set_page,B_CS1|B_CS2);
	graphic_write_command(LCD_set_addr,B_CS1|B_CS2);
	for(unit_8 i=0;i<7;i++){
		graphic_write_command(LCD_set_page | i,B_CS1|B_CS2);
		for(unit_8 j=0;j<63;j++){
			graphic_write_command(LCD_set_addr | j,B_CS1|B_CS2);
			graphic_write_data(0,B_CS1|B_CS2);
		}
	}
}
void lcd_set_data(unit_8 page,unit_8 adress,unit_8 data){
	unit_8 cs = B_CS1;
	if(adress>64){
		cs= B_CS2;
	}
	graphic_write_command(LCD_set_addr|(adress % 64),cs);
	graphic_write_command(LCD_set_page|page,cs);
	graphic_write_data(data,cs);
	}
unit_8 lcd_read_data(unit_8 page,unit_8 adress){
	unit_8 cs = B_CS1;
	if(adress>64){
		cs= B_CS2;
	}
	graphic_write_command(LCD_set_addr|(adress % 64),cs);
	graphic_write_command(LCD_set_page|page,cs);
	return graphic_read_data(cs);
	}


void pixel(unit_8 x,unit_8 y, unit_8 set){
	if((x<1)||(y<1)||(x>128)||(y>64)) return;
	unit_8 mask, controller,c;
	int index;
	index = (y-1)/8;
	mask = 1 << ((y-1)%8);
	if(set == 0){ mask = ~mask;
	}
	
	if(x >64){
		controller =B_CS2;
		x =x-65;
	} else {
		controller =B_CS1;
		x =x-1;
	}
	graphic_write_command(LCD_set_addr |x,controller );
	graphic_write_command(LCD_set_page |index,controller );

	c =graphic_read_data(controller);
	graphic_write_command(LCD_set_addr |x,controller);
	if(set){mask = mask | c;
	}
	else   {mask = mask & c;
	}
	
	graphic_write_data(mask,controller);
}


void ascii_ctrl_bit_set( unsigned char x ) { /* Funktion fÃ¶r att 1-stÃ€lla bitar */
unsigned char c;
c = *portOdrLow;
c |= ( B_SELECT | x );
*portOdrLow = c;
}

void ascii_ctrl_bit_clear( unsigned char x ){
unsigned char c;
c = *portOdrLow;
c = B_SELECT | ( c & ~x );
*portOdrLow = c;
} 

void ascii_write_controller( unsigned char c ){
ascii_ctrl_bit_set( B_E );
*portOdrHigh = c;
delay_250ns();
ascii_ctrl_bit_clear( B_E );
}

void ascii_write_cmd(char command){
	*portOdrLow = (*portOdrLow & ~0x03); //turns off RS and RW
	ascii_write_controller(command);
}

void ascii_write_data(char command){
	*portOdrLow = ((*portOdrLow & ~0x02)| 0x01); //turns off RW and RS on
 	ascii_write_controller(command);
}

unsigned char ascii_read_controller( void ){
ascii_ctrl_bit_set( B_E );
delay_250ns(); /* max 360 ns */
delay_250ns();
unsigned char rv = *portIdrHigh;
ascii_ctrl_bit_clear( B_E );
return rv;
} 

unsigned char ascii_read_status(void){
	*portModer= (0x0000FFFF & *portModer); //sets port 15-8 to inputs
	*portOdrLow = ((*portOdrLow & ~0x01)| 0x02); //turns off RS and RW on
	unsigned char rv = ascii_read_controller();
	*portModer= (0x55550000 | *portModer); //sets port 15-8 to outputs
	return rv;
}	

unsigned char ascii_read_data(void){
	*portModer=  (0x0000FFFF & *portModer); //sets port 15-8 to inputs
	*portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW on
	unsigned char rv = ascii_read_controller();
	*portModer=(0x55550000 | *portModer); //sets port 15-8 to outputs
	return rv;
}
	
void ascii_command(char cmd){
	while((ascii_read_status() & 0x80) == 0x80){//Ã€ndrade frÃ¥n "ascii_read_status() & 0x80)"
		}
		delay_mikro(8);
		ascii_write_cmd(cmd);
		
		if(~((~cmd) & 0x03)){
			delay_milli(2);
			}
		else{
			delay_mikro(40);
			}			
}



void ascii_gotoxy(char row, char col){
		unsigned char adress= row-1;
		switch (col){
			case 1:
			break;
			case 2:
			adress = adress + 0x40;
			break;
		}
		ascii_write_cmd(0x80|adress);
}

void ascii_init(void){
	delay_milli(40); //ifall ifall
	*portOdrLow = 0x04;
	ascii_command(0x38);//sätter antal rader = 2, sätter storlek = 5x8
	ascii_command(1);			//clear display
	ascii_command(0xe);//display på,markör,konstant
	ascii_command(0x4);// Set entry mode
		
}
void ascii_write_char(char c){
	while((ascii_read_status() & 0x80) == 0x80){
		delay_250ns();
		}
		delay_mikro(8);
		ascii_write_data(c);
		delay_mikro(40);
}
void init_app(void){
	*portModer  = 0x55555555;
}
void graphic_init(){

	graphic_ctrl_bit_set(B_E);
	delay_mikro(10);
	
	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RST);
	unit_8 d = 100;
	#ifdef SIMULATOR
	d = 10;
	#endif
	
	delay_milli(d);
	
	graphic_write_command(LCD_OFF,			B_CS1|B_CS2);//LCD off
	graphic_write_command(LCD_ON,			B_CS1|B_CS2);//LCD on
	graphic_write_command(LCD_disp_start,	B_CS1|B_CS2);//start=0
	graphic_write_command(LCD_set_addr,		B_CS1|B_CS2);//startadress =0
	graphic_write_command(LCD_set_page,		B_CS1|B_CS2);//page = 0
	select_controller(0x00);
	
	}


int main(void){
	init_app();
	graphic_init();
	ascii_init();
	delay_milli(10);
	//start of program
	
	
	
	return 0;
}

