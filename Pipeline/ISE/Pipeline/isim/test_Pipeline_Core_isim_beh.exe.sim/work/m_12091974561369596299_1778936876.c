/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/sean/Dropbox/CPU/CPU/ALU/SHIFT.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {3U, 0U};
static int ng4[] = {16, 0};
static int ng5[] = {8, 0};
static int ng6[] = {4, 0};
static int ng7[] = {2, 0};
static int ng8[] = {1, 0};



static void Cont_33_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t25[8];
    char t26[8];
    char t29[8];
    char t56[8];
    char t58[8];
    char t72[8];
    char t73[8];
    char t76[8];
    char t103[8];
    char t104[8];
    char t119[8];
    char t120[8];
    char t123[8];
    char t150[8];
    char t151[8];
    char t161[8];
    char t165[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t57;
    char *t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t74;
    char *t75;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t105;
    char *t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    char *t121;
    char *t122;
    char *t124;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    char *t152;
    char *t153;
    char *t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    char *t162;
    char *t163;
    char *t164;
    char *t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    char *t177;
    char *t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    char *t183;
    char *t184;
    char *t185;
    char *t186;
    char *t187;
    char *t188;

LAB0:    t1 = (t0 + 4024U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1592U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 4);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 4);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    memset(t4, 0, 8);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t14) != 0)
        goto LAB6;

LAB7:    t21 = (t4 + 4);
    t22 = *((unsigned int *)t4);
    t23 = *((unsigned int *)t21);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB8;

LAB9:    t179 = *((unsigned int *)t4);
    t180 = (~(t179));
    t181 = *((unsigned int *)t21);
    t182 = (t180 || t181);
    if (t182 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t21) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t183, 8);

LAB16:    t177 = (t0 + 5744);
    t184 = (t177 + 56U);
    t185 = *((char **)t184);
    t186 = (t185 + 56U);
    t187 = *((char **)t186);
    memcpy(t187, t3, 8);
    xsi_driver_vfirst_trans(t177, 0, 31);
    t188 = (t0 + 5584);
    *((int *)t188) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB7;

LAB8:    t27 = (t0 + 1912U);
    t28 = *((char **)t27);
    t27 = ((char*)((ng1)));
    memset(t29, 0, 8);
    t30 = (t28 + 4);
    t31 = (t27 + 4);
    t32 = *((unsigned int *)t28);
    t33 = *((unsigned int *)t27);
    t34 = (t32 ^ t33);
    t35 = *((unsigned int *)t30);
    t36 = *((unsigned int *)t31);
    t37 = (t35 ^ t36);
    t38 = (t34 | t37);
    t39 = *((unsigned int *)t30);
    t40 = *((unsigned int *)t31);
    t41 = (t39 | t40);
    t42 = (~(t41));
    t43 = (t38 & t42);
    if (t43 != 0)
        goto LAB20;

LAB17:    if (t41 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t29) = 1;

LAB20:    memset(t26, 0, 8);
    t45 = (t29 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t29);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t45) != 0)
        goto LAB23;

LAB24:    t52 = (t26 + 4);
    t53 = *((unsigned int *)t26);
    t54 = *((unsigned int *)t52);
    t55 = (t53 || t54);
    if (t55 > 0)
        goto LAB25;

LAB26:    t68 = *((unsigned int *)t26);
    t69 = (~(t68));
    t70 = *((unsigned int *)t52);
    t71 = (t69 || t70);
    if (t71 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t52) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t26) > 0)
        goto LAB31;

LAB32:    memcpy(t25, t72, 8);

LAB33:    goto LAB9;

LAB10:    t177 = (t0 + 1752U);
    t183 = *((char **)t177);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t25, 32, t183, 32);
    goto LAB16;

LAB14:    memcpy(t3, t25, 8);
    goto LAB16;

LAB19:    t44 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t26) = 1;
    goto LAB24;

LAB23:    t51 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB24;

LAB25:    t57 = ((char*)((ng1)));
    t59 = (t0 + 1752U);
    t60 = *((char **)t59);
    memset(t58, 0, 8);
    t59 = (t58 + 4);
    t61 = (t60 + 4);
    t62 = *((unsigned int *)t60);
    t63 = (t62 >> 0);
    *((unsigned int *)t58) = t63;
    t64 = *((unsigned int *)t61);
    t65 = (t64 >> 0);
    *((unsigned int *)t59) = t65;
    t66 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t66 & 65535U);
    t67 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t67 & 65535U);
    xsi_vlogtype_concat(t56, 32, 32, 2U, t58, 16, t57, 16);
    goto LAB26;

LAB27:    t74 = (t0 + 1912U);
    t75 = *((char **)t74);
    t74 = ((char*)((ng2)));
    memset(t76, 0, 8);
    t77 = (t75 + 4);
    t78 = (t74 + 4);
    t79 = *((unsigned int *)t75);
    t80 = *((unsigned int *)t74);
    t81 = (t79 ^ t80);
    t82 = *((unsigned int *)t77);
    t83 = *((unsigned int *)t78);
    t84 = (t82 ^ t83);
    t85 = (t81 | t84);
    t86 = *((unsigned int *)t77);
    t87 = *((unsigned int *)t78);
    t88 = (t86 | t87);
    t89 = (~(t88));
    t90 = (t85 & t89);
    if (t90 != 0)
        goto LAB37;

LAB34:    if (t88 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t76) = 1;

LAB37:    memset(t73, 0, 8);
    t92 = (t76 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t76);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t92) != 0)
        goto LAB40;

LAB41:    t99 = (t73 + 4);
    t100 = *((unsigned int *)t73);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB42;

LAB43:    t115 = *((unsigned int *)t73);
    t116 = (~(t115));
    t117 = *((unsigned int *)t99);
    t118 = (t116 || t117);
    if (t118 > 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t99) > 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t73) > 0)
        goto LAB48;

LAB49:    memcpy(t72, t119, 8);

LAB50:    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t25, 32, t56, 32, t72, 32);
    goto LAB33;

LAB31:    memcpy(t25, t56, 8);
    goto LAB33;

LAB36:    t91 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB37;

LAB38:    *((unsigned int *)t73) = 1;
    goto LAB41;

LAB40:    t98 = (t73 + 4);
    *((unsigned int *)t73) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB41;

LAB42:    t105 = (t0 + 1752U);
    t106 = *((char **)t105);
    memset(t104, 0, 8);
    t105 = (t104 + 4);
    t107 = (t106 + 4);
    t108 = *((unsigned int *)t106);
    t109 = (t108 >> 16);
    *((unsigned int *)t104) = t109;
    t110 = *((unsigned int *)t107);
    t111 = (t110 >> 16);
    *((unsigned int *)t105) = t111;
    t112 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t112 & 65535U);
    t113 = *((unsigned int *)t105);
    *((unsigned int *)t105) = (t113 & 65535U);
    t114 = ((char*)((ng1)));
    xsi_vlogtype_concat(t103, 32, 32, 2U, t114, 16, t104, 16);
    goto LAB43;

LAB44:    t121 = (t0 + 1912U);
    t122 = *((char **)t121);
    t121 = ((char*)((ng3)));
    memset(t123, 0, 8);
    t124 = (t122 + 4);
    t125 = (t121 + 4);
    t126 = *((unsigned int *)t122);
    t127 = *((unsigned int *)t121);
    t128 = (t126 ^ t127);
    t129 = *((unsigned int *)t124);
    t130 = *((unsigned int *)t125);
    t131 = (t129 ^ t130);
    t132 = (t128 | t131);
    t133 = *((unsigned int *)t124);
    t134 = *((unsigned int *)t125);
    t135 = (t133 | t134);
    t136 = (~(t135));
    t137 = (t132 & t136);
    if (t137 != 0)
        goto LAB54;

LAB51:    if (t135 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t123) = 1;

LAB54:    memset(t120, 0, 8);
    t139 = (t123 + 4);
    t140 = *((unsigned int *)t139);
    t141 = (~(t140));
    t142 = *((unsigned int *)t123);
    t143 = (t142 & t141);
    t144 = (t143 & 1U);
    if (t144 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t139) != 0)
        goto LAB57;

LAB58:    t146 = (t120 + 4);
    t147 = *((unsigned int *)t120);
    t148 = *((unsigned int *)t146);
    t149 = (t147 || t148);
    if (t149 > 0)
        goto LAB59;

LAB60:    t173 = *((unsigned int *)t120);
    t174 = (~(t173));
    t175 = *((unsigned int *)t146);
    t176 = (t174 || t175);
    if (t176 > 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t146) > 0)
        goto LAB63;

LAB64:    if (*((unsigned int *)t120) > 0)
        goto LAB65;

LAB66:    memcpy(t119, t178, 8);

LAB67:    goto LAB45;

LAB46:    xsi_vlog_unsigned_bit_combine(t72, 32, t103, 32, t119, 32);
    goto LAB50;

LAB48:    memcpy(t72, t103, 8);
    goto LAB50;

LAB53:    t138 = (t123 + 4);
    *((unsigned int *)t123) = 1;
    *((unsigned int *)t138) = 1;
    goto LAB54;

LAB55:    *((unsigned int *)t120) = 1;
    goto LAB58;

LAB57:    t145 = (t120 + 4);
    *((unsigned int *)t120) = 1;
    *((unsigned int *)t145) = 1;
    goto LAB58;

LAB59:    t152 = (t0 + 1752U);
    t153 = *((char **)t152);
    memset(t151, 0, 8);
    t152 = (t151 + 4);
    t154 = (t153 + 4);
    t155 = *((unsigned int *)t153);
    t156 = (t155 >> 16);
    *((unsigned int *)t151) = t156;
    t157 = *((unsigned int *)t154);
    t158 = (t157 >> 16);
    *((unsigned int *)t152) = t158;
    t159 = *((unsigned int *)t151);
    *((unsigned int *)t151) = (t159 & 65535U);
    t160 = *((unsigned int *)t152);
    *((unsigned int *)t152) = (t160 & 65535U);
    t162 = ((char*)((ng4)));
    t163 = (t0 + 1752U);
    t164 = *((char **)t163);
    memset(t165, 0, 8);
    t163 = (t165 + 4);
    t166 = (t164 + 4);
    t167 = *((unsigned int *)t164);
    t168 = (t167 >> 31);
    t169 = (t168 & 1);
    *((unsigned int *)t165) = t169;
    t170 = *((unsigned int *)t166);
    t171 = (t170 >> 31);
    t172 = (t171 & 1);
    *((unsigned int *)t163) = t172;
    xsi_vlog_mul_concat(t161, 16, 1, t162, 1U, t165, 1);
    xsi_vlogtype_concat(t150, 32, 32, 2U, t161, 16, t151, 16);
    goto LAB60;

LAB61:    t177 = (t0 + 880);
    t178 = *((char **)t177);
    goto LAB62;

LAB63:    xsi_vlog_unsigned_bit_combine(t119, 32, t150, 32, t178, 32);
    goto LAB67;

LAB65:    memcpy(t119, t150, 8);
    goto LAB67;

}

static void Cont_42_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t25[8];
    char t26[8];
    char t29[8];
    char t56[8];
    char t58[8];
    char t72[8];
    char t73[8];
    char t76[8];
    char t103[8];
    char t104[8];
    char t119[8];
    char t120[8];
    char t123[8];
    char t150[8];
    char t151[8];
    char t161[8];
    char t165[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t57;
    char *t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t74;
    char *t75;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t105;
    char *t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    char *t121;
    char *t122;
    char *t124;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    char *t152;
    char *t153;
    char *t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    char *t162;
    char *t163;
    char *t164;
    char *t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    char *t177;
    char *t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    char *t183;
    char *t184;
    char *t185;
    char *t186;
    char *t187;
    char *t188;

LAB0:    t1 = (t0 + 4272U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1592U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 3);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 3);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    memset(t4, 0, 8);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t14) != 0)
        goto LAB6;

LAB7:    t21 = (t4 + 4);
    t22 = *((unsigned int *)t4);
    t23 = *((unsigned int *)t21);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB8;

LAB9:    t179 = *((unsigned int *)t4);
    t180 = (~(t179));
    t181 = *((unsigned int *)t21);
    t182 = (t180 || t181);
    if (t182 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t21) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t183, 8);

LAB16:    t177 = (t0 + 5808);
    t184 = (t177 + 56U);
    t185 = *((char **)t184);
    t186 = (t185 + 56U);
    t187 = *((char **)t186);
    memcpy(t187, t3, 8);
    xsi_driver_vfirst_trans(t177, 0, 31);
    t188 = (t0 + 5600);
    *((int *)t188) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB7;

LAB8:    t27 = (t0 + 1912U);
    t28 = *((char **)t27);
    t27 = ((char*)((ng1)));
    memset(t29, 0, 8);
    t30 = (t28 + 4);
    t31 = (t27 + 4);
    t32 = *((unsigned int *)t28);
    t33 = *((unsigned int *)t27);
    t34 = (t32 ^ t33);
    t35 = *((unsigned int *)t30);
    t36 = *((unsigned int *)t31);
    t37 = (t35 ^ t36);
    t38 = (t34 | t37);
    t39 = *((unsigned int *)t30);
    t40 = *((unsigned int *)t31);
    t41 = (t39 | t40);
    t42 = (~(t41));
    t43 = (t38 & t42);
    if (t43 != 0)
        goto LAB20;

LAB17:    if (t41 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t29) = 1;

LAB20:    memset(t26, 0, 8);
    t45 = (t29 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t29);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t45) != 0)
        goto LAB23;

LAB24:    t52 = (t26 + 4);
    t53 = *((unsigned int *)t26);
    t54 = *((unsigned int *)t52);
    t55 = (t53 || t54);
    if (t55 > 0)
        goto LAB25;

LAB26:    t68 = *((unsigned int *)t26);
    t69 = (~(t68));
    t70 = *((unsigned int *)t52);
    t71 = (t69 || t70);
    if (t71 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t52) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t26) > 0)
        goto LAB31;

LAB32:    memcpy(t25, t72, 8);

LAB33:    goto LAB9;

LAB10:    t177 = (t0 + 2232U);
    t183 = *((char **)t177);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t25, 32, t183, 32);
    goto LAB16;

LAB14:    memcpy(t3, t25, 8);
    goto LAB16;

LAB19:    t44 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t26) = 1;
    goto LAB24;

LAB23:    t51 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB24;

LAB25:    t57 = ((char*)((ng1)));
    t59 = (t0 + 2232U);
    t60 = *((char **)t59);
    memset(t58, 0, 8);
    t59 = (t58 + 4);
    t61 = (t60 + 4);
    t62 = *((unsigned int *)t60);
    t63 = (t62 >> 0);
    *((unsigned int *)t58) = t63;
    t64 = *((unsigned int *)t61);
    t65 = (t64 >> 0);
    *((unsigned int *)t59) = t65;
    t66 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t66 & 16777215U);
    t67 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t67 & 16777215U);
    xsi_vlogtype_concat(t56, 32, 32, 2U, t58, 24, t57, 8);
    goto LAB26;

LAB27:    t74 = (t0 + 1912U);
    t75 = *((char **)t74);
    t74 = ((char*)((ng2)));
    memset(t76, 0, 8);
    t77 = (t75 + 4);
    t78 = (t74 + 4);
    t79 = *((unsigned int *)t75);
    t80 = *((unsigned int *)t74);
    t81 = (t79 ^ t80);
    t82 = *((unsigned int *)t77);
    t83 = *((unsigned int *)t78);
    t84 = (t82 ^ t83);
    t85 = (t81 | t84);
    t86 = *((unsigned int *)t77);
    t87 = *((unsigned int *)t78);
    t88 = (t86 | t87);
    t89 = (~(t88));
    t90 = (t85 & t89);
    if (t90 != 0)
        goto LAB37;

LAB34:    if (t88 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t76) = 1;

LAB37:    memset(t73, 0, 8);
    t92 = (t76 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t76);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t92) != 0)
        goto LAB40;

LAB41:    t99 = (t73 + 4);
    t100 = *((unsigned int *)t73);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB42;

LAB43:    t115 = *((unsigned int *)t73);
    t116 = (~(t115));
    t117 = *((unsigned int *)t99);
    t118 = (t116 || t117);
    if (t118 > 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t99) > 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t73) > 0)
        goto LAB48;

LAB49:    memcpy(t72, t119, 8);

LAB50:    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t25, 32, t56, 32, t72, 32);
    goto LAB33;

LAB31:    memcpy(t25, t56, 8);
    goto LAB33;

LAB36:    t91 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB37;

LAB38:    *((unsigned int *)t73) = 1;
    goto LAB41;

LAB40:    t98 = (t73 + 4);
    *((unsigned int *)t73) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB41;

LAB42:    t105 = (t0 + 2232U);
    t106 = *((char **)t105);
    memset(t104, 0, 8);
    t105 = (t104 + 4);
    t107 = (t106 + 4);
    t108 = *((unsigned int *)t106);
    t109 = (t108 >> 8);
    *((unsigned int *)t104) = t109;
    t110 = *((unsigned int *)t107);
    t111 = (t110 >> 8);
    *((unsigned int *)t105) = t111;
    t112 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t112 & 16777215U);
    t113 = *((unsigned int *)t105);
    *((unsigned int *)t105) = (t113 & 16777215U);
    t114 = ((char*)((ng1)));
    xsi_vlogtype_concat(t103, 32, 32, 2U, t114, 8, t104, 24);
    goto LAB43;

LAB44:    t121 = (t0 + 1912U);
    t122 = *((char **)t121);
    t121 = ((char*)((ng3)));
    memset(t123, 0, 8);
    t124 = (t122 + 4);
    t125 = (t121 + 4);
    t126 = *((unsigned int *)t122);
    t127 = *((unsigned int *)t121);
    t128 = (t126 ^ t127);
    t129 = *((unsigned int *)t124);
    t130 = *((unsigned int *)t125);
    t131 = (t129 ^ t130);
    t132 = (t128 | t131);
    t133 = *((unsigned int *)t124);
    t134 = *((unsigned int *)t125);
    t135 = (t133 | t134);
    t136 = (~(t135));
    t137 = (t132 & t136);
    if (t137 != 0)
        goto LAB54;

LAB51:    if (t135 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t123) = 1;

LAB54:    memset(t120, 0, 8);
    t139 = (t123 + 4);
    t140 = *((unsigned int *)t139);
    t141 = (~(t140));
    t142 = *((unsigned int *)t123);
    t143 = (t142 & t141);
    t144 = (t143 & 1U);
    if (t144 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t139) != 0)
        goto LAB57;

LAB58:    t146 = (t120 + 4);
    t147 = *((unsigned int *)t120);
    t148 = *((unsigned int *)t146);
    t149 = (t147 || t148);
    if (t149 > 0)
        goto LAB59;

LAB60:    t173 = *((unsigned int *)t120);
    t174 = (~(t173));
    t175 = *((unsigned int *)t146);
    t176 = (t174 || t175);
    if (t176 > 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t146) > 0)
        goto LAB63;

LAB64:    if (*((unsigned int *)t120) > 0)
        goto LAB65;

LAB66:    memcpy(t119, t178, 8);

LAB67:    goto LAB45;

LAB46:    xsi_vlog_unsigned_bit_combine(t72, 32, t103, 32, t119, 32);
    goto LAB50;

LAB48:    memcpy(t72, t103, 8);
    goto LAB50;

LAB53:    t138 = (t123 + 4);
    *((unsigned int *)t123) = 1;
    *((unsigned int *)t138) = 1;
    goto LAB54;

LAB55:    *((unsigned int *)t120) = 1;
    goto LAB58;

LAB57:    t145 = (t120 + 4);
    *((unsigned int *)t120) = 1;
    *((unsigned int *)t145) = 1;
    goto LAB58;

LAB59:    t152 = (t0 + 2232U);
    t153 = *((char **)t152);
    memset(t151, 0, 8);
    t152 = (t151 + 4);
    t154 = (t153 + 4);
    t155 = *((unsigned int *)t153);
    t156 = (t155 >> 8);
    *((unsigned int *)t151) = t156;
    t157 = *((unsigned int *)t154);
    t158 = (t157 >> 8);
    *((unsigned int *)t152) = t158;
    t159 = *((unsigned int *)t151);
    *((unsigned int *)t151) = (t159 & 16777215U);
    t160 = *((unsigned int *)t152);
    *((unsigned int *)t152) = (t160 & 16777215U);
    t162 = ((char*)((ng5)));
    t163 = (t0 + 2232U);
    t164 = *((char **)t163);
    memset(t165, 0, 8);
    t163 = (t165 + 4);
    t166 = (t164 + 4);
    t167 = *((unsigned int *)t164);
    t168 = (t167 >> 31);
    t169 = (t168 & 1);
    *((unsigned int *)t165) = t169;
    t170 = *((unsigned int *)t166);
    t171 = (t170 >> 31);
    t172 = (t171 & 1);
    *((unsigned int *)t163) = t172;
    xsi_vlog_mul_concat(t161, 8, 1, t162, 1U, t165, 1);
    xsi_vlogtype_concat(t150, 32, 32, 2U, t161, 8, t151, 24);
    goto LAB60;

LAB61:    t177 = (t0 + 880);
    t178 = *((char **)t177);
    goto LAB62;

LAB63:    xsi_vlog_unsigned_bit_combine(t119, 32, t150, 32, t178, 32);
    goto LAB67;

LAB65:    memcpy(t119, t150, 8);
    goto LAB67;

}

static void Cont_51_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t25[8];
    char t26[8];
    char t29[8];
    char t56[8];
    char t58[8];
    char t72[8];
    char t73[8];
    char t76[8];
    char t103[8];
    char t104[8];
    char t119[8];
    char t120[8];
    char t123[8];
    char t150[8];
    char t151[8];
    char t161[8];
    char t165[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t57;
    char *t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t74;
    char *t75;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t105;
    char *t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    char *t121;
    char *t122;
    char *t124;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    char *t152;
    char *t153;
    char *t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    char *t162;
    char *t163;
    char *t164;
    char *t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    char *t177;
    char *t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    char *t183;
    char *t184;
    char *t185;
    char *t186;
    char *t187;
    char *t188;

LAB0:    t1 = (t0 + 4520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1592U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 2);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 2);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    memset(t4, 0, 8);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t14) != 0)
        goto LAB6;

LAB7:    t21 = (t4 + 4);
    t22 = *((unsigned int *)t4);
    t23 = *((unsigned int *)t21);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB8;

LAB9:    t179 = *((unsigned int *)t4);
    t180 = (~(t179));
    t181 = *((unsigned int *)t21);
    t182 = (t180 || t181);
    if (t182 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t21) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t183, 8);

LAB16:    t177 = (t0 + 5872);
    t184 = (t177 + 56U);
    t185 = *((char **)t184);
    t186 = (t185 + 56U);
    t187 = *((char **)t186);
    memcpy(t187, t3, 8);
    xsi_driver_vfirst_trans(t177, 0, 31);
    t188 = (t0 + 5616);
    *((int *)t188) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB7;

LAB8:    t27 = (t0 + 1912U);
    t28 = *((char **)t27);
    t27 = ((char*)((ng1)));
    memset(t29, 0, 8);
    t30 = (t28 + 4);
    t31 = (t27 + 4);
    t32 = *((unsigned int *)t28);
    t33 = *((unsigned int *)t27);
    t34 = (t32 ^ t33);
    t35 = *((unsigned int *)t30);
    t36 = *((unsigned int *)t31);
    t37 = (t35 ^ t36);
    t38 = (t34 | t37);
    t39 = *((unsigned int *)t30);
    t40 = *((unsigned int *)t31);
    t41 = (t39 | t40);
    t42 = (~(t41));
    t43 = (t38 & t42);
    if (t43 != 0)
        goto LAB20;

LAB17:    if (t41 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t29) = 1;

LAB20:    memset(t26, 0, 8);
    t45 = (t29 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t29);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t45) != 0)
        goto LAB23;

LAB24:    t52 = (t26 + 4);
    t53 = *((unsigned int *)t26);
    t54 = *((unsigned int *)t52);
    t55 = (t53 || t54);
    if (t55 > 0)
        goto LAB25;

LAB26:    t68 = *((unsigned int *)t26);
    t69 = (~(t68));
    t70 = *((unsigned int *)t52);
    t71 = (t69 || t70);
    if (t71 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t52) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t26) > 0)
        goto LAB31;

LAB32:    memcpy(t25, t72, 8);

LAB33:    goto LAB9;

LAB10:    t177 = (t0 + 2392U);
    t183 = *((char **)t177);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t25, 32, t183, 32);
    goto LAB16;

LAB14:    memcpy(t3, t25, 8);
    goto LAB16;

LAB19:    t44 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t26) = 1;
    goto LAB24;

LAB23:    t51 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB24;

LAB25:    t57 = ((char*)((ng1)));
    t59 = (t0 + 2392U);
    t60 = *((char **)t59);
    memset(t58, 0, 8);
    t59 = (t58 + 4);
    t61 = (t60 + 4);
    t62 = *((unsigned int *)t60);
    t63 = (t62 >> 0);
    *((unsigned int *)t58) = t63;
    t64 = *((unsigned int *)t61);
    t65 = (t64 >> 0);
    *((unsigned int *)t59) = t65;
    t66 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t66 & 268435455U);
    t67 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t67 & 268435455U);
    xsi_vlogtype_concat(t56, 32, 32, 2U, t58, 28, t57, 4);
    goto LAB26;

LAB27:    t74 = (t0 + 1912U);
    t75 = *((char **)t74);
    t74 = ((char*)((ng2)));
    memset(t76, 0, 8);
    t77 = (t75 + 4);
    t78 = (t74 + 4);
    t79 = *((unsigned int *)t75);
    t80 = *((unsigned int *)t74);
    t81 = (t79 ^ t80);
    t82 = *((unsigned int *)t77);
    t83 = *((unsigned int *)t78);
    t84 = (t82 ^ t83);
    t85 = (t81 | t84);
    t86 = *((unsigned int *)t77);
    t87 = *((unsigned int *)t78);
    t88 = (t86 | t87);
    t89 = (~(t88));
    t90 = (t85 & t89);
    if (t90 != 0)
        goto LAB37;

LAB34:    if (t88 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t76) = 1;

LAB37:    memset(t73, 0, 8);
    t92 = (t76 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t76);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t92) != 0)
        goto LAB40;

LAB41:    t99 = (t73 + 4);
    t100 = *((unsigned int *)t73);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB42;

LAB43:    t115 = *((unsigned int *)t73);
    t116 = (~(t115));
    t117 = *((unsigned int *)t99);
    t118 = (t116 || t117);
    if (t118 > 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t99) > 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t73) > 0)
        goto LAB48;

LAB49:    memcpy(t72, t119, 8);

LAB50:    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t25, 32, t56, 32, t72, 32);
    goto LAB33;

LAB31:    memcpy(t25, t56, 8);
    goto LAB33;

LAB36:    t91 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB37;

LAB38:    *((unsigned int *)t73) = 1;
    goto LAB41;

LAB40:    t98 = (t73 + 4);
    *((unsigned int *)t73) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB41;

LAB42:    t105 = (t0 + 2392U);
    t106 = *((char **)t105);
    memset(t104, 0, 8);
    t105 = (t104 + 4);
    t107 = (t106 + 4);
    t108 = *((unsigned int *)t106);
    t109 = (t108 >> 4);
    *((unsigned int *)t104) = t109;
    t110 = *((unsigned int *)t107);
    t111 = (t110 >> 4);
    *((unsigned int *)t105) = t111;
    t112 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t112 & 268435455U);
    t113 = *((unsigned int *)t105);
    *((unsigned int *)t105) = (t113 & 268435455U);
    t114 = ((char*)((ng1)));
    xsi_vlogtype_concat(t103, 32, 32, 2U, t114, 4, t104, 28);
    goto LAB43;

LAB44:    t121 = (t0 + 1912U);
    t122 = *((char **)t121);
    t121 = ((char*)((ng3)));
    memset(t123, 0, 8);
    t124 = (t122 + 4);
    t125 = (t121 + 4);
    t126 = *((unsigned int *)t122);
    t127 = *((unsigned int *)t121);
    t128 = (t126 ^ t127);
    t129 = *((unsigned int *)t124);
    t130 = *((unsigned int *)t125);
    t131 = (t129 ^ t130);
    t132 = (t128 | t131);
    t133 = *((unsigned int *)t124);
    t134 = *((unsigned int *)t125);
    t135 = (t133 | t134);
    t136 = (~(t135));
    t137 = (t132 & t136);
    if (t137 != 0)
        goto LAB54;

LAB51:    if (t135 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t123) = 1;

LAB54:    memset(t120, 0, 8);
    t139 = (t123 + 4);
    t140 = *((unsigned int *)t139);
    t141 = (~(t140));
    t142 = *((unsigned int *)t123);
    t143 = (t142 & t141);
    t144 = (t143 & 1U);
    if (t144 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t139) != 0)
        goto LAB57;

LAB58:    t146 = (t120 + 4);
    t147 = *((unsigned int *)t120);
    t148 = *((unsigned int *)t146);
    t149 = (t147 || t148);
    if (t149 > 0)
        goto LAB59;

LAB60:    t173 = *((unsigned int *)t120);
    t174 = (~(t173));
    t175 = *((unsigned int *)t146);
    t176 = (t174 || t175);
    if (t176 > 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t146) > 0)
        goto LAB63;

LAB64:    if (*((unsigned int *)t120) > 0)
        goto LAB65;

LAB66:    memcpy(t119, t178, 8);

LAB67:    goto LAB45;

LAB46:    xsi_vlog_unsigned_bit_combine(t72, 32, t103, 32, t119, 32);
    goto LAB50;

LAB48:    memcpy(t72, t103, 8);
    goto LAB50;

LAB53:    t138 = (t123 + 4);
    *((unsigned int *)t123) = 1;
    *((unsigned int *)t138) = 1;
    goto LAB54;

LAB55:    *((unsigned int *)t120) = 1;
    goto LAB58;

LAB57:    t145 = (t120 + 4);
    *((unsigned int *)t120) = 1;
    *((unsigned int *)t145) = 1;
    goto LAB58;

LAB59:    t152 = (t0 + 2392U);
    t153 = *((char **)t152);
    memset(t151, 0, 8);
    t152 = (t151 + 4);
    t154 = (t153 + 4);
    t155 = *((unsigned int *)t153);
    t156 = (t155 >> 4);
    *((unsigned int *)t151) = t156;
    t157 = *((unsigned int *)t154);
    t158 = (t157 >> 4);
    *((unsigned int *)t152) = t158;
    t159 = *((unsigned int *)t151);
    *((unsigned int *)t151) = (t159 & 268435455U);
    t160 = *((unsigned int *)t152);
    *((unsigned int *)t152) = (t160 & 268435455U);
    t162 = ((char*)((ng6)));
    t163 = (t0 + 2392U);
    t164 = *((char **)t163);
    memset(t165, 0, 8);
    t163 = (t165 + 4);
    t166 = (t164 + 4);
    t167 = *((unsigned int *)t164);
    t168 = (t167 >> 31);
    t169 = (t168 & 1);
    *((unsigned int *)t165) = t169;
    t170 = *((unsigned int *)t166);
    t171 = (t170 >> 31);
    t172 = (t171 & 1);
    *((unsigned int *)t163) = t172;
    xsi_vlog_mul_concat(t161, 4, 1, t162, 1U, t165, 1);
    xsi_vlogtype_concat(t150, 32, 32, 2U, t161, 4, t151, 28);
    goto LAB60;

LAB61:    t177 = (t0 + 880);
    t178 = *((char **)t177);
    goto LAB62;

LAB63:    xsi_vlog_unsigned_bit_combine(t119, 32, t150, 32, t178, 32);
    goto LAB67;

LAB65:    memcpy(t119, t150, 8);
    goto LAB67;

}

static void Cont_60_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t25[8];
    char t26[8];
    char t29[8];
    char t56[8];
    char t58[8];
    char t72[8];
    char t73[8];
    char t76[8];
    char t103[8];
    char t104[8];
    char t119[8];
    char t120[8];
    char t123[8];
    char t150[8];
    char t151[8];
    char t161[8];
    char t165[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t57;
    char *t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t74;
    char *t75;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t105;
    char *t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    char *t121;
    char *t122;
    char *t124;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    char *t152;
    char *t153;
    char *t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    char *t162;
    char *t163;
    char *t164;
    char *t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    char *t177;
    char *t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    char *t183;
    char *t184;
    char *t185;
    char *t186;
    char *t187;
    char *t188;

LAB0:    t1 = (t0 + 4768U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1592U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    memset(t4, 0, 8);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t14) != 0)
        goto LAB6;

LAB7:    t21 = (t4 + 4);
    t22 = *((unsigned int *)t4);
    t23 = *((unsigned int *)t21);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB8;

LAB9:    t179 = *((unsigned int *)t4);
    t180 = (~(t179));
    t181 = *((unsigned int *)t21);
    t182 = (t180 || t181);
    if (t182 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t21) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t183, 8);

LAB16:    t177 = (t0 + 5936);
    t184 = (t177 + 56U);
    t185 = *((char **)t184);
    t186 = (t185 + 56U);
    t187 = *((char **)t186);
    memcpy(t187, t3, 8);
    xsi_driver_vfirst_trans(t177, 0, 31);
    t188 = (t0 + 5632);
    *((int *)t188) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB7;

LAB8:    t27 = (t0 + 1912U);
    t28 = *((char **)t27);
    t27 = ((char*)((ng1)));
    memset(t29, 0, 8);
    t30 = (t28 + 4);
    t31 = (t27 + 4);
    t32 = *((unsigned int *)t28);
    t33 = *((unsigned int *)t27);
    t34 = (t32 ^ t33);
    t35 = *((unsigned int *)t30);
    t36 = *((unsigned int *)t31);
    t37 = (t35 ^ t36);
    t38 = (t34 | t37);
    t39 = *((unsigned int *)t30);
    t40 = *((unsigned int *)t31);
    t41 = (t39 | t40);
    t42 = (~(t41));
    t43 = (t38 & t42);
    if (t43 != 0)
        goto LAB20;

LAB17:    if (t41 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t29) = 1;

LAB20:    memset(t26, 0, 8);
    t45 = (t29 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t29);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t45) != 0)
        goto LAB23;

LAB24:    t52 = (t26 + 4);
    t53 = *((unsigned int *)t26);
    t54 = *((unsigned int *)t52);
    t55 = (t53 || t54);
    if (t55 > 0)
        goto LAB25;

LAB26:    t68 = *((unsigned int *)t26);
    t69 = (~(t68));
    t70 = *((unsigned int *)t52);
    t71 = (t69 || t70);
    if (t71 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t52) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t26) > 0)
        goto LAB31;

LAB32:    memcpy(t25, t72, 8);

LAB33:    goto LAB9;

LAB10:    t177 = (t0 + 2552U);
    t183 = *((char **)t177);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t25, 32, t183, 32);
    goto LAB16;

LAB14:    memcpy(t3, t25, 8);
    goto LAB16;

LAB19:    t44 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t26) = 1;
    goto LAB24;

LAB23:    t51 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB24;

LAB25:    t57 = ((char*)((ng1)));
    t59 = (t0 + 2552U);
    t60 = *((char **)t59);
    memset(t58, 0, 8);
    t59 = (t58 + 4);
    t61 = (t60 + 4);
    t62 = *((unsigned int *)t60);
    t63 = (t62 >> 0);
    *((unsigned int *)t58) = t63;
    t64 = *((unsigned int *)t61);
    t65 = (t64 >> 0);
    *((unsigned int *)t59) = t65;
    t66 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t66 & 1073741823U);
    t67 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t67 & 1073741823U);
    xsi_vlogtype_concat(t56, 32, 32, 2U, t58, 30, t57, 2);
    goto LAB26;

LAB27:    t74 = (t0 + 1912U);
    t75 = *((char **)t74);
    t74 = ((char*)((ng2)));
    memset(t76, 0, 8);
    t77 = (t75 + 4);
    t78 = (t74 + 4);
    t79 = *((unsigned int *)t75);
    t80 = *((unsigned int *)t74);
    t81 = (t79 ^ t80);
    t82 = *((unsigned int *)t77);
    t83 = *((unsigned int *)t78);
    t84 = (t82 ^ t83);
    t85 = (t81 | t84);
    t86 = *((unsigned int *)t77);
    t87 = *((unsigned int *)t78);
    t88 = (t86 | t87);
    t89 = (~(t88));
    t90 = (t85 & t89);
    if (t90 != 0)
        goto LAB37;

LAB34:    if (t88 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t76) = 1;

LAB37:    memset(t73, 0, 8);
    t92 = (t76 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t76);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t92) != 0)
        goto LAB40;

LAB41:    t99 = (t73 + 4);
    t100 = *((unsigned int *)t73);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB42;

LAB43:    t115 = *((unsigned int *)t73);
    t116 = (~(t115));
    t117 = *((unsigned int *)t99);
    t118 = (t116 || t117);
    if (t118 > 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t99) > 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t73) > 0)
        goto LAB48;

LAB49:    memcpy(t72, t119, 8);

LAB50:    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t25, 32, t56, 32, t72, 32);
    goto LAB33;

LAB31:    memcpy(t25, t56, 8);
    goto LAB33;

LAB36:    t91 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB37;

LAB38:    *((unsigned int *)t73) = 1;
    goto LAB41;

LAB40:    t98 = (t73 + 4);
    *((unsigned int *)t73) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB41;

LAB42:    t105 = (t0 + 2552U);
    t106 = *((char **)t105);
    memset(t104, 0, 8);
    t105 = (t104 + 4);
    t107 = (t106 + 4);
    t108 = *((unsigned int *)t106);
    t109 = (t108 >> 2);
    *((unsigned int *)t104) = t109;
    t110 = *((unsigned int *)t107);
    t111 = (t110 >> 2);
    *((unsigned int *)t105) = t111;
    t112 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t112 & 1073741823U);
    t113 = *((unsigned int *)t105);
    *((unsigned int *)t105) = (t113 & 1073741823U);
    t114 = ((char*)((ng1)));
    xsi_vlogtype_concat(t103, 32, 32, 2U, t114, 2, t104, 30);
    goto LAB43;

LAB44:    t121 = (t0 + 1912U);
    t122 = *((char **)t121);
    t121 = ((char*)((ng3)));
    memset(t123, 0, 8);
    t124 = (t122 + 4);
    t125 = (t121 + 4);
    t126 = *((unsigned int *)t122);
    t127 = *((unsigned int *)t121);
    t128 = (t126 ^ t127);
    t129 = *((unsigned int *)t124);
    t130 = *((unsigned int *)t125);
    t131 = (t129 ^ t130);
    t132 = (t128 | t131);
    t133 = *((unsigned int *)t124);
    t134 = *((unsigned int *)t125);
    t135 = (t133 | t134);
    t136 = (~(t135));
    t137 = (t132 & t136);
    if (t137 != 0)
        goto LAB54;

LAB51:    if (t135 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t123) = 1;

LAB54:    memset(t120, 0, 8);
    t139 = (t123 + 4);
    t140 = *((unsigned int *)t139);
    t141 = (~(t140));
    t142 = *((unsigned int *)t123);
    t143 = (t142 & t141);
    t144 = (t143 & 1U);
    if (t144 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t139) != 0)
        goto LAB57;

LAB58:    t146 = (t120 + 4);
    t147 = *((unsigned int *)t120);
    t148 = *((unsigned int *)t146);
    t149 = (t147 || t148);
    if (t149 > 0)
        goto LAB59;

LAB60:    t173 = *((unsigned int *)t120);
    t174 = (~(t173));
    t175 = *((unsigned int *)t146);
    t176 = (t174 || t175);
    if (t176 > 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t146) > 0)
        goto LAB63;

LAB64:    if (*((unsigned int *)t120) > 0)
        goto LAB65;

LAB66:    memcpy(t119, t178, 8);

LAB67:    goto LAB45;

LAB46:    xsi_vlog_unsigned_bit_combine(t72, 32, t103, 32, t119, 32);
    goto LAB50;

LAB48:    memcpy(t72, t103, 8);
    goto LAB50;

LAB53:    t138 = (t123 + 4);
    *((unsigned int *)t123) = 1;
    *((unsigned int *)t138) = 1;
    goto LAB54;

LAB55:    *((unsigned int *)t120) = 1;
    goto LAB58;

LAB57:    t145 = (t120 + 4);
    *((unsigned int *)t120) = 1;
    *((unsigned int *)t145) = 1;
    goto LAB58;

LAB59:    t152 = (t0 + 2552U);
    t153 = *((char **)t152);
    memset(t151, 0, 8);
    t152 = (t151 + 4);
    t154 = (t153 + 4);
    t155 = *((unsigned int *)t153);
    t156 = (t155 >> 2);
    *((unsigned int *)t151) = t156;
    t157 = *((unsigned int *)t154);
    t158 = (t157 >> 2);
    *((unsigned int *)t152) = t158;
    t159 = *((unsigned int *)t151);
    *((unsigned int *)t151) = (t159 & 1073741823U);
    t160 = *((unsigned int *)t152);
    *((unsigned int *)t152) = (t160 & 1073741823U);
    t162 = ((char*)((ng7)));
    t163 = (t0 + 2552U);
    t164 = *((char **)t163);
    memset(t165, 0, 8);
    t163 = (t165 + 4);
    t166 = (t164 + 4);
    t167 = *((unsigned int *)t164);
    t168 = (t167 >> 31);
    t169 = (t168 & 1);
    *((unsigned int *)t165) = t169;
    t170 = *((unsigned int *)t166);
    t171 = (t170 >> 31);
    t172 = (t171 & 1);
    *((unsigned int *)t163) = t172;
    xsi_vlog_mul_concat(t161, 2, 1, t162, 1U, t165, 1);
    xsi_vlogtype_concat(t150, 32, 32, 2U, t161, 2, t151, 30);
    goto LAB60;

LAB61:    t177 = (t0 + 880);
    t178 = *((char **)t177);
    goto LAB62;

LAB63:    xsi_vlog_unsigned_bit_combine(t119, 32, t150, 32, t178, 32);
    goto LAB67;

LAB65:    memcpy(t119, t150, 8);
    goto LAB67;

}

static void Cont_69_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t25[8];
    char t26[8];
    char t29[8];
    char t56[8];
    char t58[8];
    char t72[8];
    char t73[8];
    char t76[8];
    char t103[8];
    char t104[8];
    char t119[8];
    char t120[8];
    char t123[8];
    char t150[8];
    char t151[8];
    char t161[8];
    char t165[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t57;
    char *t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t74;
    char *t75;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t105;
    char *t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    char *t121;
    char *t122;
    char *t124;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    char *t152;
    char *t153;
    char *t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    char *t162;
    char *t163;
    char *t164;
    char *t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    char *t177;
    char *t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    char *t183;
    char *t184;
    char *t185;
    char *t186;
    char *t187;
    char *t188;

LAB0:    t1 = (t0 + 5016U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 1592U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    memset(t4, 0, 8);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t14) != 0)
        goto LAB6;

LAB7:    t21 = (t4 + 4);
    t22 = *((unsigned int *)t4);
    t23 = *((unsigned int *)t21);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB8;

LAB9:    t179 = *((unsigned int *)t4);
    t180 = (~(t179));
    t181 = *((unsigned int *)t21);
    t182 = (t180 || t181);
    if (t182 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t21) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t183, 8);

LAB16:    t177 = (t0 + 6000);
    t184 = (t177 + 56U);
    t185 = *((char **)t184);
    t186 = (t185 + 56U);
    t187 = *((char **)t186);
    memcpy(t187, t3, 8);
    xsi_driver_vfirst_trans(t177, 0, 31);
    t188 = (t0 + 5648);
    *((int *)t188) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB7;

LAB8:    t27 = (t0 + 1912U);
    t28 = *((char **)t27);
    t27 = ((char*)((ng1)));
    memset(t29, 0, 8);
    t30 = (t28 + 4);
    t31 = (t27 + 4);
    t32 = *((unsigned int *)t28);
    t33 = *((unsigned int *)t27);
    t34 = (t32 ^ t33);
    t35 = *((unsigned int *)t30);
    t36 = *((unsigned int *)t31);
    t37 = (t35 ^ t36);
    t38 = (t34 | t37);
    t39 = *((unsigned int *)t30);
    t40 = *((unsigned int *)t31);
    t41 = (t39 | t40);
    t42 = (~(t41));
    t43 = (t38 & t42);
    if (t43 != 0)
        goto LAB20;

LAB17:    if (t41 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t29) = 1;

LAB20:    memset(t26, 0, 8);
    t45 = (t29 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t29);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t45) != 0)
        goto LAB23;

LAB24:    t52 = (t26 + 4);
    t53 = *((unsigned int *)t26);
    t54 = *((unsigned int *)t52);
    t55 = (t53 || t54);
    if (t55 > 0)
        goto LAB25;

LAB26:    t68 = *((unsigned int *)t26);
    t69 = (~(t68));
    t70 = *((unsigned int *)t52);
    t71 = (t69 || t70);
    if (t71 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t52) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t26) > 0)
        goto LAB31;

LAB32:    memcpy(t25, t72, 8);

LAB33:    goto LAB9;

LAB10:    t177 = (t0 + 2712U);
    t183 = *((char **)t177);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t25, 32, t183, 32);
    goto LAB16;

LAB14:    memcpy(t3, t25, 8);
    goto LAB16;

LAB19:    t44 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t26) = 1;
    goto LAB24;

LAB23:    t51 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB24;

LAB25:    t57 = ((char*)((ng1)));
    t59 = (t0 + 2712U);
    t60 = *((char **)t59);
    memset(t58, 0, 8);
    t59 = (t58 + 4);
    t61 = (t60 + 4);
    t62 = *((unsigned int *)t60);
    t63 = (t62 >> 0);
    *((unsigned int *)t58) = t63;
    t64 = *((unsigned int *)t61);
    t65 = (t64 >> 0);
    *((unsigned int *)t59) = t65;
    t66 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t66 & 2147483647U);
    t67 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t67 & 2147483647U);
    xsi_vlogtype_concat(t56, 32, 32, 2U, t58, 31, t57, 1);
    goto LAB26;

LAB27:    t74 = (t0 + 1912U);
    t75 = *((char **)t74);
    t74 = ((char*)((ng2)));
    memset(t76, 0, 8);
    t77 = (t75 + 4);
    t78 = (t74 + 4);
    t79 = *((unsigned int *)t75);
    t80 = *((unsigned int *)t74);
    t81 = (t79 ^ t80);
    t82 = *((unsigned int *)t77);
    t83 = *((unsigned int *)t78);
    t84 = (t82 ^ t83);
    t85 = (t81 | t84);
    t86 = *((unsigned int *)t77);
    t87 = *((unsigned int *)t78);
    t88 = (t86 | t87);
    t89 = (~(t88));
    t90 = (t85 & t89);
    if (t90 != 0)
        goto LAB37;

LAB34:    if (t88 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t76) = 1;

LAB37:    memset(t73, 0, 8);
    t92 = (t76 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t76);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t92) != 0)
        goto LAB40;

LAB41:    t99 = (t73 + 4);
    t100 = *((unsigned int *)t73);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB42;

LAB43:    t115 = *((unsigned int *)t73);
    t116 = (~(t115));
    t117 = *((unsigned int *)t99);
    t118 = (t116 || t117);
    if (t118 > 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t99) > 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t73) > 0)
        goto LAB48;

LAB49:    memcpy(t72, t119, 8);

LAB50:    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t25, 32, t56, 32, t72, 32);
    goto LAB33;

LAB31:    memcpy(t25, t56, 8);
    goto LAB33;

LAB36:    t91 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB37;

LAB38:    *((unsigned int *)t73) = 1;
    goto LAB41;

LAB40:    t98 = (t73 + 4);
    *((unsigned int *)t73) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB41;

LAB42:    t105 = (t0 + 2712U);
    t106 = *((char **)t105);
    memset(t104, 0, 8);
    t105 = (t104 + 4);
    t107 = (t106 + 4);
    t108 = *((unsigned int *)t106);
    t109 = (t108 >> 1);
    *((unsigned int *)t104) = t109;
    t110 = *((unsigned int *)t107);
    t111 = (t110 >> 1);
    *((unsigned int *)t105) = t111;
    t112 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t112 & 2147483647U);
    t113 = *((unsigned int *)t105);
    *((unsigned int *)t105) = (t113 & 2147483647U);
    t114 = ((char*)((ng1)));
    xsi_vlogtype_concat(t103, 32, 32, 2U, t114, 1, t104, 31);
    goto LAB43;

LAB44:    t121 = (t0 + 1912U);
    t122 = *((char **)t121);
    t121 = ((char*)((ng3)));
    memset(t123, 0, 8);
    t124 = (t122 + 4);
    t125 = (t121 + 4);
    t126 = *((unsigned int *)t122);
    t127 = *((unsigned int *)t121);
    t128 = (t126 ^ t127);
    t129 = *((unsigned int *)t124);
    t130 = *((unsigned int *)t125);
    t131 = (t129 ^ t130);
    t132 = (t128 | t131);
    t133 = *((unsigned int *)t124);
    t134 = *((unsigned int *)t125);
    t135 = (t133 | t134);
    t136 = (~(t135));
    t137 = (t132 & t136);
    if (t137 != 0)
        goto LAB54;

LAB51:    if (t135 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t123) = 1;

LAB54:    memset(t120, 0, 8);
    t139 = (t123 + 4);
    t140 = *((unsigned int *)t139);
    t141 = (~(t140));
    t142 = *((unsigned int *)t123);
    t143 = (t142 & t141);
    t144 = (t143 & 1U);
    if (t144 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t139) != 0)
        goto LAB57;

LAB58:    t146 = (t120 + 4);
    t147 = *((unsigned int *)t120);
    t148 = *((unsigned int *)t146);
    t149 = (t147 || t148);
    if (t149 > 0)
        goto LAB59;

LAB60:    t173 = *((unsigned int *)t120);
    t174 = (~(t173));
    t175 = *((unsigned int *)t146);
    t176 = (t174 || t175);
    if (t176 > 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t146) > 0)
        goto LAB63;

LAB64:    if (*((unsigned int *)t120) > 0)
        goto LAB65;

LAB66:    memcpy(t119, t178, 8);

LAB67:    goto LAB45;

LAB46:    xsi_vlog_unsigned_bit_combine(t72, 32, t103, 32, t119, 32);
    goto LAB50;

LAB48:    memcpy(t72, t103, 8);
    goto LAB50;

LAB53:    t138 = (t123 + 4);
    *((unsigned int *)t123) = 1;
    *((unsigned int *)t138) = 1;
    goto LAB54;

LAB55:    *((unsigned int *)t120) = 1;
    goto LAB58;

LAB57:    t145 = (t120 + 4);
    *((unsigned int *)t120) = 1;
    *((unsigned int *)t145) = 1;
    goto LAB58;

LAB59:    t152 = (t0 + 2712U);
    t153 = *((char **)t152);
    memset(t151, 0, 8);
    t152 = (t151 + 4);
    t154 = (t153 + 4);
    t155 = *((unsigned int *)t153);
    t156 = (t155 >> 1);
    *((unsigned int *)t151) = t156;
    t157 = *((unsigned int *)t154);
    t158 = (t157 >> 1);
    *((unsigned int *)t152) = t158;
    t159 = *((unsigned int *)t151);
    *((unsigned int *)t151) = (t159 & 2147483647U);
    t160 = *((unsigned int *)t152);
    *((unsigned int *)t152) = (t160 & 2147483647U);
    t162 = ((char*)((ng8)));
    t163 = (t0 + 2712U);
    t164 = *((char **)t163);
    memset(t165, 0, 8);
    t163 = (t165 + 4);
    t166 = (t164 + 4);
    t167 = *((unsigned int *)t164);
    t168 = (t167 >> 31);
    t169 = (t168 & 1);
    *((unsigned int *)t165) = t169;
    t170 = *((unsigned int *)t166);
    t171 = (t170 >> 31);
    t172 = (t171 & 1);
    *((unsigned int *)t163) = t172;
    xsi_vlog_mul_concat(t161, 1, 1, t162, 1U, t165, 1);
    xsi_vlogtype_concat(t150, 32, 32, 2U, t161, 1, t151, 31);
    goto LAB60;

LAB61:    t177 = (t0 + 880);
    t178 = *((char **)t177);
    goto LAB62;

LAB63:    xsi_vlog_unsigned_bit_combine(t119, 32, t150, 32, t178, 32);
    goto LAB67;

LAB65:    memcpy(t119, t150, 8);
    goto LAB67;

}

static void Cont_78_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 5264U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2872U);
    t3 = *((char **)t2);
    t2 = (t0 + 6064);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 8);
    xsi_driver_vfirst_trans(t2, 0, 31);
    t8 = (t0 + 5664);
    *((int *)t8) = 1;

LAB1:    return;
}


extern void work_m_12091974561369596299_1778936876_init()
{
	static char *pe[] = {(void *)Cont_33_0,(void *)Cont_42_1,(void *)Cont_51_2,(void *)Cont_60_3,(void *)Cont_69_4,(void *)Cont_78_5};
	xsi_register_didat("work_m_12091974561369596299_1778936876", "isim/test_Pipeline_Core_isim_beh.exe.sim/work/m_12091974561369596299_1778936876.didat");
	xsi_register_executes(pe);
}
