/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n1_self_mod5.s
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
#define MAIN_BASE_DATA_ADDR     0x160000
#define MAIN_BASE_TEXT_ADDR     0x150000
#define MAIN_BASE_DATA_ADDR_RA   0x100160000
#define MAIN_BASE_TEXT_ADDR_RA   0x100150000

#define USER_PAGE_CUSTOM_MAP
#include "hboot.s"

SECTION .MAIN  TEXT_VA=0x150000, DATA_VA=0x160000

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_ADDR,
        RA=MAIN_BASE_TEXT_ADDR_RA,
        PA=ra2pa(MAIN_BASE_TEXT_ADDR_RA,0),
part_0_ctx_nonzero_tsb_config_0,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_EP=1, TTE_P=0, TTE_W=1
        }
attr_data {
        Name = .MAIN,
        VA=MAIN_BASE_DATA_ADDR,
        RA=MAIN_BASE_DATA_ADDR_RA,
        PA=ra2pa(MAIN_BASE_DATA_ADDR_RA,0),
part_0_ctx_nonzero_tsb_config_0,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

.text
.global main
main:

	setx 	label0, %l0,%o0		! 
	setx	0x01000000, %l0, %i0	! set good data
	setx	0xdeadbeef, %l0, %i1	! set bad data

	setx 	0x20, %l0, %l2		! loop counter

label0a:
	st	%i0, [%o0]		! store good data tp label0
	flush 	%o0
label0:
	ta	T_BAD_TRAP		! 0
	st	%i0, [%o0 + 0xc]	! 4 - more stores of good data
	flush 	%o0			! 8
	ta	T_BAD_TRAP		! c
	st	%i0, [%o0 + 0x18]	! 10
	flush 	%o0			! 14
	ta	T_BAD_TRAP		! 18
	st	%i0, [%o0 + 0x24]	! 1c
	flush 	%o0			! 20
	ta	T_BAD_TRAP		! 24
	st	%i0, [%o0 + 0x30]	! 28
	flush 	%o0			! 2c
	ta	T_BAD_TRAP		! 30
	st	%i0, [%o0 + 0x3c]	! 34
	flush 	%o0			! 38
	ta	T_BAD_TRAP		! 3c
	st	%i0, [%o0 + 0x48]	! 40
	flush 	%o0			! 44
	ta	T_BAD_TRAP		! 48

	st	%i1, [%o0]		! now restore bad data
	st	%i1, [%o0 + 0xc]	!
	st	%i1, [%o0 + 0x18]	!
	st	%i1, [%o0 + 0x24]	!
	st	%i1, [%o0 + 0x30]	!
	st	%i1, [%o0 + 0x3c]	!
	st	%i1, [%o0 + 0x48]	!

	dec     %l2			! and loop
        brnz,pt %l2, label0a
        nop

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
user_data_start:
	.word 0x0
user_data_end:
