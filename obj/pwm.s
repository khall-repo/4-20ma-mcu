	.file	"pwm.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"/home/keith/git-repo/4-20ma-mcu/",100,0,2,.Ltext0
	.stabs	"src/pwm.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"int:t(0,1)=r(0,1);-32768;32767;",128,0,0,0
	.stabs	"char:t(0,2)=r(0,2);0;127;",128,0,0,0
	.stabs	"long int:t(0,3)=@s32;r(0,3);020000000000;017777777777;",128,0,0,0
	.stabs	"unsigned int:t(0,4)=r(0,4);0;0177777;",128,0,0,0
	.stabs	"long unsigned int:t(0,5)=@s32;r(0,5);0;037777777777;",128,0,0,0
	.stabs	"__int128:t(0,6)=@s128;r(0,6);02000000000000000000000000000000000000000000;01777777777777777777777777777777777777777777;",128,0,0,0
	.stabs	"__int128 unsigned:t(0,7)=@s128;r(0,7);0;03777777777777777777777777777777777777777777;",128,0,0,0
	.stabs	"long long int:t(0,8)=@s64;r(0,8);01000000000000000000000;00777777777777777777777;",128,0,0,0
	.stabs	"long long unsigned int:t(0,9)=@s64;r(0,9);0;01777777777777777777777;",128,0,0,0
	.stabs	"short int:t(0,10)=r(0,10);-32768;32767;",128,0,0,0
	.stabs	"short unsigned int:t(0,11)=r(0,11);0;0177777;",128,0,0,0
	.stabs	"signed char:t(0,12)=@s8;r(0,12);-128;127;",128,0,0,0
	.stabs	"unsigned char:t(0,13)=@s8;r(0,13);0;255;",128,0,0,0
	.stabs	"float:t(0,14)=r(0,1);4;0;",128,0,0,0
	.stabs	"double:t(0,15)=r(0,1);4;0;",128,0,0,0
	.stabs	"long double:t(0,16)=r(0,1);4;0;",128,0,0,0
	.stabs	"short _Fract:t(0,17)=r(0,1);1;0;",128,0,0,0
	.stabs	"_Fract:t(0,18)=r(0,1);2;0;",128,0,0,0
	.stabs	"long _Fract:t(0,19)=r(0,1);4;0;",128,0,0,0
	.stabs	"long long _Fract:t(0,20)=r(0,1);8;0;",128,0,0,0
	.stabs	"unsigned short _Fract:t(0,21)=r(0,1);1;0;",128,0,0,0
	.stabs	"unsigned _Fract:t(0,22)=r(0,1);2;0;",128,0,0,0
	.stabs	"unsigned long _Fract:t(0,23)=r(0,1);4;0;",128,0,0,0
	.stabs	"unsigned long long _Fract:t(0,24)=r(0,1);8;0;",128,0,0,0
	.stabs	"_Sat short _Fract:t(0,25)=r(0,1);1;0;",128,0,0,0
	.stabs	"_Sat _Fract:t(0,26)=r(0,1);2;0;",128,0,0,0
	.stabs	"_Sat long _Fract:t(0,27)=r(0,1);4;0;",128,0,0,0
	.stabs	"_Sat long long _Fract:t(0,28)=r(0,1);8;0;",128,0,0,0
	.stabs	"_Sat unsigned short _Fract:t(0,29)=r(0,1);1;0;",128,0,0,0
	.stabs	"_Sat unsigned _Fract:t(0,30)=r(0,1);2;0;",128,0,0,0
	.stabs	"_Sat unsigned long _Fract:t(0,31)=r(0,1);4;0;",128,0,0,0
	.stabs	"_Sat unsigned long long _Fract:t(0,32)=r(0,1);8;0;",128,0,0,0
	.stabs	"short _Accum:t(0,33)=r(0,1);2;0;",128,0,0,0
	.stabs	"_Accum:t(0,34)=r(0,1);4;0;",128,0,0,0
	.stabs	"long _Accum:t(0,35)=r(0,1);8;0;",128,0,0,0
	.stabs	"long long _Accum:t(0,36)=r(0,1);8;0;",128,0,0,0
	.stabs	"unsigned short _Accum:t(0,37)=r(0,1);2;0;",128,0,0,0
	.stabs	"unsigned _Accum:t(0,38)=r(0,1);4;0;",128,0,0,0
	.stabs	"unsigned long _Accum:t(0,39)=r(0,1);8;0;",128,0,0,0
	.stabs	"unsigned long long _Accum:t(0,40)=r(0,1);8;0;",128,0,0,0
	.stabs	"_Sat short _Accum:t(0,41)=r(0,1);2;0;",128,0,0,0
	.stabs	"_Sat _Accum:t(0,42)=r(0,1);4;0;",128,0,0,0
	.stabs	"_Sat long _Accum:t(0,43)=r(0,1);8;0;",128,0,0,0
	.stabs	"_Sat long long _Accum:t(0,44)=r(0,1);8;0;",128,0,0,0
	.stabs	"_Sat unsigned short _Accum:t(0,45)=r(0,1);2;0;",128,0,0,0
	.stabs	"_Sat unsigned _Accum:t(0,46)=r(0,1);4;0;",128,0,0,0
	.stabs	"_Sat unsigned long _Accum:t(0,47)=r(0,1);8;0;",128,0,0,0
	.stabs	"_Sat unsigned long long _Accum:t(0,48)=r(0,1);8;0;",128,0,0,0
	.stabs	"void:t(0,49)=(0,49)",128,0,0,0
	.stabs	"/usr/lib/avr/include/avr/io.h",130,0,0,0
	.stabs	"/usr/lib/avr/include/avr/sfr_defs.h",130,0,0,0
	.stabs	"/usr/lib/avr/include/inttypes.h",130,0,0,0
	.stabs	"/usr/lib/gcc/avr/5.4.0/include/stdint.h",130,0,0,0
	.stabs	"/usr/lib/avr/include/stdint.h",130,0,0,0
	.stabs	"int8_t:t(5,1)=(0,12)",128,0,125,0
	.stabs	"uint8_t:t(5,2)=(0,13)",128,0,126,0
	.stabs	"int16_t:t(5,3)=(0,1)",128,0,127,0
	.stabs	"uint16_t:t(5,4)=(0,4)",128,0,128,0
	.stabs	"int32_t:t(5,5)=(0,3)",128,0,129,0
	.stabs	"uint32_t:t(5,6)=(0,5)",128,0,130,0
	.stabs	"int64_t:t(5,7)=(0,8)",128,0,132,0
	.stabs	"uint64_t:t(5,8)=(0,9)",128,0,133,0
	.stabs	"intptr_t:t(5,9)=(5,3)",128,0,146,0
	.stabs	"uintptr_t:t(5,10)=(5,4)",128,0,151,0
	.stabs	"int_least8_t:t(5,11)=(5,1)",128,0,163,0
	.stabs	"uint_least8_t:t(5,12)=(5,2)",128,0,168,0
	.stabs	"int_least16_t:t(5,13)=(5,3)",128,0,173,0
	.stabs	"uint_least16_t:t(5,14)=(5,4)",128,0,178,0
	.stabs	"int_least32_t:t(5,15)=(5,5)",128,0,183,0
	.stabs	"uint_least32_t:t(5,16)=(5,6)",128,0,188,0
	.stabs	"int_least64_t:t(5,17)=(5,7)",128,0,196,0
	.stabs	"uint_least64_t:t(5,18)=(5,8)",128,0,203,0
	.stabs	"int_fast8_t:t(5,19)=(5,1)",128,0,217,0
	.stabs	"uint_fast8_t:t(5,20)=(5,2)",128,0,222,0
	.stabs	"int_fast16_t:t(5,21)=(5,3)",128,0,227,0
	.stabs	"uint_fast16_t:t(5,22)=(5,4)",128,0,232,0
	.stabs	"int_fast32_t:t(5,23)=(5,5)",128,0,237,0
	.stabs	"uint_fast32_t:t(5,24)=(5,6)",128,0,242,0
	.stabs	"int_fast64_t:t(5,25)=(5,7)",128,0,250,0
	.stabs	"uint_fast64_t:t(5,26)=(5,8)",128,0,257,0
	.stabs	"intmax_t:t(5,27)=(5,7)",128,0,277,0
	.stabs	"uintmax_t:t(5,28)=(5,8)",128,0,282,0
	.stabn	162,0,0,0
	.stabn	162,0,0,0
	.stabs	"int_farptr_t:t(3,1)=(5,5)",128,0,77,0
	.stabs	"uint_farptr_t:t(3,2)=(5,6)",128,0,81,0
	.stabn	162,0,0,0
	.stabn	162,0,0,0
	.stabs	"/usr/lib/avr/include/avr/fuse.h",130,0,0,0
	.stabs	"__fuse_t:t(6,1)=(6,2)=s3low:(0,13),0,8;high:(0,13),8,8;extended:(0,13),16,8;;",128,0,244,0
	.stabn	162,0,0,0
	.stabn	162,0,0,0
	.stabs	"init_pwm:F(0,49)",36,0,6,init_pwm
.global	init_pwm
	.type	init_pwm, @function
init_pwm:
	.stabd	46,0,0
	.stabn	68,0,7,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,8,.LM1-.LFBB1
.LM1:
	sbi 0x1a,6
	.stabn	68,0,9,.LM2-.LFBB1
.LM2:
	cbi 0x1b,6
	.stabn	68,0,14,.LM3-.LFBB1
.LM3:
	ldi r24,lo8(-125)
	out 0x2f,r24
	.stabn	68,0,16,.LM4-.LFBB1
.LM4:
	ldi r24,lo8(1)
	out 0x2e,r24
	.stabn	68,0,18,.LM5-.LFBB1
.LM5:
	out 0x22,__zero_reg__
	.stabn	68,0,21,.LM6-.LFBB1
.LM6:
	ldi r24,0
	ldi r25,lo8(2)
	out 0x2a+1,r25
	out 0x2a,r24
	ret
	.size	init_pwm, .-init_pwm
.Lscope1:
	.stabs	"",36,0,0,.Lscope1-.LFBB1
	.stabd	78,0,0
	.stabs	"set_pwm:F(0,49)",36,0,25,set_pwm
	.stabs	"duty:P(5,4)",64,0,25,24
.global	set_pwm
	.type	set_pwm, @function
set_pwm:
	.stabd	46,0,0
	.stabn	68,0,26,.LM7-.LFBB2
.LM7:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,27,.LM8-.LFBB2
.LM8:
	out 0x2a+1,r25
	out 0x2a,r24
	ret
	.size	set_pwm, .-set_pwm
.Lscope2:
	.stabs	"",36,0,0,.Lscope2-.LFBB2
	.stabd	78,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 5.4.0"
