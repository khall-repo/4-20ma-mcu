	.file	"bit-reverse.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"/home/keith/git-repo/4-20ma-mcu/",100,0,2,.Ltext0
	.stabs	"src/bit-reverse.c",100,0,2,.Ltext0
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
	.stabs	"inc/bit-reverse.h",130,0,0,0
	.stabs	"/usr/lib/gcc/avr/5.4.0/include/stdint.h",130,0,0,0
	.stabs	"/usr/lib/avr/include/stdint.h",130,0,0,0
	.stabs	"int8_t:t(3,1)=(0,12)",128,0,125,0
	.stabs	"uint8_t:t(3,2)=(0,13)",128,0,126,0
	.stabs	"int16_t:t(3,3)=(0,1)",128,0,127,0
	.stabs	"uint16_t:t(3,4)=(0,4)",128,0,128,0
	.stabs	"int32_t:t(3,5)=(0,3)",128,0,129,0
	.stabs	"uint32_t:t(3,6)=(0,5)",128,0,130,0
	.stabs	"int64_t:t(3,7)=(0,8)",128,0,132,0
	.stabs	"uint64_t:t(3,8)=(0,9)",128,0,133,0
	.stabs	"intptr_t:t(3,9)=(3,3)",128,0,146,0
	.stabs	"uintptr_t:t(3,10)=(3,4)",128,0,151,0
	.stabs	"int_least8_t:t(3,11)=(3,1)",128,0,163,0
	.stabs	"uint_least8_t:t(3,12)=(3,2)",128,0,168,0
	.stabs	"int_least16_t:t(3,13)=(3,3)",128,0,173,0
	.stabs	"uint_least16_t:t(3,14)=(3,4)",128,0,178,0
	.stabs	"int_least32_t:t(3,15)=(3,5)",128,0,183,0
	.stabs	"uint_least32_t:t(3,16)=(3,6)",128,0,188,0
	.stabs	"int_least64_t:t(3,17)=(3,7)",128,0,196,0
	.stabs	"uint_least64_t:t(3,18)=(3,8)",128,0,203,0
	.stabs	"int_fast8_t:t(3,19)=(3,1)",128,0,217,0
	.stabs	"uint_fast8_t:t(3,20)=(3,2)",128,0,222,0
	.stabs	"int_fast16_t:t(3,21)=(3,3)",128,0,227,0
	.stabs	"uint_fast16_t:t(3,22)=(3,4)",128,0,232,0
	.stabs	"int_fast32_t:t(3,23)=(3,5)",128,0,237,0
	.stabs	"uint_fast32_t:t(3,24)=(3,6)",128,0,242,0
	.stabs	"int_fast64_t:t(3,25)=(3,7)",128,0,250,0
	.stabs	"uint_fast64_t:t(3,26)=(3,8)",128,0,257,0
	.stabs	"intmax_t:t(3,27)=(3,7)",128,0,277,0
	.stabs	"uintmax_t:t(3,28)=(3,8)",128,0,282,0
	.stabn	162,0,0,0
	.stabn	162,0,0,0
	.stabn	162,0,0,0
	.stabs	"/usr/lib/avr/include/avr/pgmspace.h",130,0,0,0
	.stabs	"/usr/lib/avr/include/inttypes.h",130,0,0,0
	.stabs	"int_farptr_t:t(5,1)=(3,5)",128,0,77,0
	.stabs	"uint_farptr_t:t(5,2)=(3,6)",128,0,81,0
	.stabn	162,0,0,0
	.stabs	"/usr/lib/gcc/avr/5.4.0/include/stddef.h",130,0,0,0
	.stabs	"size_t:t(6,1)=(0,4)",128,0,216,0
	.stabn	162,0,0,0
	.stabs	"/usr/lib/avr/include/avr/io.h",130,0,0,0
	.stabs	"/usr/lib/avr/include/avr/fuse.h",130,0,0,0
	.stabs	"__fuse_t:t(8,1)=(8,2)=s3low:(0,13),0,8;high:(0,13),8,8;extended:(0,13),16,8;;",128,0,244,0
	.stabn	162,0,0,0
	.stabn	162,0,0,0
	.stabn	162,0,0,0
	.stabs	"bitReverse:F(3,2)",36,0,45,bitReverse
	.stabs	"x:P(3,2)",64,0,45,24
.global	bitReverse
	.type	bitReverse, @function
bitReverse:
	.stabd	46,0,0
	.stabn	68,0,46,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB2:
	.stabn	68,0,47,.LM1-.LFBB1
.LM1:
	mov r30,r24
	ldi r31,0
	subi r30,lo8(-(BitReverseTable256))
	sbci r31,hi8(-(BitReverseTable256))
/* #APP */
 ;  47 "src/bit-reverse.c" 1
	lpm r24, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE2:
	.stabn	68,0,48,.LM2-.LFBB1
.LM2:
	ret
	.size	bitReverse, .-bitReverse
.Lscope1:
	.stabs	"",36,0,0,.Lscope1-.LFBB1
	.stabd	78,0,0
	.section	.progmem.data,"a",@progbits
	.type	BitReverseTable256, @object
	.size	BitReverseTable256, 256
BitReverseTable256:
	.byte	0
	.byte	-128
	.byte	64
	.byte	-64
	.byte	32
	.byte	-96
	.byte	96
	.byte	-32
	.byte	16
	.byte	-112
	.byte	80
	.byte	-48
	.byte	48
	.byte	-80
	.byte	112
	.byte	-16
	.byte	8
	.byte	-120
	.byte	72
	.byte	-56
	.byte	40
	.byte	-88
	.byte	104
	.byte	-24
	.byte	24
	.byte	-104
	.byte	88
	.byte	-40
	.byte	56
	.byte	-72
	.byte	120
	.byte	-8
	.byte	4
	.byte	-124
	.byte	68
	.byte	-60
	.byte	36
	.byte	-92
	.byte	100
	.byte	-28
	.byte	20
	.byte	-108
	.byte	84
	.byte	-44
	.byte	52
	.byte	-76
	.byte	116
	.byte	-12
	.byte	12
	.byte	-116
	.byte	76
	.byte	-52
	.byte	44
	.byte	-84
	.byte	108
	.byte	-20
	.byte	28
	.byte	-100
	.byte	92
	.byte	-36
	.byte	60
	.byte	-68
	.byte	124
	.byte	-4
	.byte	2
	.byte	-126
	.byte	66
	.byte	-62
	.byte	34
	.byte	-94
	.byte	98
	.byte	-30
	.byte	18
	.byte	-110
	.byte	82
	.byte	-46
	.byte	50
	.byte	-78
	.byte	114
	.byte	-14
	.byte	10
	.byte	-118
	.byte	74
	.byte	-54
	.byte	42
	.byte	-86
	.byte	106
	.byte	-22
	.byte	26
	.byte	-102
	.byte	90
	.byte	-38
	.byte	58
	.byte	-70
	.byte	122
	.byte	-6
	.byte	6
	.byte	-122
	.byte	70
	.byte	-58
	.byte	38
	.byte	-90
	.byte	102
	.byte	-26
	.byte	22
	.byte	-106
	.byte	86
	.byte	-42
	.byte	54
	.byte	-74
	.byte	118
	.byte	-10
	.byte	14
	.byte	-114
	.byte	78
	.byte	-50
	.byte	46
	.byte	-82
	.byte	110
	.byte	-18
	.byte	30
	.byte	-98
	.byte	94
	.byte	-34
	.byte	62
	.byte	-66
	.byte	126
	.byte	-2
	.byte	1
	.byte	-127
	.byte	65
	.byte	-63
	.byte	33
	.byte	-95
	.byte	97
	.byte	-31
	.byte	17
	.byte	-111
	.byte	81
	.byte	-47
	.byte	49
	.byte	-79
	.byte	113
	.byte	-15
	.byte	9
	.byte	-119
	.byte	73
	.byte	-55
	.byte	41
	.byte	-87
	.byte	105
	.byte	-23
	.byte	25
	.byte	-103
	.byte	89
	.byte	-39
	.byte	57
	.byte	-71
	.byte	121
	.byte	-7
	.byte	5
	.byte	-123
	.byte	69
	.byte	-59
	.byte	37
	.byte	-91
	.byte	101
	.byte	-27
	.byte	21
	.byte	-107
	.byte	85
	.byte	-43
	.byte	53
	.byte	-75
	.byte	117
	.byte	-11
	.byte	13
	.byte	-115
	.byte	77
	.byte	-51
	.byte	45
	.byte	-83
	.byte	109
	.byte	-19
	.byte	29
	.byte	-99
	.byte	93
	.byte	-35
	.byte	61
	.byte	-67
	.byte	125
	.byte	-3
	.byte	3
	.byte	-125
	.byte	67
	.byte	-61
	.byte	35
	.byte	-93
	.byte	99
	.byte	-29
	.byte	19
	.byte	-109
	.byte	83
	.byte	-45
	.byte	51
	.byte	-77
	.byte	115
	.byte	-13
	.byte	11
	.byte	-117
	.byte	75
	.byte	-53
	.byte	43
	.byte	-85
	.byte	107
	.byte	-21
	.byte	27
	.byte	-101
	.byte	91
	.byte	-37
	.byte	59
	.byte	-69
	.byte	123
	.byte	-5
	.byte	7
	.byte	-121
	.byte	71
	.byte	-57
	.byte	39
	.byte	-89
	.byte	103
	.byte	-25
	.byte	23
	.byte	-105
	.byte	87
	.byte	-41
	.byte	55
	.byte	-73
	.byte	119
	.byte	-9
	.byte	15
	.byte	-113
	.byte	79
	.byte	-49
	.byte	47
	.byte	-81
	.byte	111
	.byte	-17
	.byte	31
	.byte	-97
	.byte	95
	.byte	-33
	.byte	63
	.byte	-65
	.byte	127
	.byte	-1
	.stabs	"BitReverseTable256:S(0,50)=ar(0,51)=r(0,51);0;0177777;;0;255;(0,52)=k(3,2)",38,0,25,BitReverseTable256
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 5.4.0"
