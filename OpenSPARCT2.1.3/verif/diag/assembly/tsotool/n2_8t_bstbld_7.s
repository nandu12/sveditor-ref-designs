/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_8t_bstbld_7.s
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
#define N_CPUS  8
#define REGION_MAPPED_SIZE_RTL 8192
#define REGION_SIZE_RTL (8 * 1024)
#define RESULTS_BUF_SIZE_PER_CPU_RTL 1024
#define PRIVATE_DATA_AREA_PER_CPU_RTL 64

#define ALIGN_PAGE_8K .align 8192
#define ALIGN_PAGE_64K .align 65536
#define ALIGN_PAGE_512K .align 524288
#define ALIGN_PAGE_4M .align 4194304
#define USER_PAGE_CUSTOM_MAP

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}
.text
.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] 0x72, %g2;
	ldxa	[%g0] 0x74, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

.global intr0x190_custom_trap
intr0x190_custom_trap:

#ifdef SJM
! programming the JBI - not quite rrugho
!=====================
!setx 0x0000000006040012, %g1, %g2
!setx 0x8503000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000100, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000000, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000400, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000108, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000101, %g1, %g2
!setx 0x9800000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000408, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000110, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000202, %g1, %g2
!setx 0x9800000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000410, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000118, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000303, %g1, %g2
!setx 0x9800000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000418, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000120, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000404, %g1, %g2
!setx 0x9800000020, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000420, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000128, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000505, %g1, %g2
!setx 0x9800000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000428, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000130, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000606, %g1, %g2
!setx 0x9800000030, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000430, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000138, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000707, %g1, %g2
!setx 0x9800000038, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000438, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000140, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000808, %g1, %g2
!setx 0x9800000040, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000440, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000148, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000909, %g1, %g2
!setx 0x9800000048, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000448, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000150, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000a0a, %g1, %g2
!setx 0x9800000050, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000450, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000158, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000b0b, %g1, %g2
!setx 0x9800000058, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000458, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000160, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000c0c, %g1, %g2
!setx 0x9800000060, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000460, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000168, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000d0d, %g1, %g2
!setx 0x9800000068, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000468, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000170, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000e0e, %g1, %g2
!setx 0x9800000070, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000470, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000178, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000f0f, %g1, %g2
!setx 0x9800000078, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000478, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x000000000000007f, %g1, %g2
!setx 0x8503000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001010, %g1, %g2
!setx 0x9800000080, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000480, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001111, %g1, %g2
!setx 0x9800000088, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000488, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000c00, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e20, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e28, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e38, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000008, %g1, %g2
!setx 0x8503000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000828, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x8503000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000001, %g1, %g2
!setx 0x8503000020, %g1, %g3
!stx %g2, [%g3]
!!=====================

/***********************************************************************
  Disable L2 Cache Visibility Port
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001800, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001820, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001828, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001830, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001838, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001840, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
  Disable IOBridge Visibility Ports
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002100, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002140, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002160, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002180, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002148, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002168, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002188, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a8, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002150, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002170, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002190, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021b0, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
 Configure jbi controller
 ***********************************************************************/

setx 0x03fb303e00000001, %g1, %g2
setx 0x8000000000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x000000007033fe0f, %g1, %g2
setx 0x8000000008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000003fc0000000, %g1, %g2
setx 0x80000100a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x00000000fe0003ff, %g1, %g2
setx 0x8000004100, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
 IOSYNC cycles to start sjm
 ***********************************************************************/

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]

!=============================
done;

#else
#ifdef  DC_ON_OFF
	
	and	%i0, 0x1, %i0
	brz	%i0, on
	nop

        mov     0xd, %i0
	ba	finish_dc_on_off
        stxa    %l0, [%g0] 0x45         /* turn D-cache off */
on:        
        mov     0xf, %i0
        stxa    %i0, [%g0] 0x45         /* turn D-cache back on */

finish_dc_on_off:
	done

#else
	stxa	%i0, [%g0] 0x73;	
	done;
#endif
#endif
!============================================================================

#define ENABLE_T0_Fp_exception_ieee_754_0x21
#define ENABLE_T0_Fp_exception_other_0x22
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Illegal_instruction_0x10
#define ENABLE_T1_Illegal_instruction_0x10
#define ENABLE_HT0_Illegal_instruction_0x10
#define ENABLE_HT1_Illegal_instruction_0x10
#define ENABLE_T0_Clean_Window_0x24
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_VA_IS_RA_ALSO




#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0	\
	ta      0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#ifdef SJM
#define My_HT0_HTrap_Instruction_0 \
	setx intr0x190_custom_trap, %g1, %g2; \
	jmp %g2; nop
#else
#define My_HT0_HTrap_Instruction_0      \
	stxa    %i0, [%g0] 0x73;        \
	done;
#endif

#define H_HT0_Interrupt_0x60 intr0x60_custom_trap
#define My_HT0_Interrupt_0x60   \
        ldxa    [%g0] 0x72, %g2;        \
        ldxa    [%g0] 0x74, %g1;        \
        retry;
#define H_HT0_Trap_Instruction_5
#define My_HT0_Trap_Instruction_5   \
        ldxa [%g0 + %g0]0x45, %g1;     \
		membar #Sync;  \
        xor  %g1, 19, %g1;   \
        stxa %g1, [%g0 + %g0]0x45;  \
		wrpr %g0, 0x200, %pstate;
        done;

#ifndef THREAD_COUNT
#define THREAD_COUNT 8
#endif

#ifndef THREAD_STRIDE
#define THREAD_STRIDE 1
#endif
#define SKIP_TRAPCHECK
#include "hboot.s"


!try later:
!	stxa    %l6, [$8] (0x22 | ($2 & 0x9)) ! ASI is randomly set
!===========
define(BST_INIT, `
	add     $6, ($7 & 0xfff0), $8	! 4-byte align the offset
	stxa    %l6, [$8] 0x22		! ASI is randomly set
')

!try later:
!ldda    [$8] (0x22 | ($2 & 0x9)), %l6 ! ASI is randomly set
!===========
define(BLD_INIT, `
        add     $6, ($7 & 0xfff0), $8 	! 4-byte align the offset
        ldda    [$8] 0x22, %l6 		! ASI is randomly set
')

define(CHECK_PROC_ID,`
check_cpu_id: 

	wr	%g0, 0x4, %fprs         /* make sure fef is 1 */
	mov 	THREAD_STRIDE, %l2
	th_fork(thread,%l0)

thread_0:
#ifdef SJM
	ta 	0x30
#endif
	mov 	0, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
	
thread_1:
	mov 	1, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_2:
	mov 	2, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_3:
	mov 	3, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_4:
	mov 	4, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_5:
	mov 	5, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_6:
	mov 	6, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_7:
	mov 	7, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_8:
	mov 	8, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_9:
	mov 	9, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_10:
	mov 	10, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_11:
	mov 	11, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_12:
	mov 	12, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_13:
	mov 	13, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_14:
	mov 	14, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_15:
	mov 	15, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_16:
	mov 	16, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_17:
	mov 	17, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_18:
	mov 	18, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_19:
	mov 	19, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_20:
	mov 	20, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_21:
	mov 	21, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_22:
	mov 	22, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_23:
	mov 	23, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_24:
	mov 	24, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_25:
	mov 	25, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_26:
	mov 	26, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
	
thread_27:
	mov 	27, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_28:
	mov 	28, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_29:
	mov 	29, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_30:
	mov 	30, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_31:
	mov 	31, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop

thread_32:
    mov     32, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_33:
    mov     33, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_34:
    mov     34, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_35:
    mov     35, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_36:
    mov     36, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_37:
    mov     37, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_38:
    mov     38, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_39:
    mov     39, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_40:
    mov     40, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_41:
    mov     41, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_42:
    mov     42, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_43:
    mov     43, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_44:
    mov     44, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_45:
    mov     45, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_46:
    mov     46, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_47:
    mov     47, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_48:
    mov     48, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_49:
    mov     49, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_50:
    mov     50, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_51:
    mov     51, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_52:
    mov     52, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_53:
    mov     53, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_54:
    mov     54, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_55:
    mov     55, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_56:
    mov     56, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_57:
    mov     57, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_58:
    mov     58, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_59:
    mov     59, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_60:
    mov     60, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_61:
    mov     61, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_62:
    mov     62, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_63:
    mov     63, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

entry_point:
#ifdef RTGPRIV
	ta	T_CHANGE_PRIV
#endif
	
')
! --- Common Macro Definitions ---
!
! macros will be instantiated with these arguments
! macro_name(P#, rand#, my_cpu#, PA_val, VA_val, VA_reg, VA_offset, \
!            tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3)
!
! P# - Pid, just in case one needs unique number
! rand# - random number
! my_cpu# - CPU id
! PA_val - shared memory physisal address value
! VA_val - shared memory virtual address value
! VA_reg - register containing VA region base address
! VA_offset - VA_reg + VA_offset will give correct VA address value
! tmp_reg0-tmp_reg3 - integer registers for arbitrary use within the macro
!                     tmp_reg0 & tmp_reg1 are even-odd register pair
!
! VA_val may be incorrect since VA will be determined at compile time by assembler
! and may not available at diag generation time, but VA_reg+VA_offset is valid
!
! ex. SAMPLE(1, 1249, 0, 0x43400100, 0x100, %i1, 0x100, %l6, %l7, %o5, %l3)
!
! Sample macro 1:
!  load unsigned byte from the given shared addr into tmp_reg1
!  the given shared addr is 4-byte aligned and we will randomly
!  pick one byte from the 4 bytes.
! 
! define(SAMPLE, `
!        ldub   [$6+$7+($2 mod 4)], $8
! ')
!
! Can also use C-like macro definition format.
!
! Sample macro 2:
!   issue an "ldda" instruction to the randomly picked shared location
!   (aligned it to 16-byte boundary first) with a random ASI value among
!   0x22, 0x23, 0x2a, and 0x2b (utilizing the provided "rand" value).
!
! #define BLD_INIT(Pid, rand, my_cpu, PA_val, \
!                 VA_val, VA_reg, VA_offset, \
!                 tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
!   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
!   ldda [tmp_reg2] (0x22 | (rand & 0x9)), tmp_reg0;
!
! ---

! Macro NOPTRAIN
! Train of NOPs

#define NOPTRAIN(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
		nop;\
		nop;\
		nop;\
		nop;


! Macro STTRAIN4
! Train of total 4 of UW stores.
! Note: doesn't use shared addresses

#define STTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 5120, tmp_reg1; \
        add %i0, tmp_reg1, tmp_reg1; \
        set rand, tmp_reg2; \
        stw tmp_reg2, [tmp_reg1]; \
        stw tmp_reg2, [tmp_reg1+4]; \
        stw tmp_reg2, [tmp_reg1+8]; \
        stw tmp_reg2, [tmp_reg1+16];

! Macro STTRAIN8
! Train of total 8 of UW stores 

#define STTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 5120, tmp_reg1; \
        add %i0, tmp_reg1, tmp_reg1; \
        set rand, tmp_reg2; \
        add tmp_reg2, rand % 4096, tmp_reg3; \
        stw tmp_reg2, [tmp_reg1]; \
        stw tmp_reg2, [tmp_reg1+4]; \
        stw tmp_reg2, [tmp_reg1+8]; \
        stw tmp_reg2, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1+4]; \
        stw tmp_reg3, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1]; \
        stw tmp_reg3, [tmp_reg1+8];
 
! Macro LDTRAIN4
! Train of total 4 of UW Loads
! Note the values of those loads inside the macro will not be analized,
! even though the accesses are [possibly] made to the shared locations

#define LDTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        ld [%i0], tmp_reg1; \
        ld [%i1+4], tmp_reg1; \
        ld [%i2+8], tmp_reg1; \
        ld [%i3+12], tmp_reg1;

! Macro LDTRAIN8

#define LDTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        ld [%i3], tmp_reg1; \
        ld [%i2+4], tmp_reg1; \
        ld [%i1+8], tmp_reg2; \
        ld [%i0+12], tmp_reg2; \
        ld [%i3+4], tmp_reg3; \
        ld [%i2], tmp_reg3; \
        ld [%i1+12], tmp_reg4; \
        ld [%i0+8], tmp_reg4;

! Macro PREFETCHTRAIN4

#define PREFETCHTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        prefetch [%i0+4], 0; \
        prefetch [%i1+12], 0; \
        prefetch [%i2+8], 0; \
        prefetch [%i3], 0;

! Macro PREFETCHTRAIN8

#define PREFETCHTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        prefetch [%i3], 0; \
        prefetch [%i2+4], 0; \
        prefetch [%i1+8], 0; \
        prefetch [%i0+12], 0; \
        prefetch [%i3+4], 1; \
        prefetch [%i2], 1; \
        prefetch [%i1+12], 1; \
        prefetch [%i0+8], 1;

! Macro CASTRAIN4
! This is an interesting macro that will probably create the write congessions
! access to the shared locations (offsets from bases have to be adjusted)
! the values of the locations are not changed, so it should not affect analysis

#define CASTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 128, tmp_reg1;\
        add %i0, tmp_reg1, tmp_reg1;\
        set 256, tmp_reg2;\
        add %i1, tmp_reg2, tmp_reg2;\
        ld [tmp_reg1], tmp_reg3;\
        ld [tmp_reg2], tmp_reg4;\
        cas [tmp_reg1], tmp_reg3, tmp_reg3;\
        cas [tmp_reg1], tmp_reg3, tmp_reg3;\
        cas [tmp_reg2], tmp_reg4, tmp_reg4;\
        cas [tmp_reg2], tmp_reg4, tmp_reg4;

! CASTRAIN8
! yet another flavor of cas train theme that actually always use shared locations
! given by the specified instance arguments for the first 4 cases
! and then follows then with another 4 to a randomized offset

#define CASTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
  add VA_reg, VA_offset, tmp_reg1;\
  add VA_reg, (rand&0x0ffc), tmp_reg2;\
  ld [tmp_reg1], tmp_reg3;\
  cas [tmp_reg1], tmp_reg3, tmp_reg3;\
  cas [tmp_reg1], tmp_reg3, tmp_reg3;\
  cas [tmp_reg1], tmp_reg3, tmp_reg3;\
  cas [tmp_reg1], tmp_reg3, tmp_reg3;\
  ld  [tmp_reg2], tmp_reg4;\
  cas [tmp_reg2], tmp_reg4, tmp_reg4;\
  cas [tmp_reg2], tmp_reg4, tmp_reg4;\
  cas [tmp_reg2], tmp_reg4, tmp_reg4;\
  cas [tmp_reg2], tmp_reg4, tmp_reg4;

! Macro ST_BR_ANLD_CAS
! this is meant to reproduce NG6025
! the scenario is the anulled load in the delay slot of the branch is 
! not wiped completely, which creates false RAW hazard, and the following cas
! is getting screwed
! WARNING: there is a store to the %i0+128, which can potentially be a shared 
! location. When using this macro, make sure that the vicinity of offset 128 in
! region 0 is not used

#define ST_BR_ANLD_CAS(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 128, tmp_reg1;\
        add %i0, tmp_reg1, tmp_reg1;\
        set rand, tmp_reg3;\
        stw tmp_reg3, [tmp_reg1];\
        ba,a 1;\
        cas [tmp_reg1], tmp_reg3, tmp_reg4;

#define ASI_BLOCK(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
        setx 0x060, tmp_reg1, tmp_reg2; \
        stxa %g0, [tmp_reg2] 0x38;

! Macro SELF_MODIFY
! do a read-unmodify-write at address pc + random[0..0x80]
! this is targetted to catch bugs due to sharing/modification
! of data between D$ and I$. (e.g. Niagara1, Bug #6372)
! 1. 0x80 chosen arbitrarily, is another number better
! 2. should we include an iflush ?
! 3. WT.MACRO.SELF_MODIFY should be given a small non-0 weight by default
! 4. Possible variation: a macro which only does a load
!    from the instruction stream instead of a load-store. 
!    (Niagara1 bug #6372 did not involve stores to instruction
!    stream, just sharing of unmodified data between I$ and D$.)
! 5. this macro needs text segment to be writable. On system runs,
!    this is achieved by using a special map file for the linker.
! - sgh, 25 may 04

#define SELF_MODIFY(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
	rd    %pc, tmp_reg0; \
	ld    [ tmp_reg0 + (rand & 0x7c)], tmp_reg1; \
	st    tmp_reg1, [ tmp_reg0 + (rand & 0x7c)] 

#define ASI_BLOCK(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
        setx 0x060, tmp_reg1, tmp_reg2; \
        stxa %g0, [tmp_reg2] 0x38;


#define ASI_BLOCK_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
        setx 0x8559e06ff33bad10, tmp_reg1, tmp_reg2; \
        stxa %g0, [tmp_reg2] 0x80;
	
#define PREFETCH_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        setx 0x8559e06ff33bad10, tmp_reg1, tmp_reg2; \
        prefetch [tmp_reg2], 0; \
        prefetch [tmp_reg2+4], 1; \
        prefetch [tmp_reg2+8], 2; \
        prefetch [tmp_reg2+12], 3; \
        prefetch [tmp_reg2+4], 4; \
        prefetch [tmp_reg2], 5; \
        prefetch [tmp_reg2+12], 6; \
        prefetch [tmp_reg2+8], 7;

#define LOAD_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        setx 0x8559e06ff33bad10, tmp_reg1, tmp_reg2; \
        ld [tmp_reg2], tmp_reg1; \
        ld [tmp_reg2+4], tmp_reg1; \
        ld [tmp_reg2+8], tmp_reg1; \
        ld [tmp_reg2+12], tmp_reg1;



#define STORE_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        setx 0x8559e06ff33bad10, tmp_reg2, tmp_reg1; \
        set rand, tmp_reg2; \
        add tmp_reg2, rand % 4096, tmp_reg3; \
        stw tmp_reg2, [tmp_reg1]; \
        stw tmp_reg2, [tmp_reg1+4]; \
        stw tmp_reg2, [tmp_reg1+8]; \
        stw tmp_reg2, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1+4]; \
        stw tmp_reg3, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1]; \
        stw tmp_reg3, [tmp_reg1+8];	

#define CAS_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        setx 0x8559e06ff33bad10, tmp_reg3, tmp_reg1; \
        setx 0x8559e06ff33bad10, tmp_reg3, tmp_reg2; \
        add tmp_reg2, rand % 4096, tmp_reg3; \
        cas [tmp_reg1], tmp_reg3, tmp_reg3;\
        cas [tmp_reg2], tmp_reg4, tmp_reg4;

#define IDC_FLIP(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        ta 0xb5; \
		ta T_CHANGE_NONHPRIV;

! this macro produce ldda/stda to 
! ASI_BLOCK_AS_IF_USER_PRIMARY            0x16
! ASI_BLOCK_AS_IF_USER_SECONDARY          0x17
! ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE     0x1e
! ASI_BLOCK_AS_IF_USER_SECONDARY_LITTLE   0x1f
!! hardcode for now since illegal asi not working in RS
#define BLD_16(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   ldda [tmp_reg3]0x16, tmp_reg0;
#define BLD_17(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   ldda [tmp_reg3]0x17, tmp_reg0;
#define BLD_1e(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   ldda [tmp_reg3]0x1e, tmp_reg0;
#define BLD_1f(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   ldda [tmp_reg3]0x1f, tmp_reg0;

#define BST_16(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   stda tmp_reg0, [tmp_reg3]0x16;
#define BST_17(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   stda tmp_reg0, [tmp_reg3]0x17;
#define BST_1e(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   stda tmp_reg0, [tmp_reg3]0x1e;
#define BST_1f(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   stda tmp_reg0, [tmp_reg3]0x1f;

#define BLD_INIT_2(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ldda [tmp_reg3] (0x27 | (rand & 0xf)), tmp_reg0;
#define BST_INIT_2(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   stda tmp_reg0, [tmp_reg3] (0x27 | (rand & 0xf));
#define BLD_INIT_E(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ldda [tmp_reg3] (0xe2 | (rand & 0xb)), tmp_reg0;
#define BST_INIT_E(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   stda tmp_reg0, [tmp_reg3] (0xe2 | (rand & 0xb));
#define PREFETCHA(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0x00ff), tmp_reg3; \
   prefetch [%i1], (rand & 0x1f); \
   prefetch [%i1 + ((rand >> 5) & 0x1f)], ((rand >> 5) & 0x1f); \
   prefetcha [%i1]((rand >> 5) & 0x1f), (0x0 | ((rand >> 5) & 0x1f));
#define STBYTE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        add  VA_reg, (VA_offset & 0xff00), tmp_reg1; \
        set rand, tmp_reg2; \
        stb tmp_reg2, [tmp_reg1+(rand & 0x5f)];
#define LDBYTE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        add  VA_reg, (VA_offset & 0xff00), tmp_reg1; \
        ldub [tmp_reg1+(rand & 0x5f)], tmp_reg2;
#define STBYTE1(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        add  VA_reg, (VA_offset & 0xff00), tmp_reg1;\
		set 5200, tmp_reg2; \
		add tmp_reg2, tmp_reg1, tmp_reg1; \
		set rand, tmp_reg2; \
		stb tmp_reg2, [tmp_reg1+(rand & 0x5f)];
#define STINT(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set rand, tmp_reg1; \
        stha  tmp_reg1,[%g0+%g0](0x73); \
        stda tmp_reg1, [%g0+%g0](0x73);
define(EN_INTERRUPTS,`
nop
')

define(DIS_INTERRUPTS,`
nop
')

define(CHECK_DISPATCH_STATUS,`
nop
')

define(CHECK_RECEIVE_STATUS,`
nop
')

define(WRITE_INTR_DATA_REGS,`
nop
')

define(INTR_SET_DISPATCH_VECTOR,`
add      %g0, $3, $4
sllx     $4, 8,  $5      ! DEST ID
add      %g0, $2, $4      ! VECTOR NUMBER
or       $5, $4, $5
mov      %i0, $4
mov      $5, %i0
ta       0x30
mov      $4, %i0
')

define(DSPCH_INTERRUPT,`
nop
')

#define REGION0_ALIAS0_O 0x0
#define REGION1_ALIAS0_O 0x2000
#define REGION2_ALIAS0_O 0x4000
#define REGION3_ALIAS0_O 0x6000
#define REGION4_ALIAS0_O 0x8000
#define REGION5_ALIAS0_O 0xa000
#define REGION6_ALIAS0_O 0xc000
#define REGION7_ALIAS0_O 0xe000
#define REPLACEMENT0_ALIAS0_O 0x10000


#define USER_PAGE_CUSTOM_MAP
SECTION .MAIN TEXT_VA=0x1000000
attr_text {
	Name = .MAIN,
	VA=0x1000000,
	RA=0x130000000,
	PA=ra2pa(0x130000000,0),
part_0_ctx_nonzero_tsb_config_1,
 TTE_EP=1,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=0
	}

attr_text {
	Name = .MAIN,
	VA=0x1000000,
	RA=0x130000000,
	PA=ra2pa(0x130000000,0),
part_0_ctx_nonzero_tsb_config_0,
 TTE_EP=1,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

SECTION tsotool_unshared_data DATA_VA=0x21400000
attr_data {
	Name = tsotool_unshared_data,
	VA=0x21400000,
	RA=0x21400000,
	PA=ra2pa(0x21400000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region0_alias0 DATA_VA=0x6000000
attr_data {
	Name = region0_alias0,
	VA=0x6000000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region1_alias0 DATA_VA=0x6002000
attr_data {
	Name = region1_alias0,
	VA=0x6002000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region2_alias0 DATA_VA=0x6004000
attr_data {
	Name = region2_alias0,
	VA=0x6004000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region3_alias0 DATA_VA=0x6006000
attr_data {
	Name = region3_alias0,
	VA=0x6006000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region4_alias0 DATA_VA=0x6008000
attr_data {
	Name = region4_alias0,
	VA=0x6008000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region5_alias0 DATA_VA=0x600a000
attr_data {
	Name = region5_alias0,
	VA=0x600a000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region6_alias0 DATA_VA=0x600c000
attr_data {
	Name = region6_alias0,
	VA=0x600c000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region7_alias0 DATA_VA=0x600e000
attr_data {
	Name = region7_alias0,
	VA=0x600e000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement0_alias0 DATA_VA=0x6010000
attr_data {
	Name = replacement0_alias0,
	VA=0x6010000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement1_alias0 DATA_VA=0x6012000
attr_data {
	Name = replacement1_alias0,
	VA=0x6012000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement2_alias0 DATA_VA=0x6014000
attr_data {
	Name = replacement2_alias0,
	VA=0x6014000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement3_alias0 DATA_VA=0x6016000
attr_data {
	Name = replacement3_alias0,
	VA=0x6016000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement4_alias0 DATA_VA=0x6018000
attr_data {
	Name = replacement4_alias0,
	VA=0x6018000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement5_alias0 DATA_VA=0x601a000
attr_data {
	Name = replacement5_alias0,
	VA=0x601a000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement6_alias0 DATA_VA=0x601c000
attr_data {
	Name = replacement6_alias0,
	VA=0x601c000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement7_alias0 DATA_VA=0x601e000
attr_data {
	Name = replacement7_alias0,
	VA=0x601e000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION non_fault_area_4 DATA_VA=0x0
attr_data {
	Name = non_fault_area_4,
	VA=0x0,
	RA=0x47002000,
	PA=ra2pa(0x47002000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=1,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=1,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region0_alias0_8 DATA_VA=0x6000000
attr_data {
	Name = region0_alias0_8,
	VA=0x6000000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region1_alias0_8 DATA_VA=0x6002000
attr_data {
	Name = region1_alias0_8,
	VA=0x6002000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region2_alias0_8 DATA_VA=0x6004000
attr_data {
	Name = region2_alias0_8,
	VA=0x6004000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region3_alias0_8 DATA_VA=0x6006000
attr_data {
	Name = region3_alias0_8,
	VA=0x6006000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region4_alias0_8 DATA_VA=0x6008000
attr_data {
	Name = region4_alias0_8,
	VA=0x6008000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region5_alias0_8 DATA_VA=0x600a000
attr_data {
	Name = region5_alias0_8,
	VA=0x600a000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region6_alias0_8 DATA_VA=0x600c000
attr_data {
	Name = region6_alias0_8,
	VA=0x600c000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region7_alias0_8 DATA_VA=0x600e000
attr_data {
	Name = region7_alias0_8,
	VA=0x600e000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement0_alias0_8 DATA_VA=0x6010000
attr_data {
	Name = replacement0_alias0_8,
	VA=0x6010000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement1_alias0_8 DATA_VA=0x6012000
attr_data {
	Name = replacement1_alias0_8,
	VA=0x6012000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement2_alias0_8 DATA_VA=0x6014000
attr_data {
	Name = replacement2_alias0_8,
	VA=0x6014000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement3_alias0_8 DATA_VA=0x6016000
attr_data {
	Name = replacement3_alias0_8,
	VA=0x6016000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement4_alias0_8 DATA_VA=0x6018000
attr_data {
	Name = replacement4_alias0_8,
	VA=0x6018000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement5_alias0_8 DATA_VA=0x601a000
attr_data {
	Name = replacement5_alias0_8,
	VA=0x601a000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement6_alias0_8 DATA_VA=0x601c000
attr_data {
	Name = replacement6_alias0_8,
	VA=0x601c000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement7_alias0_8 DATA_VA=0x601e000
attr_data {
	Name = replacement7_alias0_8,
	VA=0x601e000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION non_fault_area_8 DATA_VA=0x0
attr_data {
	Name = non_fault_area_8,
	VA=0x0,
	RA=0x47002000,
	PA=ra2pa(0x47002000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=SCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=1,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=1,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region0_alias0_0 DATA_VA=0x6000000
attr_data {
	Name = region0_alias0_0,
	VA=0x6000000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region1_alias0_0 DATA_VA=0x6002000
attr_data {
	Name = region1_alias0_0,
	VA=0x6002000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region2_alias0_0 DATA_VA=0x6004000
attr_data {
	Name = region2_alias0_0,
	VA=0x6004000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region3_alias0_0 DATA_VA=0x6006000
attr_data {
	Name = region3_alias0_0,
	VA=0x6006000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region4_alias0_0 DATA_VA=0x6008000
attr_data {
	Name = region4_alias0_0,
	VA=0x6008000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region5_alias0_0 DATA_VA=0x600a000
attr_data {
	Name = region5_alias0_0,
	VA=0x600a000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region6_alias0_0 DATA_VA=0x600c000
attr_data {
	Name = region6_alias0_0,
	VA=0x600c000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region7_alias0_0 DATA_VA=0x600e000
attr_data {
	Name = region7_alias0_0,
	VA=0x600e000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement0_alias0_0 DATA_VA=0x6010000
attr_data {
	Name = replacement0_alias0_0,
	VA=0x6010000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement1_alias0_0 DATA_VA=0x6012000
attr_data {
	Name = replacement1_alias0_0,
	VA=0x6012000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement2_alias0_0 DATA_VA=0x6014000
attr_data {
	Name = replacement2_alias0_0,
	VA=0x6014000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement3_alias0_0 DATA_VA=0x6016000
attr_data {
	Name = replacement3_alias0_0,
	VA=0x6016000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement4_alias0_0 DATA_VA=0x6018000
attr_data {
	Name = replacement4_alias0_0,
	VA=0x6018000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement5_alias0_0 DATA_VA=0x601a000
attr_data {
	Name = replacement5_alias0_0,
	VA=0x601a000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement6_alias0_0 DATA_VA=0x601c000
attr_data {
	Name = replacement6_alias0_0,
	VA=0x601c000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement7_alias0_0 DATA_VA=0x601e000
attr_data {
	Name = replacement7_alias0_0,
	VA=0x601e000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024


!------------------------------------------------------------------------

SECTION tsotool_unshared_data
.global tsotool_unshared_data_start
.global res_buf_fp_p_0
.global res_buf_int_p_0
.global private_data_p0
.global stack_top_p0:
.global res_buf_fp_p_1
.global res_buf_int_p_1
.global private_data_p1
.global stack_top_p1:
.global res_buf_fp_p_2
.global res_buf_int_p_2
.global private_data_p2
.global stack_top_p2:
.global res_buf_fp_p_3
.global res_buf_int_p_3
.global private_data_p3
.global stack_top_p3:
.global res_buf_fp_p_4
.global res_buf_int_p_4
.global private_data_p4
.global stack_top_p4:
.global res_buf_fp_p_5
.global res_buf_int_p_5
.global private_data_p5
.global stack_top_p5:
.global res_buf_fp_p_6
.global res_buf_int_p_6
.global private_data_p6
.global stack_top_p6:
.global res_buf_fp_p_7
.global res_buf_int_p_7
.global private_data_p7
.global stack_top_p7:
.data
ALIGN_PAGE_512K
tsotool_unshared_data_start:
!-- label names of res_buf must match with extract_loads_m64.pl --
.align 64 ! for self bcopy()
res_buf_fp_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_1:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_1:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_2:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_2:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_3:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_3:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_4:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_4:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_5:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_5:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_6:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_6:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_7:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_7:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
private_data_p0:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p1:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p2:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p3:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p4:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p5:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p6:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p7:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
stack_top_p0:
	.skip 2048
stack_top_p1:
	.skip 2048
stack_top_p2:
	.skip 2048
stack_top_p3:
	.skip 2048
stack_top_p4:
	.skip 2048
stack_top_p5:
	.skip 2048
stack_top_p6:
	.skip 2048
stack_top_p7:
	.skip 2048
tsotool_unshared_data_end:
ALIGN_PAGE_512K
! to prevent VAs from running over from this section into shared regions

!------------------------------------------------------------------------

.seg "data"
! 8 shared memory regions, 0 alias(es) each (Alias 0 is normal VA)


SECTION region0_alias0
.global REGION0_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION0_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION0_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region1_alias0
.global REGION1_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION1_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION1_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region2_alias0
.global REGION2_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION2_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION2_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region3_alias0
.global REGION3_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION3_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION3_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region4_alias0
.global REGION4_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION4_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION4_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region5_alias0
.global REGION5_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION5_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION5_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region6_alias0
.global REGION6_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION6_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION6_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region7_alias0
.global REGION7_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION7_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION7_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement0_alias0
.global REPLACEMENT0_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT0_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT0_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement1_alias0
.global REPLACEMENT1_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT1_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT1_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement2_alias0
.global REPLACEMENT2_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT2_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT2_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement3_alias0
.global REPLACEMENT3_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT3_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT3_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement4_alias0
.global REPLACEMENT4_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT4_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT4_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement5_alias0
.global REPLACEMENT5_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT5_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT5_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement6_alias0
.global REPLACEMENT6_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT6_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT6_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement7_alias0
.global REPLACEMENT7_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT7_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT7_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

SECTION .MAIN
.global local_trap_handlers_start
.global local_trap_handlers_end.global extern_interrupt_handler
.text
ALIGN_PAGE_8K
local_trap_handlers_start:

.align 64
extern_interrupt_handler:
stxa  %g0, [%g0]ASI_INTR_RECEIVE
retry

local_trap_handlers_end:

SECTION .MAIN
.global main
.global tsotool_text_start
.global irepl_text_start
.text
ba user_text_start
nop
ALIGN_PAGE_64K
irepl_text_start:
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
ALIGN_PAGE_64K
user_text_start:
ba main
nop
user_text_end:

ALIGN_PAGE_64K
tsotool_text_start:
main:
	mov     0, %o0
	mov     0, %o1
	CHECK_PROC_ID
! at this point, g1 should have CPU id (0, 1, 2, ...)
	set     REGION0_ALIAS0_START, %o0	! shared address 0
	set     REGION1_ALIAS0_START, %o1	! shared address 1
	cmp     %g1, 0x7
	be      setup_p7
	nop
	cmp     %g1, 0x6
	be      setup_p6
	nop
	cmp     %g1, 0x5
	be      setup_p5
	nop
	cmp     %g1, 0x4
	be      setup_p4
	nop
	cmp     %g1, 0x3
	be      setup_p3
	nop
	cmp     %g1, 0x2
	be      setup_p2
	nop
	cmp     %g1, 0x1
	be      setup_p1
	nop
	cmp     %g1, 0x0
	be      setup_p0
	nop
	EXIT_BAD   ! Should never reach here
	nop

setup_p0:
	setx    stack_top_p0, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_0, %g1, %o4
	setx    private_data_p0, %g1, %o5
	setx    func0, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p1:
	setx    stack_top_p1, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_1, %g1, %o4
	setx    private_data_p1, %g1, %o5
	setx    func1, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p2:
	setx    stack_top_p2, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_2, %g1, %o4
	setx    private_data_p2, %g1, %o5
	setx    func2, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p3:
	setx    stack_top_p3, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_3, %g1, %o4
	setx    private_data_p3, %g1, %o5
	setx    func3, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p4:
	setx    stack_top_p4, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_4, %g1, %o4
	setx    private_data_p4, %g1, %o5
	setx    func4, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p5:
	setx    stack_top_p5, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_5, %g1, %o4
	setx    private_data_p5, %g1, %o5
	setx    func5, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p6:
	setx    stack_top_p6, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_6, %g1, %o4
	setx    private_data_p6, %g1, %o5
	setx    func6, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p7:
	setx    stack_top_p7, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_7, %g1, %o4
	setx    private_data_p7, %g1, %o5
	setx    func7, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop
#define    NO_REAL_CPUS_MINUS_1    7

!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func0:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x00deade1), %l6
or    %l6, %lo(0x00deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1), %l4
or    %l4, %lo(0x1), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x3f800001), %l6
or    %l6, %lo(0x3f800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34000000), %l6
or    %l6, %lo(0x34000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x7bfe^4
sethi %hi(0x7bfe), %l0
or    %l0, %lo(0x7bfe), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES0: ! Test instruction sequence for ISTREAM 0 begins

P1: !_REPLACEMENT [8] (Int) (Loop entry)
sethi %hi(0x5), %l2
or %l2, %lo(0x5),  %l2
loop_entry_0_0:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P2: !_LD [33] (Int) (Branch target of P181)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P3
nop

TARGET181:
ba RET181
nop


P3: !_ST [17] (maybe <- 0x1) (Int) (Branch target of P7)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 96 ]
add   %l4, 1, %l4
ba P4
nop

TARGET7:
ba RET7
nop


P4: !_MEMBAR (FP)
membar #StoreLoad

P5: !_BLD [21] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f0
membar #Sync
! 3 addresses covered
fmovd %f8, %f2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET5
nop
RET5:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P6: !_MEMBAR (FP)

P7: !_LD [2] (Int) (CBR)
lduw [%i0 + 8], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET7
nop
RET7:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P8: !_MEMBAR (FP)
membar #StoreLoad

P9: !_BLD [23] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P10: !_MEMBAR (FP)

P11: !_BST [22] (maybe <- 0x3f800001) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET11
nop
RET11:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P12: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET12
nop
RET12:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P13: !_BST [1] (maybe <- 0x3f800004) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P14: !_MEMBAR (FP) (Secondary ctx)

P15: !_BSTC [31] (maybe <- 0x3f800009) (FP) (Branch target of P216)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 192 ] %asi
ba P16
nop

TARGET216:
ba RET216
nop


P16: !_MEMBAR (FP)

P17: !_BSTC [6] (maybe <- 0x3f80000a) (FP) (Branch target of P53)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P18
nop

TARGET53:
ba RET53
nop


P18: !_MEMBAR (FP)
membar #StoreLoad

P19: !_REPLACEMENT [29] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+64], %l7
st %l7, [%i2+64]
add %i2, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P20: !_REPLACEMENT [16] (Int)
sethi %hi(0x2000), %o5
ld [%i2+16], %l6
st %l6, [%i2+16]
add %i2, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]

P21: !_MEMBAR (FP)

P22: !_BST [30] (maybe <- 0x3f80000c) (FP) (CBR) (Branch target of P57)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET22
nop
RET22:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P23
nop

TARGET57:
ba RET57
nop


P23: !_MEMBAR (FP)
membar #StoreLoad

P24: !_REPLACEMENT [25] (Int)
sethi %hi(0x2000), %l7
ld [%i2+96], %l3
st %l3, [%i2+96]
add %i2, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

P25: !_IDC_FLIP [33] (Int) (Branch target of P86)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
IDC_FLIP(25, 17498, 0, 0x46800000, 0x0, %i3, 0x0, %l6, %l7, %o5, %l3)
ba P26
nop

TARGET86:
ba RET86
nop


P26: !_LD [22] (FP) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 4], %f6
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET26
nop
RET26:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P27: !_ST [17] (maybe <- 0x3f80000d) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 96 ]

P28: !_MEMBAR (FP)
membar #StoreLoad

P29: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f18, %f9
fmovd %f36, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P30: !_MEMBAR (FP) (Branch target of P87)
ba P31
nop

TARGET87:
ba RET87
nop


P31: !_REPLACEMENT [2] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+8], %o5
st %o5, [%i2+8]
add %i2, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET31
nop
RET31:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P32: !_MEMBAR (FP) (Branch target of P64)
ba P33
nop

TARGET64:
ba RET64
nop


P33: !_BST [18] (maybe <- 0x3f80000e) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P34: !_MEMBAR (FP)

P35: !_BST [7] (maybe <- 0x3f80000f) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET35
nop
RET35:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P36: !_MEMBAR (FP)
membar #StoreLoad

P37: !_BLD [20] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET37
nop
RET37:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P38: !_MEMBAR (FP)

P39: !_ST [23] (maybe <- 0x2) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P40: !_IDC_FLIP [8] (Int)
IDC_FLIP(40, 16893, 0, 0x43800000, 0x0, %i1, 0x0, %l6, %l7, %o5, %l3)

P41: !_MEMBAR (FP)

P42: !_BSTC [3] (maybe <- 0x3f800010) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P43: !_MEMBAR (FP)
membar #StoreLoad

P44: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P45: !_MEMBAR (FP)

P46: !_BLD [27] (FP) (CBR) (Branch target of P5)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET46
nop
RET46:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P47
nop

TARGET5:
ba RET5
nop


P47: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET47
nop
RET47:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P48: !_REPLACEMENT [30] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+128], %l3
st %l3, [%i2+128]
add %i2, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]

P49: !_MEMBAR (FP)

P50: !_BST [24] (maybe <- 0x3f800015) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P51: !_MEMBAR (FP)

P52: !_BSTC [0] (maybe <- 0x3f800017) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P53: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET53
nop
RET53:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P54: !_LD [24] (FP)
ld [%i3 + 64], %f0
! 1 addresses covered

P55: !_MEMBAR (FP)
membar #StoreLoad

P56: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P57: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET57
nop
RET57:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P58: !_REPLACEMENT [28] (Int) (CBR) (Branch target of P235)
sethi %hi(0x2000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET58
nop
RET58:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P59
nop

TARGET235:
ba RET235
nop


P59: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P60: !_BLD [23] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P61: !_MEMBAR (FP) (Secondary ctx) (Branch target of P206)
ba P62
nop

TARGET206:
ba RET206
nop


P62: !_BST [0] (maybe <- 0x3f80001c) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P63: !_MEMBAR (FP)
membar #StoreLoad

P64: !_LD [31] (Int) (CBR)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET64
nop
RET64:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P65: !_MEMBAR (FP)
membar #StoreLoad

P66: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f6
fmovd %f34, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P67: !_MEMBAR (FP) (Branch target of P136)
ba P68
nop

TARGET136:
ba RET136
nop


P68: !_LD [27] (Int) (CBR) (Branch target of P84)
lduw [%i3 + 160], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET68
nop
RET68:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P69
nop

TARGET84:
ba RET84
nop


P69: !_MEMBAR (FP)

P70: !_BST [11] (maybe <- 0x3f800021) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P71: !_MEMBAR (FP)

P72: !_BST [8] (maybe <- 0x3f800024) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P73: !_MEMBAR (FP)
membar #StoreLoad

P74: !_BLD [10] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P75: !_MEMBAR (FP)

P76: !_REPLACEMENT [15] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+128], %l7
st %l7, [%i2+128]
add %i2, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET76
nop
RET76:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P77: !_MEMBAR (FP)
membar #StoreLoad

P78: !_BLD [30] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

P79: !_MEMBAR (FP)

P80: !_LD [32] (Int) (Branch target of P88)
lduw [%i3 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P81
nop

TARGET88:
ba RET88
nop


P81: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET81
nop
RET81:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P82: !_BLD [2] (FP) (Branch target of P93)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f36, %f0
fmovd %f40, %f18
fmovs %f18, %f1
ba P83
nop

TARGET93:
ba RET93
nop


P83: !_MEMBAR (FP)

P84: !_BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET84
nop
RET84:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P85: !_MEMBAR (FP)

P86: !_REPLACEMENT [18] (Int) (CBR)
sethi %hi(0x2000), %l3
ld [%i2+128], %l7
st %l7, [%i2+128]
add %i2, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET86
nop
RET86:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P87: !_LD [6] (FP) (CBR)
ld [%i0 + 96], %f3
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET87
nop
RET87:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P88: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET88
nop
RET88:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P89: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f4
fmovd %f40, %f6

P90: !_MEMBAR (FP)

P91: !_BSTC [2] (maybe <- 0x3f800026) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P92: !_MEMBAR (FP)

P93: !_BSTC [1] (maybe <- 0x3f80002b) (FP) (CBR) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET93
nop
RET93:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P94: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P95: !_PREFETCH [14] (Int) (LE) (Branch target of P22)
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 64] %asi, 1
ba P96
nop

TARGET22:
ba RET22
nop


P96: !_LD [18] (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 128], %f7
! 1 addresses covered

P97: !_LD [27] (FP) (CBR) (Branch target of P35)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 160], %f8
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET97
nop
RET97:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P98
nop

TARGET35:
ba RET35
nop


P98: !_ST [32] (maybe <- 0x3) (Int) (CBR)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 256 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET98
nop
RET98:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P99: !_IDC_FLIP [31] (Int)
IDC_FLIP(99, 12346, 0, 0x460000c0, 0xc0, %i2, 0xc0, %l6, %l7, %o5, %l3)

P100: !_MEMBAR (FP)
membar #StoreLoad

P101: !_BLD [26] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P102: !_MEMBAR (FP)

P103: !_IDC_FLIP [7] (Int)
IDC_FLIP(103, 25991, 0, 0x43000080, 0x80, %i0, 0x80, %l6, %l7, %o5, %l3)

P104: !_IDC_FLIP [17] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
IDC_FLIP(104, 14968, 0, 0x44800060, 0x60, %i3, 0x60, %l6, %l7, %o5, %l3)

P105: !_MEMBAR (FP) (Secondary ctx)

P106: !_BSTC [29] (maybe <- 0x3f800030) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P107: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P108: !_REPLACEMENT [29] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+64], %l7
st %l7, [%i2+64]
add %i2, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P109: !_PREFETCH [33] (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P110: !_REPLACEMENT [29] (Int)
sethi %hi(0x2000), %o5
ld [%i2+64], %l6
st %l6, [%i2+64]
add %i2, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

P111: !_MEMBAR (FP)

P112: !_BST [22] (maybe <- 0x3f800031) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P113: !_MEMBAR (FP)
membar #StoreLoad

P114: !_REPLACEMENT [12] (Int) (Branch target of P123)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
ba P115
nop

TARGET123:
ba RET123
nop


P115: !_MEMBAR (FP)

P116: !_BST [3] (maybe <- 0x3f800034) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P117: !_MEMBAR (FP)
membar #StoreLoad

P118: !_REPLACEMENT [9] (Int)
sethi %hi(0x2000), %o5
ld [%i3+32], %l6
st %l6, [%i3+32]
add %i3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P119: !_ST [8] (maybe <- 0x3f800039) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i1 + 0 ] %asi

P120: !_PREFETCH [12] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 4], 1

P121: !_MEMBAR (FP)
membar #StoreLoad

P122: !_BLD [32] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P123: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET123
nop
RET123:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P124: !_IDC_FLIP [11] (Int) (Branch target of P97)
IDC_FLIP(124, 11466, 0, 0x44000000, 0x0, %i2, 0x0, %l6, %l7, %o5, %l3)
ba P125
nop

TARGET97:
ba RET97
nop


P125: !_LD [2] (FP)
ld [%i0 + 8], %f12
! 1 addresses covered

P126: !_ST [24] (maybe <- 0x4) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P127: !_LD [27] (Int)
lduw [%i2 + 160], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P128: !_MEMBAR (FP)
membar #StoreLoad

P129: !_BLD [24] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovd %f40, %f14

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET129
nop
RET129:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P130: !_MEMBAR (FP)

P131: !_BST [11] (maybe <- 0x3f80003a) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET131
nop
RET131:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P132: !_MEMBAR (FP)
membar #StoreLoad

P133: !_REPLACEMENT [11] (Int) (Branch target of P160)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
ba P134
nop

TARGET160:
ba RET160
nop


P134: !_ST [12] (maybe <- 0x5) (Int) (CBR)
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET134
nop
RET134:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P135: !_PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P136: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET136
nop
RET136:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P137: !_BSTC [20] (maybe <- 0x3f80003d) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

P138: !_MEMBAR (FP) (Branch target of P76)
membar #StoreLoad
ba P139
nop

TARGET76:
ba RET76
nop


P139: !_LD [20] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
lduwa [%i3 + 256] %asi, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P140: !_MEMBAR (FP)

P141: !_BSTC [7] (maybe <- 0x3f80003e) (FP) (Branch target of P68)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi
ba P142
nop

TARGET68:
ba RET68
nop


P142: !_MEMBAR (FP) (Branch target of P134)
ba P143
nop

TARGET134:
ba RET134
nop


P143: !_BSTC [19] (maybe <- 0x3f80003f) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P144: !_MEMBAR (FP)
membar #StoreLoad

P145: !_BLD [8] (FP) (Branch target of P168)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0
ba P146
nop

TARGET168:
ba RET168
nop


P146: !_MEMBAR (FP)

P147: !_BSTC [11] (maybe <- 0x3f800040) (FP) (Branch target of P230)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P148
nop

TARGET230:
ba RET230
nop


P148: !_MEMBAR (FP) (Branch target of P58)
membar #StoreLoad
ba P149
nop

TARGET58:
ba RET58
nop


P149: !_PREFETCH [26] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 128], 1

P150: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET150
nop
RET150:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P151: !_BLD [16] (FP) (CBR) (Branch target of P37)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET151
nop
RET151:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P152
nop

TARGET37:
ba RET37
nop


P152: !_MEMBAR (FP)

P153: !_REPLACEMENT [17] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+96], %l6
st %l6, [%i3+96]
add %i3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]

P154: !_LD [12] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 4] %asi, %f2
! 1 addresses covered

P155: !_MEMBAR (FP) (Secondary ctx) (Branch target of P188)
ba P156
nop

TARGET188:
ba RET188
nop


P156: !_BST [9] (maybe <- 0x3f800043) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P157: !_MEMBAR (FP) (Secondary ctx)

P158: !_BST [29] (maybe <- 0x3f800045) (FP) (CBR) (Branch target of P158)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET158
nop
RET158:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P159
nop

TARGET158:
ba RET158
nop


P159: !_MEMBAR (FP) (Branch target of P190)
ba P160
nop

TARGET190:
ba RET190
nop


P160: !_BSTC [0] (maybe <- 0x3f800046) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET160
nop
RET160:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P161: !_MEMBAR (FP)
membar #StoreLoad

P162: !_PREFETCH [7] (Int)
prefetch [%i0 + 128], 1

P163: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P164: !_BLD [15] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P165: !_MEMBAR (FP) (Secondary ctx) (Branch target of P213)
ba P166
nop

TARGET213:
ba RET213
nop


P166: !_BLD [33] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P167: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET167
nop
RET167:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P168: !_ST [27] (maybe <- 0x6) (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 160 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET168
nop
RET168:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P169: !_PREFETCH [21] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET169
nop
RET169:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P170: !_LD [14] (Int) (Branch target of P169)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 64], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
ba P171
nop

TARGET169:
ba RET169
nop


P171: !_MEMBAR (FP) (Branch target of P223)
ba P172
nop

TARGET223:
ba RET223
nop


P172: !_BST [6] (maybe <- 0x3f80004b) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET172
nop
RET172:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P173: !_MEMBAR (FP)
membar #StoreLoad

P174: !_ST [33] (maybe <- 0x7) (Int) (LE) (Nucleus ctx)
wr %g0, 0xc, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l7, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
stwa   %l6, [%i3 + 0] %asi
add   %l4, 1, %l4

P175: !_MEMBAR (FP) (CBR) (Branch target of P11)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET175
nop
RET175:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P176
nop

TARGET11:
ba RET11
nop


P176: !_BLD [23] (FP) (Branch target of P81)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7
ba P177
nop

TARGET81:
ba RET81
nop


P177: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET177
nop
RET177:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P178: !_BLD [1] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P179: !_MEMBAR (FP) (Branch target of P167)
ba P180
nop

TARGET167:
ba RET167
nop


P180: !_BLD [22] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P181: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET181
nop
RET181:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P182: !_LD [17] (FP) (Branch target of P177)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 96], %f0
! 1 addresses covered
ba P183
nop

TARGET177:
ba RET177
nop


P183: !_LD [18] (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
lda    [%i3 + 128] %asi, %f1
! 1 addresses covered

P184: !_MEMBAR (FP)
membar #StoreLoad

P185: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f2

P186: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET186
nop
RET186:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P187: !_REPLACEMENT [5] (Int) (Branch target of P172)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
ba P188
nop

TARGET172:
ba RET172
nop


P188: !_MEMBAR (FP) (CBR) (Branch target of P150)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET188
nop
RET188:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P189
nop

TARGET150:
ba RET150
nop


P189: !_BLD [11] (FP) (Branch target of P129)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5
ba P190
nop

TARGET129:
ba RET129
nop


P190: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET190
nop
RET190:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P191: !_REPLACEMENT [28] (Int) (Secondary ctx) (Branch target of P12)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
ba P192
nop

TARGET12:
ba RET12
nop


P192: !_PREFETCH [4] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i0 + 32] %asi, 1

P193: !_PREFETCH [21] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 0] %asi, 1

P194: !_ST [24] (maybe <- 0x3f80004d) (FP) (CBR) (Branch target of P131)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET194
nop
RET194:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P195
nop

TARGET131:
ba RET131
nop


P195: !_ST [5] (maybe <- 0x8) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %l7
srl %l7, 8, %l7
sll %l4, 8, %l3
and %l3, %l6, %l3
or %l3, %l7, %l3
srl %l3, 16, %l7
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l7, %l3
stwa   %l3, [%i0 + 64] %asi
add   %l4, 1, %l4

P196: !_FLUSHI [0] (Int)
flush %g0 

P197: !_ST [4] (maybe <- 0x9) (Int) (Branch target of P151)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4
ba P198
nop

TARGET151:
ba RET151
nop


P198: !_REPLACEMENT [32] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+256], %l3
st %l3, [%i2+256]
add %i2, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]

P199: !_MEMBAR (FP)

P200: !_BSTC [23] (maybe <- 0x3f80004e) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P201: !_MEMBAR (FP) (Branch target of P212)
ba P202
nop

TARGET212:
ba RET212
nop


P202: !_BST [10] (maybe <- 0x3f800051) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P203: !_MEMBAR (FP) (Branch target of P186)
membar #StoreLoad
ba P204
nop

TARGET186:
ba RET186
nop


P204: !_ST [28] (maybe <- 0x3f800052) (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P205: !_MEMBAR (FP)
membar #StoreLoad

P206: !_BLD [3] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f6
fmovd %f34, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovd %f40, %f10

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET206
nop
RET206:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P207: !_MEMBAR (FP)

P208: !_ST [7] (maybe <- 0xa) (Int)
stw   %l4, [%i0 + 128 ]
add   %l4, 1, %l4

P209: !_MEMBAR (FP) (Branch target of P47)
ba P210
nop

TARGET47:
ba RET47
nop


P210: !_BST [15] (maybe <- 0x3f800053) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P211: !_MEMBAR (FP) (Branch target of P98)
membar #StoreLoad
ba P212
nop

TARGET98:
ba RET98
nop


P212: !_REPLACEMENT [1] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET212
nop
RET212:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P213: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET213
nop
RET213:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P214: !_BLD [14] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P215: !_MEMBAR (FP)

P216: !_BSTC [33] (maybe <- 0x3f800054) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET216
nop
RET216:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P217: !_MEMBAR (FP)

P218: !_BSTC [2] (maybe <- 0x3f800055) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P219: !_MEMBAR (FP) (Branch target of P194)
membar #StoreLoad
ba P220
nop

TARGET194:
ba RET194
nop


P220: !_ST [19] (maybe <- 0x3f80005a) (FP) (Branch target of P31)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]
ba P221
nop

TARGET31:
ba RET31
nop


P221: !_MEMBAR (FP)

P222: !_BST [10] (maybe <- 0x3f80005b) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P223: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET223
nop
RET223:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P224: !_REPLACEMENT [21] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P225: !_MEMBAR (FP) (Branch target of P175)
membar #StoreLoad
ba P226
nop

TARGET175:
ba RET175
nop


P226: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P227: !_MEMBAR (FP)

P228: !_BLD [26] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P229: !_MEMBAR (FP)

P230: !_LD [22] (Int) (CBR) (Secondary ctx) (Branch target of P46)
wr %g0, 0x81, %asi
lduwa [%i3 + 4] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET230
nop
RET230:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P231
nop

TARGET46:
ba RET46
nop


P231: !_MEMBAR (FP)
membar #StoreLoad

P232: !_BLD [33] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f0
membar #Sync
! 1 addresses covered

P233: !_MEMBAR (FP)

P234: !_BST [7] (maybe <- 0x3f80005c) (FP) (Branch target of P26)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi
ba P235
nop

TARGET26:
ba RET26
nop


P235: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET235
nop
RET235:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P236: !_LD [28] (Int) (Loop exit)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_0
nop

P237: !_MEMBAR (Int)
membar #StoreLoad

END_NODES0: ! Test instruction sequence for CPU 0 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
stw %l6, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func1:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l3
or    %l3, %lo(0xdeadbee0), %l3
stw   %l3, [%i5]
sethi %hi(0xdeadbee1), %l3
or    %l3, %lo(0xdeadbee1), %l3
stw   %l3, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x01deade1), %l3
or    %l3, %lo(0x01deade1), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x800001), %l4
or    %l4, %lo(0x800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40000001), %l3
or    %l3, %lo(0x40000001), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34800000), %l3
or    %l3, %lo(0x34800000), %l3
stw %l3, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x1a12^4
sethi %hi(0x1a12), %l0
or    %l0, %lo(0x1a12), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES1: ! Test instruction sequence for ISTREAM 1 begins

P238: !_MEMBAR (FP) (Loop entry) (CBR)
sethi %hi(0x3), %l2
or %l2, %lo(0x3),  %l2
loop_entry_1_0:
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET238
nop
RET238:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P239: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4

P240: !_MEMBAR (FP)

P241: !_IDC_FLIP [19] (Int) (Branch target of P469)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(241, 5930, 1, 0x45000000, 0x0, %i2, 0x0, %l6, %l7, %o5, %l3)
ba P242
nop

TARGET469:
ba RET469
nop


P242: !_MEMBAR (FP) (Branch target of P410)
membar #StoreLoad
ba P243
nop

TARGET410:
ba RET410
nop


P243: !_BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET243
nop
RET243:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P244: !_MEMBAR (FP)

P245: !_PREFETCH [13] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 32], 1

P246: !_REPLACEMENT [18] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+128], %l3
st %l3, [%i2+128]
add %i2, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET246
nop
RET246:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P247: !_LD [14] (FP) (CBR)
ld [%i3 + 64], %f7
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET247
nop
RET247:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P248: !_MEMBAR (FP) (Secondary ctx)

P249: !_BST [16] (maybe <- 0x40000001) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P250: !_MEMBAR (FP) (Secondary ctx) (Branch target of P480)
membar #StoreLoad
ba P251
nop

TARGET480:
ba RET480
nop


P251: !_BLD [5] (FP) (Branch target of P645)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9
ba P252
nop

TARGET645:
ba RET645
nop


P252: !_MEMBAR (FP)

P253: !_BSTC [14] (maybe <- 0x40000002) (FP) (CBR) (Branch target of P284)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET253
nop
RET253:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P254
nop

TARGET284:
ba RET284
nop


P254: !_MEMBAR (FP)
membar #StoreLoad

P255: !_REPLACEMENT [13] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+32], %l3
st %l3, [%i3+32]
add %i3, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

P256: !_PREFETCH [17] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 96], 1

P257: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET257
nop
RET257:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P258: !_BST [18] (maybe <- 0x40000003) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P259: !_MEMBAR (FP) (Branch target of P560)
membar #StoreLoad
ba P260
nop

TARGET560:
ba RET560
nop


P260: !_LD [24] (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 64], %f10
! 1 addresses covered

P261: !_REPLACEMENT [24] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+64], %o5
st %o5, [%i2+64]
add %i2, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET261
nop
RET261:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P262: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P262)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET262
nop
RET262:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P263
nop

TARGET262:
ba RET262
nop


P263: !_BST [24] (maybe <- 0x40000004) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P264: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P265: !_LD [22] (Int) (Branch target of P577)
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P266
nop

TARGET577:
ba RET577
nop


P266: !_MEMBAR (FP)

P267: !_BST [1] (maybe <- 0x40000006) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET267
nop
RET267:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P268: !_MEMBAR (FP)

P269: !_BSTC [13] (maybe <- 0x4000000b) (FP) (Branch target of P627)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P270
nop

TARGET627:
ba RET627
nop


P270: !_MEMBAR (FP)
membar #StoreLoad

P271: !_PREFETCH [31] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 192] %asi, 1

P272: !_LD [11] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P273: !_LD [9] (Int)
lduw [%i1 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P274: !_REPLACEMENT [20] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+256], %l3
st %l3, [%i3+256]
add %i3, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]

P275: !_REPLACEMENT [20] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l6
ld [%i3+256], %o5
st %o5, [%i3+256]
add %i3, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]

P276: !_MEMBAR (FP)
membar #StoreLoad

P277: !_BLD [21] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET277
nop
RET277:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P278: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET278
nop
RET278:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P279: !_BSTC [30] (maybe <- 0x4000000e) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P280: !_MEMBAR (FP)

P281: !_BSTC [15] (maybe <- 0x4000000f) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P282: !_MEMBAR (FP) (Branch target of P407)
membar #StoreLoad
ba P283
nop

TARGET407:
ba RET407
nop


P283: !_PREFETCH [12] (Int) (CBR)
prefetch [%i2 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET283
nop
RET283:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P284: !_LD [26] (FP) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 128], %f14
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET284
nop
RET284:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P285: !_MEMBAR (FP) (Branch target of P293)
membar #StoreLoad
ba P286
nop

TARGET293:
ba RET293
nop


P286: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P287: !_MEMBAR (FP)

P288: !_BST [0] (maybe <- 0x40000010) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P289: !_MEMBAR (FP) (Branch target of P634)
membar #StoreLoad
ba P290
nop

TARGET634:
ba RET634
nop


P290: !_REPLACEMENT [21] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P291: !_REPLACEMENT [1] (Int)
sethi %hi(0x2000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P292: !_REPLACEMENT [29] (Int) (CBR)
sethi %hi(0x2000), %o5
ld [%i3+64], %l6
st %l6, [%i3+64]
add %i3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET292
nop
RET292:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P293: !_PREFETCH [25] (Int) (LE) (CBR) (Secondary ctx)
wr %g0, 0x89, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 96] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET293
nop
RET293:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P294: !_MEMBAR (FP)
membar #StoreLoad

P295: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f0
membar #Sync
! 1 addresses covered

P296: !_MEMBAR (FP) (CBR) (Branch target of P654)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET296
nop
RET296:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P297
nop

TARGET654:
ba RET654
nop


P297: !_BST [33] (maybe <- 0x40000015) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET297
nop
RET297:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P298: !_MEMBAR (FP)

P299: !_BSTC [30] (maybe <- 0x40000016) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P300: !_MEMBAR (FP)

P301: !_BSTC [32] (maybe <- 0x40000017) (FP) (Secondary ctx) (Branch target of P401)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi
ba P302
nop

TARGET401:
ba RET401
nop


P302: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET302
nop
RET302:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P303: !_ST [19] (maybe <- 0x40000018) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 0 ] %asi

P304: !_MEMBAR (FP)
membar #StoreLoad

P305: !_BLD [9] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P306: !_MEMBAR (FP) (Branch target of P552)
ba P307
nop

TARGET552:
ba RET552
nop


P307: !_BST [26] (maybe <- 0x40000019) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET307
nop
RET307:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P308: !_MEMBAR (FP)
membar #StoreLoad

P309: !_PREFETCH [28] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P310: !_REPLACEMENT [15] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+128], %l6
st %l6, [%i2+128]
add %i2, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P311: !_MEMBAR (FP) (Secondary ctx) (Branch target of P624)
membar #StoreLoad
ba P312
nop

TARGET624:
ba RET624
nop


P312: !_BLD [15] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P313: !_MEMBAR (FP) (Secondary ctx)

P314: !_BSTC [22] (maybe <- 0x4000001b) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P315: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P316: !_BLD [30] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P317: !_MEMBAR (FP) (Secondary ctx) (Branch target of P261)
ba P318
nop

TARGET261:
ba RET261
nop


P318: !_BST [17] (maybe <- 0x4000001e) (FP) (Branch target of P529)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi
ba P319
nop

TARGET529:
ba RET529
nop


P319: !_MEMBAR (FP)
membar #StoreLoad

P320: !_PREFETCH [21] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P321: !_MEMBAR (FP)
membar #StoreLoad

P322: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P323: !_MEMBAR (FP)

P324: !_IDC_FLIP [6] (Int) (Branch target of P593)
IDC_FLIP(324, 27843, 1, 0x43000060, 0x60, %i0, 0x60, %l6, %l7, %o5, %l3)
ba P325
nop

TARGET593:
ba RET593
nop


P325: !_REPLACEMENT [24] (Int) (Nucleus ctx) (Branch target of P488)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+64], %o5
st %o5, [%i3+64]
add %i3, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
ba P326
nop

TARGET488:
ba RET488
nop


P326: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P327: !_BLD [4] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f6
fmovd %f34, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P328: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET328
nop
RET328:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P329: !_REPLACEMENT [26] (Int)
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P330: !_MEMBAR (FP)

P331: !_BSTC [14] (maybe <- 0x4000001f) (FP) (Branch target of P702)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi
ba P332
nop

TARGET702:
ba RET702
nop


P332: !_MEMBAR (FP)
membar #StoreLoad

P333: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P334: !_MEMBAR (FP)

P335: !_LD [8] (Int)
lduw [%i1 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P336: !_MEMBAR (FP) (Branch target of P579)
membar #StoreLoad
ba P337
nop

TARGET579:
ba RET579
nop


P337: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P338: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET338
nop
RET338:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P339: !_ST [21] (maybe <- 0x800001) (Int) (Branch target of P424)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
ba P340
nop

TARGET424:
ba RET424
nop


P340: !_ST [17] (maybe <- 0x40000020) (FP) (Secondary ctx) (Branch target of P528)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 96 ] %asi
ba P341
nop

TARGET528:
ba RET528
nop


P341: !_MEMBAR (FP)
membar #StoreLoad

P342: !_BLD [24] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P343: !_MEMBAR (FP)

P344: !_BST [7] (maybe <- 0x40000021) (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET344
nop
RET344:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P345: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET345
nop
RET345:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P346: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P347: !_MEMBAR (FP)

P348: !_ST [6] (maybe <- 0x40000022) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 96 ] %asi

P349: !_MEMBAR (FP)

P350: !_BSTC [9] (maybe <- 0x40000023) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P351: !_MEMBAR (FP) (Branch target of P475)
membar #StoreLoad
ba P352
nop

TARGET475:
ba RET475
nop


P352: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f4
fmovd %f40, %f6

P353: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET353
nop
RET353:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P354: !_BLD [17] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P355: !_MEMBAR (FP)

P356: !_BSTC [10] (maybe <- 0x40000025) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET356
nop
RET356:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P357: !_MEMBAR (FP)
membar #StoreLoad

P358: !_REPLACEMENT [19] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P359: !_MEMBAR (FP) (Secondary ctx) (Branch target of P428)
ba P360
nop

TARGET428:
ba RET428
nop


P360: !_BST [31] (maybe <- 0x40000026) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 192 ] %asi

P361: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET361
nop
RET361:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P362: !_BSTC [20] (maybe <- 0x40000027) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P363: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET363
nop
RET363:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P364: !_BLD [1] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P365: !_MEMBAR (FP)

P366: !_BST [5] (maybe <- 0x40000028) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P367: !_MEMBAR (FP)
membar #StoreLoad

P368: !_LD [16] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 16], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P369: !_REPLACEMENT [11] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P370: !_REPLACEMENT [16] (Int)
sethi %hi(0x2000), %o5
ld [%i2+16], %l6
st %l6, [%i2+16]
add %i2, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]

P371: !_LD [3] (Int)
lduw [%i0 + 16], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P372: !_MEMBAR (FP) (Secondary ctx)

P373: !_BSTC [28] (maybe <- 0x4000002a) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P374: !_MEMBAR (FP) (Secondary ctx)

P375: !_BSTC [25] (maybe <- 0x4000002b) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET375
nop
RET375:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P376: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET376
nop
RET376:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P377: !_BST [0] (maybe <- 0x4000002d) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET377
nop
RET377:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P378: !_MEMBAR (FP)
membar #StoreLoad

P379: !_BLD [10] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P380: !_MEMBAR (FP)

P381: !_REPLACEMENT [9] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+32], %l7
st %l7, [%i3+32]
add %i3, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P382: !_REPLACEMENT [32] (Int)
sethi %hi(0x2000), %o5
ld [%i3+256], %l6
st %l6, [%i3+256]
add %i3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]

P383: !_MEMBAR (FP) (Branch target of P533)
ba P384
nop

TARGET533:
ba RET533
nop


P384: !_BSTC [31] (maybe <- 0x40000032) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 192 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET384
nop
RET384:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P385: !_MEMBAR (FP) (CBR) (Branch target of P361)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET385
nop
RET385:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P386
nop

TARGET361:
ba RET361
nop


P386: !_BSTC [6] (maybe <- 0x40000033) (FP) (Branch target of P678)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P387
nop

TARGET678:
ba RET678
nop


P387: !_MEMBAR (FP) (Branch target of P414)
membar #StoreLoad
ba P388
nop

TARGET414:
ba RET414
nop


P388: !_LD [8] (Int)
lduw [%i1 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P389: !_MEMBAR (FP) (Secondary ctx)

P390: !_BSTC [6] (maybe <- 0x40000035) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P391: !_MEMBAR (FP) (Secondary ctx) (Branch target of P576)
membar #StoreLoad
ba P392
nop

TARGET576:
ba RET576
nop


P392: !_LD [3] (FP)
ld [%i0 + 16], %f14
! 1 addresses covered

P393: !_REPLACEMENT [32] (Int) (Secondary ctx) (Branch target of P638)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i3+256], %l6
st %l6, [%i3+256]
add %i3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
ba P394
nop

TARGET638:
ba RET638
nop


P394: !_ST [25] (maybe <- 0x800002) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 96 ]
add   %l4, 1, %l4

P395: !_MEMBAR (FP)

P396: !_BST [25] (maybe <- 0x40000037) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P397: !_MEMBAR (FP)
membar #StoreLoad

P398: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P399: !_MEMBAR (FP) (Branch target of P307)
ba P400
nop

TARGET307:
ba RET307
nop


P400: !_REPLACEMENT [19] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P401: !_MEMBAR (FP) (CBR) (Branch target of P419)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET401
nop
RET401:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P402
nop

TARGET419:
ba RET419
nop


P402: !_BLD [19] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f0
membar #Sync
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET402
nop
RET402:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P403: !_MEMBAR (FP)

P404: !_BSTC [19] (maybe <- 0x40000039) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P405: !_MEMBAR (FP) (Branch target of P292)
membar #StoreLoad
ba P406
nop

TARGET292:
ba RET292
nop


P406: !_LD [8] (Int)
lduw [%i1 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P407: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET407
nop
RET407:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P408: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P409: !_MEMBAR (FP)

P410: !_BSTC [27] (maybe <- 0x4000003a) (FP) (CBR) (Branch target of P257)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET410
nop
RET410:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P411
nop

TARGET257:
ba RET257
nop


P411: !_MEMBAR (FP)
membar #StoreLoad

P412: !_REPLACEMENT [19] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P413: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET413
nop
RET413:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P414: !_BLD [28] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET414
nop
RET414:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P415: !_MEMBAR (FP) (Branch target of P644)
ba P416
nop

TARGET644:
ba RET644
nop


P416: !_BSTC [11] (maybe <- 0x4000003c) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P417: !_MEMBAR (FP)

P418: !_BSTC [32] (maybe <- 0x4000003f) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P419: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET419
nop
RET419:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P420: !_BSTC [2] (maybe <- 0x40000040) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET420
nop
RET420:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P421: !_MEMBAR (FP)
membar #StoreLoad

P422: !_BLD [31] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 192] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P423: !_MEMBAR (FP)

P424: !_ST [27] (maybe <- 0x40000045) (FP) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 160 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET424
nop
RET424:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P425: !_MEMBAR (FP)

P426: !_BSTC [9] (maybe <- 0x40000046) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P427: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET427
nop
RET427:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P428: !_PREFETCH [3] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i0 + 16] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET428
nop
RET428:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P429: !_REPLACEMENT [16] (Int) (CBR) (Secondary ctx) (Branch target of P618)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+16], %l7
st %l7, [%i3+16]
add %i3, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET429
nop
RET429:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P430
nop

TARGET618:
ba RET618
nop


P430: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET430
nop
RET430:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P431: !_BST [3] (maybe <- 0x40000048) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P432: !_MEMBAR (FP) (Branch target of P454)
membar #StoreLoad
ba P433
nop

TARGET454:
ba RET454
nop


P433: !_ST [23] (maybe <- 0x800003) (Int) (Secondary ctx) (Branch target of P283)
wr %g0, 0x81, %asi
stwa   %l4, [%i2 + 32] %asi
add   %l4, 1, %l4
ba P434
nop

TARGET283:
ba RET283
nop


P434: !_MEMBAR (FP) (Branch target of P590)
ba P435
nop

TARGET590:
ba RET590
nop


P435: !_BST [26] (maybe <- 0x4000004d) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P436: !_MEMBAR (FP)
membar #StoreLoad

P437: !_LD [11] (FP) (Secondary ctx) (Branch target of P485)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 0] %asi, %f6
! 1 addresses covered
ba P438
nop

TARGET485:
ba RET485
nop


P438: !_LD [5] (FP)
ld [%i0 + 64], %f7
! 1 addresses covered

P439: !_LD [11] (Int)
lduw [%i2 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P440: !_LD [31] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 192], %f8
! 1 addresses covered

P441: !_LD [12] (FP) (Branch target of P384)
ld [%i2 + 4], %f9
! 1 addresses covered
ba P442
nop

TARGET384:
ba RET384
nop


P442: !_REPLACEMENT [23] (Int) (Secondary ctx) (Branch target of P238)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+32], %l7
st %l7, [%i2+32]
add %i2, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
ba P443
nop

TARGET238:
ba RET238
nop


P443: !_MEMBAR (FP)

P444: !_BSTC [20] (maybe <- 0x4000004f) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

P445: !_MEMBAR (FP)
membar #StoreLoad

P446: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f10
fmovd %f34, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P447: !_MEMBAR (FP)

P448: !_BSTC [6] (maybe <- 0x40000050) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P449: !_MEMBAR (FP)
membar #StoreLoad

P450: !_REPLACEMENT [20] (Int) (Secondary ctx) (Branch target of P328)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l6
ld [%i2+256], %o5
st %o5, [%i2+256]
add %i2, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
ba P451
nop

TARGET328:
ba RET328
nop


P451: !_MEMBAR (FP)
membar #StoreLoad

P452: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P453: !_MEMBAR (FP)

P454: !_PREFETCH [23] (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET454
nop
RET454:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P455: !_PREFETCH [5] (Int)
prefetch [%i0 + 64], 1

P456: !_PREFETCH [27] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
prefetcha [%i2 + 160] %asi, 1

P457: !_MEMBAR (FP)

P458: !_BSTC [29] (maybe <- 0x40000052) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET458
nop
RET458:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P459: !_MEMBAR (FP)

P460: !_BST [11] (maybe <- 0x40000053) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P461: !_MEMBAR (FP)

P462: !_BSTC [15] (maybe <- 0x40000056) (FP) (Branch target of P563)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi
ba P463
nop

TARGET563:
ba RET563
nop


P463: !_MEMBAR (FP)
membar #StoreLoad

P464: !_REPLACEMENT [8] (Int) (Branch target of P356)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
ba P465
nop

TARGET356:
ba RET356
nop


P465: !_PREFETCH [7] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
prefetcha [%i0 + 128] %asi, 1

P466: !_MEMBAR (FP)
membar #StoreLoad

P467: !_BLD [14] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P468: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET468
nop
RET468:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P469: !_BST [14] (maybe <- 0x40000057) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET469
nop
RET469:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P470: !_MEMBAR (FP)
membar #StoreLoad

P471: !_REPLACEMENT [8] (Int)
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P472: !_MEMBAR (FP)
membar #StoreLoad

P473: !_BLD [25] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f2
fmovd %f40, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET473
nop
RET473:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P474: !_MEMBAR (FP)

P475: !_BLD [6] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f4
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET475
nop
RET475:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P476: !_MEMBAR (FP)

P477: !_PREFETCH [12] (Int) (Branch target of P377)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 4], 1
ba P478
nop

TARGET377:
ba RET377
nop


P478: !_REPLACEMENT [20] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+256], %l7
st %l7, [%i2+256]
add %i2, %l3, %l6
ld [%l6+256], %l7
st %l7, [%l6+256]
add %l6, %l3, %l6
ld [%l6+256], %l7
st %l7, [%l6+256]
add %l6, %l3, %l6
ld [%l6+256], %l7
st %l7, [%l6+256]
add %l6, %l3, %l6
ld [%l6+256], %l7
st %l7, [%l6+256]
add %l6, %l3, %l6
ld [%l6+256], %l7
st %l7, [%l6+256]
add %l6, %l3, %l6
ld [%l6+256], %l7
st %l7, [%l6+256]
add %l6, %l3, %l6
ld [%l6+256], %l7
st %l7, [%l6+256]

P479: !_REPLACEMENT [5] (Int) (Branch target of P246)
sethi %hi(0x2000), %o5
ld [%i2+64], %l6
st %l6, [%i2+64]
add %i2, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
ba P480
nop

TARGET246:
ba RET246
nop


P480: !_ST [28] (maybe <- 0x800004) (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 0] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET480
nop
RET480:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P481: !_MEMBAR (FP) (Branch target of P247)
membar #StoreLoad
ba P482
nop

TARGET247:
ba RET247
nop


P482: !_BLD [30] (FP) (Branch target of P429)
wr %g0, 0xf0, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6
ba P483
nop

TARGET429:
ba RET429
nop


P483: !_MEMBAR (FP)

P484: !_REPLACEMENT [13] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l7
ld [%i2+32], %l3
st %l3, [%i2+32]
add %i2, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET484
nop
RET484:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P485: !_MEMBAR (FP) (CBR) (Branch target of P277)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET485
nop
RET485:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P486
nop

TARGET277:
ba RET277
nop


P486: !_BST [12] (maybe <- 0x40000058) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P487: !_MEMBAR (FP)
membar #StoreLoad

P488: !_ST [24] (maybe <- 0x4000005b) (FP) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET488
nop
RET488:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P489: !_MEMBAR (FP)

P490: !_BSTC [20] (maybe <- 0x4000005c) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P491: !_MEMBAR (FP)
membar #StoreLoad

P492: !_BLD [16] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f7

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET492
nop
RET492:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P493: !_MEMBAR (FP) (Branch target of P385)
ba P494
nop

TARGET385:
ba RET385
nop


P494: !_BLD [4] (FP) (Branch target of P537)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12
ba P495
nop

TARGET537:
ba RET537
nop


P495: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET495
nop
RET495:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P496: !_PREFETCH [5] (Int) (Branch target of P344)
prefetch [%i0 + 64], 1
ba P497
nop

TARGET344:
ba RET344
nop


P497: !_MEMBAR (FP)
membar #StoreLoad

P498: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P499: !_MEMBAR (FP) (CBR) (Branch target of P521)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET499
nop
RET499:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P500
nop

TARGET521:
ba RET521
nop


P500: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f34, %f0
fmovd %f36, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P501: !_MEMBAR (FP) (Branch target of P345)
ba P502
nop

TARGET345:
ba RET345
nop


P502: !_REPLACEMENT [11] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P503: !_LD [13] (Int) (CBR) (Branch target of P509)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET503
nop
RET503:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P504
nop

TARGET509:
ba RET509
nop


P504: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET504
nop
RET504:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P505: !_BST [31] (maybe <- 0x4000005d) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 192 ] %asi

P506: !_MEMBAR (FP)
membar #StoreLoad

P507: !_BLD [3] (FP) (Secondary ctx) (Branch target of P609)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f18, %f5
fmovd %f36, %f6
fmovd %f40, %f18
fmovs %f18, %f7
ba P508
nop

TARGET609:
ba RET609
nop


P508: !_MEMBAR (FP) (Secondary ctx)

P509: !_BLD [19] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET509
nop
RET509:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P510: !_MEMBAR (FP)

P511: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P512: !_MEMBAR (FP)

P513: !_ST [26] (maybe <- 0x800005) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P514: !_MEMBAR (FP)
membar #StoreLoad

P515: !_BLD [12] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f10
fmovd %f40, %f12

P516: !_MEMBAR (FP)

P517: !_ST [3] (maybe <- 0x4000005e) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 16 ]

P518: !_ST [27] (maybe <- 0x800006) (Int)
stw   %l4, [%i3 + 160 ]
add   %l4, 1, %l4

P519: !_MEMBAR (FP)
membar #StoreLoad

P520: !_BLD [9] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P521: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET521
nop
RET521:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P522: !_BST [29] (maybe <- 0x4000005f) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P523: !_MEMBAR (FP) (Branch target of P468)
membar #StoreLoad
ba P524
nop

TARGET468:
ba RET468
nop


P524: !_LD [33] (Int) (Branch target of P527)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P525
nop

TARGET527:
ba RET527
nop


P525: !_PREFETCH [23] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 32], 1

P526: !_ST [30] (maybe <- 0x40000060) (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 128 ]

P527: !_ST [33] (maybe <- 0x40000061) (FP) (CBR)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET527
nop
RET527:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P528: !_ST [16] (maybe <- 0x800007) (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 16] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET528
nop
RET528:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P529: !_LD [9] (FP) (CBR)
ld [%i1 + 32], %f15
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET529
nop
RET529:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P530: !_MEMBAR (FP) (Branch target of P363)
ba P531
nop

TARGET363:
ba RET363
nop


P531: !_BST [7] (maybe <- 0x40000062) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

P532: !_MEMBAR (FP) (Branch target of P297)
membar #StoreLoad
ba P533
nop

TARGET297:
ba RET297
nop


P533: !_BLD [30] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f0
membar #Sync
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET533
nop
RET533:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P534: !_MEMBAR (FP)

P535: !_LD [20] (Int) (Nucleus ctx) (Branch target of P296)
wr %g0, 0x4, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 256] %asi, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
ba P536
nop

TARGET296:
ba RET296
nop


P536: !_IDC_FLIP [13] (Int) (Branch target of P561)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
IDC_FLIP(536, 16690, 1, 0x44000020, 0x20, %i3, 0x20, %l6, %l7, %o5, %l3)
ba P537
nop

TARGET561:
ba RET561
nop


P537: !_REPLACEMENT [19] (Int) (CBR) (Branch target of P473)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET537
nop
RET537:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P538
nop

TARGET473:
ba RET473
nop


P538: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P539: !_BLD [10] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P540: !_MEMBAR (FP) (Secondary ctx)

P541: !_IDC_FLIP [21] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
IDC_FLIP(541, 10991, 1, 0x45800000, 0x0, %i3, 0x0, %l6, %l7, %o5, %l3)

P542: !_REPLACEMENT [2] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l6
ld [%i2+8], %o5
st %o5, [%i2+8]
add %i2, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]

P543: !_PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 96] %asi, 1

P544: !_PREFETCH [4] (Int)
prefetch [%i0 + 32], 1

P545: !_MEMBAR (FP)
membar #StoreLoad

P546: !_BLD [11] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f2
fmovd %f40, %f4

P547: !_MEMBAR (FP)

P548: !_LD [21] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
lduwa [%i3 + 0] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P549: !_PREFETCH [16] (Int) (CBR)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 16], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET549
nop
RET549:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P550: !_LD [5] (FP) (CBR) (Branch target of P302)
ld [%i0 + 64], %f5
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET550
nop
RET550:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P551
nop

TARGET302:
ba RET302
nop


P551: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P552: !_BLD [2] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f6
fmovd %f34, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovd %f40, %f10

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET552
nop
RET552:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P553: !_MEMBAR (FP) (Secondary ctx) (Branch target of P402)
ba P554
nop

TARGET402:
ba RET402
nop


P554: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P555: !_MEMBAR (FP)

P556: !_IDC_FLIP [22] (Int)
IDC_FLIP(556, 26988, 1, 0x45800004, 0x4, %i2, 0x4, %l6, %l7, %o5, %l3)

P557: !_MEMBAR (FP)
membar #StoreLoad

P558: !_BLD [24] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P559: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET559
nop
RET559:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P560: !_BSTC [18] (maybe <- 0x40000063) (FP) (CBR) (Branch target of P427)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET560
nop
RET560:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P561
nop

TARGET427:
ba RET427
nop


P561: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET561
nop
RET561:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P562: !_REPLACEMENT [17] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+96], %l6
st %l6, [%i3+96]
add %i3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]

P563: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET563
nop
RET563:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P564: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P565: !_MEMBAR (FP)

P566: !_BST [17] (maybe <- 0x40000064) (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET566
nop
RET566:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P567: !_MEMBAR (FP) (Secondary ctx) (Branch target of P243)
membar #StoreLoad
ba P568
nop

TARGET243:
ba RET243
nop


P568: !_PREFETCH [19] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

P569: !_REPLACEMENT [22] (Int) (Branch target of P430)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
ba P570
nop

TARGET430:
ba RET430
nop


P570: !_MEMBAR (FP)
membar #StoreLoad

P571: !_BLD [31] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 192] %asi, %f0
membar #Sync
! 1 addresses covered

P572: !_MEMBAR (FP)

P573: !_PREFETCH [31] (Int) (Branch target of P375)
prefetch [%i2 + 192], 1
ba P574
nop

TARGET375:
ba RET375
nop


P574: !_LD [23] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 32], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P575: !_MEMBAR (FP)
membar #StoreLoad

P576: !_BLD [24] (FP) (CBR) (Branch target of P623)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET576
nop
RET576:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P577
nop

TARGET623:
ba RET623
nop


P577: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET577
nop
RET577:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P578: !_PREFETCH [26] (Int)
prefetch [%i3 + 128], 1

P579: !_LD [2] (FP) (CBR) (Branch target of P549)
ld [%i0 + 8], %f3
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET579
nop
RET579:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P580
nop

TARGET549:
ba RET549
nop


P580: !_MEMBAR (FP)

P581: !_BSTC [32] (maybe <- 0x40000065) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P582: !_MEMBAR (FP)
membar #StoreLoad

P583: !_LD [0] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 0] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P584: !_MEMBAR (FP)

P585: !_BSTC [27] (maybe <- 0x40000066) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P586: !_MEMBAR (FP)

P587: !_BST [14] (maybe <- 0x40000068) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P588: !_MEMBAR (FP)
membar #StoreLoad

P589: !_BLD [10] (FP) (Secondary ctx) (Branch target of P484)
wr %g0, 0xf1, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4
ba P590
nop

TARGET484:
ba RET484
nop


P590: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET590
nop
RET590:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P591: !_PREFETCH [0] (Int) (Branch target of P278)
prefetch [%i0 + 0], 1
ba P592
nop

TARGET278:
ba RET278
nop


P592: !_REPLACEMENT [18] (Int) (Branch target of P611)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+128], %l6
st %l6, [%i3+128]
add %i3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
ba P593
nop

TARGET611:
ba RET611
nop


P593: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET593
nop
RET593:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P594: !_BLD [9] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P595: !_MEMBAR (FP)

P596: !_REPLACEMENT [18] (Int)
sethi %hi(0x2000), %o5
ld [%i3+128], %l6
st %l6, [%i3+128]
add %i3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P597: !_MEMBAR (FP)

P598: !_BST [1] (maybe <- 0x40000069) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P599: !_MEMBAR (FP)

P600: !_BST [5] (maybe <- 0x4000006e) (FP) (Branch target of P616)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P601
nop

TARGET616:
ba RET616
nop


P601: !_MEMBAR (FP)
membar #StoreLoad

P602: !_BLD [15] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P603: !_MEMBAR (FP)

P604: !_REPLACEMENT [33] (Int)
sethi %hi(0x2000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P605: !_MEMBAR (FP) (Branch target of P420)
membar #StoreLoad
ba P606
nop

TARGET420:
ba RET420
nop


P606: !_BLD [2] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P607: !_MEMBAR (FP)

P608: !_REPLACEMENT [21] (Int)
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P609: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET609
nop
RET609:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P610: !_BLD [15] (FP) (Branch target of P550)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
ba P611
nop

TARGET550:
ba RET550
nop


P611: !_MEMBAR (FP) (CBR) (Branch target of P566)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET611
nop
RET611:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P612
nop

TARGET566:
ba RET566
nop


P612: !_REPLACEMENT [29] (Int)
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P613: !_LD [28] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 0] %asi, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P614: !_MEMBAR (FP)
membar #StoreLoad

P615: !_BLD [24] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P616: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET616
nop
RET616:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P617: !_ST [23] (maybe <- 0x40000070) (FP) (Branch target of P504)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 32 ]
ba P618
nop

TARGET504:
ba RET504
nop


P618: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET618
nop
RET618:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P619: !_BST [19] (maybe <- 0x40000071) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P620: !_MEMBAR (FP) (Branch target of P495)
membar #StoreLoad
ba P621
nop

TARGET495:
ba RET495
nop


P621: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f0
membar #Sync
! 2 addresses covered
fmovs %f8, %f1

P622: !_MEMBAR (FP) (Branch target of P559)
ba P623
nop

TARGET559:
ba RET559
nop


P623: !_BST [25] (maybe <- 0x40000072) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET623
nop
RET623:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P624: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET624
nop
RET624:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P625: !_PREFETCH [23] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
prefetcha [%i3 + 32] %asi, 1

P626: !_MEMBAR (FP) (Branch target of P458)
membar #StoreLoad
ba P627
nop

TARGET458:
ba RET458
nop


P627: !_BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f2
fmovd %f34, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovd %f40, %f6

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET627
nop
RET627:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P628: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET628
nop
RET628:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P629: !_BST [24] (maybe <- 0x40000074) (FP) (Branch target of P338)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi
ba P630
nop

TARGET338:
ba RET338
nop


P630: !_MEMBAR (FP)
membar #StoreLoad

P631: !_BLD [23] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P632: !_MEMBAR (FP)

P633: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f10

P634: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET634
nop
RET634:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P635: !_REPLACEMENT [27] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+160], %l7
st %l7, [%i3+160]
add %i3, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]

P636: !_REPLACEMENT [33] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P637: !_LD [7] (Int)
lduw [%i0 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P638: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET638
nop
RET638:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P639: !_BLD [26] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P640: !_MEMBAR (FP)

P641: !_ST [28] (maybe <- 0x800008) (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P642: !_MEMBAR (FP)
membar #StoreLoad

P643: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f36, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P644: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET644
nop
RET644:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P645: !_BST [3] (maybe <- 0x40000076) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET645
nop
RET645:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P646: !_MEMBAR (FP)
membar #StoreLoad

P647: !_REPLACEMENT [3] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+16], %o5
st %o5, [%i2+16]
add %i2, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]

P648: !_LD [8] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i1 + 0] %asi, %f2
! 1 addresses covered

P649: !_ST [8] (maybe <- 0x800009) (Int)
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4

P650: !_MEMBAR (FP)
membar #StoreLoad

P651: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P652: !_MEMBAR (FP)

P653: !_ST [13] (maybe <- 0x4000007b) (FP)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P654: !_REPLACEMENT [17] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+96], %l3
st %l3, [%i3+96]
add %i3, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET654
nop
RET654:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P655: !_ST [19] (maybe <- 0x80000a) (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P656: !_MEMBAR (FP)
membar #StoreLoad

P657: !_BLD [19] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P658: !_MEMBAR (FP)

P659: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P660: !_MEMBAR (FP)

P661: !_BST [6] (maybe <- 0x4000007c) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P662: !_MEMBAR (FP)
membar #StoreLoad

P663: !_BLD [30] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P664: !_MEMBAR (FP) (Branch target of P499)
ba P665
nop

TARGET499:
ba RET499
nop


P665: !_REPLACEMENT [24] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+64], %l7
st %l7, [%i2+64]
add %i2, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P666: !_MEMBAR (FP)

P667: !_BSTC [16] (maybe <- 0x4000007e) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P668: !_MEMBAR (FP)
membar #StoreLoad

P669: !_LD [7] (Int)
lduw [%i0 + 128], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P670: !_LD [19] (FP)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 0], %f8
! 1 addresses covered

P671: !_MEMBAR (FP) (Branch target of P267)
membar #StoreLoad
ba P672
nop

TARGET267:
ba RET267
nop


P672: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P673: !_MEMBAR (FP)

P674: !_IDC_FLIP [2] (Int)
IDC_FLIP(674, 8916, 1, 0x43000008, 0x8, %i0, 0x8, %l6, %l7, %o5, %l3)

P675: !_MEMBAR (FP)
membar #StoreLoad

P676: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P677: !_MEMBAR (FP) (Branch target of P376)
ba P678
nop

TARGET376:
ba RET376
nop


P678: !_BST [15] (maybe <- 0x4000007f) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET678
nop
RET678:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P679: !_MEMBAR (FP)
membar #StoreLoad

P680: !_BLD [6] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P681: !_MEMBAR (FP) (Secondary ctx)

P682: !_BLD [21] (FP) (Branch target of P353)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f0
membar #Sync
! 3 addresses covered
fmovd %f8, %f2
ba P683
nop

TARGET353:
ba RET353
nop


P683: !_MEMBAR (FP) (Branch target of P628)
ba P684
nop

TARGET628:
ba RET628
nop


P684: !_REPLACEMENT [23] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+32], %o5
st %o5, [%i3+32]
add %i3, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

P685: !_MEMBAR (FP) (Secondary ctx)

P686: !_BST [5] (maybe <- 0x40000080) (FP) (Secondary ctx) (Branch target of P492)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P687
nop

TARGET492:
ba RET492
nop


P687: !_MEMBAR (FP) (Secondary ctx)

P688: !_BSTC [11] (maybe <- 0x40000082) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P689: !_MEMBAR (FP)
membar #StoreLoad

P690: !_REPLACEMENT [12] (Int) (Nucleus ctx) (Branch target of P413)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
ba P691
nop

TARGET413:
ba RET413
nop


P691: !_REPLACEMENT [8] (Int)
sethi %hi(0x2000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P692: !_MEMBAR (FP)

P693: !_BSTC [21] (maybe <- 0x40000085) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P694: !_MEMBAR (FP)
membar #StoreLoad

P695: !_LD [25] (FP)
ld [%i2 + 96], %f3
! 1 addresses covered

P696: !_MEMBAR (FP)
membar #StoreLoad

P697: !_BLD [15] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P698: !_MEMBAR (FP)

P699: !_ST [30] (maybe <- 0x80000b) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 128] %asi
add   %l4, 1, %l4

P700: !_REPLACEMENT [11] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P701: !_REPLACEMENT [20] (Int)
sethi %hi(0x2000), %l6
ld [%i3+256], %o5
st %o5, [%i3+256]
add %i3, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]

P702: !_REPLACEMENT [9] (Int) (CBR)
sethi %hi(0x2000), %l3
ld [%i3+32], %l7
st %l7, [%i3+32]
add %i3, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET702
nop
RET702:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P703: !_MEMBAR (FP)

P704: !_BST [11] (maybe <- 0x40000088) (FP) (Branch target of P253)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P705
nop

TARGET253:
ba RET253
nop


P705: !_MEMBAR (FP)
membar #StoreLoad

P706: !_LD [10] (Int)
lduw [%i1 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P707: !_REPLACEMENT [5] (Int)
sethi %hi(0x2000), %l6
ld [%i3+64], %o5
st %o5, [%i3+64]
add %i3, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

P708: !_LD [27] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lda    [%i3 + 160] %asi, %f5
! 1 addresses covered

P709: !_MEMBAR (FP) (Secondary ctx)

P710: !_BST [12] (maybe <- 0x4000008b) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P711: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P712: !_LD [17] (Int) (Loop exit) (Branch target of P503)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 96], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
!--
loop_exit_1_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_0
nop
ba P713
nop

TARGET503:
ba RET503
nop


P713: !_MEMBAR (Int)
membar #StoreLoad

END_NODES1: ! Test instruction sequence for CPU 1 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
stw %l7, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func2:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x02deade1), %l6
or    %l6, %lo(0x02deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1000001), %l4
or    %l4, %lo(0x1000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40800001), %l6
or    %l6, %lo(0x40800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35000000), %l6
or    %l6, %lo(0x35000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x7e38^4
sethi %hi(0x7e38), %l0
or    %l0, %lo(0x7e38), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES2: ! Test instruction sequence for ISTREAM 2 begins

P714: !_MEMBAR (FP) (Loop entry) (Branch target of P1037)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_0:
ba P715
nop

TARGET1037:
ba RET1037
nop


P715: !_BST [33] (maybe <- 0x40800001) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P716: !_MEMBAR (FP)
membar #StoreLoad

P717: !_REPLACEMENT [12] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET717
nop
RET717:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P718: !_REPLACEMENT [13] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l6
ld [%i2+32], %o5
st %o5, [%i2+32]
add %i2, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

P719: !_ST [6] (maybe <- 0x40800002) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 96 ]

P720: !_REPLACEMENT [5] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %o5
ld [%i2+64], %l6
st %l6, [%i2+64]
add %i2, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

P721: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET721
nop
RET721:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P722: !_BSTC [5] (maybe <- 0x40800003) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET722
nop
RET722:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P723: !_MEMBAR (FP)
membar #StoreLoad

P724: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4

P725: !_MEMBAR (FP)

P726: !_BLD [25] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P727: !_MEMBAR (FP) (Secondary ctx)

P728: !_REPLACEMENT [9] (Int)
sethi %hi(0x2000), %o5
ld [%i2+32], %l6
st %l6, [%i2+32]
add %i2, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P729: !_MEMBAR (FP)

P730: !_BST [2] (maybe <- 0x40800005) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P731: !_MEMBAR (FP)
membar #StoreLoad

P732: !_ST [9] (maybe <- 0x4080000a) (FP) (Secondary ctx) (Branch target of P1009)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i1 + 32 ] %asi
ba P733
nop

TARGET1009:
ba RET1009
nop


P733: !_LD [26] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P734: !_LD [21] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i3 + 0] %asi, %f7
! 1 addresses covered

P735: !_LD [11] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 0] %asi, %f8
! 1 addresses covered

P736: !_MEMBAR (FP)

P737: !_BST [10] (maybe <- 0x4080000b) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P738: !_MEMBAR (FP)
membar #StoreLoad

P739: !_REPLACEMENT [7] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P740: !_ST [29] (maybe <- 0x4080000c) (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P741: !_LD [22] (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET741
nop
RET741:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P742: !_REPLACEMENT [21] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P743: !_MEMBAR (FP)

P744: !_BSTC [30] (maybe <- 0x4080000d) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P745: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET745
nop
RET745:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P746: !_PREFETCH [24] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 64] %asi, 1

P747: !_REPLACEMENT [14] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+64], %o5
st %o5, [%i3+64]
add %i3, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

P748: !_PREFETCH [8] (Int) (CBR) (Nucleus ctx) (Branch target of P887)
wr %g0, 0x4, %asi
prefetcha [%i1 + 0] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET748
nop
RET748:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P749
nop

TARGET887:
ba RET887
nop


P749: !_MEMBAR (FP)
membar #StoreLoad

P750: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f18, %f11
fmovd %f36, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P751: !_MEMBAR (FP)

P752: !_PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P753: !_ST [30] (maybe <- 0x1000001) (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 128] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET753
nop
RET753:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P754: !_PREFETCH [20] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 256] %asi, 1

P755: !_MEMBAR (FP) (Branch target of P924)
membar #StoreLoad
ba P756
nop

TARGET924:
ba RET924
nop


P756: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f34, %f0
fmovd %f36, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P757: !_MEMBAR (FP)

P758: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P759: !_MEMBAR (FP) (CBR) (Branch target of P748)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET759
nop
RET759:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P760
nop

TARGET748:
ba RET748
nop


P760: !_LD [24] (FP) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 64], %f6
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET760
nop
RET760:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P761: !_LD [23] (Int) (Branch target of P918)
lduw [%i3 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
ba P762
nop

TARGET918:
ba RET918
nop


P762: !_LD [16] (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 16], %f7
! 1 addresses covered

P763: !_MEMBAR (FP)
membar #StoreLoad

P764: !_BLD [1] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P765: !_MEMBAR (FP)

P766: !_BST [17] (maybe <- 0x4080000e) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P767: !_MEMBAR (FP) (Secondary ctx) (Branch target of P916)
membar #StoreLoad
ba P768
nop

TARGET916:
ba RET916
nop


P768: !_BLD [6] (FP) (Branch target of P1233)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovd %f40, %f14
ba P769
nop

TARGET1233:
ba RET1233
nop


P769: !_MEMBAR (FP)

P770: !_PREFETCH [19] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P771: !_LD [7] (FP)
ld [%i0 + 128], %f15
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P772: !_IDC_FLIP [12] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(772, 25411, 2, 0x44000004, 0x4, %i2, 0x4, %l6, %l7, %o5, %l3)

P773: !_MEMBAR (FP)

P774: !_BSTC [1] (maybe <- 0x4080000f) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P775: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET775
nop
RET775:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P776: !_BSTC [8] (maybe <- 0x40800014) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P777: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET777
nop
RET777:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P778: !_IDC_FLIP [24] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
IDC_FLIP(778, 14957, 2, 0x45800040, 0x40, %i3, 0x40, %l6, %l7, %o5, %l3)

P779: !_MEMBAR (FP)

P780: !_BSTC [14] (maybe <- 0x40800016) (FP) (Branch target of P940)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi
ba P781
nop

TARGET940:
ba RET940
nop


P781: !_MEMBAR (FP) (Branch target of P952)
membar #StoreLoad
ba P782
nop

TARGET952:
ba RET952
nop


P782: !_LD [11] (Int)
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P783: !_ST [0] (maybe <- 0x40800017) (FP) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET783
nop
RET783:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P784: !_ST [31] (maybe <- 0x40800018) (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 192 ]

P785: !_REPLACEMENT [24] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+64], %o5
st %o5, [%i3+64]
add %i3, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

P786: !_REPLACEMENT [27] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l3
ld [%i3+160], %l7
st %l7, [%i3+160]
add %i3, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]

P787: !_MEMBAR (FP)

P788: !_BST [22] (maybe <- 0x40800019) (FP) (Branch target of P1085)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P789
nop

TARGET1085:
ba RET1085
nop


P789: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET789
nop
RET789:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P790: !_BLD [2] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET790
nop
RET790:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P791: !_MEMBAR (FP) (Branch target of P760)
ba P792
nop

TARGET760:
ba RET760
nop


P792: !_LD [28] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 0], %f5
! 1 addresses covered

P793: !_LD [29] (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
lda    [%i3 + 64] %asi, %f6
! 1 addresses covered

P794: !_PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P795: !_MEMBAR (FP)

P796: !_BST [32] (maybe <- 0x4080001c) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

P797: !_MEMBAR (FP) (Branch target of P1156)
membar #StoreLoad
ba P798
nop

TARGET1156:
ba RET1156
nop


P798: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovd %f40, %f8

P799: !_MEMBAR (FP) (Branch target of P1033)
ba P800
nop

TARGET1033:
ba RET1033
nop


P800: !_BSTC [33] (maybe <- 0x4080001d) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P801: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET801
nop
RET801:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P802: !_BLD [16] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET802
nop
RET802:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P803: !_MEMBAR (FP) (Branch target of P1169)
ba P804
nop

TARGET1169:
ba RET1169
nop


P804: !_ST [25] (maybe <- 0x4080001e) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 96 ] %asi

P805: !_LD [16] (FP) (Branch target of P840)
ld [%i3 + 16], %f10
! 1 addresses covered
ba P806
nop

TARGET840:
ba RET840
nop


P806: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P807: !_BLD [17] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P808: !_MEMBAR (FP) (Secondary ctx)

P809: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f12
fmovd %f40, %f14

P810: !_MEMBAR (FP) (Branch target of P1197)
ba P811
nop

TARGET1197:
ba RET1197
nop


P811: !_BST [4] (maybe <- 0x4080001f) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P812: !_MEMBAR (FP) (Branch target of P986)
membar #StoreLoad
ba P813
nop

TARGET986:
ba RET986
nop


P813: !_BLD [3] (FP) (Branch target of P1147)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f18, %f1
fmovd %f36, %f2
fmovd %f40, %f18
fmovs %f18, %f3
ba P814
nop

TARGET1147:
ba RET1147
nop


P814: !_MEMBAR (FP)

P815: !_BLD [33] (FP) (Secondary ctx) (Branch target of P1193)
wr %g0, 0xf1, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4
ba P816
nop

TARGET1193:
ba RET1193
nop


P816: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P1145)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET816
nop
RET816:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P817
nop

TARGET1145:
ba RET1145
nop


P817: !_BSTC [11] (maybe <- 0x40800024) (FP) (CBR) (Secondary ctx) (Branch target of P1000)
wr %g0, 0xe1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET817
nop
RET817:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P818
nop

TARGET1000:
ba RET1000
nop


P818: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P819: !_LD [10] (Int)
lduw [%i1 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P820: !_REPLACEMENT [27] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+160], %o5
st %o5, [%i3+160]
add %i3, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET820
nop
RET820:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P821: !_PREFETCH [8] (Int)
prefetch [%i1 + 0], 1

P822: !_MEMBAR (FP)
membar #StoreLoad

P823: !_BLD [14] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P824: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET824
nop
RET824:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P825: !_BST [12] (maybe <- 0x40800027) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P826: !_MEMBAR (FP)
membar #StoreLoad

P827: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f6
fmovd %f40, %f8

P828: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET828
nop
RET828:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P829: !_IDC_FLIP [23] (Int)
IDC_FLIP(829, 26945, 2, 0x45800020, 0x20, %i2, 0x20, %l6, %l7, %o5, %l3)

P830: !_MEMBAR (FP)
membar #StoreLoad

P831: !_BLD [23] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P832: !_MEMBAR (FP)

P833: !_BSTC [19] (maybe <- 0x4080002a) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P834: !_MEMBAR (FP)
membar #StoreLoad

P835: !_BLD [16] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f12

P836: !_MEMBAR (FP)

P837: !_REPLACEMENT [33] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P838: !_REPLACEMENT [26] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %o5
ld [%i3+128], %l6
st %l6, [%i3+128]
add %i3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P839: !_IDC_FLIP [5] (Int)
IDC_FLIP(839, 6666, 2, 0x43000040, 0x40, %i0, 0x40, %l6, %l7, %o5, %l3)

P840: !_MEMBAR (FP) (CBR) (Branch target of P1119)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET840
nop
RET840:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P841
nop

TARGET1119:
ba RET1119
nop


P841: !_BSTC [10] (maybe <- 0x4080002b) (FP) (Branch target of P849)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi
ba P842
nop

TARGET849:
ba RET849
nop


P842: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET842
nop
RET842:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P843: !_BSTC [13] (maybe <- 0x4080002c) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET843
nop
RET843:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P844: !_MEMBAR (FP)
membar #StoreLoad

P845: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P846: !_MEMBAR (FP)

P847: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P848: !_MEMBAR (FP) (Branch target of P1112)
ba P849
nop

TARGET1112:
ba RET1112
nop


P849: !_LD [7] (FP) (CBR)
ld [%i0 + 128], %f1
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET849
nop
RET849:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P850: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1001)
membar #StoreLoad
ba P851
nop

TARGET1001:
ba RET1001
nop


P851: !_BLD [17] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f2

P852: !_MEMBAR (FP) (Secondary ctx) (Branch target of P777)
ba P853
nop

TARGET777:
ba RET777
nop


P853: !_BLD [19] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET853
nop
RET853:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P854: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET854
nop
RET854:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P855: !_REPLACEMENT [31] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+192], %o5
st %o5, [%i2+192]
add %i2, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]

P856: !_ST [26] (maybe <- 0x4080002f) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 128 ] %asi

P857: !_PREFETCH [9] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i1 + 32] %asi, 1

P858: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET858
nop
RET858:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P859: !_BST [33] (maybe <- 0x40800030) (FP) (Branch target of P1040)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P860
nop

TARGET1040:
ba RET1040
nop


P860: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET860
nop
RET860:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P861: !_REPLACEMENT [10] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P862: !_MEMBAR (FP)
membar #StoreLoad

P863: !_BLD [15] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P864: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET864
nop
RET864:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P865: !_LD [31] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 192], %f5
! 1 addresses covered

P866: !_REPLACEMENT [25] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+96], %l7
st %l7, [%i2+96]
add %i2, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET866
nop
RET866:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P867: !_ST [27] (maybe <- 0x1000002) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 160 ]
add   %l4, 1, %l4

P868: !_PREFETCH [27] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 160] %asi, 1

P869: !_MEMBAR (FP)
membar #StoreLoad

P870: !_BLD [8] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P871: !_MEMBAR (FP)

P872: !_BST [8] (maybe <- 0x40800031) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P873: !_MEMBAR (FP)
membar #StoreLoad

P874: !_BLD [14] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8

P875: !_MEMBAR (FP)

P876: !_REPLACEMENT [14] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+64], %l3
st %l3, [%i3+64]
add %i3, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P877: !_LD [8] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 0] %asi, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P878: !_REPLACEMENT [17] (Int)
sethi %hi(0x2000), %o5
ld [%i3+96], %l6
st %l6, [%i3+96]
add %i3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]

P879: !_MEMBAR (FP)
membar #StoreLoad

P880: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P881: !_MEMBAR (FP)

P882: !_ST [28] (maybe <- 0x1000003) (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P883: !_MEMBAR (FP)

P884: !_BSTC [2] (maybe <- 0x40800033) (FP) (Branch target of P1087)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P885
nop

TARGET1087:
ba RET1087
nop


P885: !_MEMBAR (FP)
membar #StoreLoad

P886: !_BLD [7] (FP) (Branch target of P1128)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
ba P887
nop

TARGET1128:
ba RET1128
nop


P887: !_MEMBAR (FP) (CBR) (Branch target of P722)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET887
nop
RET887:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P888
nop

TARGET722:
ba RET722
nop


P888: !_LD [18] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 128] %asi, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET888
nop
RET888:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P889: !_REPLACEMENT [13] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+32], %l7
st %l7, [%i2+32]
add %i2, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P890: !_ST [19] (maybe <- 0x1000004) (Int) (CBR)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET890
nop
RET890:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P891: !_MEMBAR (FP)

P892: !_BST [25] (maybe <- 0x40800038) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P893: !_MEMBAR (FP)
membar #StoreLoad

P894: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f12
fmovd %f34, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P895: !_MEMBAR (FP) (Branch target of P1178)
ba P896
nop

TARGET1178:
ba RET1178
nop


P896: !_ST [33] (maybe <- 0x1000005) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 0] %asi
add   %l4, 1, %l4

P897: !_MEMBAR (FP) (Secondary ctx)

P898: !_BST [19] (maybe <- 0x4080003a) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P899: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P900: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P901: !_MEMBAR (FP)

P902: !_BSTC [27] (maybe <- 0x4080003b) (FP) (Branch target of P1158)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi
ba P903
nop

TARGET1158:
ba RET1158
nop


P903: !_MEMBAR (FP) (CBR) (Branch target of P1069)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET903
nop
RET903:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P904
nop

TARGET1069:
ba RET1069
nop


P904: !_BLD [1] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f18, %f5
fmovd %f36, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P905: !_MEMBAR (FP)

P906: !_REPLACEMENT [16] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+16], %l7
st %l7, [%i2+16]
add %i2, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]

P907: !_LD [33] (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P908: !_MEMBAR (FP)
membar #StoreLoad

P909: !_BLD [19] (FP) (Branch target of P888)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8
ba P910
nop

TARGET888:
ba RET888
nop


P910: !_MEMBAR (FP)

P911: !_BST [33] (maybe <- 0x4080003d) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P912: !_MEMBAR (FP)
membar #StoreLoad

P913: !_REPLACEMENT [25] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+96], %l7
st %l7, [%i3+96]
add %i3, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET913
nop
RET913:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P914: !_PREFETCH [11] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

P915: !_ST [16] (maybe <- 0x4080003e) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 16 ] %asi

P916: !_ST [32] (maybe <- 0x1000006) (Int) (CBR) (Branch target of P1127)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 256 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET916
nop
RET916:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P917
nop

TARGET1127:
ba RET1127
nop


P917: !_MEMBAR (FP)

P918: !_BST [2] (maybe <- 0x4080003f) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET918
nop
RET918:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P919: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET919
nop
RET919:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P920: !_REPLACEMENT [29] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET920
nop
RET920:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P921: !_ST [15] (maybe <- 0x1000007) (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 128 ]
add   %l4, 1, %l4

P922: !_MEMBAR (FP) (Branch target of P1165)
ba P923
nop

TARGET1165:
ba RET1165
nop


P923: !_BSTC [10] (maybe <- 0x40800044) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P924: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET924
nop
RET924:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P925: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P926: !_MEMBAR (FP)

P927: !_BSTC [15] (maybe <- 0x40800045) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P928: !_MEMBAR (FP) (Secondary ctx)

P929: !_BSTC [16] (maybe <- 0x40800046) (FP) (Branch target of P783)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P930
nop

TARGET783:
ba RET783
nop


P930: !_MEMBAR (FP) (Branch target of P843)
membar #StoreLoad
ba P931
nop

TARGET843:
ba RET843
nop


P931: !_REPLACEMENT [2] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+8], %o5
st %o5, [%i2+8]
add %i2, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]

P932: !_PREFETCH [25] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 96] %asi, 1

P933: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET933
nop
RET933:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P934: !_BST [25] (maybe <- 0x40800047) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P935: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P936: !_ST [14] (maybe <- 0x1000008) (Int) (Branch target of P860)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4
ba P937
nop

TARGET860:
ba RET860
nop


P937: !_REPLACEMENT [8] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P938: !_MEMBAR (FP) (Branch target of P919)
membar #StoreLoad
ba P939
nop

TARGET919:
ba RET919
nop


P939: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f10

P940: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET940
nop
RET940:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P941: !_REPLACEMENT [26] (Int) (Branch target of P842)
sethi %hi(0x2000), %o5
ld [%i3+128], %l6
st %l6, [%i3+128]
add %i3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
ba P942
nop

TARGET842:
ba RET842
nop


P942: !_MEMBAR (FP)

P943: !_BST [23] (maybe <- 0x40800049) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P944: !_MEMBAR (FP)
membar #StoreLoad

P945: !_ST [18] (maybe <- 0x1000009) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 128 ]
add   %l4, 1, %l4

P946: !_LD [1] (Int) (CBR)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET946
nop
RET946:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P947: !_ST [14] (maybe <- 0x4080004c) (FP)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P948: !_MEMBAR (FP) (Branch target of P1188)
membar #StoreLoad
ba P949
nop

TARGET1188:
ba RET1188
nop


P949: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P950: !_MEMBAR (FP)

P951: !_BST [15] (maybe <- 0x4080004d) (FP) (Branch target of P973)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi
ba P952
nop

TARGET973:
ba RET973
nop


P952: !_MEMBAR (FP) (CBR) (Branch target of P1157)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET952
nop
RET952:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P953
nop

TARGET1157:
ba RET1157
nop


P953: !_LD [33] (FP) (CBR)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 0], %f13
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET953
nop
RET953:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P954: !_MEMBAR (FP)
membar #StoreLoad

P955: !_BLD [3] (FP) (Branch target of P978)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f34, %f0
fmovd %f36, %f18
fmovs %f18, %f1
fmovd %f40, %f2
ba P956
nop

TARGET978:
ba RET978
nop


P956: !_MEMBAR (FP) (Branch target of P801)
ba P957
nop

TARGET801:
ba RET801
nop


P957: !_LD [5] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P958: !_LD [10] (FP) (Branch target of P913)
ld [%i1 + 64], %f3
! 1 addresses covered
ba P959
nop

TARGET913:
ba RET913
nop


P959: !_IDC_FLIP [8] (Int) (Branch target of P1050)
IDC_FLIP(959, 20428, 2, 0x43800000, 0x0, %i1, 0x0, %l6, %l7, %o5, %l3)
ba P960
nop

TARGET1050:
ba RET1050
nop


P960: !_LD [12] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 4] %asi, %f4
! 1 addresses covered

P961: !_ST [5] (maybe <- 0x4080004e) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 64 ] %asi

P962: !_LD [14] (FP)
ld [%i2 + 64], %f5
! 1 addresses covered

P963: !_MEMBAR (FP)

P964: !_BSTC [14] (maybe <- 0x4080004f) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P965: !_MEMBAR (FP)
membar #StoreLoad

P966: !_LD [0] (FP) (Branch target of P1131)
ld [%i0 + 0], %f6
! 1 addresses covered
ba P967
nop

TARGET1131:
ba RET1131
nop


P967: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P968: !_BLD [1] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f18, %f9
fmovd %f36, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P969: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1286)
ba P970
nop

TARGET1286:
ba RET1286
nop


P970: !_REPLACEMENT [16] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+16], %l6
st %l6, [%i3+16]
add %i3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]

P971: !_MEMBAR (FP) (Branch target of P1236)
ba P972
nop

TARGET1236:
ba RET1236
nop


P972: !_BST [19] (maybe <- 0x40800050) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P973: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET973
nop
RET973:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P974: !_BST [19] (maybe <- 0x40800051) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P975: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET975
nop
RET975:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P976: !_ST [23] (maybe <- 0x40800052) (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 32 ]

P977: !_ST [1] (maybe <- 0x40800053) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P978: !_PREFETCH [11] (Int) (CBR) (Branch target of P820)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET978
nop
RET978:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P979
nop

TARGET820:
ba RET820
nop


P979: !_MEMBAR (FP)

P980: !_BST [11] (maybe <- 0x40800054) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P981: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET981
nop
RET981:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P982: !_REPLACEMENT [9] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+32], %o5
st %o5, [%i3+32]
add %i3, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

P983: !_ST [13] (maybe <- 0x40800057) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P984: !_REPLACEMENT [20] (Int)
sethi %hi(0x2000), %o5
ld [%i3+256], %l6
st %l6, [%i3+256]
add %i3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]

P985: !_ST [12] (maybe <- 0x100000a) (Int)
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4

P986: !_LD [3] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
lduwa [%i0 + 16] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET986
nop
RET986:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P987: !_ST [12] (maybe <- 0x100000b) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
stwa   %l4, [%i2 + 4] %asi
add   %l4, 1, %l4

P988: !_MEMBAR (FP) (Secondary ctx)

P989: !_BST [28] (maybe <- 0x40800058) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P990: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P991: !_LD [25] (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 96], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET991
nop
RET991:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P992: !_LD [33] (FP)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 0], %f12
! 1 addresses covered

P993: !_MEMBAR (FP)
membar #StoreLoad

P994: !_BLD [9] (FP) (Branch target of P1101)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovd %f40, %f14
ba P995
nop

TARGET1101:
ba RET1101
nop


P995: !_MEMBAR (FP)

P996: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P997: !_MEMBAR (FP)

P998: !_REPLACEMENT [18] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P999: !_MEMBAR (FP)
membar #StoreLoad

P1000: !_BLD [16] (FP) (CBR) (Branch target of P828)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1000
nop
RET1000:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P1001
nop

TARGET828:
ba RET828
nop


P1001: !_MEMBAR (FP) (CBR) (Branch target of P981)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1001
nop
RET1001:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1002
nop

TARGET981:
ba RET981
nop


P1002: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f2

P1003: !_MEMBAR (FP)

P1004: !_REPLACEMENT [16] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+16], %l3
st %l3, [%i2+16]
add %i2, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]

P1005: !_LD [4] (FP)
ld [%i0 + 32], %f3
! 1 addresses covered

P1006: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1006
nop
RET1006:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1007: !_BLD [28] (FP) (Branch target of P741)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4
ba P1008
nop

TARGET741:
ba RET741
nop


P1008: !_MEMBAR (FP)

P1009: !_LD [33] (Int) (CBR)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1009
nop
RET1009:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1010: !_ST [1] (maybe <- 0x100000c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1011: !_MEMBAR (FP)

P1012: !_BST [3] (maybe <- 0x40800059) (FP) (Branch target of P1064)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P1013
nop

TARGET1064:
ba RET1064
nop


P1013: !_MEMBAR (FP)

P1014: !_BST [20] (maybe <- 0x4080005e) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P1015: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1016: !_ST [8] (maybe <- 0x100000d) (Int)
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4

P1017: !_PREFETCH [2] (Int)
prefetch [%i0 + 8], 1

P1018: !_ST [23] (maybe <- 0x100000e) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 32 ]
add   %l4, 1, %l4

P1019: !_MEMBAR (FP)

P1020: !_BSTC [22] (maybe <- 0x4080005f) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1021: !_MEMBAR (FP) (Branch target of P946)
membar #StoreLoad
ba P1022
nop

TARGET946:
ba RET946
nop


P1022: !_ST [29] (maybe <- 0x40800062) (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P1023: !_MEMBAR (FP)

P1024: !_BSTC [23] (maybe <- 0x40800063) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1025: !_MEMBAR (FP)
membar #StoreLoad

P1026: !_REPLACEMENT [1] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P1027: !_REPLACEMENT [30] (Int) (Nucleus ctx) (Branch target of P1243)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l3
ld [%i3+128], %l7
st %l7, [%i3+128]
add %i3, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
ba P1028
nop

TARGET1243:
ba RET1243
nop


P1028: !_REPLACEMENT [28] (Int)
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P1029: !_REPLACEMENT [8] (Int) (Branch target of P775)
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
ba P1030
nop

TARGET775:
ba RET775
nop


P1030: !_LD [32] (FP)
ld [%i2 + 256], %f5
! 1 addresses covered

P1031: !_REPLACEMENT [2] (Int) (Branch target of P802)
sethi %hi(0x2000), %l6
ld [%i3+8], %o5
st %o5, [%i3+8]
add %i3, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
add %l7, %l6, %l7
ld [%l7+8], %o5
st %o5, [%l7+8]
ba P1032
nop

TARGET802:
ba RET802
nop


P1032: !_ST [21] (maybe <- 0x40800066) (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]

P1033: !_REPLACEMENT [25] (Int) (CBR)
sethi %hi(0x2000), %o5
ld [%i3+96], %l6
st %l6, [%i3+96]
add %i3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1033
nop
RET1033:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1034: !_MEMBAR (FP) (Branch target of P933)
membar #StoreLoad
ba P1035
nop

TARGET933:
ba RET933
nop


P1035: !_BLD [15] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6

P1036: !_MEMBAR (FP) (Branch target of P864)
ba P1037
nop

TARGET864:
ba RET864
nop


P1037: !_BSTC [5] (maybe <- 0x40800067) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1037
nop
RET1037:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1038: !_MEMBAR (FP) (Branch target of P1284)
ba P1039
nop

TARGET1284:
ba RET1284
nop


P1039: !_BSTC [22] (maybe <- 0x40800069) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1040: !_MEMBAR (FP) (CBR) (Branch target of P789)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1040
nop
RET1040:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1041
nop

TARGET789:
ba RET789
nop


P1041: !_ST [0] (maybe <- 0x4080006c) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P1042: !_ST [11] (maybe <- 0x4080006d) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P1043: !_MEMBAR (FP)

P1044: !_BSTC [7] (maybe <- 0x4080006e) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

P1045: !_MEMBAR (FP)
membar #StoreLoad

P1046: !_REPLACEMENT [28] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P1047: !_LD [3] (FP)
ld [%i0 + 16], %f7
! 1 addresses covered

P1048: !_LD [19] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P1049: !_PREFETCH [19] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i3 + 0] %asi, 1

P1050: !_PREFETCH [6] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
prefetcha [%i0 + 96] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1050
nop
RET1050:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1051: !_IDC_FLIP [9] (Int)
IDC_FLIP(1051, 20083, 2, 0x43800020, 0x20, %i1, 0x20, %l6, %l7, %o5, %l3)

P1052: !_MEMBAR (FP) (Branch target of P1089)
ba P1053
nop

TARGET1089:
ba RET1089
nop


P1053: !_BST [14] (maybe <- 0x4080006f) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P1054: !_MEMBAR (FP)
membar #StoreLoad

P1055: !_ST [3] (maybe <- 0x40800070) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 16 ]

P1056: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1006)
membar #StoreLoad
ba P1057
nop

TARGET1006:
ba RET1006
nop


P1057: !_BLD [32] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8

P1058: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P1261)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1058
nop
RET1058:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P1059
nop

TARGET1261:
ba RET1261
nop


P1059: !_BSTC [2] (maybe <- 0x40800071) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1059
nop
RET1059:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1060: !_MEMBAR (FP) (Branch target of P903)
ba P1061
nop

TARGET903:
ba RET903
nop


P1061: !_BSTC [26] (maybe <- 0x40800076) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P1062: !_MEMBAR (FP)

P1063: !_BSTC [29] (maybe <- 0x40800078) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P1064: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1064
nop
RET1064:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1065: !_BST [29] (maybe <- 0x40800079) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P1066: !_MEMBAR (FP)
membar #StoreLoad

P1067: !_IDC_FLIP [0] (Int)
IDC_FLIP(1067, 9313, 2, 0x43000000, 0x0, %i0, 0x0, %l6, %l7, %o5, %l3)

P1068: !_MEMBAR (FP)
membar #StoreLoad

P1069: !_BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1069
nop
RET1069:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1070: !_MEMBAR (FP)

P1071: !_BLD [26] (FP) (CBR) (Branch target of P824)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovd %f40, %f12

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1071
nop
RET1071:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1072
nop

TARGET824:
ba RET824
nop


P1072: !_MEMBAR (FP) (Branch target of P953)
ba P1073
nop

TARGET953:
ba RET953
nop


P1073: !_PREFETCH [18] (Int) (LE) (Branch target of P1090)
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 128] %asi, 1
ba P1074
nop

TARGET1090:
ba RET1090
nop


P1074: !_PREFETCH [3] (Int)
prefetch [%i0 + 16], 1

P1075: !_MEMBAR (FP)

P1076: !_BSTC [0] (maybe <- 0x4080007a) (FP) (Branch target of P866)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P1077
nop

TARGET866:
ba RET866
nop


P1077: !_MEMBAR (FP)
membar #StoreLoad

P1078: !_ST [30] (maybe <- 0x4080007f) (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 128 ]

P1079: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1079
nop
RET1079:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1080: !_BLD [29] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1081: !_MEMBAR (FP) (Secondary ctx)

P1082: !_BLD [1] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f34, %f0
fmovd %f36, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P1083: !_MEMBAR (FP)

P1084: !_BST [21] (maybe <- 0x40800080) (FP) (Secondary ctx) (Branch target of P1263)
wr %g0, 0xf1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P1085
nop

TARGET1263:
ba RET1263
nop


P1085: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P1164)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1085
nop
RET1085:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1086
nop

TARGET1164:
ba RET1164
nop


P1086: !_BST [26] (maybe <- 0x40800083) (FP) (Branch target of P1228)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi
ba P1087
nop

TARGET1228:
ba RET1228
nop


P1087: !_MEMBAR (FP) (CBR) (Branch target of P753)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1087
nop
RET1087:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1088
nop

TARGET753:
ba RET753
nop


P1088: !_BSTC [32] (maybe <- 0x40800085) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1088
nop
RET1088:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1089: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1089
nop
RET1089:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1090: !_BSTC [10] (maybe <- 0x40800086) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1090
nop
RET1090:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1091: !_MEMBAR (FP) (Branch target of P1059)
membar #StoreLoad
ba P1092
nop

TARGET1059:
ba RET1059
nop


P1092: !_PREFETCH [27] (Int)
prefetch [%i3 + 160], 1

P1093: !_REPLACEMENT [18] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+128], %l6
st %l6, [%i2+128]
add %i2, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P1094: !_PREFETCH [25] (Int)
prefetch [%i3 + 96], 1

P1095: !_REPLACEMENT [24] (Int)
sethi %hi(0x2000), %l7
ld [%i2+64], %l3
st %l3, [%i2+64]
add %i2, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P1096: !_MEMBAR (FP)

P1097: !_BSTC [31] (maybe <- 0x40800087) (FP) (Branch target of P1288)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 192 ] %asi
ba P1098
nop

TARGET1288:
ba RET1288
nop


P1098: !_MEMBAR (FP)
membar #StoreLoad

P1099: !_REPLACEMENT [27] (Int)
sethi %hi(0x2000), %l3
ld [%i2+160], %l7
st %l7, [%i2+160]
add %i2, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]

P1100: !_MEMBAR (FP) (Branch target of P790)
membar #StoreLoad
ba P1101
nop

TARGET790:
ba RET790
nop


P1101: !_BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1101
nop
RET1101:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1102: !_MEMBAR (FP)

P1103: !_REPLACEMENT [21] (Int) (Branch target of P1124)
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
ba P1104
nop

TARGET1124:
ba RET1124
nop


P1104: !_REPLACEMENT [33] (Int)
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P1105: !_MEMBAR (FP)
membar #StoreLoad

P1106: !_BLD [19] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P1107: !_MEMBAR (FP) (Branch target of P717)
ba P1108
nop

TARGET717:
ba RET717
nop


P1108: !_BST [28] (maybe <- 0x40800088) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1109: !_MEMBAR (FP) (Secondary ctx)

P1110: !_BSTC [18] (maybe <- 0x40800089) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P1111: !_MEMBAR (FP) (Secondary ctx)

P1112: !_BST [9] (maybe <- 0x4080008a) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1112
nop
RET1112:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1113: !_MEMBAR (FP)
membar #StoreLoad

P1114: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1115: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1115
nop
RET1115:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1116: !_ST [13] (maybe <- 0x4080008c) (FP) (Nucleus ctx) (Branch target of P1207)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 32 ] %asi
ba P1117
nop

TARGET1207:
ba RET1207
nop


P1117: !_REPLACEMENT [10] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+64], %l7
st %l7, [%i2+64]
add %i2, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P1118: !_MEMBAR (FP)
membar #StoreLoad

P1119: !_BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1119
nop
RET1119:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1120: !_MEMBAR (FP)

P1121: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1122: !_MEMBAR (FP) (Branch target of P1079)
ba P1123
nop

TARGET1079:
ba RET1079
nop


P1123: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f10
fmovd %f40, %f12

P1124: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1124
nop
RET1124:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1125: !_REPLACEMENT [23] (Int)
sethi %hi(0x2000), %l6
ld [%i2+32], %o5
st %o5, [%i2+32]
add %i2, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

P1126: !_MEMBAR (FP)
membar #StoreLoad

P1127: !_BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovd %f40, %f14

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1127
nop
RET1127:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1128: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1128
nop
RET1128:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1129: !_REPLACEMENT [14] (Int)
sethi %hi(0x2000), %l7
ld [%i2+64], %l3
st %l3, [%i2+64]
add %i2, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P1130: !_MEMBAR (FP)
membar #StoreLoad

P1131: !_BLD [4] (FP) (CBR) (Branch target of P1225)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f18, %f1
fmovd %f36, %f2
fmovd %f40, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1131
nop
RET1131:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1132
nop

TARGET1225:
ba RET1225
nop


P1132: !_MEMBAR (FP)

P1133: !_BLD [19] (FP) (Secondary ctx) (Branch target of P1115)
wr %g0, 0xf1, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4
ba P1134
nop

TARGET1115:
ba RET1115
nop


P1134: !_MEMBAR (FP) (Secondary ctx)

P1135: !_LD [24] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
lduwa [%i3 + 64] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1136: !_REPLACEMENT [2] (Int) (Branch target of P1088)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+8], %l7
st %l7, [%i3+8]
add %i3, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
ba P1137
nop

TARGET1088:
ba RET1088
nop


P1137: !_REPLACEMENT [23] (Int) (Secondary ctx) (Branch target of P1071)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i3+32], %l6
st %l6, [%i3+32]
add %i3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
ba P1138
nop

TARGET1071:
ba RET1071
nop


P1138: !_MEMBAR (FP)
membar #StoreLoad

P1139: !_BLD [33] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1140: !_MEMBAR (FP)

P1141: !_LD [22] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 4] %asi, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P1142: !_REPLACEMENT [18] (Int) (Branch target of P991)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+128], %l7
st %l7, [%i2+128]
add %i2, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
ba P1143
nop

TARGET991:
ba RET991
nop


P1143: !_MEMBAR (FP) (Branch target of P1239)
membar #StoreLoad
ba P1144
nop

TARGET1239:
ba RET1239
nop


P1144: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f6
fmovd %f40, %f8

P1145: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1145
nop
RET1145:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1146: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1147: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1147
nop
RET1147:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1148: !_REPLACEMENT [19] (Int)
sethi %hi(0x2000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P1149: !_MEMBAR (FP)

P1150: !_BSTC [33] (maybe <- 0x4080008d) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1151: !_MEMBAR (FP)
membar #StoreLoad

P1152: !_BLD [19] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

P1153: !_MEMBAR (FP)

P1154: !_BST [12] (maybe <- 0x4080008e) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1155: !_MEMBAR (FP)
membar #StoreLoad

P1156: !_BLD [16] (FP) (CBR) (Branch target of P1272)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1156
nop
RET1156:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1157
nop

TARGET1272:
ba RET1272
nop


P1157: !_MEMBAR (FP) (CBR) (Branch target of P721)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1157
nop
RET1157:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P1158
nop

TARGET721:
ba RET721
nop


P1158: !_REPLACEMENT [31] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+192], %l7
st %l7, [%i3+192]
add %i3, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1158
nop
RET1158:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1159: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1167)
membar #StoreLoad
ba P1160
nop

TARGET1167:
ba RET1167
nop


P1160: !_BLD [11] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P1161: !_MEMBAR (FP) (Secondary ctx)

P1162: !_REPLACEMENT [4] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l3
ld [%i3+32], %l7
st %l7, [%i3+32]
add %i3, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P1163: !_REPLACEMENT [24] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i3+64], %l6
st %l6, [%i3+64]
add %i3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

P1164: !_PREFETCH [13] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1164
nop
RET1164:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1165: !_ST [29] (maybe <- 0x40800091) (FP) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1165
nop
RET1165:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1166: !_ST [32] (maybe <- 0x100000f) (Int)
stw   %l4, [%i3 + 256 ]
add   %l4, 1, %l4

P1167: !_REPLACEMENT [1] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+4], %l3
st %l3, [%i2+4]
add %i2, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1167
nop
RET1167:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1168: !_MEMBAR (FP) (Branch target of P1269)
ba P1169
nop

TARGET1269:
ba RET1269
nop


P1169: !_BSTC [33] (maybe <- 0x40800092) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1169
nop
RET1169:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1170: !_MEMBAR (FP) (Branch target of P854)
ba P1171
nop

TARGET854:
ba RET854
nop


P1171: !_BST [18] (maybe <- 0x40800093) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P1172: !_MEMBAR (FP)
membar #StoreLoad

P1173: !_REPLACEMENT [1] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P1174: !_MEMBAR (FP)
membar #StoreLoad

P1175: !_BLD [1] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f18, %f3
fmovd %f36, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1176: !_MEMBAR (FP)

P1177: !_IDC_FLIP [13] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(1177, 1731, 2, 0x44000020, 0x20, %i2, 0x20, %l6, %l7, %o5, %l3)

P1178: !_MEMBAR (FP) (CBR) (Branch target of P1058)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1178
nop
RET1178:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1179
nop

TARGET1058:
ba RET1058
nop


P1179: !_BST [12] (maybe <- 0x40800094) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1180: !_MEMBAR (FP)
membar #StoreLoad

P1181: !_ST [25] (maybe <- 0x1000010) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 96] %asi
add   %l4, 1, %l4

P1182: !_ST [5] (maybe <- 0x1000011) (Int) (Branch target of P1215)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4
ba P1183
nop

TARGET1215:
ba RET1215
nop


P1183: !_MEMBAR (FP)
membar #StoreLoad

P1184: !_BLD [8] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1185: !_MEMBAR (FP)

P1186: !_BLD [23] (FP) (Branch target of P858)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f8
fmovd %f40, %f10
ba P1187
nop

TARGET858:
ba RET858
nop


P1187: !_MEMBAR (FP)

P1188: !_BSTC [24] (maybe <- 0x40800097) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1188
nop
RET1188:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1189: !_MEMBAR (FP)
membar #StoreLoad

P1190: !_REPLACEMENT [21] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P1191: !_REPLACEMENT [16] (Int) (Branch target of P1241)
sethi %hi(0x2000), %l7
ld [%i2+16], %l3
st %l3, [%i2+16]
add %i2, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
ba P1192
nop

TARGET1241:
ba RET1241
nop


P1192: !_REPLACEMENT [32] (Int)
sethi %hi(0x2000), %l6
ld [%i2+256], %o5
st %o5, [%i2+256]
add %i2, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]

P1193: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1193
nop
RET1193:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1194: !_BSTC [20] (maybe <- 0x40800099) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

P1195: !_MEMBAR (FP) (Branch target of P920)
membar #StoreLoad
ba P1196
nop

TARGET920:
ba RET920
nop


P1196: !_LD [2] (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
lda    [%i0 + 8] %asi, %f11
! 1 addresses covered

P1197: !_PREFETCH [23] (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1197
nop
RET1197:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1198: !_MEMBAR (FP)
membar #StoreLoad

P1199: !_BLD [19] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1199
nop
RET1199:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1200: !_MEMBAR (FP) (Branch target of P1273)
ba P1201
nop

TARGET1273:
ba RET1273
nop


P1201: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P1202: !_MEMBAR (FP)

P1203: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4

P1204: !_MEMBAR (FP)

P1205: !_LD [30] (Int) (Branch target of P1199)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
ba P1206
nop

TARGET1199:
ba RET1199
nop


P1206: !_IDC_FLIP [3] (Int)
IDC_FLIP(1206, 18737, 2, 0x43000010, 0x10, %i0, 0x10, %l6, %l7, %o5, %l3)

P1207: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1207
nop
RET1207:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1208: !_BLD [11] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1209: !_MEMBAR (FP)

P1210: !_BLD [7] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8

P1211: !_MEMBAR (FP)

P1212: !_BST [26] (maybe <- 0x4080009a) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P1213: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1213
nop
RET1213:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1214: !_BSTC [7] (maybe <- 0x4080009c) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1214
nop
RET1214:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1215: !_MEMBAR (FP) (CBR) (Branch target of P1213)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1215
nop
RET1215:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1216
nop

TARGET1213:
ba RET1213
nop


P1216: !_BLD [21] (FP) (Secondary ctx) (Branch target of P817)
wr %g0, 0xf1, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11
ba P1217
nop

TARGET817:
ba RET817
nop


P1217: !_MEMBAR (FP) (Secondary ctx)

P1218: !_BST [30] (maybe <- 0x4080009d) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P1219: !_MEMBAR (FP)
membar #StoreLoad

P1220: !_LD [21] (FP) (CBR)
ld [%i3 + 0], %f12
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1220
nop
RET1220:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1221: !_MEMBAR (FP)
membar #StoreLoad

P1222: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f36, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P1223: !_MEMBAR (FP)

P1224: !_REPLACEMENT [2] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+8], %l6
st %l6, [%i2+8]
add %i2, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]

P1225: !_ST [5] (maybe <- 0x1000012) (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
stwa   %l4, [%i0 + 64] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1225
nop
RET1225:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1226: !_MEMBAR (FP) (Branch target of P1234)
membar #StoreLoad
ba P1227
nop

TARGET1234:
ba RET1234
nop


P1227: !_BLD [16] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f2

P1228: !_MEMBAR (FP) (CBR) (Branch target of P816)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1228
nop
RET1228:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1229
nop

TARGET816:
ba RET816
nop


P1229: !_REPLACEMENT [24] (Int)
sethi %hi(0x2000), %o5
ld [%i2+64], %l6
st %l6, [%i2+64]
add %i2, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

P1230: !_REPLACEMENT [29] (Int)
sethi %hi(0x2000), %l7
ld [%i2+64], %l3
st %l3, [%i2+64]
add %i2, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P1231: !_PREFETCH [15] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 128], 1

P1232: !_MEMBAR (FP)
membar #StoreLoad

P1233: !_BLD [24] (FP) (CBR) (Branch target of P759)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovd %f40, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1233
nop
RET1233:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1234
nop

TARGET759:
ba RET759
nop


P1234: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1234
nop
RET1234:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1235: !_REPLACEMENT [7] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+128], %l6
st %l6, [%i2+128]
add %i2, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P1236: !_REPLACEMENT [26] (Int) (CBR)
sethi %hi(0x2000), %l7
ld [%i2+128], %l3
st %l3, [%i2+128]
add %i2, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1236
nop
RET1236:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1237: !_ST [10] (maybe <- 0x1000013) (Int)
stw   %l4, [%i1 + 64 ]
add   %l4, 1, %l4

P1238: !_MEMBAR (FP)

P1239: !_BSTC [28] (maybe <- 0x4080009e) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1239
nop
RET1239:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1240: !_MEMBAR (FP) (Branch target of P1220)
membar #StoreLoad
ba P1241
nop

TARGET1220:
ba RET1220
nop


P1241: !_BLD [22] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1241
nop
RET1241:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1242: !_MEMBAR (FP)

P1243: !_LD [32] (Int) (CBR)
lduw [%i3 + 256], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1243
nop
RET1243:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1244: !_MEMBAR (FP)
membar #StoreLoad

P1245: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P1246: !_MEMBAR (FP)

P1247: !_LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1248: !_MEMBAR (FP)
membar #StoreLoad

P1249: !_BLD [2] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f36, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P1250: !_MEMBAR (FP)

P1251: !_ST [33] (maybe <- 0x1000014) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 0] %asi
add   %l4, 1, %l4

P1252: !_LD [29] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 64], %f2
! 1 addresses covered

P1253: !_ST [17] (maybe <- 0x4080009f) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 96 ]

P1254: !_PREFETCH [23] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 32], 1

P1255: !_MEMBAR (FP)
membar #StoreLoad

P1256: !_BLD [16] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f3

P1257: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1257
nop
RET1257:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1258: !_BLD [29] (FP) (Branch target of P1214)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4
ba P1259
nop

TARGET1214:
ba RET1214
nop


P1259: !_MEMBAR (FP)

P1260: !_REPLACEMENT [9] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+32], %l3
st %l3, [%i2+32]
add %i2, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

P1261: !_REPLACEMENT [23] (Int) (CBR)
sethi %hi(0x2000), %l6
ld [%i2+32], %o5
st %o5, [%i2+32]
add %i2, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1261
nop
RET1261:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1262: !_MEMBAR (FP) (Branch target of P853)
membar #StoreLoad
ba P1263
nop

TARGET853:
ba RET853
nop


P1263: !_BLD [3] (FP) (CBR) (Branch target of P890)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f18, %f7
fmovd %f36, %f8
fmovd %f40, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1263
nop
RET1263:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1264
nop

TARGET890:
ba RET890
nop


P1264: !_MEMBAR (FP)

P1265: !_REPLACEMENT [12] (Int)
sethi %hi(0x2000), %l7
ld [%i2+4], %l3
st %l3, [%i2+4]
add %i2, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P1266: !_REPLACEMENT [5] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l6
ld [%i2+64], %o5
st %o5, [%i2+64]
add %i2, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

P1267: !_LD [16] (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 16], %f10
! 1 addresses covered

P1268: !_MEMBAR (FP) (Branch target of P745)
ba P1269
nop

TARGET745:
ba RET745
nop


P1269: !_BSTC [30] (maybe <- 0x408000a0) (FP) (CBR) (Branch target of P975)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1269
nop
RET1269:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P1270
nop

TARGET975:
ba RET975
nop


P1270: !_MEMBAR (FP)

P1271: !_BST [30] (maybe <- 0x408000a1) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P1272: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1272
nop
RET1272:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1273: !_BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1273
nop
RET1273:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1274: !_MEMBAR (FP)

P1275: !_PREFETCH [6] (Int)
prefetch [%i0 + 96], 1

P1276: !_MEMBAR (FP)

P1277: !_BSTC [14] (maybe <- 0x408000a2) (FP) (Branch target of P1257)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi
ba P1278
nop

TARGET1257:
ba RET1257
nop


P1278: !_MEMBAR (FP)

P1279: !_BST [23] (maybe <- 0x408000a3) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1280: !_MEMBAR (FP)

P1281: !_BST [21] (maybe <- 0x408000a6) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1281
nop
RET1281:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1282: !_MEMBAR (FP)
membar #StoreLoad

P1283: !_REPLACEMENT [27] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+160], %l6
st %l6, [%i3+160]
add %i3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]

P1284: !_ST [21] (maybe <- 0x408000a9) (FP) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1284
nop
RET1284:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1285: !_MEMBAR (FP) (Secondary ctx)

P1286: !_BST [33] (maybe <- 0x408000aa) (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1286
nop
RET1286:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1287: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1288: !_BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1288
nop
RET1288:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1289: !_MEMBAR (FP)

P1290: !_LD [18] (Int) (Loop exit) (Secondary ctx) (Branch target of P1281)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 128] %asi, %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovs %f12, %f30
!--
loop_exit_2_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_0
nop
ba P1291
nop

TARGET1281:
ba RET1281
nop


P1291: !_MEMBAR (Int)
membar #StoreLoad

END_NODES2: ! Test instruction sequence for CPU 2 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
stw %l7, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func3:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x03deade1), %l6
or    %l6, %lo(0x03deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1800001), %l4
or    %l4, %lo(0x1800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41000001), %l6
or    %l6, %lo(0x41000001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35800000), %l6
or    %l6, %lo(0x35800000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x6ad6^4
sethi %hi(0x6ad6), %l0
or    %l0, %lo(0x6ad6), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES3: ! Test instruction sequence for ISTREAM 3 begins

P1292: !_MEMBAR (FP) (Loop entry) (Branch target of P1617)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_0:
membar #StoreLoad
ba P1293
nop

TARGET1617:
ba RET1617
nop


P1293: !_BLD [10] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f0
membar #Sync
! 1 addresses covered

P1294: !_MEMBAR (FP)

P1295: !_BSTC [33] (maybe <- 0x41000001) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1296: !_MEMBAR (FP)
membar #StoreLoad

P1297: !_BLD [28] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1297
nop
RET1297:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1298: !_MEMBAR (FP) (Secondary ctx)

P1299: !_ST [31] (maybe <- 0x1800001) (Int) (CBR)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1299
nop
RET1299:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1300: !_LD [12] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1301: !_REPLACEMENT [9] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+32], %l7
st %l7, [%i3+32]
add %i3, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P1302: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1302
nop
RET1302:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1303: !_BSTC [25] (maybe <- 0x41000002) (FP) (Branch target of P1511)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi
ba P1304
nop

TARGET1511:
ba RET1511
nop


P1304: !_MEMBAR (FP)
membar #StoreLoad

P1305: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f2

P1306: !_MEMBAR (FP)

P1307: !_PREFETCH [15] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 128] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1307
nop
RET1307:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1308: !_PREFETCH [16] (Int) (Secondary ctx) (Branch target of P1939)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 16] %asi, 1
ba P1309
nop

TARGET1939:
ba RET1939
nop


P1309: !_LD [18] (Int) (CBR)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1309
nop
RET1309:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1310: !_ST [3] (maybe <- 0x1800002) (Int) (Branch target of P1760)
stw   %l4, [%i0 + 16 ]
add   %l4, 1, %l4
ba P1311
nop

TARGET1760:
ba RET1760
nop


P1311: !_LD [12] (Int) (Branch target of P1337)
lduw [%i2 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
ba P1312
nop

TARGET1337:
ba RET1337
nop


P1312: !_REPLACEMENT [12] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P1313: !_PREFETCH [6] (Int) (CBR)
prefetch [%i0 + 96], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1313
nop
RET1313:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1314: !_MEMBAR (FP)
membar #StoreLoad

P1315: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1316: !_MEMBAR (FP)

P1317: !_LD [28] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1318: !_REPLACEMENT [31] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+192], %l3
st %l3, [%i3+192]
add %i3, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]

P1319: !_REPLACEMENT [11] (Int)
sethi %hi(0x2000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P1320: !_IDC_FLIP [20] (Int) (CBR) (Branch target of P1555)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(1320, 28195, 3, 0x45000100, 0x100, %i2, 0x100, %l6, %l7, %o5, %l3)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1320
nop
RET1320:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1321
nop

TARGET1555:
ba RET1555
nop


P1321: !_REPLACEMENT [12] (Int)
sethi %hi(0x2000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P1322: !_REPLACEMENT [6] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l6
ld [%i3+96], %o5
st %o5, [%i3+96]
add %i3, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]

P1323: !_LD [24] (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 64], %f4
! 1 addresses covered

P1324: !_REPLACEMENT [23] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+32], %l7
st %l7, [%i2+32]
add %i2, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P1325: !_MEMBAR (FP)

P1326: !_BST [26] (maybe <- 0x41000004) (FP) (Branch target of P1476)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi
ba P1327
nop

TARGET1476:
ba RET1476
nop


P1327: !_MEMBAR (FP) (Branch target of P1363)
membar #StoreLoad
ba P1328
nop

TARGET1363:
ba RET1363
nop


P1328: !_LD [5] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1329: !_MEMBAR (FP)
membar #StoreLoad

P1330: !_BLD [17] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P1331: !_MEMBAR (FP)

P1332: !_LD [28] (FP) (CBR) (Nucleus ctx) (Branch target of P1657)
wr %g0, 0x4, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 0] %asi, %f6
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1332
nop
RET1332:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P1333
nop

TARGET1657:
ba RET1657
nop


P1333: !_MEMBAR (FP)

P1334: !_BST [17] (maybe <- 0x41000006) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P1335: !_MEMBAR (FP) (Branch target of P1404)
membar #StoreLoad
ba P1336
nop

TARGET1404:
ba RET1404
nop


P1336: !_IDC_FLIP [28] (Int)
IDC_FLIP(1336, 9347, 3, 0x46000000, 0x0, %i2, 0x0, %l6, %l7, %o5, %l3)

P1337: !_PREFETCH [24] (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1337
nop
RET1337:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1338: !_PREFETCH [29] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
prefetcha [%i2 + 64] %asi, 1

P1339: !_PREFETCH [33] (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

P1340: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1340
nop
RET1340:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1341: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovd %f40, %f8

P1342: !_MEMBAR (FP)

P1343: !_BSTC [23] (maybe <- 0x41000007) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1344: !_MEMBAR (FP)

P1345: !_BST [8] (maybe <- 0x4100000a) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P1346: !_MEMBAR (FP)
membar #StoreLoad

P1347: !_ST [6] (maybe <- 0x4100000c) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 96 ]

P1348: !_MEMBAR (FP)
membar #StoreLoad

P1349: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1350: !_MEMBAR (FP)

P1351: !_BSTC [14] (maybe <- 0x4100000d) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P1352: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1353: !_REPLACEMENT [19] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1353
nop
RET1353:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1354: !_REPLACEMENT [0] (Int) (CBR)
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1354
nop
RET1354:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1355: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1355
nop
RET1355:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1356: !_BLD [7] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

P1357: !_MEMBAR (FP)

P1358: !_BLD [14] (FP) (Branch target of P1913)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
ba P1359
nop

TARGET1913:
ba RET1913
nop


P1359: !_MEMBAR (FP)

P1360: !_PREFETCH [11] (Int)
prefetch [%i3 + 0], 1

P1361: !_PREFETCH [21] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 0] %asi, 1

P1362: !_MEMBAR (FP)
membar #StoreLoad

P1363: !_BLD [29] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1363
nop
RET1363:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1364: !_MEMBAR (FP)

P1365: !_REPLACEMENT [11] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P1366: !_LD [8] (FP)
ld [%i1 + 0], %f15
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P1367: !_PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 16] %asi, 1

P1368: !_MEMBAR (FP) (CBR) (Branch target of P1601)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1368
nop
RET1368:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P1369
nop

TARGET1601:
ba RET1601
nop


P1369: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f0
membar #Sync
! 3 addresses covered
fmovd %f8, %f2

P1370: !_MEMBAR (FP) (Branch target of P1798)
ba P1371
nop

TARGET1798:
ba RET1798
nop


P1371: !_PREFETCH [24] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 64], 1

P1372: !_ST [28] (maybe <- 0x1800003) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 0] %asi
add   %l4, 1, %l4

P1373: !_ST [17] (maybe <- 0x4100000e) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 96 ]

P1374: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1374
nop
RET1374:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1375: !_BLD [21] (FP) (CBR) (Secondary ctx) (Branch target of P1496)
wr %g0, 0xf1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1375
nop
RET1375:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P1376
nop

TARGET1496:
ba RET1496
nop


P1376: !_MEMBAR (FP) (Secondary ctx)

P1377: !_BLD [24] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1378: !_MEMBAR (FP)

P1379: !_BSTC [17] (maybe <- 0x4100000f) (FP) (Branch target of P1355)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi
ba P1380
nop

TARGET1355:
ba RET1355
nop


P1380: !_MEMBAR (FP)

P1381: !_BST [10] (maybe <- 0x41000010) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P1382: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1383: !_ST [33] (maybe <- 0x41000011) (FP)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P1384: !_MEMBAR (FP)
membar #StoreLoad

P1385: !_BLD [19] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8

P1386: !_MEMBAR (FP)

P1387: !_BST [3] (maybe <- 0x41000012) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P1388: !_MEMBAR (FP)

P1389: !_BSTC [24] (maybe <- 0x41000017) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1389
nop
RET1389:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1390: !_MEMBAR (FP)
membar #StoreLoad

P1391: !_BLD [14] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1392: !_MEMBAR (FP)

P1393: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1394: !_MEMBAR (FP)

P1395: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1396: !_MEMBAR (FP)

P1397: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P1398: !_MEMBAR (FP)

P1399: !_BLD [26] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P1400: !_MEMBAR (FP)

P1401: !_ST [31] (maybe <- 0x41000019) (FP) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 192 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1401
nop
RET1401:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1402: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1403: !_BLD [5] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovd %f40, %f4

P1404: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1404
nop
RET1404:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1405: !_PREFETCH [19] (Int) (CBR)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1405
nop
RET1405:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1406: !_LD [7] (Int) (CBR)
lduw [%i0 + 128], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1406
nop
RET1406:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1407: !_MEMBAR (FP)

P1408: !_BSTC [17] (maybe <- 0x4100001a) (FP) (CBR) (Branch target of P1480)
wr %g0, 0xe0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1408
nop
RET1408:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1409
nop

TARGET1480:
ba RET1480
nop


P1409: !_MEMBAR (FP)
membar #StoreLoad

P1410: !_BLD [10] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1411: !_MEMBAR (FP)

P1412: !_BSTC [33] (maybe <- 0x4100001b) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1413: !_MEMBAR (FP)
membar #StoreLoad

P1414: !_IDC_FLIP [25] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
IDC_FLIP(1414, 25865, 3, 0x45800060, 0x60, %i3, 0x60, %l6, %l7, %o5, %l3)

P1415: !_ST [19] (maybe <- 0x4100001c) (FP)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]

P1416: !_ST [7] (maybe <- 0x1800004) (Int)
stw   %l4, [%i0 + 128 ]
add   %l4, 1, %l4

P1417: !_REPLACEMENT [3] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+16], %l6
st %l6, [%i3+16]
add %i3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]

P1418: !_ST [18] (maybe <- 0x4100001d) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 128 ]

P1419: !_LD [13] (Int) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1419
nop
RET1419:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1420: !_REPLACEMENT [4] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+32], %l7
st %l7, [%i2+32]
add %i2, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P1421: !_MEMBAR (FP)
membar #StoreLoad

P1422: !_BLD [23] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f6
fmovd %f40, %f8

P1423: !_MEMBAR (FP)

P1424: !_BLD [23] (FP) (Branch target of P1313)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11
ba P1425
nop

TARGET1313:
ba RET1313
nop


P1425: !_MEMBAR (FP) (Branch target of P1436)
ba P1426
nop

TARGET1436:
ba RET1436
nop


P1426: !_BSTC [23] (maybe <- 0x4100001e) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1427: !_MEMBAR (FP) (Secondary ctx)

P1428: !_BSTC [3] (maybe <- 0x41000021) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P1429: !_MEMBAR (FP) (Branch target of P1868)
membar #StoreLoad
ba P1430
nop

TARGET1868:
ba RET1868
nop


P1430: !_LD [17] (Int) (Branch target of P1744)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 96], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
ba P1431
nop

TARGET1744:
ba RET1744
nop


P1431: !_LD [21] (FP)
ld [%i3 + 0], %f12
! 1 addresses covered

P1432: !_MEMBAR (FP)
membar #StoreLoad

P1433: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f36, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P1434: !_MEMBAR (FP)

P1435: !_PREFETCH [13] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 32] %asi, 1

P1436: !_LD [16] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
lduwa [%i2 + 16] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1436
nop
RET1436:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1437: !_LD [1] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i0 + 4] %asi, %f2
! 1 addresses covered

P1438: !_MEMBAR (FP)

P1439: !_BSTC [27] (maybe <- 0x41000026) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P1440: !_MEMBAR (FP)
membar #StoreLoad

P1441: !_PREFETCH [23] (Int) (CBR) (Branch target of P1642)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1441
nop
RET1441:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1442
nop

TARGET1642:
ba RET1642
nop


P1442: !_PREFETCH [2] (Int)
prefetch [%i0 + 8], 1

P1443: !_LD [0] (Int)
lduw [%i0 + 0], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1444: !_MEMBAR (FP) (Secondary ctx)

P1445: !_BSTC [23] (maybe <- 0x41000028) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1446: !_MEMBAR (FP) (Secondary ctx)

P1447: !_BSTC [21] (maybe <- 0x4100002b) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1448: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1449: !_BLD [3] (FP) (Branch target of P1639)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f18, %f5
fmovd %f36, %f6
fmovd %f40, %f18
fmovs %f18, %f7
ba P1450
nop

TARGET1639:
ba RET1639
nop


P1450: !_MEMBAR (FP)

P1451: !_REPLACEMENT [25] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+96], %l3
st %l3, [%i3+96]
add %i3, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

P1452: !_LD [15] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 128] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1453: !_REPLACEMENT [20] (Int) (Branch target of P1401)
sethi %hi(0x2000), %o5
ld [%i3+256], %l6
st %l6, [%i3+256]
add %i3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
ba P1454
nop

TARGET1401:
ba RET1401
nop


P1454: !_LD [2] (Int)
lduw [%i0 + 8], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P1455: !_REPLACEMENT [6] (Int)
sethi %hi(0x2000), %l3
ld [%i3+96], %l7
st %l7, [%i3+96]
add %i3, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]

P1456: !_MEMBAR (FP)

P1457: !_BSTC [24] (maybe <- 0x4100002e) (FP) (Branch target of P1405)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi
ba P1458
nop

TARGET1405:
ba RET1405
nop


P1458: !_MEMBAR (FP)

P1459: !_BSTC [9] (maybe <- 0x41000030) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P1460: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1460
nop
RET1460:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1461: !_REPLACEMENT [18] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+128], %l3
st %l3, [%i2+128]
add %i2, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]

P1462: !_MEMBAR (FP)

P1463: !_BST [19] (maybe <- 0x41000032) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1464: !_MEMBAR (FP) (Branch target of P1827)
membar #StoreLoad
ba P1465
nop

TARGET1827:
ba RET1827
nop


P1465: !_BLD [23] (FP) (Branch target of P1679)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f8
fmovd %f40, %f10
ba P1466
nop

TARGET1679:
ba RET1679
nop


P1466: !_MEMBAR (FP) (Branch target of P1683)
ba P1467
nop

TARGET1683:
ba RET1683
nop


P1467: !_ST [6] (maybe <- 0x1800005) (Int) (Branch target of P1757)
stw   %l4, [%i0 + 96 ]
add   %l4, 1, %l4
ba P1468
nop

TARGET1757:
ba RET1757
nop


P1468: !_MEMBAR (FP)
membar #StoreLoad

P1469: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1470: !_MEMBAR (FP)

P1471: !_REPLACEMENT [28] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P1472: !_ST [18] (maybe <- 0x41000033) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 128 ] %asi

P1473: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1556)
membar #StoreLoad
ba P1474
nop

TARGET1556:
ba RET1556
nop


P1474: !_BLD [32] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

P1475: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1577)
ba P1476
nop

TARGET1577:
ba RET1577
nop


P1476: !_MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1476
nop
RET1476:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1477: !_BLD [12] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P1478: !_MEMBAR (FP)

P1479: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f0
membar #Sync
! 1 addresses covered

P1480: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1480
nop
RET1480:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1481: !_BSTC [10] (maybe <- 0x41000034) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P1482: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1483: !_REPLACEMENT [9] (Int) (Nucleus ctx) (Branch target of P1622)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+32], %l3
st %l3, [%i3+32]
add %i3, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
ba P1484
nop

TARGET1622:
ba RET1622
nop


P1484: !_REPLACEMENT [20] (Int)
sethi %hi(0x2000), %l6
ld [%i3+256], %o5
st %o5, [%i3+256]
add %i3, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]

P1485: !_ST [21] (maybe <- 0x41000035) (FP) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1485
nop
RET1485:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1486: !_REPLACEMENT [21] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P1487: !_PREFETCH [8] (Int) (Branch target of P1502)
prefetch [%i1 + 0], 1
ba P1488
nop

TARGET1502:
ba RET1502
nop


P1488: !_REPLACEMENT [25] (Int)
sethi %hi(0x2000), %o5
ld [%i3+96], %l6
st %l6, [%i3+96]
add %i3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]

P1489: !_REPLACEMENT [24] (Int)
sethi %hi(0x2000), %l7
ld [%i3+64], %l3
st %l3, [%i3+64]
add %i3, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P1490: !_PREFETCH [33] (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P1491: !_REPLACEMENT [4] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+32], %o5
st %o5, [%i2+32]
add %i2, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1491
nop
RET1491:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1492: !_LD [8] (Int)
lduw [%i1 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1493: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1493
nop
RET1493:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1494: !_BLD [26] (FP) (Branch target of P1719)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2
ba P1495
nop

TARGET1719:
ba RET1719
nop


P1495: !_MEMBAR (FP) (Branch target of P1368)
ba P1496
nop

TARGET1368:
ba RET1368
nop


P1496: !_ST [15] (maybe <- 0x41000036) (FP) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 128 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1496
nop
RET1496:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1497: !_REPLACEMENT [14] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P1498: !_MEMBAR (FP)

P1499: !_BST [12] (maybe <- 0x41000037) (FP) (Branch target of P1799)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P1500
nop

TARGET1799:
ba RET1799
nop


P1500: !_MEMBAR (FP)
membar #StoreLoad

P1501: !_BLD [11] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1502: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1502
nop
RET1502:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1503: !_LD [3] (FP)
ld [%i0 + 16], %f6
! 1 addresses covered

P1504: !_REPLACEMENT [30] (Int)
sethi %hi(0x2000), %o5
ld [%i3+128], %l6
st %l6, [%i3+128]
add %i3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P1505: !_REPLACEMENT [19] (Int) (Branch target of P1375)
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
ba P1506
nop

TARGET1375:
ba RET1375
nop


P1506: !_REPLACEMENT [17] (Int)
sethi %hi(0x2000), %l6
ld [%i3+96], %o5
st %o5, [%i3+96]
add %i3, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]

P1507: !_PREFETCH [26] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 128] %asi, 1

P1508: !_MEMBAR (FP)

P1509: !_BST [2] (maybe <- 0x4100003a) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P1510: !_MEMBAR (FP)
membar #StoreLoad

P1511: !_ST [2] (maybe <- 0x4100003f) (FP) (CBR) (Branch target of P1493)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 8 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1511
nop
RET1511:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1512
nop

TARGET1493:
ba RET1493
nop


P1512: !_ST [30] (maybe <- 0x41000040) (FP) (CBR)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1512
nop
RET1512:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1513: !_MEMBAR (FP)

P1514: !_BST [1] (maybe <- 0x41000041) (FP) (Branch target of P1873)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P1515
nop

TARGET1873:
ba RET1873
nop


P1515: !_MEMBAR (FP)
membar #StoreLoad

P1516: !_BLD [19] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1517: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1517
nop
RET1517:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1518: !_BST [4] (maybe <- 0x41000046) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P1519: !_MEMBAR (FP) (Branch target of P1660)
membar #StoreLoad
ba P1520
nop

TARGET1660:
ba RET1660
nop


P1520: !_ST [14] (maybe <- 0x4100004b) (FP)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P1521: !_PREFETCH [14] (Int)
prefetch [%i3 + 64], 1

P1522: !_LD [23] (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 32], %f8
! 1 addresses covered

P1523: !_PREFETCH [13] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i3 + 32] %asi, 1

P1524: !_REPLACEMENT [22] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P1525: !_MEMBAR (FP)

P1526: !_BSTC [10] (maybe <- 0x4100004c) (FP) (Branch target of P1763)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi
ba P1527
nop

TARGET1763:
ba RET1763
nop


P1527: !_MEMBAR (FP)
membar #StoreLoad

P1528: !_PREFETCH [24] (Int) (Branch target of P1581)
prefetch [%i2 + 64], 1
ba P1529
nop

TARGET1581:
ba RET1581
nop


P1529: !_MEMBAR (FP) (Branch target of P1701)
membar #StoreLoad
ba P1530
nop

TARGET1701:
ba RET1701
nop


P1530: !_BLD [8] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P1531: !_MEMBAR (FP)

P1532: !_REPLACEMENT [23] (Int)
sethi %hi(0x2000), %o5
ld [%i3+32], %l6
st %l6, [%i3+32]
add %i3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P1533: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1533
nop
RET1533:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1534: !_BSTC [2] (maybe <- 0x4100004d) (FP) (Branch target of P1854)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P1535
nop

TARGET1854:
ba RET1854
nop


P1535: !_MEMBAR (FP)
membar #StoreLoad

P1536: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P1537: !_MEMBAR (FP)

P1538: !_BSTC [3] (maybe <- 0x41000052) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P1539: !_MEMBAR (FP)
membar #StoreLoad

P1540: !_ST [14] (maybe <- 0x1800006) (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1541: !_ST [5] (maybe <- 0x41000057) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P1542: !_MEMBAR (FP)
membar #StoreLoad

P1543: !_BLD [21] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1543
nop
RET1543:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1544: !_MEMBAR (FP)

P1545: !_IDC_FLIP [20] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(1545, 22276, 3, 0x45000100, 0x100, %i2, 0x100, %l6, %l7, %o5, %l3)

P1546: !_MEMBAR (FP)

P1547: !_BST [23] (maybe <- 0x41000058) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1547
nop
RET1547:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1548: !_MEMBAR (FP)
membar #StoreLoad

P1549: !_LD [28] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 0], %f0
! 1 addresses covered

P1550: !_REPLACEMENT [5] (Int) (Secondary ctx) (Branch target of P1406)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+64], %o5
st %o5, [%i2+64]
add %i2, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
ba P1551
nop

TARGET1406:
ba RET1406
nop


P1551: !_PREFETCH [14] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 64], 1

P1552: !_MEMBAR (FP)

P1553: !_BSTC [23] (maybe <- 0x4100005b) (FP) (Branch target of P1778)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P1554
nop

TARGET1778:
ba RET1778
nop


P1554: !_MEMBAR (FP)
membar #StoreLoad

P1555: !_PREFETCH [27] (Int) (CBR)
prefetch [%i2 + 160], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1555
nop
RET1555:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1556: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1556
nop
RET1556:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1557: !_BLD [30] (FP) (CBR) (Branch target of P1302)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1557
nop
RET1557:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1558
nop

TARGET1302:
ba RET1302
nop


P1558: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1558
nop
RET1558:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1559: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P1560: !_MEMBAR (FP)

P1561: !_REPLACEMENT [9] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+32], %l6
st %l6, [%i2+32]
add %i2, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P1562: !_LD [28] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i3 + 0] %asi, %f4
! 1 addresses covered

P1563: !_MEMBAR (FP)
membar #StoreLoad

P1564: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1565: !_MEMBAR (FP)

P1566: !_BLD [16] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f6

P1567: !_MEMBAR (FP)

P1568: !_LD [13] (FP) (Branch target of P1703)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 32], %f7
! 1 addresses covered
ba P1569
nop

TARGET1703:
ba RET1703
nop


P1569: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1569
nop
RET1569:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1570: !_BSTC [6] (maybe <- 0x4100005e) (FP) (Branch target of P1340)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P1571
nop

TARGET1340:
ba RET1340
nop


P1571: !_MEMBAR (FP)
membar #StoreLoad

P1572: !_REPLACEMENT [31] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+192], %l3
st %l3, [%i3+192]
add %i3, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]

P1573: !_MEMBAR (FP)
membar #StoreLoad

P1574: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1575: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1575
nop
RET1575:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1576: !_PREFETCH [19] (Int) (Nucleus ctx) (Branch target of P1826)
wr %g0, 0x4, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 0] %asi, 1
ba P1577
nop

TARGET1826:
ba RET1826
nop


P1577: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1577
nop
RET1577:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1578: !_BST [21] (maybe <- 0x41000060) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1579: !_MEMBAR (FP)
membar #StoreLoad

P1580: !_IDC_FLIP [13] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(1580, 28407, 3, 0x44000020, 0x20, %i2, 0x20, %l6, %l7, %o5, %l3)

P1581: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1581
nop
RET1581:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1582: !_BSTC [16] (maybe <- 0x41000063) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1583: !_MEMBAR (FP)
membar #StoreLoad

P1584: !_ST [13] (maybe <- 0x41000064) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P1585: !_MEMBAR (FP)
membar #StoreLoad

P1586: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f10
fmovd %f40, %f12

P1587: !_MEMBAR (FP)

P1588: !_BSTC [29] (maybe <- 0x41000065) (FP) (CBR) (Branch target of P1543)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1588
nop
RET1588:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P1589
nop

TARGET1543:
ba RET1543
nop


P1589: !_MEMBAR (FP)
membar #StoreLoad

P1590: !_IDC_FLIP [15] (Int) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(1590, 16772, 3, 0x44000080, 0x80, %i2, 0x80, %l6, %l7, %o5, %l3)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1590
nop
RET1590:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1591: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1766)
ba P1592
nop

TARGET1766:
ba RET1766
nop


P1592: !_BSTC [33] (maybe <- 0x41000066) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1593: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1569)
ba P1594
nop

TARGET1569:
ba RET1569
nop


P1594: !_BST [25] (maybe <- 0x41000067) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P1595: !_MEMBAR (FP)
membar #StoreLoad

P1596: !_LD [30] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 128], %f13
! 1 addresses covered

P1597: !_LD [26] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i2 + 128] %asi, %f14
! 1 addresses covered

P1598: !_ST [1] (maybe <- 0x41000069) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P1599: !_LD [31] (Int) (Branch target of P1533)
lduw [%i3 + 192], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
ba P1600
nop

TARGET1533:
ba RET1533
nop


P1600: !_MEMBAR (FP)
membar #StoreLoad

P1601: !_BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1601
nop
RET1601:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1602: !_MEMBAR (FP)

P1603: !_REPLACEMENT [33] (Int) (Nucleus ctx) (Branch target of P1558)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
ba P1604
nop

TARGET1558:
ba RET1558
nop


P1604: !_PREFETCH [12] (Int)
prefetch [%i2 + 4], 1

P1605: !_MEMBAR (FP)

P1606: !_BST [18] (maybe <- 0x4100006a) (FP) (Branch target of P1309)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi
ba P1607
nop

TARGET1309:
ba RET1309
nop


P1607: !_MEMBAR (FP)
membar #StoreLoad

P1608: !_BLD [7] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f2

P1609: !_MEMBAR (FP)

P1610: !_BSTC [2] (maybe <- 0x4100006b) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P1611: !_MEMBAR (FP)
membar #StoreLoad

P1612: !_REPLACEMENT [11] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P1613: !_REPLACEMENT [5] (Int)
sethi %hi(0x2000), %l7
ld [%i3+64], %l3
st %l3, [%i3+64]
add %i3, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P1614: !_PREFETCH [4] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i0 + 32] %asi, 1

P1615: !_ST [22] (maybe <- 0x1800007) (Int) (Branch target of P1649)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
ba P1616
nop

TARGET1649:
ba RET1649
nop


P1616: !_REPLACEMENT [5] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+64], %l7
st %l7, [%i2+64]
add %i2, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1616
nop
RET1616:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1617: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P1419)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1617
nop
RET1617:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P1618
nop

TARGET1419:
ba RET1419
nop


P1618: !_BSTC [5] (maybe <- 0x41000070) (FP) (CBR) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1618
nop
RET1618:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1619: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1620: !_ST [26] (maybe <- 0x41000072) (FP) (CBR)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1620
nop
RET1620:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1621: !_ST [30] (maybe <- 0x1800008) (Int) (CBR)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1621
nop
RET1621:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1622: !_ST [6] (maybe <- 0x1800009) (Int) (CBR)
stw   %l4, [%i0 + 96 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1622
nop
RET1622:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1623: !_LD [31] (FP) (Branch target of P1624)
ld [%i3 + 192], %f3
! 1 addresses covered
ba P1624
nop

TARGET1624:
ba RET1624
nop


P1624: !_MEMBAR (FP) (CBR) (Branch target of P1916)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1624
nop
RET1624:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1625
nop

TARGET1916:
ba RET1916
nop


P1625: !_BST [5] (maybe <- 0x41000073) (FP) (Branch target of P1907)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P1626
nop

TARGET1907:
ba RET1907
nop


P1626: !_MEMBAR (FP)
membar #StoreLoad

P1627: !_LD [11] (FP) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 0] %asi, %f4
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1627
nop
RET1627:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1628: !_MEMBAR (FP) (Secondary ctx)

P1629: !_BSTC [20] (maybe <- 0x41000075) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

P1630: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1630
nop
RET1630:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1631: !_BST [18] (maybe <- 0x41000076) (FP) (Branch target of P1860)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi
ba P1632
nop

TARGET1860:
ba RET1860
nop


P1632: !_MEMBAR (FP)

P1633: !_BST [13] (maybe <- 0x41000077) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1634: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1635: !_BLD [12] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1636: !_MEMBAR (FP)

P1637: !_PREFETCH [29] (Int) (CBR)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1637
nop
RET1637:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1638: !_MEMBAR (FP)
membar #StoreLoad

P1639: !_BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f8
fmovd %f40, %f10

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1639
nop
RET1639:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1640: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1640
nop
RET1640:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1641: !_ST [10] (maybe <- 0x180000a) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
stwa   %l4, [%i1 + 64] %asi
add   %l4, 1, %l4

P1642: !_LD [10] (Int) (CBR)
lduw [%i1 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1642
nop
RET1642:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1643: !_ST [16] (maybe <- 0x4100007a) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 16 ]

P1644: !_LD [26] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 128] %asi, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1645: !_MEMBAR (FP)
membar #StoreLoad

P1646: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1647: !_MEMBAR (FP)

P1648: !_ST [24] (maybe <- 0x4100007b) (FP) (Branch target of P1620)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]
ba P1649
nop

TARGET1620:
ba RET1620
nop


P1649: !_ST [9] (maybe <- 0x180000b) (Int) (CBR) (Branch target of P1621)
stw   %l4, [%i1 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1649
nop
RET1649:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P1650
nop

TARGET1621:
ba RET1621
nop


P1650: !_ST [28] (maybe <- 0x4100007c) (FP) (Branch target of P1588)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]
ba P1651
nop

TARGET1588:
ba RET1588
nop


P1651: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1692)
ba P1652
nop

TARGET1692:
ba RET1692
nop


P1652: !_BSTC [21] (maybe <- 0x4100007d) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1653: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1859)
membar #StoreLoad
ba P1654
nop

TARGET1859:
ba RET1859
nop


P1654: !_BLD [1] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f12
fmovd %f34, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P1655: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1726)
ba P1656
nop

TARGET1726:
ba RET1726
nop


P1656: !_BSTC [32] (maybe <- 0x41000080) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

P1657: !_MEMBAR (FP) (CBR) (Branch target of P1743)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1657
nop
RET1657:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1658
nop

TARGET1743:
ba RET1743
nop


P1658: !_IDC_FLIP [16] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(1658, 24294, 3, 0x44800010, 0x10, %i2, 0x10, %l6, %l7, %o5, %l3)

P1659: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1660: !_BLD [1] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f18, %f3
fmovd %f36, %f4
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1660
nop
RET1660:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1661: !_MEMBAR (FP) (Secondary ctx)

P1662: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f6
fmovd %f40, %f8

P1663: !_MEMBAR (FP)

P1664: !_ST [4] (maybe <- 0x41000081) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P1665: !_IDC_FLIP [8] (Int)
IDC_FLIP(1665, 16893, 3, 0x43800000, 0x0, %i1, 0x0, %l6, %l7, %o5, %l3)

P1666: !_MEMBAR (FP) (Branch target of P1618)
ba P1667
nop

TARGET1618:
ba RET1618
nop


P1667: !_BSTC [29] (maybe <- 0x41000082) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1667
nop
RET1667:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1668: !_MEMBAR (FP) (Branch target of P1677)
membar #StoreLoad
ba P1669
nop

TARGET1677:
ba RET1677
nop


P1669: !_BLD [33] (FP) (Branch target of P1930)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P1670
nop

TARGET1930:
ba RET1930
nop


P1670: !_MEMBAR (FP)

P1671: !_BLD [2] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f10
fmovd %f34, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P1672: !_MEMBAR (FP)

P1673: !_ST [9] (maybe <- 0x41000083) (FP) (Branch target of P1781)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 32 ]
ba P1674
nop

TARGET1781:
ba RET1781
nop


P1674: !_MEMBAR (FP)

P1675: !_BSTC [20] (maybe <- 0x41000084) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P1676: !_MEMBAR (FP)
membar #StoreLoad

P1677: !_BLD [32] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1677
nop
RET1677:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1678: !_MEMBAR (FP) (Branch target of P1353)
ba P1679
nop

TARGET1353:
ba RET1353
nop


P1679: !_BSTC [30] (maybe <- 0x41000085) (FP) (CBR) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1679
nop
RET1679:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1680: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1681: !_ST [4] (maybe <- 0x180000c) (Int) (Branch target of P1575)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4
ba P1682
nop

TARGET1575:
ba RET1575
nop


P1682: !_MEMBAR (FP)

P1683: !_BSTC [24] (maybe <- 0x41000086) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1683
nop
RET1683:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1684: !_MEMBAR (FP)

P1685: !_BST [31] (maybe <- 0x41000088) (FP) (Branch target of P1590)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 192 ] %asi
ba P1686
nop

TARGET1590:
ba RET1590
nop


P1686: !_MEMBAR (FP)
membar #StoreLoad

P1687: !_BLD [0] (FP) (Branch target of P1374)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4
ba P1688
nop

TARGET1374:
ba RET1374
nop


P1688: !_MEMBAR (FP)

P1689: !_LD [14] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lda    [%i3 + 64] %asi, %f5
! 1 addresses covered

P1690: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1690
nop
RET1690:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1691: !_BST [33] (maybe <- 0x41000089) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1692: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1692
nop
RET1692:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1693: !_LD [5] (Int) (CBR)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1693
nop
RET1693:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1694: !_MEMBAR (FP) (Branch target of P1627)
ba P1695
nop

TARGET1627:
ba RET1627
nop


P1695: !_BST [24] (maybe <- 0x4100008a) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P1696: !_MEMBAR (FP)

P1697: !_BSTC [11] (maybe <- 0x4100008c) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1698: !_MEMBAR (FP)
membar #StoreLoad

P1699: !_LD [13] (FP) (CBR)
ld [%i2 + 32], %f6
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1699
nop
RET1699:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1700: !_MEMBAR (FP) (Branch target of P1879)
membar #StoreLoad
ba P1701
nop

TARGET1879:
ba RET1879
nop


P1701: !_BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1701
nop
RET1701:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1702: !_MEMBAR (FP)

P1703: !_BSTC [13] (maybe <- 0x4100008f) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1703
nop
RET1703:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1704: !_MEMBAR (FP)
membar #StoreLoad

P1705: !_LD [14] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i2 + 64] %asi, %f8
! 1 addresses covered

P1706: !_MEMBAR (FP)
membar #StoreLoad

P1707: !_BLD [5] (FP) (Branch target of P1640)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10
ba P1708
nop

TARGET1640:
ba RET1640
nop


P1708: !_MEMBAR (FP) (CBR) (Branch target of P1667)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1708
nop
RET1708:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1709
nop

TARGET1667:
ba RET1667
nop


P1709: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f18, %f13
fmovd %f36, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P1710: !_MEMBAR (FP)

P1711: !_BLD [18] (FP) (Branch target of P1883)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f0
membar #Sync
! 1 addresses covered
ba P1712
nop

TARGET1883:
ba RET1883
nop


P1712: !_MEMBAR (FP)

P1713: !_BLD [26] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P1714: !_MEMBAR (FP) (Branch target of P1630)
ba P1715
nop

TARGET1630:
ba RET1630
nop


P1715: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1716: !_MEMBAR (FP)

P1717: !_LD [5] (FP)
ld [%i0 + 64], %f4
! 1 addresses covered

P1718: !_MEMBAR (FP) (Secondary ctx)

P1719: !_BST [23] (maybe <- 0x41000092) (FP) (CBR) (Secondary ctx) (Branch target of P1690)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1719
nop
RET1719:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1720
nop

TARGET1690:
ba RET1690
nop


P1720: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1746)
membar #StoreLoad
ba P1721
nop

TARGET1746:
ba RET1746
nop


P1721: !_BLD [5] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P1722: !_MEMBAR (FP) (Secondary ctx)

P1723: !_REPLACEMENT [20] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+256], %l6
st %l6, [%i2+256]
add %i2, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]

P1724: !_MEMBAR (FP)

P1725: !_BSTC [13] (maybe <- 0x41000095) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1726: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1726
nop
RET1726:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1727: !_PREFETCH [22] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 4], 1

P1728: !_LD [7] (FP) (CBR) (Branch target of P1307)
ld [%i0 + 128], %f7
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1728
nop
RET1728:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1729
nop

TARGET1307:
ba RET1307
nop


P1729: !_MEMBAR (FP) (Branch target of P1354)
membar #StoreLoad
ba P1730
nop

TARGET1354:
ba RET1354
nop


P1730: !_BLD [26] (FP) (Branch target of P1485)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9
ba P1731
nop

TARGET1485:
ba RET1485
nop


P1731: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1731
nop
RET1731:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1732: !_BSTC [24] (maybe <- 0x41000098) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P1733: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1332)
membar #StoreLoad
ba P1734
nop

TARGET1332:
ba RET1332
nop


P1734: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f10
fmovd %f34, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P1735: !_MEMBAR (FP)

P1736: !_PREFETCH [15] (Int)
prefetch [%i3 + 128], 1

P1737: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1299)
ba P1738
nop

TARGET1299:
ba RET1299
nop


P1738: !_BST [20] (maybe <- 0x4100009a) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

P1739: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1740: !_REPLACEMENT [4] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+32], %l3
st %l3, [%i2+32]
add %i2, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

P1741: !_IDC_FLIP [12] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
IDC_FLIP(1741, 12674, 3, 0x44000004, 0x4, %i3, 0x4, %l6, %l7, %o5, %l3)

P1742: !_REPLACEMENT [31] (Int)
sethi %hi(0x2000), %l6
ld [%i2+192], %o5
st %o5, [%i2+192]
add %i2, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]

P1743: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1743
nop
RET1743:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1744: !_BST [23] (maybe <- 0x4100009b) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1744
nop
RET1744:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1745: !_MEMBAR (FP) (Branch target of P1903)
membar #StoreLoad
ba P1746
nop

TARGET1903:
ba RET1903
nop


P1746: !_BLD [1] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f18, %f1
fmovd %f36, %f2
fmovd %f40, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1746
nop
RET1746:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1747: !_MEMBAR (FP)

P1748: !_REPLACEMENT [25] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+96], %l3
st %l3, [%i3+96]
add %i3, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

P1749: !_MEMBAR (FP)
membar #StoreLoad

P1750: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P1751: !_MEMBAR (FP)

P1752: !_REPLACEMENT [14] (Int)
sethi %hi(0x2000), %l6
ld [%i3+64], %o5
st %o5, [%i3+64]
add %i3, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

P1753: !_ST [3] (maybe <- 0x180000d) (Int)
stw   %l4, [%i0 + 16 ]
add   %l4, 1, %l4

P1754: !_MEMBAR (FP)

P1755: !_BST [23] (maybe <- 0x4100009e) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1756: !_MEMBAR (FP) (CBR) (Branch target of P1835)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1756
nop
RET1756:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1757
nop

TARGET1835:
ba RET1835
nop


P1757: !_REPLACEMENT [14] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+64], %l6
st %l6, [%i2+64]
add %i2, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1757
nop
RET1757:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1758: !_MEMBAR (FP)

P1759: !_BSTC [14] (maybe <- 0x410000a1) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P1760: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1760
nop
RET1760:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1761: !_BST [32] (maybe <- 0x410000a2) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P1762: !_MEMBAR (FP)
membar #StoreLoad

P1763: !_BLD [18] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1763
nop
RET1763:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1764: !_MEMBAR (FP) (Secondary ctx)

P1765: !_PREFETCH [9] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i1 + 32] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1765
nop
RET1765:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1766: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1766
nop
RET1766:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1767: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f6
fmovd %f40, %f8

P1768: !_MEMBAR (FP)

P1769: !_LD [12] (FP)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 4], %f9
! 1 addresses covered

P1770: !_REPLACEMENT [1] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P1771: !_MEMBAR (FP)

P1772: !_BSTC [30] (maybe <- 0x410000a3) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P1773: !_MEMBAR (FP)
membar #StoreLoad

P1774: !_LD [9] (FP)
ld [%i1 + 32], %f10
! 1 addresses covered

P1775: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1776: !_BLD [33] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1777: !_MEMBAR (FP) (Secondary ctx)

P1778: !_BST [22] (maybe <- 0x410000a4) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1778
nop
RET1778:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1779: !_MEMBAR (FP)
membar #StoreLoad

P1780: !_PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 32] %asi, 1

P1781: !_ST [6] (maybe <- 0x410000a7) (FP) (CBR)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 96 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1781
nop
RET1781:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1782: !_LD [4] (Int) (Branch target of P1512)
lduw [%i0 + 32], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
ba P1783
nop

TARGET1512:
ba RET1512
nop


P1783: !_MEMBAR (FP) (Branch target of P1856)
membar #StoreLoad
ba P1784
nop

TARGET1856:
ba RET1856
nop


P1784: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f12
fmovd %f34, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P1785: !_MEMBAR (FP)

P1786: !_BST [8] (maybe <- 0x410000a8) (FP) (Branch target of P1765)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi
ba P1787
nop

TARGET1765:
ba RET1765
nop


P1787: !_MEMBAR (FP)
membar #StoreLoad

P1788: !_PREFETCH [15] (Int) (Branch target of P1557)
prefetch [%i2 + 128], 1
ba P1789
nop

TARGET1557:
ba RET1557
nop


P1789: !_MEMBAR (FP)
membar #StoreLoad

P1790: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P1791: !_MEMBAR (FP)

P1792: !_PREFETCH [10] (Int) (CBR) (Branch target of P1756)
prefetch [%i1 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1792
nop
RET1792:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P1793
nop

TARGET1756:
ba RET1756
nop


P1793: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1794: !_BLD [9] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1795: !_MEMBAR (FP) (Secondary ctx)

P1796: !_REPLACEMENT [28] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P1797: !_MEMBAR (FP) (Branch target of P1731)
ba P1798
nop

TARGET1731:
ba RET1731
nop


P1798: !_BSTC [23] (maybe <- 0x410000aa) (FP) (CBR) (Branch target of P1904)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1798
nop
RET1798:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P1799
nop

TARGET1904:
ba RET1904
nop


P1799: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1799
nop
RET1799:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1800: !_ST [0] (maybe <- 0x180000e) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1801: !_MEMBAR (FP)
membar #StoreLoad

P1802: !_BLD [11] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f6
fmovd %f40, %f8

P1803: !_MEMBAR (FP) (Branch target of P1792)
ba P1804
nop

TARGET1792:
ba RET1792
nop


P1804: !_PREFETCH [16] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 16], 1

P1805: !_REPLACEMENT [15] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+128], %l7
st %l7, [%i3+128]
add %i3, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]

P1806: !_LD [8] (Int) (Branch target of P1893)
lduw [%i1 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P1807
nop

TARGET1893:
ba RET1893
nop


P1807: !_PREFETCH [6] (Int)
prefetch [%i0 + 96], 1

P1808: !_MEMBAR (FP)
membar #StoreLoad

P1809: !_BLD [17] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P1810: !_MEMBAR (FP)

P1811: !_BLD [26] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1812: !_MEMBAR (FP)

P1813: !_ST [10] (maybe <- 0x180000f) (Int)
stw   %l4, [%i1 + 64 ]
add   %l4, 1, %l4

P1814: !_REPLACEMENT [30] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l3
ld [%i3+128], %l7
st %l7, [%i3+128]
add %i3, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]

P1815: !_PREFETCH [17] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 96], 1

P1816: !_MEMBAR (FP)

P1817: !_BST [9] (maybe <- 0x410000ad) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P1818: !_MEMBAR (FP)
membar #StoreLoad

P1819: !_PREFETCH [12] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 4] %asi, 1

P1820: !_REPLACEMENT [26] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+128], %l3
st %l3, [%i3+128]
add %i3, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]

P1821: !_LD [7] (Int)
lduw [%i0 + 128], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1822: !_PREFETCH [8] (Int) (Branch target of P1693)
prefetch [%i1 + 0], 1
ba P1823
nop

TARGET1693:
ba RET1693
nop


P1823: !_ST [14] (maybe <- 0x1800010) (Int) (LE) (Branch target of P1699)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l3, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
stwa   %o5, [%i2 + 64] %asi
add   %l4, 1, %l4
ba P1824
nop

TARGET1699:
ba RET1699
nop


P1824: !_LD [25] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 96] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1825: !_LD [0] (FP) (Branch target of P1547)
ld [%i0 + 0], %f12
! 1 addresses covered
ba P1826
nop

TARGET1547:
ba RET1547
nop


P1826: !_REPLACEMENT [5] (Int) (CBR)
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1826
nop
RET1826:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1827: !_REPLACEMENT [25] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l3
ld [%i3+96], %l7
st %l7, [%i3+96]
add %i3, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1827
nop
RET1827:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1828: !_MEMBAR (FP)
membar #StoreLoad

P1829: !_BLD [31] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 192] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1830: !_MEMBAR (FP)

P1831: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P1832: !_MEMBAR (FP)

P1833: !_ST [27] (maybe <- 0x410000af) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 160 ]

P1834: !_REPLACEMENT [9] (Int) (Branch target of P1728)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+32], %l6
st %l6, [%i2+32]
add %i2, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
ba P1835
nop

TARGET1728:
ba RET1728
nop


P1835: !_FLUSHI [24] (Int) (CBR)
flush %g0 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1835
nop
RET1835:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1836: !_MEMBAR (FP)
membar #StoreLoad

P1837: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f0
membar #Sync
! 2 addresses covered
fmovs %f8, %f1

P1838: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1838
nop
RET1838:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1839: !_BST [12] (maybe <- 0x410000b0) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1840: !_MEMBAR (FP)

P1841: !_BSTC [30] (maybe <- 0x410000b3) (FP) (Branch target of P1637)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi
ba P1842
nop

TARGET1637:
ba RET1637
nop


P1842: !_MEMBAR (FP)
membar #StoreLoad

P1843: !_LD [23] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 32] %asi, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P1844: !_REPLACEMENT [9] (Int) (Secondary ctx) (Branch target of P1441)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+32], %l7
st %l7, [%i3+32]
add %i3, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
ba P1845
nop

TARGET1441:
ba RET1441
nop


P1845: !_REPLACEMENT [33] (Int)
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P1846: !_MEMBAR (FP)
membar #StoreLoad

P1847: !_BLD [12] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f2
fmovd %f40, %f4

P1848: !_MEMBAR (FP)

P1849: !_BST [1] (maybe <- 0x410000b4) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P1850: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1850
nop
RET1850:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1851: !_BSTC [15] (maybe <- 0x410000b9) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P1852: !_MEMBAR (FP)

P1853: !_BST [0] (maybe <- 0x410000ba) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P1854: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1854
nop
RET1854:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1855: !_REPLACEMENT [7] (Int)
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P1856: !_REPLACEMENT [10] (Int) (CBR) (Secondary ctx) (Branch target of P1460)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1856
nop
RET1856:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P1857
nop

TARGET1460:
ba RET1460
nop


P1857: !_REPLACEMENT [9] (Int)
sethi %hi(0x2000), %l3
ld [%i3+32], %l7
st %l7, [%i3+32]
add %i3, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P1858: !_REPLACEMENT [32] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %o5
ld [%i3+256], %l6
st %l6, [%i3+256]
add %i3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]

P1859: !_REPLACEMENT [8] (Int) (CBR) (Branch target of P1926)
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1859
nop
RET1859:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1860
nop

TARGET1926:
ba RET1926
nop


P1860: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1860
nop
RET1860:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1861: !_BSTC [28] (maybe <- 0x410000bf) (FP) (Secondary ctx) (Branch target of P1297)
wr %g0, 0xe1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P1862
nop

TARGET1297:
ba RET1297
nop


P1862: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1863: !_BLD [23] (FP) (Secondary ctx) (Branch target of P1389)
wr %g0, 0xf1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7
ba P1864
nop

TARGET1389:
ba RET1389
nop


P1864: !_MEMBAR (FP) (Secondary ctx)

P1865: !_BLD [8] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1866: !_MEMBAR (FP)

P1867: !_BLD [4] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f10
fmovd %f34, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P1868: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P1708)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1868
nop
RET1868:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1869
nop

TARGET1708:
ba RET1708
nop


P1869: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P1870: !_MEMBAR (FP)

P1871: !_BSTC [20] (maybe <- 0x410000c0) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P1872: !_MEMBAR (FP) (Branch target of P1408)
membar #StoreLoad
ba P1873
nop

TARGET1408:
ba RET1408
nop


P1873: !_BLD [18] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i3 + 128] %asi, %f0
membar #Sync
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1873
nop
RET1873:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1874: !_MEMBAR (FP)

P1875: !_ST [9] (maybe <- 0x1800011) (Int)
stw   %l4, [%i1 + 32 ]
add   %l4, 1, %l4

P1876: !_MEMBAR (FP)
membar #StoreLoad

P1877: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P1878: !_MEMBAR (FP)

P1879: !_LD [9] (Int) (CBR)
lduw [%i1 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1879
nop
RET1879:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1880: !_MEMBAR (FP) (Secondary ctx)

P1881: !_BSTC [23] (maybe <- 0x410000c1) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1882: !_MEMBAR (FP) (Secondary ctx)

P1883: !_BSTC [28] (maybe <- 0x410000c4) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1883
nop
RET1883:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1884: !_MEMBAR (FP)
membar #StoreLoad

P1885: !_BLD [14] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1886: !_MEMBAR (FP)

P1887: !_LD [25] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 96] %asi, %f4
! 1 addresses covered

P1888: !_PREFETCH [25] (Int) (Branch target of P1616)
prefetch [%i2 + 96], 1
ba P1889
nop

TARGET1616:
ba RET1616
nop


P1889: !_MEMBAR (FP) (Secondary ctx)

P1890: !_BSTC [13] (maybe <- 0x410000c5) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1891: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1892: !_PREFETCH [32] (Int) (Nucleus ctx) (Branch target of P1850)
wr %g0, 0x4, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 256] %asi, 1
ba P1893
nop

TARGET1850:
ba RET1850
nop


P1893: !_ST [7] (maybe <- 0x1800012) (Int) (CBR)
stw   %l4, [%i0 + 128 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1893
nop
RET1893:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1894: !_REPLACEMENT [32] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+256], %l6
st %l6, [%i2+256]
add %i2, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]

P1895: !_ST [1] (maybe <- 0x1800013) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1896: !_ST [10] (maybe <- 0x410000c8) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i1 + 64 ] %asi

P1897: !_PREFETCH [3] (Int) (Branch target of P1517)
prefetch [%i0 + 16], 1
ba P1898
nop

TARGET1517:
ba RET1517
nop


P1898: !_REPLACEMENT [31] (Int)
sethi %hi(0x2000), %l3
ld [%i2+192], %l7
st %l7, [%i2+192]
add %i2, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]

P1899: !_MEMBAR (FP)

P1900: !_BST [23] (maybe <- 0x410000c9) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1901: !_MEMBAR (FP)
membar #StoreLoad

P1902: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P1903: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1903
nop
RET1903:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1904: !_PREFETCH [5] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1904
nop
RET1904:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1905: !_PREFETCH [10] (Int)
prefetch [%i1 + 64], 1

P1906: !_REPLACEMENT [5] (Int)
sethi %hi(0x2000), %l3
ld [%i2+64], %l7
st %l7, [%i2+64]
add %i2, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P1907: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1907
nop
RET1907:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1908: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1909: !_MEMBAR (FP)

P1910: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1911: !_MEMBAR (FP)

P1912: !_LD [23] (FP)
ld [%i3 + 32], %f12
! 1 addresses covered

P1913: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1913
nop
RET1913:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1914: !_BLD [10] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1915: !_MEMBAR (FP)

P1916: !_BST [14] (maybe <- 0x410000cc) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1916
nop
RET1916:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1917: !_MEMBAR (FP)
membar #StoreLoad

P1918: !_BLD [32] (FP) (Branch target of P1922)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14
ba P1919
nop

TARGET1922:
ba RET1922
nop


P1919: !_MEMBAR (FP)

P1920: !_PREFETCH [27] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 160], 1

P1921: !_MEMBAR (FP)
membar #StoreLoad

P1922: !_BLD [3] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f18, %f1
fmovd %f36, %f2
fmovd %f40, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1922
nop
RET1922:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1923: !_MEMBAR (FP)

P1924: !_BSTC [5] (maybe <- 0x410000cd) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P1925: !_MEMBAR (FP) (Secondary ctx) (Branch target of P1838)
membar #StoreLoad
ba P1926
nop

TARGET1838:
ba RET1838
nop


P1926: !_BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f4
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1926
nop
RET1926:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1927: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1927
nop
RET1927:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1928: !_LD [25] (Int)
lduw [%i2 + 96], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P1929: !_MEMBAR (FP)
membar #StoreLoad

P1930: !_BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1930
nop
RET1930:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1931: !_MEMBAR (FP)

P1932: !_ST [33] (maybe <- 0x1800014) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 0] %asi
add   %l4, 1, %l4

P1933: !_PREFETCH [30] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 128], 1

P1934: !_MEMBAR (FP) (Branch target of P1491)
ba P1935
nop

TARGET1491:
ba RET1491
nop


P1935: !_BST [32] (maybe <- 0x410000cf) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P1936: !_MEMBAR (FP)
membar #StoreLoad

P1937: !_LD [3] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
lduwa [%i0 + 16] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1938: !_MEMBAR (FP) (Branch target of P1927)
membar #StoreLoad
ba P1939
nop

TARGET1927:
ba RET1927
nop


P1939: !_BLD [33] (FP) (CBR) (Branch target of P1320)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1939
nop
RET1939:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1940
nop

TARGET1320:
ba RET1320
nop


P1940: !_MEMBAR (FP)

P1941: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 64], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
!--
loop_exit_3_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_0
nop

P1942: !_MEMBAR (Int)
membar #StoreLoad

END_NODES3: ! Test instruction sequence for CPU 3 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
stw %l7, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func4:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x04deade1), %l6
or    %l6, %lo(0x04deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x2000001), %l4
or    %l4, %lo(0x2000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41800001), %l6
or    %l6, %lo(0x41800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x36000000), %l6
or    %l6, %lo(0x36000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x6fc4^4
sethi %hi(0x6fc4), %l0
or    %l0, %lo(0x6fc4), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES4: ! Test instruction sequence for ISTREAM 4 begins

P1943: !_MEMBAR (FP) (Loop entry)
sethi %hi(0x5), %l2
or %l2, %lo(0x5),  %l2
loop_entry_4_0:

P1944: !_BST [6] (maybe <- 0x41800001) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P1945: !_MEMBAR (FP)
membar #StoreLoad

P1946: !_LD [29] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 64], %f0
! 1 addresses covered

P1947: !_ST [26] (maybe <- 0x2000001) (Int) (Branch target of P2173)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4
ba P1948
nop

TARGET2173:
ba RET2173
nop


P1948: !_ST [14] (maybe <- 0x41800003) (FP) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1948
nop
RET1948:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1949: !_MEMBAR (Int) (Branch target of P2175)
membar #StoreLoad
ba P1950
nop

TARGET2175:
ba RET2175
nop


P1950: !_REPLACEMENT [4] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+32], %l7
st %l7, [%i3+32]
add %i3, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P1951: !_MEMBAR (FP)
membar #StoreLoad

P1952: !_BLD [12] (FP) (Branch target of P2041)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f40, %f18
fmovs %f18, %f3
ba P1953
nop

TARGET2041:
ba RET2041
nop


P1953: !_MEMBAR (FP)

P1954: !_BST [33] (maybe <- 0x41800004) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1955: !_MEMBAR (FP)
membar #StoreLoad

P1956: !_REPLACEMENT [28] (Int) (Nucleus ctx) (Branch target of P2017)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
ba P1957
nop

TARGET2017:
ba RET2017
nop


P1957: !_PREFETCH [27] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 160], 1

P1958: !_REPLACEMENT [26] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+128], %o5
st %o5, [%i2+128]
add %i2, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P1959: !_MEMBAR (FP) (Secondary ctx)

P1960: !_BST [12] (maybe <- 0x41800005) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P1961: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P1962: !_REPLACEMENT [1] (Int) (Branch target of P2192)
sethi %hi(0x2000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
ba P1963
nop

TARGET2192:
ba RET2192
nop


P1963: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2098)
ba P1964
nop

TARGET2098:
ba RET2098
nop


P1964: !_BSTC [5] (maybe <- 0x41800008) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P1965: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1965
nop
RET1965:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1966: !_BSTC [27] (maybe <- 0x4180000a) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1966
nop
RET1966:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1967: !_MEMBAR (FP)
membar #StoreLoad

P1968: !_LD [9] (Int)
lduw [%i1 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1969: !_MEMBAR (FP)
membar #StoreLoad

P1970: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1971: !_MEMBAR (FP)

P1972: !_BST [15] (maybe <- 0x4180000c) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P1973: !_MEMBAR (FP)
membar #StoreLoad

P1974: !_BLD [24] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1975: !_MEMBAR (FP)

P1976: !_REPLACEMENT [24] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+64], %l6
st %l6, [%i3+64]
add %i3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1976
nop
RET1976:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1977: !_MEMBAR (FP) (Branch target of P2115)
ba P1978
nop

TARGET2115:
ba RET2115
nop


P1978: !_BST [20] (maybe <- 0x4180000d) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P1979: !_MEMBAR (FP)
membar #StoreLoad

P1980: !_PREFETCH [30] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 128], 1

P1981: !_MEMBAR (FP)
membar #StoreLoad

P1982: !_BLD [11] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f8
fmovd %f40, %f10

P1983: !_MEMBAR (FP) (CBR) (Branch target of P2008)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1983
nop
RET1983:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1984
nop

TARGET2008:
ba RET2008
nop


P1984: !_BSTC [17] (maybe <- 0x4180000e) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P1985: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1985
nop
RET1985:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1986: !_BSTC [13] (maybe <- 0x4180000f) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P1987: !_MEMBAR (FP)
membar #StoreLoad

P1988: !_ST [27] (maybe <- 0x41800012) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 160 ] %asi

P1989: !_MEMBAR (FP) (CBR) (Branch target of P2205)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1989
nop
RET1989:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1990
nop

TARGET2205:
ba RET2205
nop


P1990: !_BLD [10] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1991: !_MEMBAR (FP)

P1992: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

P1993: !_MEMBAR (FP)

P1994: !_REPLACEMENT [32] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+256], %l3
st %l3, [%i2+256]
add %i2, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]

P1995: !_ST [8] (maybe <- 0x41800013) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 0 ]

P1996: !_MEMBAR (FP)

P1997: !_BSTC [15] (maybe <- 0x41800014) (FP) (CBR) (Branch target of P2053)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1997
nop
RET1997:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P1998
nop

TARGET2053:
ba RET2053
nop


P1998: !_MEMBAR (FP)
membar #StoreLoad

P1999: !_ST [10] (maybe <- 0x41800015) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 64 ]

P2000: !_PREFETCH [30] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 128], 1

P2001: !_REPLACEMENT [31] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+192], %l6
st %l6, [%i3+192]
add %i3, %o5, %l3
ld [%l3+192], %l6
st %l6, [%l3+192]
add %l3, %o5, %l3
ld [%l3+192], %l6
st %l6, [%l3+192]
add %l3, %o5, %l3
ld [%l3+192], %l6
st %l6, [%l3+192]
add %l3, %o5, %l3
ld [%l3+192], %l6
st %l6, [%l3+192]
add %l3, %o5, %l3
ld [%l3+192], %l6
st %l6, [%l3+192]
add %l3, %o5, %l3
ld [%l3+192], %l6
st %l6, [%l3+192]
add %l3, %o5, %l3
ld [%l3+192], %l6
st %l6, [%l3+192]

P2002: !_MEMBAR (FP)

P2003: !_BSTC [7] (maybe <- 0x41800016) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

P2004: !_MEMBAR (FP)
membar #StoreLoad

P2005: !_REPLACEMENT [14] (Int)
sethi %hi(0x2000), %l6
ld [%i3+64], %o5
st %o5, [%i3+64]
add %i3, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

P2006: !_MEMBAR (FP)
membar #StoreLoad

P2007: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2008: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2008
nop
RET2008:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2009: !_PREFETCH [30] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 128] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2009
nop
RET2009:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2010: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2010
nop
RET2010:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2011: !_BLD [14] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

P2012: !_MEMBAR (FP)

P2013: !_BST [31] (maybe <- 0x41800017) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 192 ] %asi

P2014: !_MEMBAR (FP) (Branch target of P2045)
membar #StoreLoad
ba P2015
nop

TARGET2045:
ba RET2045
nop


P2015: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f18, %f1
fmovd %f36, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P2016: !_MEMBAR (FP)

P2017: !_BST [24] (maybe <- 0x41800018) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2017
nop
RET2017:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2018: !_MEMBAR (FP)
membar #StoreLoad

P2019: !_BLD [27] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2020: !_MEMBAR (FP) (Secondary ctx)

P2021: !_PREFETCH [19] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

P2022: !_REPLACEMENT [26] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+128], %l3
st %l3, [%i3+128]
add %i3, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]

P2023: !_LD [3] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
lduwa [%i0 + 16] %asi, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P2024: !_MEMBAR (FP)
membar #StoreLoad

P2025: !_BLD [30] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6

P2026: !_MEMBAR (FP)

P2027: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovd %f40, %f8

P2028: !_MEMBAR (FP)

P2029: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P2030: !_MEMBAR (FP)

P2031: !_REPLACEMENT [5] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+64], %l6
st %l6, [%i2+64]
add %i2, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2031
nop
RET2031:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2032: !_LD [16] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lda    [%i3 + 16] %asi, %f11
! 1 addresses covered

P2033: !_REPLACEMENT [22] (Int)
sethi %hi(0x2000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P2034: !_ST [18] (maybe <- 0x2000002) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
stwa   %l4, [%i3 + 128] %asi
add   %l4, 1, %l4

P2035: !_ST [24] (maybe <- 0x2000003) (Int) (LE) (Nucleus ctx)
wr %g0, 0xc, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l7, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
stwa   %l6, [%i2 + 64] %asi
add   %l4, 1, %l4

P2036: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2036
nop
RET2036:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2037: !_BLD [26] (FP) (CBR) (Branch target of P2109)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f12
fmovd %f40, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2037
nop
RET2037:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2038
nop

TARGET2109:
ba RET2109
nop


P2038: !_MEMBAR (FP) (Branch target of P2092)
ba P2039
nop

TARGET2092:
ba RET2092
nop


P2039: !_BLD [0] (FP) (Branch target of P2037)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f34, %f0
fmovd %f36, %f18
fmovs %f18, %f1
fmovd %f40, %f2
ba P2040
nop

TARGET2037:
ba RET2037
nop


P2040: !_MEMBAR (FP)

P2041: !_IDC_FLIP [22] (Int) (CBR)
IDC_FLIP(2041, 15483, 4, 0x45800004, 0x4, %i2, 0x4, %l6, %l7, %o5, %l3)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2041
nop
RET2041:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2042: !_MEMBAR (FP)
membar #StoreLoad

P2043: !_BLD [11] (FP) (Branch target of P1997)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5
ba P2044
nop

TARGET1997:
ba RET1997
nop


P2044: !_MEMBAR (FP)

P2045: !_BLD [27] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2045
nop
RET2045:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2046: !_MEMBAR (FP)

P2047: !_PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2047
nop
RET2047:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2048: !_MEMBAR (FP) (Branch target of P2052)
membar #StoreLoad
ba P2049
nop

TARGET2052:
ba RET2052
nop


P2049: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P2050: !_MEMBAR (FP)

P2051: !_BLD [26] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2052: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2052
nop
RET2052:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2053: !_BLD [28] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2053
nop
RET2053:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2054: !_MEMBAR (FP)

P2055: !_REPLACEMENT [9] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+32], %l3
st %l3, [%i3+32]
add %i3, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

P2056: !_REPLACEMENT [3] (Int)
sethi %hi(0x2000), %l6
ld [%i3+16], %o5
st %o5, [%i3+16]
add %i3, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]

P2057: !_ST [13] (maybe <- 0x2000004) (Int) (Branch target of P2060)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4
ba P2058
nop

TARGET2060:
ba RET2060
nop


P2058: !_MEMBAR (FP) (Secondary ctx)

P2059: !_BSTC [25] (maybe <- 0x4180001a) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2060: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2060
nop
RET2060:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2061: !_LD [22] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
lduwa [%i3 + 4] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2062: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2062
nop
RET2062:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2063: !_BLD [10] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2064: !_MEMBAR (FP) (Secondary ctx)

P2065: !_REPLACEMENT [2] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+8], %l3
st %l3, [%i2+8]
add %i2, %l7, %o5
ld [%o5+8], %l3
st %l3, [%o5+8]
add %o5, %l7, %o5
ld [%o5+8], %l3
st %l3, [%o5+8]
add %o5, %l7, %o5
ld [%o5+8], %l3
st %l3, [%o5+8]
add %o5, %l7, %o5
ld [%o5+8], %l3
st %l3, [%o5+8]
add %o5, %l7, %o5
ld [%o5+8], %l3
st %l3, [%o5+8]
add %o5, %l7, %o5
ld [%o5+8], %l3
st %l3, [%o5+8]
add %o5, %l7, %o5
ld [%o5+8], %l3
st %l3, [%o5+8]

P2066: !_PREFETCH [17] (Int) (CBR)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 96], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2066
nop
RET2066:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2067: !_REPLACEMENT [17] (Int)
sethi %hi(0x2000), %l7
ld [%i2+96], %l3
st %l3, [%i2+96]
add %i2, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

P2068: !_ST [29] (maybe <- 0x2000005) (Int) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l7, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
stwa   %l6, [%i2 + 64] %asi
add   %l4, 1, %l4

P2069: !_MEMBAR (FP)
membar #StoreLoad

P2070: !_BLD [17] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f14

P2071: !_MEMBAR (FP)

P2072: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P2073: !_MEMBAR (FP)

P2074: !_LD [14] (Int) (Branch target of P2164)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
ba P2075
nop

TARGET2164:
ba RET2164
nop


P2075: !_REPLACEMENT [6] (Int) (Branch target of P2047)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+96], %l3
st %l3, [%i3+96]
add %i3, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
ba P2076
nop

TARGET2047:
ba RET2047
nop


P2076: !_MEMBAR (FP)

P2077: !_BST [24] (maybe <- 0x4180001c) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2077
nop
RET2077:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2078: !_MEMBAR (FP)
membar #StoreLoad

P2079: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f2

P2080: !_MEMBAR (FP) (Branch target of P2031)
ba P2081
nop

TARGET2031:
ba RET2031
nop


P2081: !_BLD [22] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2081
nop
RET2081:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2082: !_MEMBAR (FP) (Secondary ctx)

P2083: !_LD [32] (FP) (Branch target of P2151)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 256], %f6
! 1 addresses covered
ba P2084
nop

TARGET2151:
ba RET2151
nop


P2084: !_MEMBAR (FP) (Branch target of P2117)
ba P2085
nop

TARGET2117:
ba RET2117
nop


P2085: !_BSTC [9] (maybe <- 0x4180001e) (FP) (Branch target of P2066)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi
ba P2086
nop

TARGET2066:
ba RET2066
nop


P2086: !_MEMBAR (FP)
membar #StoreLoad

P2087: !_BLD [20] (FP) (Branch target of P1985)
wr %g0, 0xf0, %asi
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P2088
nop

TARGET1985:
ba RET1985
nop


P2088: !_MEMBAR (FP)

P2089: !_LD [27] (FP) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 160], %f8
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2089
nop
RET2089:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2090: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2091: !_BLD [29] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2092: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P1948)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2092
nop
RET2092:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2093
nop

TARGET1948:
ba RET1948
nop


P2093: !_BLD [7] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f10

P2094: !_MEMBAR (FP) (Secondary ctx)

P2095: !_BLD [22] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2096: !_MEMBAR (FP) (Secondary ctx)

P2097: !_LD [6] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i0 + 96] %asi, %f14
! 1 addresses covered

P2098: !_LD [8] (Int) (CBR) (Branch target of P2122)
lduw [%i1 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2098
nop
RET2098:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2099
nop

TARGET2122:
ba RET2122
nop


P2099: !_MEMBAR (FP)
membar #StoreLoad

P2100: !_BLD [8] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P2101: !_MEMBAR (FP)

P2102: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P2103: !_MEMBAR (FP)

P2104: !_REPLACEMENT [23] (Int) (CBR) (Secondary ctx) (Branch target of P2181)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+32], %l3
st %l3, [%i2+32]
add %i2, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2104
nop
RET2104:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2105
nop

TARGET2181:
ba RET2181
nop


P2105: !_ST [26] (maybe <- 0x41800020) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P2106: !_REPLACEMENT [6] (Int)
sethi %hi(0x2000), %l6
ld [%i2+96], %o5
st %o5, [%i2+96]
add %i2, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]

P2107: !_LD [27] (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
lda    [%i3 + 160] %asi, %f4
! 1 addresses covered

P2108: !_LD [21] (FP)
ld [%i3 + 0], %f5
! 1 addresses covered

P2109: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2109
nop
RET2109:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2110: !_BST [26] (maybe <- 0x41800021) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P2111: !_MEMBAR (FP)
membar #StoreLoad

P2112: !_ST [14] (maybe <- 0x2000006) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 64] %asi
add   %l4, 1, %l4

P2113: !_REPLACEMENT [2] (Int) (Branch target of P1983)
sethi %hi(0x2000), %o5
ld [%i2+8], %l6
st %l6, [%i2+8]
add %i2, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
ba P2114
nop

TARGET1983:
ba RET1983
nop


P2114: !_REPLACEMENT [16] (Int)
sethi %hi(0x2000), %l7
ld [%i2+16], %l3
st %l3, [%i2+16]
add %i2, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]

P2115: !_REPLACEMENT [24] (Int) (CBR) (Branch target of P2139)
sethi %hi(0x2000), %l6
ld [%i2+64], %o5
st %o5, [%i2+64]
add %i2, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2115
nop
RET2115:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2116
nop

TARGET2139:
ba RET2139
nop


P2116: !_REPLACEMENT [24] (Int)
sethi %hi(0x2000), %l6
ld [%i2+64], %o5
st %o5, [%i2+64]
add %i2, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

P2117: !_REPLACEMENT [23] (Int) (CBR)
sethi %hi(0x2000), %l3
ld [%i2+32], %l7
st %l7, [%i2+32]
add %i2, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2117
nop
RET2117:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2118: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2118
nop
RET2118:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2119: !_BSTC [33] (maybe <- 0x41800023) (FP) (Branch target of P2216)
wr %g0, 0xe0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P2120
nop

TARGET2216:
ba RET2216
nop


P2120: !_MEMBAR (FP) (Branch target of P2152)
membar #StoreLoad
ba P2121
nop

TARGET2152:
ba RET2152
nop


P2121: !_PREFETCH [19] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P2122: !_LD [0] (Int) (Loop exit) (CBR)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2122
nop
RET2122:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
!--
loop_exit_4_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_4_0
nop

P2123: !_MEMBAR (FP) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_4_1:
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2123
nop
RET2123:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2124: !_BLD [32] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f0
membar #Sync
! 1 addresses covered

P2125: !_MEMBAR (FP)

P2126: !_BLD [31] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 192] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2127: !_MEMBAR (FP) (Secondary ctx)

P2128: !_BSTC [15] (maybe <- 0x41800024) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P2129: !_MEMBAR (FP)
membar #StoreLoad

P2130: !_REPLACEMENT [4] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+32], %l7
st %l7, [%i2+32]
add %i2, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P2131: !_REPLACEMENT [20] (Int)
sethi %hi(0x2000), %o5
ld [%i2+256], %l6
st %l6, [%i2+256]
add %i2, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]

P2132: !_ST [8] (maybe <- 0x2000007) (Int)
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4

P2133: !_MEMBAR (FP)
membar #StoreLoad

P2134: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f2

P2135: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2135
nop
RET2135:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2136: !_REPLACEMENT [12] (Int)
sethi %hi(0x2000), %l7
ld [%i2+4], %l3
st %l3, [%i2+4]
add %i2, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P2137: !_REPLACEMENT [26] (Int) (CBR)
sethi %hi(0x2000), %l6
ld [%i2+128], %o5
st %o5, [%i2+128]
add %i2, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2137
nop
RET2137:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2138: !_ST [21] (maybe <- 0x41800025) (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]

P2139: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2139
nop
RET2139:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2140: !_BST [27] (maybe <- 0x41800026) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P2141: !_MEMBAR (FP)
membar #StoreLoad

P2142: !_REPLACEMENT [19] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2142
nop
RET2142:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2143: !_MEMBAR (FP)

P2144: !_BSTC [12] (maybe <- 0x41800028) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2145: !_MEMBAR (FP)
membar #StoreLoad

P2146: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovd %f40, %f4

P2147: !_MEMBAR (FP)

P2148: !_BLD [30] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2149: !_MEMBAR (FP)

P2150: !_BLD [30] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6

P2151: !_MEMBAR (FP) (CBR) (Branch target of P2123)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2151
nop
RET2151:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P2152
nop

TARGET2123:
ba RET2123
nop


P2152: !_BLD [1] (FP) (CBR) (Branch target of P2157)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f18, %f9
fmovd %f36, %f10
fmovd %f40, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2152
nop
RET2152:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2153
nop

TARGET2157:
ba RET2157
nop


P2153: !_MEMBAR (FP) (Branch target of P2062)
ba P2154
nop

TARGET2062:
ba RET2062
nop


P2154: !_BSTC [9] (maybe <- 0x4180002b) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P2155: !_MEMBAR (FP)
membar #StoreLoad

P2156: !_REPLACEMENT [31] (Int) (Branch target of P2009)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+192], %l7
st %l7, [%i2+192]
add %i2, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
ba P2157
nop

TARGET2009:
ba RET2009
nop


P2157: !_LD [27] (FP) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 160], %f12
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2157
nop
RET2157:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2158: !_REPLACEMENT [16] (Int) (Branch target of P1966)
sethi %hi(0x2000), %l3
ld [%i2+16], %l7
st %l7, [%i2+16]
add %i2, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
ba P2159
nop

TARGET1966:
ba RET1966
nop


P2159: !_MEMBAR (FP) (Secondary ctx)

P2160: !_BSTC [32] (maybe <- 0x4180002d) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P2161: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2162: !_REPLACEMENT [8] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P2163: !_MEMBAR (FP)

P2164: !_BST [9] (maybe <- 0x4180002e) (FP) (CBR) (Branch target of P2036)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2164
nop
RET2164:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2165
nop

TARGET2036:
ba RET2036
nop


P2165: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2165
nop
RET2165:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2166: !_BST [23] (maybe <- 0x41800030) (FP) (Branch target of P2196)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P2167
nop

TARGET2196:
ba RET2196
nop


P2167: !_MEMBAR (FP)
membar #StoreLoad

P2168: !_ST [10] (maybe <- 0x41800033) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 64 ]

P2169: !_PREFETCH [18] (Int) (CBR) (Branch target of P1965)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2169
nop
RET2169:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2170
nop

TARGET1965:
ba RET1965
nop


P2170: !_REPLACEMENT [23] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+32], %o5
st %o5, [%i2+32]
add %i2, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

P2171: !_MEMBAR (FP)
membar #StoreLoad

P2172: !_BLD [7] (FP) (Branch target of P2089)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
ba P2173
nop

TARGET2089:
ba RET2089
nop


P2173: !_MEMBAR (FP) (CBR) (Branch target of P1989)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2173
nop
RET2173:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2174
nop

TARGET1989:
ba RET1989
nop


P2174: !_BST [33] (maybe <- 0x41800034) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P2175: !_MEMBAR (FP) (CBR) (Branch target of P2191)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2175
nop
RET2175:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2176
nop

TARGET2191:
ba RET2191
nop


P2176: !_PREFETCH [32] (Int) (LE) (Secondary ctx)
wr %g0, 0x89, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 256] %asi, 1

P2177: !_ST [18] (maybe <- 0x41800035) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P2178: !_PREFETCH [7] (Int)
prefetch [%i0 + 128], 1

P2179: !_LD [0] (FP) (Branch target of P2010)
ld [%i0 + 0], %f14
! 1 addresses covered
ba P2180
nop

TARGET2010:
ba RET2010
nop


P2180: !_MEMBAR (FP) (Branch target of P2118)
ba P2181
nop

TARGET2118:
ba RET2118
nop


P2181: !_BST [22] (maybe <- 0x41800036) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2181
nop
RET2181:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2182: !_MEMBAR (FP) (Branch target of P2142)
membar #StoreLoad
ba P2183
nop

TARGET2142:
ba RET2142
nop


P2183: !_ST [33] (maybe <- 0x41800039) (FP)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P2184: !_REPLACEMENT [12] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P2185: !_REPLACEMENT [24] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l7
ld [%i2+64], %l3
st %l3, [%i2+64]
add %i2, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P2186: !_ST [15] (maybe <- 0x2000008) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 128] %asi
add   %l4, 1, %l4

P2187: !_REPLACEMENT [10] (Int)
sethi %hi(0x2000), %l3
ld [%i2+64], %l7
st %l7, [%i2+64]
add %i2, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P2188: !_PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P2189: !_MEMBAR (FP)
membar #StoreLoad

P2190: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P2191: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2191
nop
RET2191:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2192: !_ST [27] (maybe <- 0x4180003a) (FP) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 160 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2192
nop
RET2192:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2193: !_ST [14] (maybe <- 0x2000009) (Int) (Branch target of P2137)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4
ba P2194
nop

TARGET2137:
ba RET2137
nop


P2194: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2135)
ba P2195
nop

TARGET2135:
ba RET2135
nop


P2195: !_BST [23] (maybe <- 0x4180003b) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P2196: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P2081)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2196
nop
RET2196:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2197
nop

TARGET2081:
ba RET2081
nop


P2197: !_REPLACEMENT [16] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+16], %l6
st %l6, [%i3+16]
add %i3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]
add %l3, %o5, %l3
ld [%l3+16], %l6
st %l6, [%l3+16]

P2198: !_REPLACEMENT [6] (Int)
sethi %hi(0x2000), %l7
ld [%i3+96], %l3
st %l3, [%i3+96]
add %i3, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

P2199: !_MEMBAR (FP)
membar #StoreLoad

P2200: !_BLD [31] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 192] %asi, %f0
membar #Sync
! 1 addresses covered

P2201: !_MEMBAR (FP) (Branch target of P2165)
ba P2202
nop

TARGET2165:
ba RET2165
nop


P2202: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P2203: !_MEMBAR (FP)

P2204: !_BLD [24] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovd %f40, %f4

P2205: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2205
nop
RET2205:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2206: !_PREFETCH [32] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i2 + 256] %asi, 1

P2207: !_ST [1] (maybe <- 0x200000a) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2208: !_MEMBAR (FP)
membar #StoreLoad

P2209: !_BLD [20] (FP) (Branch target of P1976)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
ba P2210
nop

TARGET1976:
ba RET1976
nop


P2210: !_MEMBAR (FP) (Branch target of P2169)
ba P2211
nop

TARGET2169:
ba RET2169
nop


P2211: !_REPLACEMENT [26] (Int) (Branch target of P2077)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
ba P2212
nop

TARGET2077:
ba RET2077
nop


P2212: !_MEMBAR (FP)
membar #StoreLoad

P2213: !_BLD [27] (FP) (Branch target of P2104)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7
ba P2214
nop

TARGET2104:
ba RET2104
nop


P2214: !_MEMBAR (FP)

P2215: !_BLD [19] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8

P2216: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2216
nop
RET2216:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2217: !_BST [10] (maybe <- 0x4180003e) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P2218: !_MEMBAR (FP)
membar #StoreLoad

P2219: !_IDC_FLIP [20] (Int)
IDC_FLIP(2219, 11767, 4, 0x45000100, 0x100, %i3, 0x100, %l6, %l7, %o5, %l3)

P2220: !_ST [16] (maybe <- 0x200000b) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 16 ]
add   %l4, 1, %l4

P2221: !_REPLACEMENT [21] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P2222: !_MEMBAR (FP)
membar #StoreLoad

P2223: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f18, %f11
fmovd %f36, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2224: !_MEMBAR (FP) (Loop exit)
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
!--
loop_exit_4_1:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_4_1
nop

P2225: !_MEMBAR (Int)
membar #StoreLoad

END_NODES4: ! Test instruction sequence for CPU 4 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
stw %l3, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func5:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %o5
or    %o5, %lo(0xdeadbee0), %o5
stw   %o5, [%i5]
sethi %hi(0xdeadbee1), %o5
or    %o5, %lo(0xdeadbee1), %o5
stw   %o5, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x05deade1), %o5
or    %o5, %lo(0x05deade1), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x2800001), %l4
or    %l4, %lo(0x2800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x42000001), %o5
or    %o5, %lo(0x42000001), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x36800000), %o5
or    %o5, %lo(0x36800000), %o5
stw %o5, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0xb71^4
sethi %hi(0xb71), %l0
or    %l0, %lo(0xb71), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES5: ! Test instruction sequence for ISTREAM 5 begins

P2226: !_MEMBAR (FP) (Loop entry) (CBR)
sethi %hi(0x3), %l2
or %l2, %lo(0x3),  %l2
loop_entry_5_0:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2226
nop
RET2226:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2227: !_BST [5] (maybe <- 0x42000001) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P2228: !_MEMBAR (FP) (Branch target of P2399)
membar #StoreLoad
ba P2229
nop

TARGET2399:
ba RET2399
nop


P2229: !_BLD [12] (FP) (CBR) (Secondary ctx) (Branch target of P2591)
wr %g0, 0xf1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f0
membar #Sync
! 3 addresses covered
fmovd %f8, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2229
nop
RET2229:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2230
nop

TARGET2591:
ba RET2591
nop


P2230: !_MEMBAR (FP) (Secondary ctx)

P2231: !_BST [13] (maybe <- 0x42000003) (FP) (Secondary ctx) (Branch target of P2621)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P2232
nop

TARGET2621:
ba RET2621
nop


P2232: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2563)
membar #StoreLoad
ba P2233
nop

TARGET2563:
ba RET2563
nop


P2233: !_ST [32] (maybe <- 0x2800001) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 256] %asi
add   %l4, 1, %l4

P2234: !_MEMBAR (FP)
membar #StoreLoad

P2235: !_BLD [33] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2236: !_MEMBAR (FP) (Branch target of P2309)
ba P2237
nop

TARGET2309:
ba RET2309
nop


P2237: !_REPLACEMENT [27] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+160], %l6
st %l6, [%i3+160]
add %i3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2237
nop
RET2237:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2238: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2239: !_BLD [17] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f4

P2240: !_MEMBAR (FP) (Secondary ctx)

P2241: !_REPLACEMENT [23] (Int) (CBR) (Nucleus ctx) (Branch target of P2379)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %o5
ld [%i3+32], %l6
st %l6, [%i3+32]
add %i3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2241
nop
RET2241:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2242
nop

TARGET2379:
ba RET2379
nop


P2242: !_MEMBAR (FP) (Branch target of P2365)
membar #StoreLoad
ba P2243
nop

TARGET2365:
ba RET2365
nop


P2243: !_BLD [20] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2243
nop
RET2243:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2244: !_MEMBAR (FP) (CBR) (Branch target of P2237)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2244
nop
RET2244:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2245
nop

TARGET2237:
ba RET2237
nop


P2245: !_BST [10] (maybe <- 0x42000006) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P2246: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2246
nop
RET2246:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2247: !_ST [20] (maybe <- 0x42000007) (FP) (CBR)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 256 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2247
nop
RET2247:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2248: !_PREFETCH [11] (Int) (LE) (Branch target of P2491)
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 0] %asi, 1
ba P2249
nop

TARGET2491:
ba RET2491
nop


P2249: !_ST [31] (maybe <- 0x2800002) (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2250: !_LD [26] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 128] %asi, %f6
! 1 addresses covered

P2251: !_MEMBAR (FP)
membar #StoreLoad

P2252: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2253: !_MEMBAR (FP) (CBR) (Branch target of P2525)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2253
nop
RET2253:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2254
nop

TARGET2525:
ba RET2525
nop


P2254: !_PREFETCH [7] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i0 + 128] %asi, 1

P2255: !_MEMBAR (FP)

P2256: !_BST [15] (maybe <- 0x42000008) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2256
nop
RET2256:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2257: !_MEMBAR (FP)

P2258: !_BSTC [0] (maybe <- 0x42000009) (FP) (Branch target of P2600)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P2259
nop

TARGET2600:
ba RET2600
nop


P2259: !_MEMBAR (FP)
membar #StoreLoad

P2260: !_REPLACEMENT [13] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+32], %l7
st %l7, [%i3+32]
add %i3, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2260
nop
RET2260:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2261: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2261
nop
RET2261:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2262: !_BST [11] (maybe <- 0x4200000e) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2263: !_MEMBAR (FP)
membar #StoreLoad

P2264: !_ST [20] (maybe <- 0x2800003) (Int) (Branch target of P2340)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 256 ]
add   %l4, 1, %l4
ba P2265
nop

TARGET2340:
ba RET2340
nop


P2265: !_MEMBAR (FP)
membar #StoreLoad

P2266: !_BLD [10] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8

P2267: !_MEMBAR (FP)

P2268: !_REPLACEMENT [2] (Int)
sethi %hi(0x2000), %o5
ld [%i3+8], %l6
st %l6, [%i3+8]
add %i3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]

P2269: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2270: !_BLD [5] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P2271: !_MEMBAR (FP) (Secondary ctx)

P2272: !_PREFETCH [5] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i0 + 64] %asi, 1

P2273: !_ST [13] (maybe <- 0x42000011) (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 32 ] %asi

P2274: !_REPLACEMENT [7] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+128], %o5
st %o5, [%i2+128]
add %i2, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P2275: !_LD [11] (Int) (CBR)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2275
nop
RET2275:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2276: !_ST [12] (maybe <- 0x2800004) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
stwa   %l4, [%i3 + 4] %asi
add   %l4, 1, %l4

P2277: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2277
nop
RET2277:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2278: !_BLD [31] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 192] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2279: !_MEMBAR (FP)

P2280: !_BST [20] (maybe <- 0x42000012) (FP) (CBR) (Branch target of P2455)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2280
nop
RET2280:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2281
nop

TARGET2455:
ba RET2455
nop


P2281: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2281
nop
RET2281:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2282: !_REPLACEMENT [19] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P2283: !_MEMBAR (FP) (Branch target of P2326)
ba P2284
nop

TARGET2326:
ba RET2326
nop


P2284: !_BST [17] (maybe <- 0x42000013) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P2285: !_MEMBAR (FP)

P2286: !_BST [16] (maybe <- 0x42000014) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2287: !_MEMBAR (FP)
membar #StoreLoad

P2288: !_ST [11] (maybe <- 0x2800005) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 0] %asi
add   %l4, 1, %l4

P2289: !_REPLACEMENT [17] (Int) (Branch target of P2298)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+96], %l7
st %l7, [%i2+96]
add %i2, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
ba P2290
nop

TARGET2298:
ba RET2298
nop


P2290: !_REPLACEMENT [17] (Int) (CBR)
sethi %hi(0x2000), %o5
ld [%i2+96], %l6
st %l6, [%i2+96]
add %i2, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2290
nop
RET2290:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2291: !_MEMBAR (FP) (Secondary ctx)

P2292: !_BSTC [14] (maybe <- 0x42000015) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2293: !_MEMBAR (FP) (Secondary ctx)

P2294: !_BST [1] (maybe <- 0x42000016) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2294
nop
RET2294:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2295: !_MEMBAR (FP)
membar #StoreLoad

P2296: !_REPLACEMENT [13] (Int)
sethi %hi(0x2000), %l7
ld [%i2+32], %l3
st %l3, [%i2+32]
add %i2, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

P2297: !_MEMBAR (FP)

P2298: !_BST [20] (maybe <- 0x4200001b) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2298
nop
RET2298:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2299: !_MEMBAR (FP)
membar #StoreLoad

P2300: !_BLD [8] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2301: !_MEMBAR (FP) (CBR) (Branch target of P2406)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2301
nop
RET2301:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2302
nop

TARGET2406:
ba RET2406
nop


P2302: !_LD [27] (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 160], %f14
! 1 addresses covered

P2303: !_MEMBAR (FP) (Branch target of P2275)
membar #StoreLoad
ba P2304
nop

TARGET2275:
ba RET2275
nop


P2304: !_BLD [8] (FP) (Branch target of P2441)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0
ba P2305
nop

TARGET2441:
ba RET2441
nop


P2305: !_MEMBAR (FP)

P2306: !_REPLACEMENT [25] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+96], %l3
st %l3, [%i3+96]
add %i3, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2306
nop
RET2306:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2307: !_REPLACEMENT [5] (Int)
sethi %hi(0x2000), %l7
ld [%i3+64], %l3
st %l3, [%i3+64]
add %i3, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P2308: !_REPLACEMENT [15] (Int)
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P2309: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P2552)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2309
nop
RET2309:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2310
nop

TARGET2552:
ba RET2552
nop


P2310: !_BLD [0] (FP) (CBR) (Secondary ctx) (Branch target of P2322)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f18, %f3
fmovd %f36, %f4
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2310
nop
RET2310:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2311
nop

TARGET2322:
ba RET2322
nop


P2311: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2311
nop
RET2311:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2312: !_LD [15] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 128], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P2313: !_PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2313
nop
RET2313:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2314: !_MEMBAR (FP)
membar #StoreLoad

P2315: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f6
fmovd %f40, %f8

P2316: !_MEMBAR (FP)

P2317: !_BST [10] (maybe <- 0x4200001c) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P2318: !_MEMBAR (FP)
membar #StoreLoad

P2319: !_LD [13] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2320: !_MEMBAR (FP) (Branch target of P2356)
ba P2321
nop

TARGET2356:
ba RET2356
nop


P2321: !_BST [9] (maybe <- 0x4200001d) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P2322: !_MEMBAR (FP) (CBR) (Branch target of P2533)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2322
nop
RET2322:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2323
nop

TARGET2533:
ba RET2533
nop


P2323: !_REPLACEMENT [25] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+96], %l6
st %l6, [%i2+96]
add %i2, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]
add %l3, %o5, %l3
ld [%l3+96], %l6
st %l6, [%l3+96]

P2324: !_LD [4] (FP)
ld [%i0 + 32], %f9
! 1 addresses covered

P2325: !_LD [14] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 64], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P2326: !_PREFETCH [18] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 128] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2326
nop
RET2326:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2327: !_IDC_FLIP [11] (Int)
IDC_FLIP(2327, 23339, 5, 0x44000000, 0x0, %i3, 0x0, %l6, %l7, %o5, %l3)

P2328: !_ST [14] (maybe <- 0x4200001f) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P2329: !_MEMBAR (FP)

P2330: !_BST [25] (maybe <- 0x42000020) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2331: !_MEMBAR (FP)
membar #StoreLoad

P2332: !_ST [3] (maybe <- 0x2800006) (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
stwa   %l4, [%i0 + 16] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2332
nop
RET2332:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2333: !_REPLACEMENT [9] (Int) (Nucleus ctx) (Branch target of P2310)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+32], %l6
st %l6, [%i2+32]
add %i2, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
ba P2334
nop

TARGET2310:
ba RET2310
nop


P2334: !_REPLACEMENT [16] (Int)
sethi %hi(0x2000), %l7
ld [%i2+16], %l3
st %l3, [%i2+16]
add %i2, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]

P2335: !_PREFETCH [25] (Int)
prefetch [%i3 + 96], 1

P2336: !_MEMBAR (FP)
membar #StoreLoad

P2337: !_BLD [8] (FP) (CBR) (Branch target of P2548)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2337
nop
RET2337:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2338
nop

TARGET2548:
ba RET2548
nop


P2338: !_MEMBAR (FP)

P2339: !_LD [21] (FP)
ld [%i3 + 0], %f12
! 1 addresses covered

P2340: !_MEMBAR (FP) (CBR) (Branch target of P2557)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2340
nop
RET2340:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2341
nop

TARGET2557:
ba RET2557
nop


P2341: !_BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2341
nop
RET2341:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2342: !_MEMBAR (FP)

P2343: !_PREFETCH [3] (Int)
prefetch [%i0 + 16], 1

P2344: !_MEMBAR (FP)
membar #StoreLoad

P2345: !_BLD [17] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f14

P2346: !_MEMBAR (FP)

P2347: !_BST [31] (maybe <- 0x42000022) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 192 ] %asi

P2348: !_MEMBAR (FP)
membar #StoreLoad

P2349: !_ST [9] (maybe <- 0x42000023) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 32 ]

P2350: !_PREFETCH [8] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
prefetcha [%i1 + 0] %asi, 1

P2351: !_PREFETCH [22] (Int) (Branch target of P2400)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 4], 1
ba P2352
nop

TARGET2400:
ba RET2400
nop


P2352: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2353: !_BLD [32] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P2354: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2521)
ba P2355
nop

TARGET2521:
ba RET2521
nop


P2355: !_REPLACEMENT [18] (Int) (Branch target of P2474)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+128], %l3
st %l3, [%i3+128]
add %i3, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
ba P2356
nop

TARGET2474:
ba RET2474
nop


P2356: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2356
nop
RET2356:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2357: !_BST [13] (maybe <- 0x42000024) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2358: !_MEMBAR (FP)
membar #StoreLoad

P2359: !_BLD [3] (FP) (Branch target of P2630)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4
ba P2360
nop

TARGET2630:
ba RET2630
nop


P2360: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2360
nop
RET2360:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2361: !_BSTC [0] (maybe <- 0x42000027) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P2362: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2311)
membar #StoreLoad
ba P2363
nop

TARGET2311:
ba RET2311
nop


P2363: !_REPLACEMENT [13] (Int)
sethi %hi(0x2000), %l6
ld [%i3+32], %o5
st %o5, [%i3+32]
add %i3, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

P2364: !_MEMBAR (FP)
membar #StoreLoad

P2365: !_BLD [18] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2365
nop
RET2365:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2366: !_MEMBAR (FP)

P2367: !_BLD [29] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2367
nop
RET2367:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2368: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2368
nop
RET2368:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2369: !_LD [14] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2370: !_LD [26] (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 128], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2370
nop
RET2370:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2371: !_REPLACEMENT [1] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P2372: !_MEMBAR (FP) (Secondary ctx)

P2373: !_BSTC [14] (maybe <- 0x4200002c) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P2374: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2375: !_BLD [3] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f18, %f9
fmovd %f36, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2376: !_MEMBAR (FP) (Secondary ctx)

P2377: !_LD [11] (Int)
lduw [%i2 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2378: !_MEMBAR (FP)

P2379: !_BSTC [17] (maybe <- 0x4200002d) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2379
nop
RET2379:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2380: !_MEMBAR (FP) (Branch target of P2306)
ba P2381
nop

TARGET2306:
ba RET2306
nop


P2381: !_BSTC [32] (maybe <- 0x4200002e) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P2382: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2382
nop
RET2382:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2383: !_BLD [23] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f12
fmovd %f40, %f14

P2384: !_MEMBAR (FP) (Branch target of P2229)
ba P2385
nop

TARGET2229:
ba RET2229
nop


P2385: !_ST [13] (maybe <- 0x2800007) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 32] %asi
add   %l4, 1, %l4

P2386: !_LD [26] (Int)
lduw [%i3 + 128], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P2387: !_REPLACEMENT [4] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+32], %o5
st %o5, [%i3+32]
add %i3, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

P2388: !_MEMBAR (FP) (Branch target of P2337)
membar #StoreLoad
ba P2389
nop

TARGET2337:
ba RET2337
nop


P2389: !_BLD [32] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P2390: !_MEMBAR (FP)

P2391: !_ST [11] (maybe <- 0x2800008) (Int) (Branch target of P2520)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
ba P2392
nop

TARGET2520:
ba RET2520
nop


P2392: !_REPLACEMENT [7] (Int) (Branch target of P2301)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+128], %l6
st %l6, [%i2+128]
add %i2, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
ba P2393
nop

TARGET2301:
ba RET2301
nop


P2393: !_PREFETCH [26] (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2393
nop
RET2393:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2394: !_MEMBAR (FP)

P2395: !_BSTC [10] (maybe <- 0x4200002f) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P2396: !_MEMBAR (FP)

P2397: !_BSTC [33] (maybe <- 0x42000030) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2398: !_MEMBAR (FP) (Branch target of P2537)
membar #StoreLoad
ba P2399
nop

TARGET2537:
ba RET2537
nop


P2399: !_ST [18] (maybe <- 0x42000031) (FP) (CBR) (Branch target of P2508)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2399
nop
RET2399:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2400
nop

TARGET2508:
ba RET2508
nop


P2400: !_REPLACEMENT [8] (Int) (CBR) (Branch target of P2370)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2400
nop
RET2400:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2401
nop

TARGET2370:
ba RET2370
nop


P2401: !_MEMBAR (FP)

P2402: !_BST [19] (maybe <- 0x42000032) (FP) (CBR) (Branch target of P2405)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2402
nop
RET2402:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2403
nop

TARGET2405:
ba RET2405
nop


P2403: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2403
nop
RET2403:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2404: !_BSTC [25] (maybe <- 0x42000033) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P2405: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2405
nop
RET2405:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2406: !_BLD [17] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f0
membar #Sync
! 1 addresses covered
fmovd %f8, %f0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2406
nop
RET2406:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2407: !_MEMBAR (FP)

P2408: !_REPLACEMENT [23] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+32], %l6
st %l6, [%i2+32]
add %i2, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P2409: !_REPLACEMENT [14] (Int) (CBR)
sethi %hi(0x2000), %l7
ld [%i2+64], %l3
st %l3, [%i2+64]
add %i2, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2409
nop
RET2409:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2410: !_MEMBAR (FP)
membar #StoreLoad

P2411: !_BLD [27] (FP) (Branch target of P2246)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2
ba P2412
nop

TARGET2246:
ba RET2246
nop


P2412: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2412
nop
RET2412:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2413: !_BLD [13] (FP) (Branch target of P2486)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5
ba P2414
nop

TARGET2486:
ba RET2486
nop


P2414: !_MEMBAR (FP)

P2415: !_REPLACEMENT [30] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+128], %l6
st %l6, [%i3+128]
add %i3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P2416: !_MEMBAR (FP) (Branch target of P2368)
membar #StoreLoad
ba P2417
nop

TARGET2368:
ba RET2368
nop


P2417: !_BLD [15] (FP) (Branch target of P2460)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6
ba P2418
nop

TARGET2460:
ba RET2460
nop


P2418: !_MEMBAR (FP)

P2419: !_BSTC [3] (maybe <- 0x42000035) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P2420: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2420
nop
RET2420:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2421: !_BSTC [26] (maybe <- 0x4200003a) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2421
nop
RET2421:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2422: !_MEMBAR (FP)
membar #StoreLoad

P2423: !_REPLACEMENT [3] (Int) (Branch target of P2503)
sethi %hi(0x2000), %l7
ld [%i3+16], %l3
st %l3, [%i3+16]
add %i3, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
ba P2424
nop

TARGET2503:
ba RET2503
nop


P2424: !_ST [21] (maybe <- 0x2800009) (Int)
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P2425: !_IDC_FLIP [29] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
IDC_FLIP(2425, 20594, 5, 0x46000040, 0x40, %i3, 0x40, %l6, %l7, %o5, %l3)

P2426: !_MEMBAR (FP) (Branch target of P2499)
ba P2427
nop

TARGET2499:
ba RET2499
nop


P2427: !_BSTC [4] (maybe <- 0x4200003c) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2427
nop
RET2427:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2428: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2428
nop
RET2428:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2429: !_LD [33] (FP)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 0], %f7
! 1 addresses covered

P2430: !_MEMBAR (FP)
membar #StoreLoad

P2431: !_BLD [6] (FP) (Branch target of P2294)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9
ba P2432
nop

TARGET2294:
ba RET2294
nop


P2432: !_MEMBAR (FP)

P2433: !_ST [18] (maybe <- 0x280000a) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2434: !_LD [8] (Int) (Secondary ctx) (Branch target of P2428)
wr %g0, 0x81, %asi
lduwa [%i1 + 0] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P2435
nop

TARGET2428:
ba RET2428
nop


P2435: !_MEMBAR (FP) (Branch target of P2469)
ba P2436
nop

TARGET2469:
ba RET2469
nop


P2436: !_BST [3] (maybe <- 0x42000041) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P2437: !_MEMBAR (FP)

P2438: !_BST [27] (maybe <- 0x42000046) (FP) (Branch target of P2341)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi
ba P2439
nop

TARGET2341:
ba RET2341
nop


P2439: !_MEMBAR (FP)
membar #StoreLoad

P2440: !_LD [5] (FP)
ld [%i0 + 64], %f10
! 1 addresses covered

P2441: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2441
nop
RET2441:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2442: !_BLD [16] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f11

P2443: !_MEMBAR (FP) (Secondary ctx)

P2444: !_BSTC [15] (maybe <- 0x42000048) (FP) (Secondary ctx) (Branch target of P2538)
wr %g0, 0xe1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi
ba P2445
nop

TARGET2538:
ba RET2538
nop


P2445: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2446: !_PREFETCH [15] (Int) (CBR) (Secondary ctx) (Branch target of P2277)
wr %g0, 0x81, %asi
prefetcha [%i3 + 128] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2446
nop
RET2446:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2447
nop

TARGET2277:
ba RET2277
nop


P2447: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2448: !_BLD [31] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 192] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

P2449: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P2393)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2449
nop
RET2449:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2450
nop

TARGET2393:
ba RET2393
nop


P2450: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2451: !_MEMBAR (FP)

P2452: !_PREFETCH [31] (Int)
prefetch [%i2 + 192], 1

P2453: !_ST [20] (maybe <- 0x280000b) (Int) (Branch target of P2585)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 256 ]
add   %l4, 1, %l4
ba P2454
nop

TARGET2585:
ba RET2585
nop


P2454: !_IDC_FLIP [0] (Int)
IDC_FLIP(2454, 23269, 5, 0x43000000, 0x0, %i0, 0x0, %l6, %l7, %o5, %l3)

P2455: !_LD [9] (FP) (CBR)
ld [%i1 + 32], %f14
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2455
nop
RET2455:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2456: !_MEMBAR (FP)
membar #StoreLoad

P2457: !_BLD [32] (FP) (Branch target of P2420)
wr %g0, 0xf0, %asi
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
ba P2458
nop

TARGET2420:
ba RET2420
nop


P2458: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2458
nop
RET2458:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2459: !_LD [25] (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 96], %f0
! 1 addresses covered

P2460: !_ST [19] (maybe <- 0x280000c) (Int) (CBR)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2460
nop
RET2460:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2461: !_ST [1] (maybe <- 0x280000d) (Int) (Branch target of P2403)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
ba P2462
nop

TARGET2403:
ba RET2403
nop


P2462: !_PREFETCH [31] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 192], 1

P2463: !_LD [2] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i0 + 8] %asi, %f1
! 1 addresses covered

P2464: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2464
nop
RET2464:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2465: !_BSTC [24] (maybe <- 0x42000049) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P2466: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2466
nop
RET2466:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2467: !_BLD [33] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f2

P2468: !_MEMBAR (FP)

P2469: !_BSTC [32] (maybe <- 0x4200004b) (FP) (CBR) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2469
nop
RET2469:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2470: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2471: !_ST [7] (maybe <- 0x4200004c) (FP) (Nucleus ctx) (Branch target of P2409)
wr %g0, 0x4, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 128 ] %asi
ba P2472
nop

TARGET2409:
ba RET2409
nop


P2472: !_REPLACEMENT [22] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P2473: !_MEMBAR (FP)
membar #StoreLoad

P2474: !_BLD [8] (FP) (CBR) (Branch target of P2256)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovd %f40, %f4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2474
nop
RET2474:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2475
nop

TARGET2256:
ba RET2256
nop


P2475: !_MEMBAR (FP)

P2476: !_BLD [11] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2477: !_MEMBAR (FP) (Branch target of P2616)
ba P2478
nop

TARGET2616:
ba RET2616
nop


P2478: !_BLD [8] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P2479: !_MEMBAR (FP) (Secondary ctx)

P2480: !_ST [15] (maybe <- 0x280000e) (Int)
stw   %l4, [%i2 + 128 ]
add   %l4, 1, %l4

P2481: !_MEMBAR (FP) (Branch target of P2466)
membar #StoreLoad
ba P2482
nop

TARGET2466:
ba RET2466
nop


P2482: !_BLD [29] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f10

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2482
nop
RET2482:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2483: !_MEMBAR (FP)

P2484: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2485: !_MEMBAR (FP)

P2486: !_BLD [18] (FP) (CBR) (Branch target of P2226)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2486
nop
RET2486:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2487
nop

TARGET2226:
ba RET2226
nop


P2487: !_MEMBAR (FP)

P2488: !_PREFETCH [16] (Int) (CBR)
prefetch [%i3 + 16], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2488
nop
RET2488:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2489: !_LD [30] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 128], %f15
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P2490: !_ST [19] (maybe <- 0x280000f) (Int) (Branch target of P2253)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
ba P2491
nop

TARGET2253:
ba RET2253
nop


P2491: !_LD [26] (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 128], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2491
nop
RET2491:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2492: !_REPLACEMENT [28] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P2493: !_ST [29] (maybe <- 0x2800010) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 64] %asi
add   %l4, 1, %l4

P2494: !_LD [28] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 0] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2495: !_LD [1] (Int)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P2496: !_ST [16] (maybe <- 0x2800011) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 16 ]
add   %l4, 1, %l4

P2497: !_ST [20] (maybe <- 0x4200004d) (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 256 ] %asi

P2498: !_MEMBAR (FP) (Branch target of P2544)
ba P2499
nop

TARGET2544:
ba RET2544
nop


P2499: !_BSTC [1] (maybe <- 0x4200004e) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2499
nop
RET2499:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2500: !_MEMBAR (FP)
membar #StoreLoad

P2501: !_BLD [8] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f0
membar #Sync
! 2 addresses covered
fmovs %f8, %f1

P2502: !_MEMBAR (FP)

P2503: !_REPLACEMENT [5] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+64], %l3
st %l3, [%i3+64]
add %i3, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2503
nop
RET2503:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2504: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2505: !_BLD [21] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f2
fmovd %f40, %f4

P2506: !_MEMBAR (FP) (Secondary ctx)

P2507: !_ST [18] (maybe <- 0x42000053) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P2508: !_REPLACEMENT [18] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+128], %o5
st %o5, [%i2+128]
add %i2, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2508
nop
RET2508:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2509: !_MEMBAR (FP)

P2510: !_BST [11] (maybe <- 0x42000054) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P2511: !_MEMBAR (FP) (Branch target of P2570)
membar #StoreLoad
ba P2512
nop

TARGET2570:
ba RET2570
nop


P2512: !_BLD [32] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2513: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2513
nop
RET2513:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2514: !_BLD [27] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2515: !_MEMBAR (FP) (Secondary ctx)

P2516: !_BLD [0] (FP) (Branch target of P2382)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12
ba P2517
nop

TARGET2382:
ba RET2382
nop


P2517: !_MEMBAR (FP)

P2518: !_LD [21] (FP) (Branch target of P2612)
ld [%i3 + 0], %f13
! 1 addresses covered
ba P2519
nop

TARGET2612:
ba RET2612
nop


P2519: !_IDC_FLIP [23] (Int)
IDC_FLIP(2519, 5037, 5, 0x45800020, 0x20, %i3, 0x20, %l6, %l7, %o5, %l3)

P2520: !_ST [3] (maybe <- 0x42000057) (FP) (CBR)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 16 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2520
nop
RET2520:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2521: !_ST [28] (maybe <- 0x42000058) (FP) (CBR)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2521
nop
RET2521:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2522: !_ST [27] (maybe <- 0x42000059) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 160 ]

P2523: !_REPLACEMENT [18] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+128], %l7
st %l7, [%i2+128]
add %i2, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]

P2524: !_LD [29] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 64], %f14
! 1 addresses covered

P2525: !_IDC_FLIP [20] (Int) (CBR)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(2525, 30167, 5, 0x45000100, 0x100, %i2, 0x100, %l6, %l7, %o5, %l3)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2525
nop
RET2525:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2526: !_LD [3] (Int)
lduw [%i0 + 16], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2527: !_PREFETCH [14] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 64], 1

P2528: !_ST [12] (maybe <- 0x2800012) (Int) (CBR)
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2528
nop
RET2528:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2529: !_PREFETCH [21] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

P2530: !_REPLACEMENT [16] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+16], %l7
st %l7, [%i3+16]
add %i3, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2530
nop
RET2530:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2531: !_ST [20] (maybe <- 0x4200005a) (FP)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 256 ]

P2532: !_ST [6] (maybe <- 0x2800013) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
stwa   %l4, [%i0 + 96] %asi
add   %l4, 1, %l4

P2533: !_REPLACEMENT [4] (Int) (CBR)
sethi %hi(0x2000), %l7
ld [%i3+32], %l3
st %l3, [%i3+32]
add %i3, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2533
nop
RET2533:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2534: !_REPLACEMENT [5] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l7
ld [%i3+64], %l3
st %l3, [%i3+64]
add %i3, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P2535: !_MEMBAR (FP)

P2536: !_BSTC [15] (maybe <- 0x4200005b) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P2537: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2537
nop
RET2537:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2538: !_ST [22] (maybe <- 0x4200005c) (FP) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 4 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2538
nop
RET2538:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2539: !_ST [16] (maybe <- 0x4200005d) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 16 ]

P2540: !_MEMBAR (FP) (Secondary ctx)

P2541: !_BST [21] (maybe <- 0x4200005e) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2542: !_MEMBAR (FP) (Secondary ctx)

P2543: !_BST [5] (maybe <- 0x42000061) (FP) (Branch target of P2367)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P2544
nop

TARGET2367:
ba RET2367
nop


P2544: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2544
nop
RET2544:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2545: !_BLD [0] (FP) (Branch target of P2446)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f18, %f1
fmovd %f36, %f2
fmovd %f40, %f18
fmovs %f18, %f3
ba P2546
nop

TARGET2446:
ba RET2446
nop


P2546: !_MEMBAR (FP)

P2547: !_BLD [6] (FP) (Branch target of P2464)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f4
fmovd %f40, %f18
fmovs %f18, %f5
ba P2548
nop

TARGET2464:
ba RET2464
nop


P2548: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2548
nop
RET2548:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2549: !_BST [24] (maybe <- 0x42000063) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P2550: !_MEMBAR (FP) (Branch target of P2261)
membar #StoreLoad
ba P2551
nop

TARGET2261:
ba RET2261
nop


P2551: !_REPLACEMENT [21] (Int) (Branch target of P2280)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
ba P2552
nop

TARGET2280:
ba RET2280
nop


P2552: !_REPLACEMENT [3] (Int) (CBR) (Branch target of P2427)
sethi %hi(0x2000), %l7
ld [%i2+16], %l3
st %l3, [%i2+16]
add %i2, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2552
nop
RET2552:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2553
nop

TARGET2427:
ba RET2427
nop


P2553: !_MEMBAR (FP)

P2554: !_BST [32] (maybe <- 0x42000065) (FP) (Branch target of P2241)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi
ba P2555
nop

TARGET2241:
ba RET2241
nop


P2555: !_MEMBAR (FP)
membar #StoreLoad

P2556: !_PREFETCH [30] (Int)
prefetch [%i3 + 128], 1

P2557: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2557
nop
RET2557:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2558: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f6
fmovd %f34, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P2559: !_MEMBAR (FP)

P2560: !_BST [14] (maybe <- 0x42000066) (FP) (Branch target of P2488)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi
ba P2561
nop

TARGET2488:
ba RET2488
nop


P2561: !_MEMBAR (FP)
membar #StoreLoad

P2562: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2563: !_MEMBAR (FP) (CBR) (Branch target of P2627)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2563
nop
RET2563:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2564
nop

TARGET2627:
ba RET2627
nop


P2564: !_BSTC [24] (maybe <- 0x42000067) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2565: !_MEMBAR (FP)
membar #StoreLoad

P2566: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P2567: !_MEMBAR (FP)

P2568: !_LD [10] (FP) (Branch target of P2528)
ld [%i1 + 64], %f1
! 1 addresses covered
ba P2569
nop

TARGET2528:
ba RET2528
nop


P2569: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2412)
membar #StoreLoad
ba P2570
nop

TARGET2412:
ba RET2412
nop


P2570: !_BLD [21] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f2
fmovd %f40, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2570
nop
RET2570:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2571: !_MEMBAR (FP) (Secondary ctx)

P2572: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P2573: !_MEMBAR (FP)

P2574: !_REPLACEMENT [7] (Int) (Branch target of P2449)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+128], %l3
st %l3, [%i2+128]
add %i2, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
ba P2575
nop

TARGET2449:
ba RET2449
nop


P2575: !_MEMBAR (FP) (Secondary ctx)

P2576: !_BST [21] (maybe <- 0x42000069) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P2577: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2243)
membar #StoreLoad
ba P2578
nop

TARGET2243:
ba RET2243
nop


P2578: !_BLD [8] (FP) (Branch target of P2360)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovd %f40, %f8
ba P2579
nop

TARGET2360:
ba RET2360
nop


P2579: !_MEMBAR (FP)

P2580: !_BSTC [26] (maybe <- 0x4200006c) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P2581: !_MEMBAR (FP)

P2582: !_BSTC [4] (maybe <- 0x4200006e) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P2583: !_MEMBAR (FP) (Branch target of P2402)
membar #StoreLoad
ba P2584
nop

TARGET2402:
ba RET2402
nop


P2584: !_BLD [27] (FP) (Branch target of P2530)
wr %g0, 0xf0, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10
ba P2585
nop

TARGET2530:
ba RET2530
nop


P2585: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2585
nop
RET2585:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2586: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2587: !_MEMBAR (FP)

P2588: !_REPLACEMENT [33] (Int) (Branch target of P2290)
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
ba P2589
nop

TARGET2290:
ba RET2290
nop


P2589: !_MEMBAR (FP) (Branch target of P2458)
ba P2590
nop

TARGET2458:
ba RET2458
nop


P2590: !_BST [15] (maybe <- 0x42000073) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P2591: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2591
nop
RET2591:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2592: !_LD [30] (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
lda    [%i3 + 128] %asi, %f12
! 1 addresses covered

P2593: !_MEMBAR (FP)

P2594: !_BST [26] (maybe <- 0x42000074) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P2595: !_MEMBAR (FP)

P2596: !_BSTC [30] (maybe <- 0x42000076) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P2597: !_MEMBAR (FP)
membar #StoreLoad

P2598: !_REPLACEMENT [2] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+8], %l7
st %l7, [%i3+8]
add %i3, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]

P2599: !_MEMBAR (FP) (Branch target of P2244)
membar #StoreLoad
ba P2600
nop

TARGET2244:
ba RET2244
nop


P2600: !_BLD [18] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2600
nop
RET2600:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2601: !_MEMBAR (FP)

P2602: !_BLD [21] (FP) (Branch target of P2332)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0
ba P2603
nop

TARGET2332:
ba RET2332
nop


P2603: !_MEMBAR (FP)

P2604: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f18, %f3
fmovd %f36, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2605: !_MEMBAR (FP)

P2606: !_REPLACEMENT [22] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P2607: !_LD [31] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 192], %f6
! 1 addresses covered

P2608: !_MEMBAR (FP)

P2609: !_BST [13] (maybe <- 0x42000077) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2610: !_MEMBAR (FP)
membar #StoreLoad

P2611: !_BLD [2] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f18, %f9
fmovd %f36, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2612: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2612
nop
RET2612:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2613: !_LD [1] (FP) (Branch target of P2247)
ld [%i0 + 4], %f12
! 1 addresses covered
ba P2614
nop

TARGET2247:
ba RET2247
nop


P2614: !_MEMBAR (FP) (Secondary ctx)

P2615: !_BSTC [15] (maybe <- 0x4200007a) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P2616: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2616
nop
RET2616:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2617: !_ST [8] (maybe <- 0x4200007b) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 0 ]

P2618: !_MEMBAR (FP)

P2619: !_BSTC [11] (maybe <- 0x4200007c) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2620: !_MEMBAR (FP)
membar #StoreLoad

P2621: !_ST [27] (maybe <- 0x4200007f) (FP) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 160 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2621
nop
RET2621:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2622: !_MEMBAR (FP) (Branch target of P2260)
membar #StoreLoad
ba P2623
nop

TARGET2260:
ba RET2260
nop


P2623: !_BLD [12] (FP) (Branch target of P2281)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
ba P2624
nop

TARGET2281:
ba RET2281
nop


P2624: !_MEMBAR (FP)

P2625: !_REPLACEMENT [30] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+128], %o5
st %o5, [%i2+128]
add %i2, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P2626: !_MEMBAR (FP) (Branch target of P2421)
ba P2627
nop

TARGET2421:
ba RET2421
nop


P2627: !_BSTC [3] (maybe <- 0x42000080) (FP) (CBR) (Branch target of P2513)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2627
nop
RET2627:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P2628
nop

TARGET2513:
ba RET2513
nop


P2628: !_MEMBAR (FP)
membar #StoreLoad

P2629: !_REPLACEMENT [12] (Int)
sethi %hi(0x2000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P2630: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2630
nop
RET2630:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2631: !_BLD [11] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f0
membar #Sync
! 3 addresses covered
fmovd %f8, %f2

P2632: !_MEMBAR (FP) (Branch target of P2482)
ba P2633
nop

TARGET2482:
ba RET2482
nop


P2633: !_BSTC [20] (maybe <- 0x42000085) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P2634: !_MEMBAR (FP)
membar #StoreLoad

P2635: !_PREFETCH [18] (Int) (Branch target of P2313)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 128], 1
ba P2636
nop

TARGET2313:
ba RET2313
nop


P2636: !_LD [19] (Int) (Loop exit)
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovs %f2, %f30
!--
loop_exit_5_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_5_0
nop

P2637: !_MEMBAR (Int)
membar #StoreLoad

END_NODES5: ! Test instruction sequence for CPU 5 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
stw %l7, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func6:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x06deade1), %l6
or    %l6, %lo(0x06deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x3000001), %l4
or    %l4, %lo(0x3000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x42800001), %l6
or    %l6, %lo(0x42800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x37000000), %l6
or    %l6, %lo(0x37000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x194e^4
sethi %hi(0x194e), %l0
or    %l0, %lo(0x194e), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES6: ! Test instruction sequence for ISTREAM 6 begins

P2638: !_MEMBAR (FP) (Loop entry) (Secondary ctx)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_6_0:
membar #StoreLoad

P2639: !_BLD [10] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i1 + 64] %asi, %f0
membar #Sync
! 1 addresses covered

P2640: !_MEMBAR (FP) (Secondary ctx)

P2641: !_BLD [7] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2641
nop
RET2641:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2642: !_MEMBAR (FP) (Secondary ctx)

P2643: !_PREFETCH [31] (Int) (Nucleus ctx) (Branch target of P2705)
wr %g0, 0x4, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 192] %asi, 1
ba P2644
nop

TARGET2705:
ba RET2705
nop


P2644: !_MEMBAR (FP)
membar #StoreLoad

P2645: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f2
fmovd %f40, %f4

P2646: !_MEMBAR (FP)

P2647: !_LD [22] (Int) (CBR) (Branch target of P2960)
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2647
nop
RET2647:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2648
nop

TARGET2960:
ba RET2960
nop


P2648: !_REPLACEMENT [21] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P2649: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2650: !_BLD [2] (FP) (CBR) (Secondary ctx) (Branch target of P2975)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f18, %f7
fmovd %f36, %f8
fmovd %f40, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2650
nop
RET2650:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2651
nop

TARGET2975:
ba RET2975
nop


P2651: !_MEMBAR (FP) (Secondary ctx) (Branch target of P3101)
ba P2652
nop

TARGET3101:
ba RET3101
nop


P2652: !_BSTC [13] (maybe <- 0x42800001) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P2653: !_MEMBAR (FP) (Branch target of P3018)
membar #StoreLoad
ba P2654
nop

TARGET3018:
ba RET3018
nop


P2654: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f10
fmovd %f34, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P2655: !_MEMBAR (FP)

P2656: !_REPLACEMENT [4] (Int)
sethi %hi(0x2000), %l6
ld [%i2+32], %o5
st %o5, [%i2+32]
add %i2, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]

P2657: !_MEMBAR (FP)
membar #StoreLoad

P2658: !_BLD [22] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2658
nop
RET2658:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2659: !_MEMBAR (FP)

P2660: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P2661: !_MEMBAR (FP)

P2662: !_BST [8] (maybe <- 0x42800004) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P2663: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2663
nop
RET2663:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2664: !_PREFETCH [33] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 0] %asi, 1

P2665: !_LD [18] (Int) (Branch target of P3278)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 128], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
ba P2666
nop

TARGET3278:
ba RET3278
nop


P2666: !_LD [6] (Int)
lduw [%i0 + 96], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2667: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2667
nop
RET2667:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2668: !_BST [14] (maybe <- 0x42800006) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2669: !_MEMBAR (FP)
membar #StoreLoad

P2670: !_LD [29] (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 64], %f4
! 1 addresses covered

P2671: !_MEMBAR (FP)
membar #StoreLoad

P2672: !_BLD [25] (FP) (CBR) (Branch target of P3359)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2672
nop
RET2672:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2673
nop

TARGET3359:
ba RET3359
nop


P2673: !_MEMBAR (FP)

P2674: !_REPLACEMENT [12] (Int) (Nucleus ctx) (Branch target of P3151)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+4], %l3
st %l3, [%i2+4]
add %i2, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
ba P2675
nop

TARGET3151:
ba RET3151
nop


P2675: !_IDC_FLIP [5] (Int)
IDC_FLIP(2675, 31029, 6, 0x43000040, 0x40, %i0, 0x40, %l6, %l7, %o5, %l3)

P2676: !_LD [18] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P2677: !_REPLACEMENT [24] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i2+64], %l6
st %l6, [%i2+64]
add %i2, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2677
nop
RET2677:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2678: !_REPLACEMENT [30] (Int)
sethi %hi(0x2000), %o5
ld [%i2+128], %l6
st %l6, [%i2+128]
add %i2, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P2679: !_MEMBAR (FP) (Branch target of P3576)
ba P2680
nop

TARGET3576:
ba RET3576
nop


P2680: !_BSTC [32] (maybe <- 0x42800007) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P2681: !_MEMBAR (FP)
membar #StoreLoad

P2682: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2683: !_MEMBAR (FP) (Branch target of P3002)
ba P2684
nop

TARGET3002:
ba RET3002
nop


P2684: !_BST [32] (maybe <- 0x42800008) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P2685: !_MEMBAR (FP) (Branch target of P3477)
membar #StoreLoad
ba P2686
nop

TARGET3477:
ba RET3477
nop


P2686: !_BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2686
nop
RET2686:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2687: !_MEMBAR (FP) (Branch target of P3269)
ba P2688
nop

TARGET3269:
ba RET3269
nop


P2688: !_REPLACEMENT [7] (Int) (Branch target of P2846)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
ba P2689
nop

TARGET2846:
ba RET2846
nop


P2689: !_MEMBAR (FP)
membar #StoreLoad

P2690: !_BLD [29] (FP) (CBR) (Branch target of P3337)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2690
nop
RET2690:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P2691
nop

TARGET3337:
ba RET3337
nop


P2691: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2691
nop
RET2691:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2692: !_LD [12] (FP) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 4], %f14
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2692
nop
RET2692:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2693: !_MEMBAR (FP)

P2694: !_BST [5] (maybe <- 0x42800009) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P2695: !_MEMBAR (FP)
membar #StoreLoad

P2696: !_PREFETCH [14] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2696
nop
RET2696:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2697: !_PREFETCH [1] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i0 + 4] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2697
nop
RET2697:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2698: !_LD [13] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 32] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2699: !_MEMBAR (FP)

P2700: !_BST [21] (maybe <- 0x4280000b) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P2701: !_MEMBAR (FP) (CBR) (Branch target of P3523)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2701
nop
RET2701:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2702
nop

TARGET3523:
ba RET3523
nop


P2702: !_BLD [9] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P2703: !_MEMBAR (FP)

P2704: !_LD [13] (FP) (CBR)
ld [%i2 + 32], %f1
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2704
nop
RET2704:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2705: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2705
nop
RET2705:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2706: !_BST [8] (maybe <- 0x4280000e) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2706
nop
RET2706:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2707: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2707
nop
RET2707:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2708: !_ST [13] (maybe <- 0x42800010) (FP) (CBR)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2708
nop
RET2708:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2709: !_REPLACEMENT [32] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+256], %o5
st %o5, [%i2+256]
add %i2, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2709
nop
RET2709:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2710: !_REPLACEMENT [17] (Int)
sethi %hi(0x2000), %l6
ld [%i2+96], %o5
st %o5, [%i2+96]
add %i2, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]

P2711: !_REPLACEMENT [19] (Int)
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P2712: !_MEMBAR (FP)

P2713: !_BSTC [8] (maybe <- 0x42800011) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P2714: !_MEMBAR (FP)
membar #StoreLoad

P2715: !_MEMBAR (Int)
membar #StoreLoad

P2716: !_LD [32] (Int) (Loop exit)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 256], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
!--
loop_exit_6_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_6_0
nop

P2717: !_PREFETCH [31] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_6_1:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 192], 1

P2718: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2718
nop
RET2718:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2719: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f0
membar #Sync
! 2 addresses covered
fmovs %f8, %f1

P2720: !_MEMBAR (FP) (Branch target of P3433)
ba P2721
nop

TARGET3433:
ba RET3433
nop


P2721: !_PREFETCH [24] (Int) (Branch target of P2706)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 64], 1
ba P2722
nop

TARGET2706:
ba RET2706
nop


P2722: !_LD [24] (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
lda    [%i3 + 64] %asi, %f2
! 1 addresses covered

P2723: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2723
nop
RET2723:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2724: !_BLD [18] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2724
nop
RET2724:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2725: !_MEMBAR (FP)

P2726: !_REPLACEMENT [10] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P2727: !_ST [12] (maybe <- 0x3000001) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 4] %asi
add   %l4, 1, %l4

P2728: !_MEMBAR (FP)

P2729: !_BSTC [25] (maybe <- 0x42800013) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2729
nop
RET2729:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2730: !_MEMBAR (FP) (Branch target of P3397)
membar #StoreLoad
ba P2731
nop

TARGET3397:
ba RET3397
nop


P2731: !_BLD [19] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P2732: !_MEMBAR (FP)

P2733: !_REPLACEMENT [31] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+192], %l3
st %l3, [%i3+192]
add %i3, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]

P2734: !_PREFETCH [22] (Int) (Branch target of P2827)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 4], 1
ba P2735
nop

TARGET2827:
ba RET2827
nop


P2735: !_LD [8] (Int)
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2736: !_MEMBAR (FP) (Branch target of P2998)
ba P2737
nop

TARGET2998:
ba RET2998
nop


P2737: !_BST [17] (maybe <- 0x42800015) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2738: !_MEMBAR (FP)
membar #StoreLoad

P2739: !_ST [4] (maybe <- 0x3000002) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2740: !_PREFETCH [31] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 192] %asi, 1

P2741: !_PREFETCH [3] (Int)
prefetch [%i0 + 16], 1

P2742: !_ST [14] (maybe <- 0x42800016) (FP)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P2743: !_MEMBAR (FP)
membar #StoreLoad

P2744: !_BLD [12] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2745: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2745
nop
RET2745:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2746: !_BSTC [7] (maybe <- 0x42800017) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

P2747: !_MEMBAR (FP)
membar #StoreLoad

P2748: !_ST [33] (maybe <- 0x42800018) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 0 ] %asi

P2749: !_MEMBAR (FP)
membar #StoreLoad

P2750: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P2751: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2751
nop
RET2751:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2752: !_PREFETCH [26] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 128], 1

P2753: !_ST [10] (maybe <- 0x42800019) (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i1 + 64 ] %asi

P2754: !_PREFETCH [6] (Int)
prefetch [%i0 + 96], 1

P2755: !_MEMBAR (FP)
membar #StoreLoad

P2756: !_BLD [20] (FP) (Branch target of P3154)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
ba P2757
nop

TARGET3154:
ba RET3154
nop


P2757: !_MEMBAR (FP)

P2758: !_BLD [28] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2758
nop
RET2758:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2759: !_MEMBAR (FP)

P2760: !_BLD [9] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P2761: !_MEMBAR (FP) (Branch target of P3293)
ba P2762
nop

TARGET3293:
ba RET3293
nop


P2762: !_REPLACEMENT [26] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+128], %l7
st %l7, [%i2+128]
add %i2, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]

P2763: !_MEMBAR (FP)

P2764: !_BSTC [20] (maybe <- 0x4280001a) (FP) (Branch target of P3631)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi
ba P2765
nop

TARGET3631:
ba RET3631
nop


P2765: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2765
nop
RET2765:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2766: !_BST [6] (maybe <- 0x4280001b) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P2767: !_MEMBAR (FP)
membar #StoreLoad

P2768: !_REPLACEMENT [1] (Int)
sethi %hi(0x2000), %l7
ld [%i2+4], %l3
st %l3, [%i2+4]
add %i2, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P2769: !_MEMBAR (FP)
membar #StoreLoad

P2770: !_BLD [22] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P2771: !_MEMBAR (FP) (Branch target of P3105)
ba P2772
nop

TARGET3105:
ba RET3105
nop


P2772: !_ST [23] (maybe <- 0x4280001d) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P2773: !_LD [25] (Int)
lduw [%i2 + 96], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2774: !_MEMBAR (FP)
membar #StoreLoad

P2775: !_BLD [2] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f4
fmovd %f34, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovd %f40, %f8

P2776: !_MEMBAR (FP) (CBR) (Branch target of P2822)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2776
nop
RET2776:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2777
nop

TARGET2822:
ba RET2822
nop


P2777: !_BSTC [29] (maybe <- 0x4280001e) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2778: !_MEMBAR (FP)
membar #StoreLoad

P2779: !_PREFETCH [7] (Int) (Branch target of P3547)
prefetch [%i0 + 128], 1
ba P2780
nop

TARGET3547:
ba RET3547
nop


P2780: !_MEMBAR (FP) (Secondary ctx)

P2781: !_BSTC [2] (maybe <- 0x4280001f) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P2782: !_MEMBAR (FP) (Secondary ctx) (Branch target of P3458)
membar #StoreLoad
ba P2783
nop

TARGET3458:
ba RET3458
nop


P2783: !_BLD [17] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P2784: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2784
nop
RET2784:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2785: !_BST [24] (maybe <- 0x42800024) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2786: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2878)
ba P2787
nop

TARGET2878:
ba RET2878
nop


P2787: !_BSTC [27] (maybe <- 0x42800026) (FP) (Branch target of P3405)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi
ba P2788
nop

TARGET3405:
ba RET3405
nop


P2788: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2788
nop
RET2788:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2789: !_BST [10] (maybe <- 0x42800028) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P2790: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2790
nop
RET2790:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2791: !_BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f10
fmovd %f40, %f12

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2791
nop
RET2791:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2792: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2792
nop
RET2792:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2793: !_BSTC [4] (maybe <- 0x42800029) (FP) (Branch target of P3180)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P2794
nop

TARGET3180:
ba RET3180
nop


P2794: !_MEMBAR (FP)
membar #StoreLoad

P2795: !_BLD [30] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2796: !_MEMBAR (FP) (Branch target of P3095)
ba P2797
nop

TARGET3095:
ba RET3095
nop


P2797: !_BSTC [22] (maybe <- 0x4280002e) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2798: !_MEMBAR (FP)
membar #StoreLoad

P2799: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f34, %f0
fmovd %f36, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P2800: !_MEMBAR (FP) (Branch target of P2877)
ba P2801
nop

TARGET2877:
ba RET2877
nop


P2801: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2802: !_MEMBAR (FP) (Loop exit)
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
!--
loop_exit_6_1:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_6_1
nop

P2803: !_REPLACEMENT [31] (Int) (Loop entry) (Branch target of P2913)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_6_2:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+192], %l3
st %l3, [%i3+192]
add %i3, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
ba P2804
nop

TARGET2913:
ba RET2913
nop


P2804: !_MEMBAR (FP)
membar #StoreLoad

P2805: !_BLD [6] (FP) (CBR) (Branch target of P3634)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f0
membar #Sync
! 2 addresses covered
fmovs %f8, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2805
nop
RET2805:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2806
nop

TARGET3634:
ba RET3634
nop


P2806: !_MEMBAR (FP)

P2807: !_BSTC [23] (maybe <- 0x42800031) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2808: !_MEMBAR (FP)
membar #StoreLoad

P2809: !_MEMBAR (Int)
membar #StoreLoad

P2810: !_REPLACEMENT [32] (Int) (Branch target of P3153)
sethi %hi(0x2000), %l6
ld [%i3+256], %o5
st %o5, [%i3+256]
add %i3, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
add %l7, %l6, %l7
ld [%l7+256], %o5
st %o5, [%l7+256]
ba P2811
nop

TARGET3153:
ba RET3153
nop


P2811: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2812: !_BLD [4] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f2
fmovd %f34, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P2813: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2813
nop
RET2813:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2814: !_REPLACEMENT [31] (Int)
sethi %hi(0x2000), %l6
ld [%i3+192], %o5
st %o5, [%i3+192]
add %i3, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]
add %l7, %l6, %l7
ld [%l7+192], %o5
st %o5, [%l7+192]

P2815: !_MEMBAR (FP)
membar #StoreLoad

P2816: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2817: !_MEMBAR (FP)

P2818: !_BLD [30] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8

P2819: !_MEMBAR (FP)

P2820: !_REPLACEMENT [6] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+96], %l7
st %l7, [%i3+96]
add %i3, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]

P2821: !_REPLACEMENT [27] (Int)
sethi %hi(0x2000), %o5
ld [%i3+160], %l6
st %l6, [%i3+160]
add %i3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]

P2822: !_ST [3] (maybe <- 0x3000003) (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
stwa   %l4, [%i0 + 16] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2822
nop
RET2822:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2823: !_PREFETCH [5] (Int) (Branch target of P3423)
prefetch [%i0 + 64], 1
ba P2824
nop

TARGET3423:
ba RET3423
nop


P2824: !_MEMBAR (FP) (Branch target of P3283)
ba P2825
nop

TARGET3283:
ba RET3283
nop


P2825: !_BST [10] (maybe <- 0x42800034) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P2826: !_MEMBAR (FP)
membar #StoreLoad

P2827: !_BLD [28] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2827
nop
RET2827:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2828: !_MEMBAR (FP) (Secondary ctx)

P2829: !_BSTC [11] (maybe <- 0x42800035) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2830: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2831: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2832: !_MEMBAR (FP)

P2833: !_BLD [26] (FP) (Branch target of P2925)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f12
fmovd %f40, %f18
fmovs %f18, %f13
ba P2834
nop

TARGET2925:
ba RET2925
nop


P2834: !_MEMBAR (FP)

P2835: !_BST [3] (maybe <- 0x42800038) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P2836: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2836
nop
RET2836:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2837: !_BSTC [19] (maybe <- 0x4280003d) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2838: !_MEMBAR (FP)
membar #StoreLoad

P2839: !_MEMBAR (Int)

P2840: !_BST [7] (maybe <- 0x4280003e) (FP) (Branch target of P2890)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi
ba P2841
nop

TARGET2890:
ba RET2890
nop


P2841: !_MEMBAR (FP) (Branch target of P3422)
ba P2842
nop

TARGET3422:
ba RET3422
nop


P2842: !_BSTC [5] (maybe <- 0x4280003f) (FP) (Branch target of P2869)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P2843
nop

TARGET2869:
ba RET2869
nop


P2843: !_MEMBAR (FP) (Branch target of P2939)
membar #StoreLoad
ba P2844
nop

TARGET2939:
ba RET2939
nop


P2844: !_PREFETCH [17] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 96] %asi, 1

P2845: !_MEMBAR (FP) (Secondary ctx)

P2846: !_BST [14] (maybe <- 0x42800041) (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2846
nop
RET2846:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2847: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2848: !_BLD [7] (FP) (Branch target of P3303)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14
ba P2849
nop

TARGET3303:
ba RET3303
nop


P2849: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2849
nop
RET2849:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2850: !_ST [19] (maybe <- 0x3000004) (Int) (CBR)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2850
nop
RET2850:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2851: !_MEMBAR (FP)
membar #StoreLoad

P2852: !_BLD [17] (FP) (CBR) (Branch target of P3461)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2852
nop
RET2852:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P2853
nop

TARGET3461:
ba RET3461
nop


P2853: !_MEMBAR (FP) (Branch target of P3097)
ba P2854
nop

TARGET3097:
ba RET3097
nop


P2854: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f0
membar #Sync
! 3 addresses covered
fmovd %f8, %f2

P2855: !_MEMBAR (FP)

P2856: !_ST [18] (maybe <- 0x3000005) (Int)
stw   %l4, [%i2 + 128 ]
add   %l4, 1, %l4

P2857: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2857
nop
RET2857:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2858: !_BSTC [18] (maybe <- 0x42800042) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2858
nop
RET2858:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2859: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2859
nop
RET2859:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2860: !_BST [31] (maybe <- 0x42800043) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 192 ] %asi

P2861: !_MEMBAR (FP)

P2862: !_BST [22] (maybe <- 0x42800044) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P2863: !_MEMBAR (FP)

P2864: !_BSTC [22] (maybe <- 0x42800047) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P2865: !_MEMBAR (FP) (Branch target of P3382)
ba P2866
nop

TARGET3382:
ba RET3382
nop


P2866: !_BSTC [14] (maybe <- 0x4280004a) (FP) (Branch target of P2876)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi
ba P2867
nop

TARGET2876:
ba RET2876
nop


P2867: !_MEMBAR (FP)

P2868: !_BST [6] (maybe <- 0x4280004b) (FP) (Branch target of P3192)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P2869
nop

TARGET3192:
ba RET3192
nop


P2869: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2869
nop
RET2869:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2870: !_LD [22] (Int) (CBR) (Secondary ctx) (Branch target of P3309)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2870
nop
RET2870:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P2871
nop

TARGET3309:
ba RET3309
nop


P2871: !_LD [13] (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
lda    [%i3 + 32] %asi, %f3
! 1 addresses covered

P2872: !_MEMBAR (FP)
membar #StoreLoad

P2873: !_BLD [25] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f4
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2873
nop
RET2873:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2874: !_MEMBAR (FP)

P2875: !_BSTC [10] (maybe <- 0x4280004d) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P2876: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2876
nop
RET2876:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2877: !_REPLACEMENT [5] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+64], %o5
st %o5, [%i3+64]
add %i3, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2877
nop
RET2877:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2878: !_ST [19] (maybe <- 0x4280004e) (FP) (CBR)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2878
nop
RET2878:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2879: !_ST [3] (maybe <- 0x4280004f) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 16 ]

P2880: !_MEMBAR (FP)

P2881: !_BST [26] (maybe <- 0x42800050) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P2882: !_MEMBAR (FP)
membar #StoreLoad

P2883: !_BLD [18] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2883
nop
RET2883:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2884: !_MEMBAR (FP)

P2885: !_PREFETCH [28] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P2886: !_LD [33] (Int) (Branch target of P3400)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
ba P2887
nop

TARGET3400:
ba RET3400
nop


P2887: !_ST [18] (maybe <- 0x42800052) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 128 ] %asi

P2888: !_MEMBAR (FP) (Branch target of P3453)
ba P2889
nop

TARGET3453:
ba RET3453
nop


P2889: !_BSTC [30] (maybe <- 0x42800053) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P2890: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2890
nop
RET2890:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2891: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovd %f40, %f8

P2892: !_MEMBAR (FP)

P2893: !_LD [20] (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 256] %asi, %f9
! 1 addresses covered

P2894: !_REPLACEMENT [18] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P2895: !_IDC_FLIP [23] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(2895, 11677, 6, 0x45800020, 0x20, %i2, 0x20, %l6, %l7, %o5, %l3)

P2896: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P2897: !_BLD [20] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f10

P2898: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2900)
ba P2899
nop

TARGET2900:
ba RET2900
nop


P2899: !_REPLACEMENT [23] (Int) (Branch target of P3232)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+32], %o5
st %o5, [%i2+32]
add %i2, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
ba P2900
nop

TARGET3232:
ba RET3232
nop


P2900: !_LD [32] (Int) (CBR)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2900
nop
RET2900:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2901: !_MEMBAR (FP)

P2902: !_BST [1] (maybe <- 0x42800054) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P2903: !_MEMBAR (FP)

P2904: !_BST [3] (maybe <- 0x42800059) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P2905: !_MEMBAR (FP)
membar #StoreLoad

P2906: !_BLD [3] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f18, %f13
fmovd %f36, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2906
nop
RET2906:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2907: !_MEMBAR (FP)

P2908: !_BST [9] (maybe <- 0x4280005e) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P2909: !_MEMBAR (FP)
membar #StoreLoad

P2910: !_PREFETCH [10] (Int)
prefetch [%i1 + 64], 1

P2911: !_REPLACEMENT [23] (Int) (Branch target of P2918)
sethi %hi(0x2000), %l6
ld [%i2+32], %o5
st %o5, [%i2+32]
add %i2, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
ba P2912
nop

TARGET2918:
ba RET2918
nop


P2912: !_ST [27] (maybe <- 0x3000006) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 160] %asi
add   %l4, 1, %l4

P2913: !_REPLACEMENT [2] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+8], %l6
st %l6, [%i3+8]
add %i3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]
add %l3, %o5, %l3
ld [%l3+8], %l6
st %l6, [%l3+8]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2913
nop
RET2913:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2914: !_ST [9] (maybe <- 0x42800060) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 32 ]

P2915: !_ST [30] (maybe <- 0x3000007) (Int) (Secondary ctx) (Branch target of P3223)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 128] %asi
add   %l4, 1, %l4
ba P2916
nop

TARGET3223:
ba RET3223
nop


P2916: !_MEMBAR (FP)
membar #StoreLoad

P2917: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f0
membar #Sync
! 2 addresses covered
fmovs %f8, %f1

P2918: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2918
nop
RET2918:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2919: !_PREFETCH [24] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i3 + 64] %asi, 1

P2920: !_ST [20] (maybe <- 0x42800061) (FP) (Branch target of P2883)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 256 ]
ba P2921
nop

TARGET2883:
ba RET2883
nop


P2921: !_MEMBAR (FP)

P2922: !_BSTC [4] (maybe <- 0x42800062) (FP) (Branch target of P3603)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P2923
nop

TARGET3603:
ba RET3603
nop


P2923: !_MEMBAR (FP)
membar #StoreLoad

P2924: !_PREFETCH [32] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 256], 1

P2925: !_ST [0] (maybe <- 0x42800067) (FP) (CBR) (Secondary ctx) (Branch target of P2852)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2925
nop
RET2925:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P2926
nop

TARGET2852:
ba RET2852
nop


P2926: !_REPLACEMENT [0] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P2927: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2927
nop
RET2927:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2928: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f2
fmovd %f34, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P2929: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2929
nop
RET2929:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2930: !_LD [22] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lda    [%i3 + 4] %asi, %f7
! 1 addresses covered

P2931: !_REPLACEMENT [9] (Int) (Secondary ctx) (Branch target of P2697)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l6
ld [%i2+32], %o5
st %o5, [%i2+32]
add %i2, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
add %l7, %l6, %l7
ld [%l7+32], %o5
st %o5, [%l7+32]
ba P2932
nop

TARGET2697:
ba RET2697
nop


P2932: !_LD [26] (Int) (Branch target of P3533)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
ba P2933
nop

TARGET3533:
ba RET3533
nop


P2933: !_PREFETCH [33] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 0] %asi, 1

P2934: !_MEMBAR (FP)

P2935: !_BST [11] (maybe <- 0x42800068) (FP) (Branch target of P2849)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P2936
nop

TARGET2849:
ba RET2849
nop


P2936: !_MEMBAR (FP) (Branch target of P3282)
membar #StoreLoad
ba P2937
nop

TARGET3282:
ba RET3282
nop


P2937: !_LD [9] (Int) (Branch target of P3356)
lduw [%i1 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P2938
nop

TARGET3356:
ba RET3356
nop


P2938: !_ST [29] (maybe <- 0x4280006b) (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2939: !_REPLACEMENT [1] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2939
nop
RET2939:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2940: !_REPLACEMENT [25] (Int)
sethi %hi(0x2000), %l7
ld [%i3+96], %l3
st %l3, [%i3+96]
add %i3, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

P2941: !_PREFETCH [12] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 4] %asi, 1

P2942: !_MEMBAR (FP)
membar #StoreLoad

P2943: !_BLD [2] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P2944: !_MEMBAR (FP)

P2945: !_BLD [0] (FP) (Branch target of P3077)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f36, %f0
fmovd %f40, %f18
fmovs %f18, %f1
ba P2946
nop

TARGET3077:
ba RET3077
nop


P2946: !_MEMBAR (FP)

P2947: !_BLD [28] (FP) (Secondary ctx) (Branch target of P2850)
wr %g0, 0xf1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f2
ba P2948
nop

TARGET2850:
ba RET2850
nop


P2948: !_MEMBAR (FP) (Secondary ctx)

P2949: !_LD [21] (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 0], %f3
! 1 addresses covered

P2950: !_ST [10] (maybe <- 0x4280006c) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 64 ]

P2951: !_MEMBAR (FP)
membar #StoreLoad

P2952: !_BLD [0] (FP) (Branch target of P2790)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f4
fmovd %f34, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovd %f40, %f8
ba P2953
nop

TARGET2790:
ba RET2790
nop


P2953: !_MEMBAR (FP)

P2954: !_BST [14] (maybe <- 0x4280006d) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2955: !_MEMBAR (FP)
membar #StoreLoad

P2956: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2957: !_MEMBAR (FP)

P2958: !_BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2958
nop
RET2958:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2959: !_MEMBAR (FP)

P2960: !_BST [20] (maybe <- 0x4280006e) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2960
nop
RET2960:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2961: !_MEMBAR (FP)
membar #StoreLoad

P2962: !_LD [15] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i3 + 128] %asi, %f13
! 1 addresses covered

P2963: !_MEMBAR (FP)
membar #StoreLoad

P2964: !_BLD [33] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

P2965: !_MEMBAR (FP)

P2966: !_BLD [28] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2966
nop
RET2966:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2967: !_MEMBAR (FP) (Secondary ctx)

P2968: !_PREFETCH [8] (Int)
prefetch [%i1 + 0], 1

P2969: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2723)
ba P2970
nop

TARGET2723:
ba RET2723
nop


P2970: !_BST [18] (maybe <- 0x4280006f) (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P2971: !_MEMBAR (FP) (Secondary ctx)

P2972: !_BSTC [14] (maybe <- 0x42800070) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2972
nop
RET2972:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2973: !_MEMBAR (FP)
membar #StoreLoad

P2974: !_BLD [4] (FP) (Branch target of P3326)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4
ba P2975
nop

TARGET3326:
ba RET3326
nop


P2975: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2975
nop
RET2975:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2976: !_REPLACEMENT [30] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P2977: !_REPLACEMENT [3] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l3
ld [%i3+16], %l7
st %l7, [%i3+16]
add %i3, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]

P2978: !_ST [24] (maybe <- 0x42800071) (FP) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2978
nop
RET2978:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2979: !_ST [26] (maybe <- 0x3000008) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
stwa   %l4, [%i2 + 128] %asi
add   %l4, 1, %l4

P2980: !_MEMBAR (FP)

P2981: !_BST [14] (maybe <- 0x42800072) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P2982: !_MEMBAR (FP) (Branch target of P3195)
membar #StoreLoad
ba P2983
nop

TARGET3195:
ba RET3195
nop


P2983: !_PREFETCH [16] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 16], 1

P2984: !_REPLACEMENT [19] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P2985: !_MEMBAR (FP) (Branch target of P2859)
ba P2986
nop

TARGET2859:
ba RET2859
nop


P2986: !_BST [10] (maybe <- 0x42800073) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P2987: !_MEMBAR (FP)
membar #StoreLoad

P2988: !_ST [5] (maybe <- 0x42800074) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P2989: !_REPLACEMENT [14] (Int)
sethi %hi(0x2000), %l7
ld [%i3+64], %l3
st %l3, [%i3+64]
add %i3, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P2990: !_MEMBAR (FP)

P2991: !_BST [12] (maybe <- 0x42800075) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P2992: !_MEMBAR (FP)
membar #StoreLoad

P2993: !_PREFETCH [24] (Int) (Branch target of P3626)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 64], 1
ba P2994
nop

TARGET3626:
ba RET3626
nop


P2994: !_MEMBAR (FP) (Branch target of P3380)
membar #StoreLoad
ba P2995
nop

TARGET3380:
ba RET3380
nop


P2995: !_BLD [18] (FP) (Branch target of P2701)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
ba P2996
nop

TARGET2701:
ba RET2701
nop


P2996: !_MEMBAR (FP)

P2997: !_BST [6] (maybe <- 0x42800078) (FP) (Branch target of P2791)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P2998
nop

TARGET2791:
ba RET2791
nop


P2998: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2998
nop
RET2998:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2999: !_BSTC [23] (maybe <- 0x4280007a) (FP) (Branch target of P2707)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P3000
nop

TARGET2707:
ba RET2707
nop


P3000: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3000
nop
RET3000:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3001: !_PREFETCH [19] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P3002: !_LD [14] (FP) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 64], %f6
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3002
nop
RET3002:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3003: !_REPLACEMENT [29] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+64], %o5
st %o5, [%i3+64]
add %i3, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3003
nop
RET3003:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3004: !_MEMBAR (FP)

P3005: !_BST [32] (maybe <- 0x4280007d) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P3006: !_MEMBAR (FP)
membar #StoreLoad

P3007: !_PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 128] %asi, 1

P3008: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P2692)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3008
nop
RET3008:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P3009
nop

TARGET2692:
ba RET2692
nop


P3009: !_BLD [10] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3010: !_MEMBAR (FP) (Secondary ctx)

P3011: !_BLD [22] (FP) (Branch target of P3152)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f8
fmovd %f40, %f10
ba P3012
nop

TARGET3152:
ba RET3152
nop


P3012: !_MEMBAR (FP)

P3013: !_BSTC [26] (maybe <- 0x4280007e) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P3014: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P3015: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P3016: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3016
nop
RET3016:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3017: !_LD [0] (FP)
ld [%i0 + 0], %f14
! 1 addresses covered

P3018: !_ST [19] (maybe <- 0x3000009) (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 0] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3018
nop
RET3018:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3019: !_MEMBAR (FP)
membar #StoreLoad

P3020: !_BLD [21] (FP) (Branch target of P3129)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1
ba P3021
nop

TARGET3129:
ba RET3129
nop


P3021: !_MEMBAR (FP)

P3022: !_ST [31] (maybe <- 0x42800080) (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P3023: !_REPLACEMENT [23] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+32], %l7
st %l7, [%i2+32]
add %i2, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

P3024: !_MEMBAR (FP) (Branch target of P3235)
membar #StoreLoad
ba P3025
nop

TARGET3235:
ba RET3235
nop


P3025: !_BLD [12] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f2
fmovd %f40, %f4

P3026: !_MEMBAR (FP) (Branch target of P3490)
ba P3027
nop

TARGET3490:
ba RET3490
nop


P3027: !_REPLACEMENT [20] (Int)
sethi %hi(0x2000), %o5
ld [%i2+256], %l6
st %l6, [%i2+256]
add %i2, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]

P3028: !_REPLACEMENT [20] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l7
ld [%i2+256], %l3
st %l3, [%i2+256]
add %i2, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]

P3029: !_MEMBAR (FP)

P3030: !_BST [6] (maybe <- 0x42800081) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P3031: !_MEMBAR (FP) (Branch target of P2858)
membar #StoreLoad
ba P3032
nop

TARGET2858:
ba RET2858
nop


P3032: !_REPLACEMENT [12] (Int) (Branch target of P3061)
sethi %hi(0x2000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
ba P3033
nop

TARGET3061:
ba RET3061
nop


P3033: !_MEMBAR (FP)
membar #StoreLoad

P3034: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f18, %f7
fmovd %f36, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3035: !_MEMBAR (FP)

P3036: !_PREFETCH [2] (Int)
prefetch [%i0 + 8], 1

P3037: !_LD [26] (Int) (Branch target of P3366)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 128], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
ba P3038
nop

TARGET3366:
ba RET3366
nop


P3038: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3038
nop
RET3038:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3039: !_BLD [25] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3040: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2672)
ba P3041
nop

TARGET2672:
ba RET2672
nop


P3041: !_LD [24] (Int)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3042: !_REPLACEMENT [26] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+128], %l7
st %l7, [%i3+128]
add %i3, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]

P3043: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P3044: !_BLD [9] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P3045: !_MEMBAR (FP) (Secondary ctx)

P3046: !_REPLACEMENT [8] (Int) (CBR)
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3046
nop
RET3046:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3047: !_MEMBAR (FP)

P3048: !_BSTC [26] (maybe <- 0x42800083) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P3049: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3049
nop
RET3049:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3050: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f34, %f0
fmovd %f36, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P3051: !_MEMBAR (FP)

P3052: !_PREFETCH [12] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 4], 1

P3053: !_MEMBAR (FP) (Branch target of P3545)
ba P3054
nop

TARGET3545:
ba RET3545
nop


P3054: !_BSTC [22] (maybe <- 0x42800085) (FP) (Branch target of P3049)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P3055
nop

TARGET3049:
ba RET3049
nop


P3055: !_MEMBAR (FP) (Branch target of P3238)
membar #StoreLoad
ba P3056
nop

TARGET3238:
ba RET3238
nop


P3056: !_LD [31] (Int) (Nucleus ctx) (Branch target of P3000)
wr %g0, 0x4, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 192] %asi, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
ba P3057
nop

TARGET3000:
ba RET3000
nop


P3057: !_PREFETCH [7] (Int) (Nucleus ctx) (Branch target of P3475)
wr %g0, 0x4, %asi
prefetcha [%i0 + 128] %asi, 1
ba P3058
nop

TARGET3475:
ba RET3475
nop


P3058: !_REPLACEMENT [1] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P3059: !_MEMBAR (FP)
membar #StoreLoad

P3060: !_BLD [16] (FP) (Branch target of P2805)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f3
ba P3061
nop

TARGET2805:
ba RET2805
nop


P3061: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3061
nop
RET3061:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3062: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P3063: !_MEMBAR (FP)

P3064: !_PREFETCH [11] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

P3065: !_REPLACEMENT [12] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P3066: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3066
nop
RET3066:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3067: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P3068: !_MEMBAR (FP) (Branch target of P3298)
ba P3069
nop

TARGET3298:
ba RET3298
nop


P3069: !_REPLACEMENT [28] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P3070: !_ST [25] (maybe <- 0x42800088) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 96 ] %asi

P3071: !_REPLACEMENT [14] (Int) (CBR)
sethi %hi(0x2000), %l7
ld [%i3+64], %l3
st %l3, [%i3+64]
add %i3, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3071
nop
RET3071:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3072: !_MEMBAR (FP) (Branch target of P3324)
ba P3073
nop

TARGET3324:
ba RET3324
nop


P3073: !_BST [8] (maybe <- 0x42800089) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P3074: !_MEMBAR (FP)
membar #StoreLoad

P3075: !_REPLACEMENT [15] (Int)
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P3076: !_REPLACEMENT [7] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l3
ld [%i3+128], %l7
st %l7, [%i3+128]
add %i3, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]

P3077: !_MEMBAR (FP) (CBR) (Branch target of P3488)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3077
nop
RET3077:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3078
nop

TARGET3488:
ba RET3488
nop


P3078: !_BSTC [11] (maybe <- 0x4280008b) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3079: !_MEMBAR (FP) (Branch target of P3071)
membar #StoreLoad
ba P3080
nop

TARGET3071:
ba RET3071
nop


P3080: !_LD [31] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 192] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3080
nop
RET3080:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3081: !_LD [18] (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 128], %f7
! 1 addresses covered

P3082: !_LD [16] (FP) (Secondary ctx) (Branch target of P3427)
wr %g0, 0x81, %asi
lda    [%i3 + 16] %asi, %f8
! 1 addresses covered
ba P3083
nop

TARGET3427:
ba RET3427
nop


P3083: !_MEMBAR (FP)

P3084: !_BST [6] (maybe <- 0x4280008e) (FP) (Branch target of P3446)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi
ba P3085
nop

TARGET3446:
ba RET3446
nop


P3085: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3085
nop
RET3085:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3086: !_BLD [24] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P3087: !_MEMBAR (FP)

P3088: !_IDC_FLIP [24] (Int)
IDC_FLIP(3088, 20427, 6, 0x45800040, 0x40, %i2, 0x40, %l6, %l7, %o5, %l3)

P3089: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3089
nop
RET3089:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3090: !_BLD [15] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3091: !_MEMBAR (FP)

P3092: !_BLD [16] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f12

P3093: !_MEMBAR (FP)

P3094: !_REPLACEMENT [9] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+32], %l3
st %l3, [%i3+32]
add %i3, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

P3095: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3095
nop
RET3095:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3096: !_BST [20] (maybe <- 0x42800090) (FP) (Branch target of P3138)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi
ba P3097
nop

TARGET3138:
ba RET3138
nop


P3097: !_MEMBAR (FP) (CBR) (Branch target of P3038)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3097
nop
RET3097:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3098
nop

TARGET3038:
ba RET3038
nop


P3098: !_ST [16] (maybe <- 0x42800091) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 16 ] %asi

P3099: !_LD [17] (Int) (CBR)
lduw [%i3 + 96], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3099
nop
RET3099:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3100: !_LD [23] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3101: !_IDC_FLIP [21] (Int) (CBR)
IDC_FLIP(3101, 1385, 6, 0x45800000, 0x0, %i2, 0x0, %l6, %l7, %o5, %l3)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3101
nop
RET3101:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3102: !_MEMBAR (FP)

P3103: !_BSTC [12] (maybe <- 0x42800092) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3104: !_MEMBAR (FP)

P3105: !_BSTC [29] (maybe <- 0x42800095) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3105
nop
RET3105:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3106: !_MEMBAR (FP)
membar #StoreLoad

P3107: !_ST [21] (maybe <- 0x42800096) (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P3108: !_IDC_FLIP [21] (Int)
IDC_FLIP(3108, 3487, 6, 0x45800000, 0x0, %i3, 0x0, %l6, %l7, %o5, %l3)

P3109: !_MEMBAR (FP)

P3110: !_BSTC [3] (maybe <- 0x42800097) (FP) (CBR)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3110
nop
RET3110:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3111: !_MEMBAR (FP)
membar #StoreLoad

P3112: !_LD [7] (Int) (LE) (Branch target of P2978)
wr %g0, 0x88, %asi
lduwa [%i0 + 128] %asi, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
ba P3113
nop

TARGET2978:
ba RET2978
nop


P3113: !_MEMBAR (FP) (Branch target of P3363)
membar #StoreLoad
ba P3114
nop

TARGET3363:
ba RET3363
nop


P3114: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3115: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3115
nop
RET3115:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3116: !_ST [14] (maybe <- 0x4280009c) (FP)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P3117: !_LD [13] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i3 + 32] %asi, %f14
! 1 addresses covered

P3118: !_MEMBAR (FP) (Branch target of P3008)
membar #StoreLoad
ba P3119
nop

TARGET3008:
ba RET3008
nop


P3119: !_BLD [3] (FP) (Branch target of P3205)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f18, %f1
fmovd %f36, %f2
fmovd %f40, %f18
fmovs %f18, %f3
ba P3120
nop

TARGET3205:
ba RET3205
nop


P3120: !_MEMBAR (FP) (Branch target of P3139)
ba P3121
nop

TARGET3139:
ba RET3139
nop


P3121: !_BST [1] (maybe <- 0x4280009d) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P3122: !_MEMBAR (FP)
membar #StoreLoad

P3123: !_BLD [30] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P3124: !_MEMBAR (FP) (Branch target of P2724)
ba P3125
nop

TARGET2724:
ba RET2724
nop


P3125: !_BSTC [9] (maybe <- 0x428000a2) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P3126: !_MEMBAR (FP)
membar #StoreLoad

P3127: !_REPLACEMENT [29] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l6
ld [%i3+64], %o5
st %o5, [%i3+64]
add %i3, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

P3128: !_REPLACEMENT [2] (Int)
sethi %hi(0x2000), %l3
ld [%i3+8], %l7
st %l7, [%i3+8]
add %i3, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]
add %l6, %l3, %l6
ld [%l6+8], %l7
st %l7, [%l6+8]

P3129: !_MEMBAR (FP) (CBR) (Branch target of P3150)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3129
nop
RET3129:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3130
nop

TARGET3150:
ba RET3150
nop


P3130: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P3131: !_MEMBAR (FP) (Branch target of P3522)
ba P3132
nop

TARGET3522:
ba RET3522
nop


P3132: !_BST [33] (maybe <- 0x428000a4) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3133: !_MEMBAR (FP)
membar #StoreLoad

P3134: !_PREFETCH [31] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 192], 1

P3135: !_MEMBAR (FP) (Branch target of P3099)
membar #StoreLoad
ba P3136
nop

TARGET3099:
ba RET3099
nop


P3136: !_BLD [31] (FP) (Branch target of P2758)
wr %g0, 0xf0, %asi
ldda [%i2 + 192] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P3137
nop

TARGET2758:
ba RET2758
nop


P3137: !_MEMBAR (FP)

P3138: !_PREFETCH [22] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 4] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3138
nop
RET3138:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3139: !_REPLACEMENT [5] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+64], %l7
st %l7, [%i2+64]
add %i2, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3139
nop
RET3139:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3140: !_MEMBAR (FP)
membar #StoreLoad

P3141: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3142: !_MEMBAR (FP)

P3143: !_BSTC [22] (maybe <- 0x428000a5) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3144: !_MEMBAR (FP) (Secondary ctx)

P3145: !_BSTC [24] (maybe <- 0x428000a8) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P3146: !_MEMBAR (FP)
membar #StoreLoad

P3147: !_BLD [6] (FP) (Branch target of P2857)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11
ba P3148
nop

TARGET2857:
ba RET2857
nop


P3148: !_MEMBAR (FP)

P3149: !_BST [32] (maybe <- 0x428000aa) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

P3150: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3150
nop
RET3150:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3151: !_REPLACEMENT [24] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l7
ld [%i2+64], %l3
st %l3, [%i2+64]
add %i2, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3151
nop
RET3151:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3152: !_ST [21] (maybe <- 0x300000a) (Int) (CBR) (Secondary ctx) (Branch target of P3502)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 0] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3152
nop
RET3152:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3153
nop

TARGET3502:
ba RET3502
nop


P3153: !_REPLACEMENT [31] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+192], %l3
st %l3, [%i3+192]
add %i3, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3153
nop
RET3153:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3154: !_REPLACEMENT [21] (Int) (CBR)
sethi %hi(0x2000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3154
nop
RET3154:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3155: !_MEMBAR (FP)
membar #StoreLoad

P3156: !_BLD [11] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f12
fmovd %f40, %f14

P3157: !_MEMBAR (FP)

P3158: !_LD [15] (Int)
lduw [%i2 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3159: !_ST [1] (maybe <- 0x428000ab) (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 4 ] %asi

P3160: !_MEMBAR (FP)

P3161: !_BST [23] (maybe <- 0x428000ac) (FP) (CBR) (Branch target of P3218)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3161
nop
RET3161:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P3162
nop

TARGET3218:
ba RET3218
nop


P3162: !_MEMBAR (FP)
membar #StoreLoad

P3163: !_ST [4] (maybe <- 0x300000b) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3164: !_MEMBAR (FP) (Secondary ctx)

P3165: !_BST [1] (maybe <- 0x428000af) (FP) (Secondary ctx) (Branch target of P2709)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P3166
nop

TARGET2709:
ba RET2709
nop


P3166: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P3167: !_REPLACEMENT [21] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P3168: !_LD [26] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3169: !_MEMBAR (FP)
membar #StoreLoad

P3170: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f18, %f1
fmovd %f36, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P3171: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3171
nop
RET3171:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3172: !_PREFETCH [5] (Int)
prefetch [%i0 + 64], 1

P3173: !_REPLACEMENT [12] (Int) (CBR)
sethi %hi(0x2000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3173
nop
RET3173:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3174: !_REPLACEMENT [11] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P3175: !_PREFETCH [25] (Int) (Secondary ctx) (Branch target of P2873)
wr %g0, 0x81, %asi
prefetcha [%i3 + 96] %asi, 1
ba P3176
nop

TARGET2873:
ba RET2873
nop


P3176: !_MEMBAR (FP)

P3177: !_BST [17] (maybe <- 0x428000b4) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P3178: !_MEMBAR (FP)
membar #StoreLoad

P3179: !_BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3179
nop
RET3179:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3180: !_MEMBAR (FP) (CBR) (Branch target of P2690)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3180
nop
RET3180:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P3181
nop

TARGET2690:
ba RET2690
nop


P3181: !_BST [15] (maybe <- 0x428000b5) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P3182: !_MEMBAR (FP)
membar #StoreLoad

P3183: !_ST [26] (maybe <- 0x428000b6) (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 128 ] %asi

P3184: !_MEMBAR (FP) (Branch target of P3424)
membar #StoreLoad
ba P3185
nop

TARGET3424:
ba RET3424
nop


P3185: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P3186: !_MEMBAR (FP)

P3187: !_BLD [24] (FP) (Branch target of P2650)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9
ba P3188
nop

TARGET2650:
ba RET2650
nop


P3188: !_MEMBAR (FP)

P3189: !_REPLACEMENT [27] (Int) (Nucleus ctx) (Branch target of P3355)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+160], %o5
st %o5, [%i2+160]
add %i2, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
ba P3190
nop

TARGET3355:
ba RET3355
nop


P3190: !_MEMBAR (FP)

P3191: !_BST [29] (maybe <- 0x428000b7) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3191
nop
RET3191:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3192: !_MEMBAR (FP) (CBR) (Branch target of P3200)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3192
nop
RET3192:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P3193
nop

TARGET3200:
ba RET3200
nop


P3193: !_REPLACEMENT [10] (Int)
sethi %hi(0x2000), %l6
ld [%i2+64], %o5
st %o5, [%i2+64]
add %i2, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]

P3194: !_REPLACEMENT [7] (Int)
sethi %hi(0x2000), %l3
ld [%i2+128], %l7
st %l7, [%i2+128]
add %i2, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]

P3195: !_PREFETCH [30] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3195
nop
RET3195:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3196: !_REPLACEMENT [33] (Int)
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P3197: !_REPLACEMENT [13] (Int)
sethi %hi(0x2000), %o5
ld [%i2+32], %l6
st %l6, [%i2+32]
add %i2, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P3198: !_IDC_FLIP [13] (Int) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(3198, 3242, 6, 0x44000020, 0x20, %i2, 0x20, %l6, %l7, %o5, %l3)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3198
nop
RET3198:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3199: !_ST [29] (maybe <- 0x428000b8) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P3200: !_FLUSHI [28] (Int) (CBR)
flush %g0 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3200
nop
RET3200:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3201: !_PREFETCH [15] (Int)
prefetch [%i2 + 128], 1

P3202: !_REPLACEMENT [10] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+64], %l3
st %l3, [%i3+64]
add %i3, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]
add %o5, %l7, %o5
ld [%o5+64], %l3
st %l3, [%o5+64]

P3203: !_REPLACEMENT [27] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l6
ld [%i3+160], %o5
st %o5, [%i3+160]
add %i3, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]

P3204: !_IDC_FLIP [12] (Int)
IDC_FLIP(3204, 27693, 6, 0x44000004, 0x4, %i2, 0x4, %l6, %l7, %o5, %l3)

P3205: !_LD [24] (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3205
nop
RET3205:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3206: !_MEMBAR (FP)
membar #StoreLoad

P3207: !_BLD [26] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3208: !_MEMBAR (FP) (Branch target of P2966)
ba P3209
nop

TARGET2966:
ba RET2966
nop


P3209: !_REPLACEMENT [3] (Int)
sethi %hi(0x2000), %l3
ld [%i3+16], %l7
st %l7, [%i3+16]
add %i3, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]

P3210: !_REPLACEMENT [30] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i3+128], %l6
st %l6, [%i3+128]
add %i3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P3211: !_PREFETCH [12] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 4] %asi, 1

P3212: !_LD [1] (Int) (CBR)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3212
nop
RET3212:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3213: !_REPLACEMENT [24] (Int) (Branch target of P3426)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+64], %o5
st %o5, [%i2+64]
add %i2, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
add %l7, %l6, %l7
ld [%l7+64], %o5
st %o5, [%l7+64]
ba P3214
nop

TARGET3426:
ba RET3426
nop


P3214: !_ST [23] (maybe <- 0x428000b9) (FP) (Branch target of P3596)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 32 ]
ba P3215
nop

TARGET3596:
ba RET3596
nop


P3215: !_LD [26] (FP)
ld [%i3 + 128], %f12
! 1 addresses covered

P3216: !_ST [33] (maybe <- 0x300000c) (Int) (CBR)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3216
nop
RET3216:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3217: !_REPLACEMENT [12] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3217
nop
RET3217:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3218: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3218
nop
RET3218:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3219: !_BSTC [10] (maybe <- 0x428000ba) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi

P3220: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3220
nop
RET3220:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3221: !_BST [29] (maybe <- 0x428000bb) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P3222: !_MEMBAR (FP)

P3223: !_BST [5] (maybe <- 0x428000bc) (FP) (CBR) (Branch target of P3115)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3223
nop
RET3223:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P3224
nop

TARGET3115:
ba RET3115
nop


P3224: !_MEMBAR (FP) (Branch target of P3046)
membar #StoreLoad
ba P3225
nop

TARGET3046:
ba RET3046
nop


P3225: !_BLD [14] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3226: !_MEMBAR (FP)

P3227: !_REPLACEMENT [26] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+128], %l6
st %l6, [%i2+128]
add %i2, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P3228: !_REPLACEMENT [9] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l7
ld [%i2+32], %l3
st %l3, [%i2+32]
add %i2, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

P3229: !_MEMBAR (FP)

P3230: !_BSTC [17] (maybe <- 0x428000be) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P3231: !_MEMBAR (FP)
membar #StoreLoad

P3232: !_BLD [32] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3232
nop
RET3232:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3233: !_MEMBAR (FP)

P3234: !_BST [16] (maybe <- 0x428000bf) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3235: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3235
nop
RET3235:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3236: !_ST [20] (maybe <- 0x428000c0) (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i3 + 256 ] %asi

P3237: !_MEMBAR (FP) (Branch target of P3254)
ba P3238
nop

TARGET3254:
ba RET3254
nop


P3238: !_BST [1] (maybe <- 0x428000c1) (FP) (CBR) (Branch target of P3481)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3238
nop
RET3238:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3239
nop

TARGET3481:
ba RET3481
nop


P3239: !_MEMBAR (FP)
membar #StoreLoad

P3240: !_ST [33] (maybe <- 0x428000c6) (FP)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]

P3241: !_PREFETCH [22] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 4], 1

P3242: !_LD [14] (FP)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 64], %f15
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P3243: !_REPLACEMENT [32] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+256], %l6
st %l6, [%i3+256]
add %i3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]
add %l3, %o5, %l3
ld [%l3+256], %l6
st %l6, [%l3+256]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3243
nop
RET3243:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3244: !_PREFETCH [25] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 96] %asi, 1

P3245: !_MEMBAR (FP) (Branch target of P3365)
ba P3246
nop

TARGET3365:
ba RET3365
nop


P3246: !_BST [12] (maybe <- 0x428000c7) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3247: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3247
nop
RET3247:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3248: !_REPLACEMENT [30] (Int) (Branch target of P3464)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+128], %l6
st %l6, [%i2+128]
add %i2, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
ba P3249
nop

TARGET3464:
ba RET3464
nop


P3249: !_LD [10] (Int) (Nucleus ctx) (Branch target of P2708)
wr %g0, 0x4, %asi
lduwa [%i1 + 64] %asi, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
ba P3250
nop

TARGET2708:
ba RET2708
nop


P3250: !_ST [17] (maybe <- 0x300000d) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 96 ]
add   %l4, 1, %l4

P3251: !_LD [4] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
lduwa [%i0 + 32] %asi, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P3252: !_LD [2] (FP)
ld [%i0 + 8], %f0
! 1 addresses covered

P3253: !_PREFETCH [15] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 128], 1

P3254: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3254
nop
RET3254:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3255: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3256: !_MEMBAR (FP)

P3257: !_REPLACEMENT [16] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+16], %l3
st %l3, [%i3+16]
add %i3, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]
add %o5, %l7, %o5
ld [%o5+16], %l3
st %l3, [%o5+16]

P3258: !_MEMBAR (FP)

P3259: !_BSTC [25] (maybe <- 0x428000ca) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P3260: !_MEMBAR (FP)
membar #StoreLoad

P3261: !_LD [21] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 0] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3262: !_MEMBAR (FP) (Branch target of P3510)
ba P3263
nop

TARGET3510:
ba RET3510
nop


P3263: !_BST [14] (maybe <- 0x428000cc) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P3264: !_MEMBAR (FP) (Branch target of P2704)
membar #StoreLoad
ba P3265
nop

TARGET2704:
ba RET2704
nop


P3265: !_REPLACEMENT [3] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+16], %o5
st %o5, [%i2+16]
add %i2, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]
add %l7, %l6, %l7
ld [%l7+16], %o5
st %o5, [%l7+16]

P3266: !_ST [8] (maybe <- 0x428000cd) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 0 ]

P3267: !_ST [1] (maybe <- 0x428000ce) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 4 ] %asi

P3268: !_MEMBAR (FP)

P3269: !_BST [7] (maybe <- 0x428000cf) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3269
nop
RET3269:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3270: !_MEMBAR (FP)
membar #StoreLoad

P3271: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P3272: !_MEMBAR (FP)

P3273: !_BLD [30] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f4

P3274: !_MEMBAR (FP)

P3275: !_BSTC [21] (maybe <- 0x428000d0) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3276: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3276
nop
RET3276:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3277: !_LD [18] (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 128], %f5
! 1 addresses covered

P3278: !_ST [15] (maybe <- 0x428000d3) (FP) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 128 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3278
nop
RET3278:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3279: !_PREFETCH [28] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P3280: !_PREFETCH [4] (Int) (LE) (Secondary ctx) (Branch target of P2751)
wr %g0, 0x89, %asi
prefetcha [%i0 + 32] %asi, 1
ba P3281
nop

TARGET2751:
ba RET2751
nop


P3281: !_MEMBAR (FP) (Branch target of P2691)
ba P3282
nop

TARGET2691:
ba RET2691
nop


P3282: !_BSTC [18] (maybe <- 0x428000d4) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3282
nop
RET3282:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3283: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3283
nop
RET3283:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3284: !_PREFETCH [31] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
prefetcha [%i3 + 192] %asi, 1

P3285: !_MEMBAR (FP)
membar #StoreLoad

P3286: !_BLD [24] (FP) (Branch target of P2663)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7
ba P3287
nop

TARGET2663:
ba RET2663
nop


P3287: !_MEMBAR (FP)

P3288: !_BSTC [30] (maybe <- 0x428000d5) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P3289: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P3290: !_BLD [6] (FP) (Secondary ctx) (Branch target of P2696)
wr %g0, 0xf1, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9
ba P3291
nop

TARGET2696:
ba RET2696
nop


P3291: !_MEMBAR (FP) (Secondary ctx)

P3292: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f10

P3293: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3293
nop
RET3293:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3294: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P3295: !_MEMBAR (FP)

P3296: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3297: !_MEMBAR (FP) (Branch target of P3003)
ba P3298
nop

TARGET3003:
ba RET3003
nop


P3298: !_ST [21] (maybe <- 0x300000e) (Int) (CBR) (Nucleus ctx) (Branch target of P3560)
wr %g0, 0x4, %asi
stwa   %l4, [%i2 + 0] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3298
nop
RET3298:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P3299
nop

TARGET3560:
ba RET3560
nop


P3299: !_REPLACEMENT [13] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+32], %l6
st %l6, [%i2+32]
add %i2, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P3300: !_MEMBAR (FP)
membar #StoreLoad

P3301: !_BLD [29] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

P3302: !_MEMBAR (FP)

P3303: !_BST [23] (maybe <- 0x428000d6) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3303
nop
RET3303:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3304: !_MEMBAR (FP)

P3305: !_BST [5] (maybe <- 0x428000d9) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 64 ] %asi

P3306: !_MEMBAR (FP) (Branch target of P3636)
membar #StoreLoad
ba P3307
nop

TARGET3636:
ba RET3636
nop


P3307: !_ST [15] (maybe <- 0x428000db) (FP)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 128 ]

P3308: !_MEMBAR (FP) (Secondary ctx)

P3309: !_BST [16] (maybe <- 0x428000dc) (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3309
nop
RET3309:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3310: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3310
nop
RET3310:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3311: !_BLD [9] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P3312: !_MEMBAR (FP)

P3313: !_BST [19] (maybe <- 0x428000dd) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P3314: !_MEMBAR (FP)
membar #StoreLoad

P3315: !_BLD [2] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f18, %f3
fmovd %f36, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3316: !_MEMBAR (FP)

P3317: !_ST [7] (maybe <- 0x428000de) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 128 ]

P3318: !_MEMBAR (FP)

P3319: !_BSTC [0] (maybe <- 0x428000df) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P3320: !_MEMBAR (FP)
membar #StoreLoad

P3321: !_REPLACEMENT [7] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+128], %l3
st %l3, [%i3+128]
add %i3, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]

P3322: !_MEMBAR (FP)

P3323: !_BSTC [28] (maybe <- 0x428000e4) (FP) (Branch target of P2836)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi
ba P3324
nop

TARGET2836:
ba RET2836
nop


P3324: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3324
nop
RET3324:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3325: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f6
fmovd %f34, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P3326: !_MEMBAR (FP) (CBR) (Branch target of P3455)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3326
nop
RET3326:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3327
nop

TARGET3455:
ba RET3455
nop


P3327: !_BSTC [9] (maybe <- 0x428000e5) (FP) (Branch target of P3179)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi
ba P3328
nop

TARGET3179:
ba RET3179
nop


P3328: !_MEMBAR (FP)
membar #StoreLoad

P3329: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P3330: !_MEMBAR (FP)

P3331: !_LD [17] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 96] %asi, %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3332: !_MEMBAR (FP)

P3333: !_BST [27] (maybe <- 0x428000e7) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P3334: !_MEMBAR (FP)
membar #StoreLoad

P3335: !_FLUSHI [24] (Int)
flush %g0 

P3336: !_REPLACEMENT [32] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+256], %l3
st %l3, [%i3+256]
add %i3, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]
add %o5, %l7, %o5
ld [%o5+256], %l3
st %l3, [%o5+256]

P3337: !_PREFETCH [13] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 32] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3337
nop
RET3337:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3338: !_MEMBAR (FP) (Branch target of P3220)
ba P3339
nop

TARGET3220:
ba RET3220
nop


P3339: !_BST [23] (maybe <- 0x428000e9) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3340: !_MEMBAR (FP) (Branch target of P3276)
ba P3341
nop

TARGET3276:
ba RET3276
nop


P3341: !_BST [23] (maybe <- 0x428000ec) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3342: !_MEMBAR (FP)
membar #StoreLoad

P3343: !_REPLACEMENT [12] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P3344: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3344
nop
RET3344:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3345: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P3346: !_MEMBAR (FP)

P3347: !_BLD [16] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P3348: !_MEMBAR (FP) (Branch target of P3191)
ba P3349
nop

TARGET3191:
ba RET3191
nop


P3349: !_PREFETCH [31] (Int) (Branch target of P3407)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 192], 1
ba P3350
nop

TARGET3407:
ba RET3407
nop


P3350: !_LD [25] (FP)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 96], %f0
! 1 addresses covered

P3351: !_MEMBAR (FP) (Branch target of P2972)
membar #StoreLoad
ba P3352
nop

TARGET2972:
ba RET2972
nop


P3352: !_BLD [21] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f40, %f18
fmovs %f18, %f3

P3353: !_MEMBAR (FP) (Branch target of P3536)
ba P3354
nop

TARGET3536:
ba RET3536
nop


P3354: !_REPLACEMENT [7] (Int) (Branch target of P3529)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+128], %l7
st %l7, [%i2+128]
add %i2, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
add %l6, %l3, %l6
ld [%l6+128], %l7
st %l7, [%l6+128]
ba P3355
nop

TARGET3529:
ba RET3529
nop


P3355: !_ST [22] (maybe <- 0x300000f) (Int) (CBR)
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3355
nop
RET3355:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3356: !_PREFETCH [14] (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 64] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3356
nop
RET3356:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3357: !_REPLACEMENT [27] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l3
ld [%i2+160], %l7
st %l7, [%i2+160]
add %i2, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]

P3358: !_REPLACEMENT [23] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i2+32], %l6
st %l6, [%i2+32]
add %i2, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P3359: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3359
nop
RET3359:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3360: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3361: !_MEMBAR (FP)

P3362: !_LD [23] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3363: !_LD [16] (Int) (LE) (CBR) (Nucleus ctx) (Branch target of P3552)
wr %g0, 0xc, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 16] %asi, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3363
nop
RET3363:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3364
nop

TARGET3552:
ba RET3552
nop


P3364: !_PREFETCH [19] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

P3365: !_ST [26] (maybe <- 0x3000010) (Int) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3365
nop
RET3365:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3366: !_REPLACEMENT [23] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+32], %l7
st %l7, [%i2+32]
add %i2, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]
add %l6, %l3, %l6
ld [%l6+32], %l7
st %l7, [%l6+32]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3366
nop
RET3366:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3367: !_REPLACEMENT [17] (Int)
sethi %hi(0x2000), %l3
ld [%i2+96], %l7
st %l7, [%i2+96]
add %i2, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]
add %l6, %l3, %l6
ld [%l6+96], %l7
st %l7, [%l6+96]

P3368: !_MEMBAR (FP)

P3369: !_BST [12] (maybe <- 0x428000ef) (FP) (Branch target of P2906)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P3370
nop

TARGET2906:
ba RET2906
nop


P3370: !_MEMBAR (FP)

P3371: !_BSTC [19] (maybe <- 0x428000f2) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P3372: !_MEMBAR (FP)
membar #StoreLoad

P3373: !_PREFETCH [16] (Int) (Secondary ctx) (Branch target of P2677)
wr %g0, 0x81, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 16] %asi, 1
ba P3374
nop

TARGET2677:
ba RET2677
nop


P3374: !_PREFETCH [19] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i2 + 0] %asi, 1

P3375: !_MEMBAR (FP)

P3376: !_BST [29] (maybe <- 0x428000f3) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P3377: !_MEMBAR (FP) (Branch target of P3110)
membar #StoreLoad
ba P3378
nop

TARGET3110:
ba RET3110
nop


P3378: !_ST [3] (maybe <- 0x428000f4) (FP) (Secondary ctx) (Branch target of P3543)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 16 ] %asi
ba P3379
nop

TARGET3543:
ba RET3543
nop


P3379: !_REPLACEMENT [9] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+32], %l6
st %l6, [%i3+32]
add %i3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P3380: !_REPLACEMENT [13] (Int) (CBR)
sethi %hi(0x2000), %l7
ld [%i3+32], %l3
st %l3, [%i3+32]
add %i3, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3380
nop
RET3380:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3381: !_MEMBAR (FP)
membar #StoreLoad

P3382: !_BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f6
fmovd %f40, %f8

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3382
nop
RET3382:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3383: !_MEMBAR (FP) (Branch target of P2929)
ba P3384
nop

TARGET2929:
ba RET2929
nop


P3384: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P3385: !_MEMBAR (FP)

P3386: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P3387: !_MEMBAR (FP)

P3388: !_BLD [7] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3389: !_MEMBAR (FP)

P3390: !_BLD [7] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

P3391: !_MEMBAR (FP)

P3392: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P3393: !_MEMBAR (FP)

P3394: !_BLD [2] (FP) (Branch target of P3564)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4
ba P3395
nop

TARGET3564:
ba RET3564
nop


P3395: !_MEMBAR (FP) (Loop exit)
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovs %f4, %f30
!--
loop_exit_6_2:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_6_2
nop

P3396: !_MEMBAR (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_6_3:

P3397: !_BSTC [32] (maybe <- 0x428000f5) (FP) (CBR) (Branch target of P3589)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3397
nop
RET3397:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3398
nop

TARGET3589:
ba RET3589
nop


P3398: !_MEMBAR (FP)

P3399: !_BST [17] (maybe <- 0x428000f6) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P3400: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3400
nop
RET3400:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3401: !_BSTC [20] (maybe <- 0x428000f7) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi

P3402: !_MEMBAR (FP)
membar #StoreLoad

P3403: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f0
membar #Sync
! 1 addresses covered

P3404: !_MEMBAR (FP)

P3405: !_BLD [0] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f18, %f3
fmovd %f36, %f4
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3405
nop
RET3405:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3406: !_MEMBAR (FP) (Secondary ctx) (Branch target of P3171)
ba P3407
nop

TARGET3171:
ba RET3171
nop


P3407: !_BLD [29] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3407
nop
RET3407:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3408: !_MEMBAR (FP)

P3409: !_ST [1] (maybe <- 0x3000011) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3410: !_ST [1] (maybe <- 0x3000012) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
stwa   %l4, [%i0 + 4] %asi
add   %l4, 1, %l4

P3411: !_REPLACEMENT [26] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+128], %l6
st %l6, [%i3+128]
add %i3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]
add %l3, %o5, %l3
ld [%l3+128], %l6
st %l6, [%l3+128]

P3412: !_MEMBAR (FP) (Branch target of P3417)
membar #StoreLoad
ba P3413
nop

TARGET3417:
ba RET3417
nop


P3413: !_BLD [11] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3414: !_MEMBAR (FP) (Branch target of P3344)
ba P3415
nop

TARGET3344:
ba RET3344
nop


P3415: !_BST [15] (maybe <- 0x428000f8) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P3416: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3416
nop
RET3416:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3417: !_BSTC [33] (maybe <- 0x428000f9) (FP) (CBR) (Branch target of P2788)
wr %g0, 0xe0, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3417
nop
RET3417:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3418
nop

TARGET2788:
ba RET2788
nop


P3418: !_MEMBAR (FP) (Branch target of P3089)
ba P3419
nop

TARGET3089:
ba RET3089
nop


P3419: !_BSTC [9] (maybe <- 0x428000fa) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P3420: !_MEMBAR (FP)
membar #StoreLoad

P3421: !_LD [9] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i1 + 32] %asi, %f10
! 1 addresses covered

P3422: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3422
nop
RET3422:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3423: !_BST [16] (maybe <- 0x428000fc) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3423
nop
RET3423:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3424: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3424
nop
RET3424:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3425: !_ST [0] (maybe <- 0x428000fd) (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 0 ] %asi

P3426: !_REPLACEMENT [31] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+192], %l3
st %l3, [%i3+192]
add %i3, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]
add %o5, %l7, %o5
ld [%o5+192], %l3
st %l3, [%o5+192]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3426
nop
RET3426:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3427: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3427
nop
RET3427:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3428: !_BSTC [21] (maybe <- 0x428000fe) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P3429: !_MEMBAR (FP) (Branch target of P3016)
membar #StoreLoad
ba P3430
nop

TARGET3016:
ba RET3016
nop


P3430: !_BLD [10] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3431: !_MEMBAR (FP) (Branch target of P2958)
ba P3432
nop

TARGET2958:
ba RET2958
nop


P3432: !_BLD [13] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f12
fmovd %f40, %f14

P3433: !_MEMBAR (FP) (CBR) (Branch target of P3437)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3433
nop
RET3433:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P3434
nop

TARGET3437:
ba RET3437
nop


P3434: !_ST [25] (maybe <- 0x42800101) (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 96 ] %asi

P3435: !_LD [21] (Int)
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3436: !_MEMBAR (FP)

P3437: !_BST [22] (maybe <- 0x42800102) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3437
nop
RET3437:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3438: !_MEMBAR (FP) (Branch target of P3161)
membar #StoreLoad
ba P3439
nop

TARGET3161:
ba RET3161
nop


P3439: !_BLD [19] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P3440: !_MEMBAR (FP) (Branch target of P3066)
ba P3441
nop

TARGET3066:
ba RET3066
nop


P3441: !_PREFETCH [23] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetcha [%i3 + 32] %asi, 1

P3442: !_PREFETCH [16] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 16], 1

P3443: !_MEMBAR (FP)

P3444: !_BST [23] (maybe <- 0x42800105) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3445: !_MEMBAR (FP)

P3446: !_BST [1] (maybe <- 0x42800108) (FP) (CBR) (Branch target of P3212)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3446
nop
RET3446:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P3447
nop

TARGET3212:
ba RET3212
nop


P3447: !_MEMBAR (FP) (Branch target of P3243)
membar #StoreLoad
ba P3448
nop

TARGET3243:
ba RET3243
nop


P3448: !_REPLACEMENT [11] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P3449: !_LD [3] (FP) (Branch target of P3217)
ld [%i0 + 16], %f0
! 1 addresses covered
ba P3450
nop

TARGET3217:
ba RET3217
nop


P3450: !_ST [28] (maybe <- 0x3000013) (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P3451: !_LD [8] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 0] %asi, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P3452: !_ST [6] (maybe <- 0x4280010d) (FP) (Secondary ctx) (Branch target of P3416)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i0 + 96 ] %asi
ba P3453
nop

TARGET3416:
ba RET3416
nop


P3453: !_REPLACEMENT [6] (Int) (CBR)
sethi %hi(0x2000), %l7
ld [%i3+96], %l3
st %l3, [%i3+96]
add %i3, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3453
nop
RET3453:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3454: !_REPLACEMENT [1] (Int) (Branch target of P3587)
sethi %hi(0x2000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
ba P3455
nop

TARGET3587:
ba RET3587
nop


P3455: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3455
nop
RET3455:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3456: !_BSTC [4] (maybe <- 0x4280010e) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P3457: !_MEMBAR (FP)
membar #StoreLoad

P3458: !_BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovd %f40, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3458
nop
RET3458:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3459: !_MEMBAR (FP) (Branch target of P2647)
ba P3460
nop

TARGET2647:
ba RET2647
nop


P3460: !_ST [17] (maybe <- 0x3000014) (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 96] %asi
add   %l4, 1, %l4

P3461: !_ST [32] (maybe <- 0x42800113) (FP) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 256 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3461
nop
RET3461:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3462: !_REPLACEMENT [17] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+96], %o5
st %o5, [%i2+96]
add %i2, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]
add %l7, %l6, %l7
ld [%l7+96], %o5
st %o5, [%l7+96]

P3463: !_MEMBAR (FP) (Branch target of P2641)
ba P3464
nop

TARGET2641:
ba RET2641
nop


P3464: !_BSTC [13] (maybe <- 0x42800114) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3464
nop
RET3464:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3465: !_MEMBAR (FP)

P3466: !_BSTC [11] (maybe <- 0x42800117) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3467: !_MEMBAR (FP)

P3468: !_BSTC [12] (maybe <- 0x4280011a) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3469: !_MEMBAR (FP) (Branch target of P2667)
membar #StoreLoad
ba P3470
nop

TARGET2667:
ba RET2667
nop


P3470: !_LD [30] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3471: !_LD [26] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3472: !_MEMBAR (FP)
membar #StoreLoad

P3473: !_BLD [23] (FP) (Branch target of P2927)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5
ba P3474
nop

TARGET2927:
ba RET2927
nop


P3474: !_MEMBAR (FP)

P3475: !_BSTC [11] (maybe <- 0x4280011d) (FP) (CBR)
wr %g0, 0xe0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3475
nop
RET3475:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3476: !_MEMBAR (FP) (Branch target of P2718)
ba P3477
nop

TARGET2718:
ba RET2718
nop


P3477: !_BST [7] (maybe <- 0x42800120) (FP) (CBR) (Secondary ctx) (Branch target of P2686)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3477
nop
RET3477:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3478
nop

TARGET2686:
ba RET2686
nop


P3478: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P3479: !_BLD [13] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f6
fmovd %f40, %f8

P3480: !_MEMBAR (FP) (Secondary ctx)

P3481: !_REPLACEMENT [13] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+32], %l3
st %l3, [%i3+32]
add %i3, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3481
nop
RET3481:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3482: !_MEMBAR (FP)

P3483: !_BST [22] (maybe <- 0x42800121) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P3484: !_MEMBAR (FP)
membar #StoreLoad

P3485: !_REPLACEMENT [7] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(0x2000), %l6
ld [%i3+128], %o5
st %o5, [%i3+128]
add %i3, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]
add %l7, %l6, %l7
ld [%l7+128], %o5
st %o5, [%l7+128]

P3486: !_ST [24] (maybe <- 0x42800124) (FP) (CBR) (Branch target of P3247)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3486
nop
RET3486:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3487
nop

TARGET3247:
ba RET3247
nop


P3487: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P3488: !_BLD [25] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovd %f40, %f10

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3488
nop
RET3488:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3489: !_MEMBAR (FP) (Secondary ctx)

P3490: !_REPLACEMENT [8] (Int) (CBR)
sethi %hi(0x2000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3490
nop
RET3490:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3491: !_LD [3] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i0 + 16] %asi, %f11
! 1 addresses covered

P3492: !_REPLACEMENT [28] (Int)
sethi %hi(0x2000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P3493: !_REPLACEMENT [10] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P3494: !_PREFETCH [10] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
prefetcha [%i1 + 64] %asi, 1

P3495: !_MEMBAR (FP) (Secondary ctx)

P3496: !_BSTC [21] (maybe <- 0x42800125) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P3497: !_MEMBAR (FP) (Secondary ctx)

P3498: !_BST [15] (maybe <- 0x42800128) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P3499: !_MEMBAR (FP)
membar #StoreLoad

P3500: !_BLD [19] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

P3501: !_MEMBAR (FP)

P3502: !_ST [30] (maybe <- 0x42800129) (FP) (CBR)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3502
nop
RET3502:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3503: !_ST [2] (maybe <- 0x3000015) (Int)
stw   %l4, [%i0 + 8 ]
add   %l4, 1, %l4

P3504: !_MEMBAR (FP)

P3505: !_BST [12] (maybe <- 0x4280012a) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P3506: !_MEMBAR (FP)
membar #StoreLoad

P3507: !_MEMBAR (Int) (Branch target of P2792)
ba P3508
nop

TARGET2792:
ba RET2792
nop


P3508: !_BST [10] (maybe <- 0x4280012d) (FP) (Branch target of P3173)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i1 + 64 ] %asi
ba P3509
nop

TARGET3173:
ba RET3173
nop


P3509: !_MEMBAR (FP)
membar #StoreLoad

P3510: !_ST [4] (maybe <- 0x3000016) (Int) (CBR)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3510
nop
RET3510:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3511: !_MEMBAR (FP)

P3512: !_BST [22] (maybe <- 0x4280012e) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3513: !_MEMBAR (FP)

P3514: !_BST [15] (maybe <- 0x42800131) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P3515: !_MEMBAR (FP)

P3516: !_BST [32] (maybe <- 0x42800132) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi

P3517: !_MEMBAR (FP) (Branch target of P2658)
membar #StoreLoad
ba P3518
nop

TARGET2658:
ba RET2658
nop


P3518: !_BLD [10] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3519: !_MEMBAR (FP)

P3520: !_LD [20] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3521: !_REPLACEMENT [27] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+160], %o5
st %o5, [%i2+160]
add %i2, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]

P3522: !_REPLACEMENT [33] (Int) (CBR) (Branch target of P2729)
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3522
nop
RET3522:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3523
nop

TARGET2729:
ba RET2729
nop


P3523: !_REPLACEMENT [19] (Int) (CBR)
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3523
nop
RET3523:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3524: !_MEMBAR (FP)

P3525: !_BST [17] (maybe <- 0x42800133) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi

P3526: !_MEMBAR (FP)

P3527: !_BSTC [25] (maybe <- 0x42800134) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P3528: !_MEMBAR (FP) (Secondary ctx) (Branch target of P2776)
membar #StoreLoad
ba P3529
nop

TARGET2776:
ba RET2776
nop


P3529: !_REPLACEMENT [25] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+96], %l3
st %l3, [%i3+96]
add %i3, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3529
nop
RET3529:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3530: !_PREFETCH [6] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
prefetcha [%i0 + 96] %asi, 1

P3531: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P3532: !_BLD [1] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f34, %f0
fmovd %f36, %f18
fmovs %f18, %f1
fmovd %f40, %f2

P3533: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3533
nop
RET3533:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3534: !_ST [22] (maybe <- 0x3000017) (Int)
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4

P3535: !_MEMBAR (FP)

P3536: !_BST [28] (maybe <- 0x42800136) (FP) (CBR) (Branch target of P3310)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3536
nop
RET3536:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3537
nop

TARGET3310:
ba RET3310
nop


P3537: !_MEMBAR (FP)
membar #StoreLoad

P3538: !_LD [28] (Int)
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3539: !_MEMBAR (FP)

P3540: !_BST [12] (maybe <- 0x42800137) (FP) (Branch target of P3486)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P3541
nop

TARGET3486:
ba RET3486
nop


P3541: !_MEMBAR (FP) (Branch target of P2870)
membar #StoreLoad
ba P3542
nop

TARGET2870:
ba RET2870
nop


P3542: !_BLD [25] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovd %f40, %f4

P3543: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3543
nop
RET3543:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3544: !_LD [19] (FP)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 0], %f5
! 1 addresses covered

P3545: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3545
nop
RET3545:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3546: !_BST [7] (maybe <- 0x4280013a) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

P3547: !_MEMBAR (FP) (CBR) (Branch target of P3633)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3547
nop
RET3547:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P3548
nop

TARGET3633:
ba RET3633
nop


P3548: !_BSTC [22] (maybe <- 0x4280013b) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P3549: !_MEMBAR (FP)
membar #StoreLoad

P3550: !_LD [31] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3551: !_MEMBAR (FP)
membar #StoreLoad

P3552: !_BLD [16] (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3552
nop
RET3552:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3553: !_MEMBAR (FP)

P3554: !_BSTC [32] (maybe <- 0x4280013e) (FP) (Branch target of P3080)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 256 ] %asi
ba P3555
nop

TARGET3080:
ba RET3080
nop


P3555: !_MEMBAR (FP) (Branch target of P3622)
membar #StoreLoad
ba P3556
nop

TARGET3622:
ba RET3622
nop


P3556: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3557: !_MEMBAR (FP) (Branch target of P2784)
ba P3558
nop

TARGET2784:
ba RET2784
nop


P3558: !_BST [23] (maybe <- 0x4280013f) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

P3559: !_MEMBAR (FP)
membar #StoreLoad

P3560: !_BLD [25] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f8
fmovd %f40, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3560
nop
RET3560:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3561: !_MEMBAR (FP)

P3562: !_LD [16] (Int)
lduw [%i3 + 16], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P3563: !_PREFETCH [26] (Int) (Nucleus ctx) (Branch target of P2745)
wr %g0, 0x4, %asi
prefetcha [%i2 + 128] %asi, 1
ba P3564
nop

TARGET2745:
ba RET2745
nop


P3564: !_LD [14] (FP) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 64], %f10
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3564
nop
RET3564:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3565: !_ST [9] (maybe <- 0x42800142) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 32 ]

P3566: !_REPLACEMENT [3] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+16], %l7
st %l7, [%i2+16]
add %i2, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]

P3567: !_PREFETCH [4] (Int)
prefetch [%i0 + 32], 1

P3568: !_MEMBAR (FP)

P3569: !_BSTC [15] (maybe <- 0x42800143) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P3570: !_MEMBAR (FP)
membar #StoreLoad

P3571: !_REPLACEMENT [19] (Int)
sethi %hi(0x2000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P3572: !_LD [8] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 0] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3573: !_REPLACEMENT [21] (Int)
sethi %hi(0x2000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P3574: !_MEMBAR (FP)
membar #StoreLoad

P3575: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3576: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3576
nop
RET3576:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3577: !_BLD [27] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P3578: !_MEMBAR (FP)

P3579: !_FLUSHI [11] (Int)
flush %g0 

P3580: !_MEMBAR (FP)

P3581: !_BST [22] (maybe <- 0x42800144) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3581
nop
RET3581:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3582: !_MEMBAR (FP)
membar #StoreLoad

P3583: !_BLD [30] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

P3584: !_MEMBAR (FP) (Secondary ctx)

P3585: !_BLD [31] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 192] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P3586: !_MEMBAR (FP)

P3587: !_BST [16] (maybe <- 0x42800147) (FP) (CBR)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3587
nop
RET3587:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3588: !_MEMBAR (FP)
membar #StoreLoad

P3589: !_LD [5] (Int) (CBR)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3589
nop
RET3589:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3590: !_PREFETCH [23] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
prefetcha [%i2 + 32] %asi, 1

P3591: !_REPLACEMENT [0] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P3592: !_LD [18] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3593: !_ST [0] (maybe <- 0x3000018) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3594: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P3595: !_BLD [23] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f0
membar #Sync
! 3 addresses covered
fmovd %f8, %f2

P3596: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P3085)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3596
nop
RET3596:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P3597
nop

TARGET3085:
ba RET3085
nop


P3597: !_BST [4] (maybe <- 0x42800148) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P3598: !_MEMBAR (FP)
membar #StoreLoad

P3599: !_ST [28] (maybe <- 0x4280014d) (FP) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 0 ] %asi

P3600: !_MEMBAR (FP)
membar #StoreLoad

P3601: !_BLD [23] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3602: !_MEMBAR (FP)

P3603: !_BST [26] (maybe <- 0x4280014e) (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3603
nop
RET3603:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3604: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3604
nop
RET3604:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3605: !_PREFETCH [24] (Int)
prefetch [%i3 + 64], 1

P3606: !_LD [6] (Int)
lduw [%i0 + 96], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P3607: !_ST [27] (maybe <- 0x3000019) (Int)
stw   %l4, [%i3 + 160 ]
add   %l4, 1, %l4

P3608: !_MEMBAR (FP)

P3609: !_BSTC [23] (maybe <- 0x42800150) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3610: !_MEMBAR (FP)
membar #StoreLoad

P3611: !_ST [19] (maybe <- 0x42800153) (FP) (Branch target of P3216)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]
ba P3612
nop

TARGET3216:
ba RET3216
nop


P3612: !_MEMBAR (FP)
membar #StoreLoad

P3613: !_BLD [9] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P3614: !_MEMBAR (FP)

P3615: !_ST [27] (maybe <- 0x42800154) (FP) (Secondary ctx) (Branch target of P3604)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 160 ] %asi
ba P3616
nop

TARGET3604:
ba RET3604
nop


P3616: !_REPLACEMENT [5] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+64], %l7
st %l7, [%i3+64]
add %i3, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]
add %l6, %l3, %l6
ld [%l6+64], %l7
st %l7, [%l6+64]

P3617: !_REPLACEMENT [1] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P3618: !_ST [28] (maybe <- 0x300001a) (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P3619: !_ST [4] (maybe <- 0x42800155) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P3620: !_ST [26] (maybe <- 0x300001b) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3621: !_MEMBAR (FP) (Secondary ctx)

P3622: !_BSTC [2] (maybe <- 0x42800156) (FP) (CBR) (Secondary ctx) (Branch target of P2813)
wr %g0, 0xe1, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3622
nop
RET3622:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P3623
nop

TARGET2813:
ba RET2813
nop


P3623: !_MEMBAR (FP) (Secondary ctx)
membar #StoreLoad

P3624: !_REPLACEMENT [1] (Int) (Secondary ctx) (Branch target of P3581)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
ba P3625
nop

TARGET3581:
ba RET3581
nop


P3625: !_REPLACEMENT [17] (Int)
sethi %hi(0x2000), %l7
ld [%i2+96], %l3
st %l3, [%i2+96]
add %i2, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]
add %o5, %l7, %o5
ld [%o5+96], %l3
st %l3, [%o5+96]

P3626: !_MEMBAR (FP) (CBR) (Secondary ctx)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3626
nop
RET3626:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3627: !_BLD [16] (FP) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f8

P3628: !_MEMBAR (FP) (Secondary ctx)

P3629: !_BLD [7] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3630: !_MEMBAR (FP)

P3631: !_BST [1] (maybe <- 0x4280015b) (FP) (CBR) (Branch target of P3198)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3631
nop
RET3631:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3632
nop

TARGET3198:
ba RET3198
nop


P3632: !_MEMBAR (FP)
membar #StoreLoad

P3633: !_REPLACEMENT [8] (Int) (CBR)
sethi %hi(0x2000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3633
nop
RET3633:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3634: !_REPLACEMENT [15] (Int) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l7
ld [%i2+128], %l3
st %l3, [%i2+128]
add %i2, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3634
nop
RET3634:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3635: !_REPLACEMENT [12] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %l7
ld [%i2+4], %l3
st %l3, [%i2+4]
add %i2, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P3636: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3636
nop
RET3636:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3637: !_BLD [9] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3638: !_MEMBAR (FP) (Loop exit) (Branch target of P2765)
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
!--
loop_exit_6_3:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_6_3
nop
ba P3639
nop

TARGET2765:
ba RET2765
nop


P3639: !_MEMBAR (Int)
membar #StoreLoad

END_NODES6: ! Test instruction sequence for CPU 6 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
stw %o5, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func7:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%i5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x07deade1), %l7
or    %l7, %lo(0x07deade1), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x3800001), %l4
or    %l4, %lo(0x3800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x43000001), %l7
or    %l7, %lo(0x43000001), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x37800000), %l7
or    %l7, %lo(0x37800000), %l7
stw %l7, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x3c21^4
sethi %hi(0x3c21), %l0
or    %l0, %lo(0x3c21), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES7: ! Test instruction sequence for ISTREAM 7 begins

P3640: !_REPLACEMENT [27] (Int) (Loop entry)
sethi %hi(0x5), %l2
or %l2, %lo(0x5),  %l2
loop_entry_7_0:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+160], %l6
st %l6, [%i2+160]
add %i2, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]
add %l3, %o5, %l3
ld [%l3+160], %l6
st %l6, [%l3+160]

P3641: !_LD [16] (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 16], %f0
! 1 addresses covered

P3642: !_ST [9] (maybe <- 0x43000001) (FP) (CBR)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 32 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3642
nop
RET3642:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3643: !_ST [25] (maybe <- 0x43000002) (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
sta   %f20, [%i2 + 96 ] %asi

P3644: !_PREFETCH [22] (Int)
prefetch [%i2 + 4], 1

P3645: !_LD [24] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3646: !_PREFETCH [2] (Int) (LE) (CBR) (Secondary ctx)
wr %g0, 0x89, %asi
prefetcha [%i0 + 8] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3646
nop
RET3646:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3647: !_MEMBAR (FP)
membar #StoreLoad

P3648: !_BLD [30] (FP) (Branch target of P3794)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P3649
nop

TARGET3794:
ba RET3794
nop


P3649: !_MEMBAR (FP) (Branch target of P3707)
ba P3650
nop

TARGET3707:
ba RET3707
nop


P3650: !_PREFETCH [12] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 4], 1

P3651: !_MEMBAR (FP)

P3652: !_BST [31] (maybe <- 0x43000003) (FP) (Branch target of P3660)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 192 ] %asi
ba P3653
nop

TARGET3660:
ba RET3660
nop


P3653: !_MEMBAR (FP) (Branch target of P3776)
membar #StoreLoad
ba P3654
nop

TARGET3776:
ba RET3776
nop


P3654: !_REPLACEMENT [4] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %o5
ld [%i3+32], %l6
st %l6, [%i3+32]
add %i3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P3655: !_MEMBAR (FP)
membar #StoreLoad

P3656: !_BLD [2] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f2
fmovd %f34, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P3657: !_MEMBAR (FP) (Branch target of P3676)
ba P3658
nop

TARGET3676:
ba RET3676
nop


P3658: !_BST [4] (maybe <- 0x43000004) (FP) (Branch target of P3710)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi
ba P3659
nop

TARGET3710:
ba RET3710
nop


P3659: !_MEMBAR (FP)

P3660: !_BST [7] (maybe <- 0x43000009) (FP) (CBR) (Branch target of P3787)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3660
nop
RET3660:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P3661
nop

TARGET3787:
ba RET3787
nop


P3661: !_MEMBAR (FP)
membar #StoreLoad

P3662: !_PREFETCH [22] (Int) (Branch target of P3739)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 4], 1
ba P3663
nop

TARGET3739:
ba RET3739
nop


P3663: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3663
nop
RET3663:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3664: !_BLD [15] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3665: !_MEMBAR (FP)

P3666: !_BSTC [30] (maybe <- 0x4300000a) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P3667: !_MEMBAR (FP)
membar #StoreLoad

P3668: !_BLD [31] (FP) (Branch target of P3646)
wr %g0, 0xf0, %asi
ldda [%i2 + 192] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f8
ba P3669
nop

TARGET3646:
ba RET3646
nop


P3669: !_MEMBAR (FP)

P3670: !_ST [4] (maybe <- 0x3800001) (Int) (Branch target of P3681)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4
ba P3671
nop

TARGET3681:
ba RET3681
nop


P3671: !_LD [9] (FP) (CBR) (Secondary ctx)
wr %g0, 0x81, %asi
lda    [%i1 + 32] %asi, %f9
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3671
nop
RET3671:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3672: !_ST [10] (maybe <- 0x3800002) (Int)
stw   %l4, [%i1 + 64 ]
add   %l4, 1, %l4

P3673: !_REPLACEMENT [31] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+192], %l7
st %l7, [%i3+192]
add %i3, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]
add %l6, %l3, %l6
ld [%l6+192], %l7
st %l7, [%l6+192]

P3674: !_REPLACEMENT [28] (Int)
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P3675: !_MEMBAR (FP)
membar #StoreLoad

P3676: !_BLD [18] (FP) (CBR) (Branch target of P3671)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f10

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3676
nop
RET3676:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P3677
nop

TARGET3671:
ba RET3671
nop


P3677: !_MEMBAR (FP)

P3678: !_LD [25] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lda    [%i3 + 96] %asi, %f11
! 1 addresses covered

P3679: !_REPLACEMENT [14] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+64], %l6
st %l6, [%i2+64]
add %i2, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

P3680: !_MEMBAR (FP)
membar #StoreLoad

P3681: !_BLD [3] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f12
fmovd %f34, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3681
nop
RET3681:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3682: !_MEMBAR (FP) (Branch target of P3722)
ba P3683
nop

TARGET3722:
ba RET3722
nop


P3683: !_REPLACEMENT [4] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(0x2000), %o5
ld [%i2+32], %l6
st %l6, [%i2+32]
add %i2, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]
add %l3, %o5, %l3
ld [%l3+32], %l6
st %l6, [%l3+32]

P3684: !_LD [16] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 16], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P3685: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3685
nop
RET3685:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3686: !_BLD [2] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f18, %f3
fmovd %f36, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3687: !_MEMBAR (FP)

P3688: !_BLD [20] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f6

P3689: !_MEMBAR (FP)

P3690: !_BSTC [26] (maybe <- 0x4300000b) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 128 ] %asi

P3691: !_MEMBAR (FP) (Secondary ctx)

P3692: !_BST [25] (maybe <- 0x4300000d) (FP) (Branch target of P3696)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 64 ] %asi
ba P3693
nop

TARGET3696:
ba RET3696
nop


P3693: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3693
nop
RET3693:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3694: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3695: !_MEMBAR (FP)

P3696: !_BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f8
fmovd %f34, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovd %f40, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3696
nop
RET3696:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3697: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3697
nop
RET3697:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3698: !_PREFETCH [9] (Int) (Branch target of P3757)
prefetch [%i1 + 32], 1
ba P3699
nop

TARGET3757:
ba RET3757
nop


P3699: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3699
nop
RET3699:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3700: !_BLD [14] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3701: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3701
nop
RET3701:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3702: !_BST [30] (maybe <- 0x4300000f) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P3703: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3703
nop
RET3703:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3704: !_BLD [18] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

P3705: !_MEMBAR (FP)

P3706: !_ST [24] (maybe <- 0x3800003) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3707: !_PREFETCH [28] (Int) (CBR)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3707
nop
RET3707:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3708: !_MEMBAR (FP)
membar #StoreLoad

P3709: !_BLD [16] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P3710: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3710
nop
RET3710:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3711: !_BST [30] (maybe <- 0x43000010) (FP) (Branch target of P3765)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi
ba P3712
nop

TARGET3765:
ba RET3765
nop


P3712: !_MEMBAR (FP)
membar #StoreLoad

P3713: !_BLD [0] (FP) (Branch target of P3761)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4
ba P3714
nop

TARGET3761:
ba RET3761
nop


P3714: !_MEMBAR (FP)

P3715: !_REPLACEMENT [33] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3715
nop
RET3715:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3716: !_MEMBAR (FP) (Branch target of P3801)
membar #StoreLoad
ba P3717
nop

TARGET3801:
ba RET3801
nop


P3717: !_BLD [31] (FP) (Branch target of P3760)
wr %g0, 0xf0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 192] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
ba P3718
nop

TARGET3760:
ba RET3760
nop


P3718: !_MEMBAR (FP)

P3719: !_PREFETCH [6] (Int) (CBR)
prefetch [%i0 + 96], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3719
nop
RET3719:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3720: !_MEMBAR (FP)
membar #StoreLoad

P3721: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f6
fmovd %f34, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovd %f40, %f10

P3722: !_MEMBAR (FP) (CBR) (Branch target of P3835)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3722
nop
RET3722:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3723
nop

TARGET3835:
ba RET3835
nop


P3723: !_BLD [8] (FP)
wr %g0, 0xf0, %asi
ldda [%i1 + 0] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovd %f40, %f12

P3724: !_MEMBAR (FP) (Branch target of P3744)
ba P3725
nop

TARGET3744:
ba RET3744
nop


P3725: !_BLD [32] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 256] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3726: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3726
nop
RET3726:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3727: !_BSTC [7] (maybe <- 0x43000011) (FP) (Branch target of P3697)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi
ba P3728
nop

TARGET3697:
ba RET3697
nop


P3728: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3728
nop
RET3728:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3729: !_BLD [28] (FP)
wr %g0, 0xf0, %asi
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f14

P3730: !_MEMBAR (FP)

P3731: !_BSTC [3] (maybe <- 0x43000012) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P3732: !_MEMBAR (FP) (Branch target of P3771)
membar #StoreLoad
ba P3733
nop

TARGET3771:
ba RET3771
nop


P3733: !_BLD [6] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--
fmovd %f40, %f0

P3734: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3734
nop
RET3734:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3735: !_REPLACEMENT [29] (Int)
sethi %hi(0x2000), %o5
ld [%i2+64], %l6
st %l6, [%i2+64]
add %i2, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]
add %l3, %o5, %l3
ld [%l3+64], %l6
st %l6, [%l3+64]

P3736: !_REPLACEMENT [30] (Int)
sethi %hi(0x2000), %l7
ld [%i2+128], %l3
st %l3, [%i2+128]
add %i2, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]
add %o5, %l7, %o5
ld [%o5+128], %l3
st %l3, [%o5+128]

P3737: !_MEMBAR (FP) (Branch target of P3841)
membar #StoreLoad
ba P3738
nop

TARGET3841:
ba RET3841
nop


P3738: !_BLD [19] (FP) (Branch target of P3752)
wr %g0, 0xf0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P3739
nop

TARGET3752:
ba RET3752
nop


P3739: !_MEMBAR (FP) (CBR) (Branch target of P3726)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3739
nop
RET3739:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3740
nop

TARGET3726:
ba RET3726
nop


P3740: !_LD [26] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lda    [%i3 + 128] %asi, %f2
! 1 addresses covered

P3741: !_ST [19] (maybe <- 0x43000017) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]

P3742: !_MEMBAR (FP) (CBR) (Secondary ctx) (Branch target of P3743)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3742
nop
RET3742:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3743
nop

TARGET3743:
ba RET3743
nop


P3743: !_BLD [24] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
ldda [%i3 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovd %f40, %f4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3743
nop
RET3743:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3744: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3744
nop
RET3744:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3745: !_ST [5] (maybe <- 0x43000018) (FP) (Branch target of P3719)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]
ba P3746
nop

TARGET3719:
ba RET3719
nop


P3746: !_MEMBAR (FP) (Branch target of P3813)
membar #StoreLoad
ba P3747
nop

TARGET3813:
ba RET3813
nop


P3747: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f18, %f7
fmovd %f36, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3748: !_MEMBAR (FP)

P3749: !_ST [21] (maybe <- 0x3800004) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3750: !_MEMBAR (FP)
membar #StoreLoad

P3751: !_BLD [0] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f10
fmovd %f34, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P3752: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3752
nop
RET3752:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3753: !_BSTC [18] (maybe <- 0x43000019) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 128 ] %asi

P3754: !_MEMBAR (FP)
membar #StoreLoad

P3755: !_BLD [15] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P3756: !_MEMBAR (FP)

P3757: !_BST [17] (maybe <- 0x4300001a) (FP) (CBR) (Branch target of P3642)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3757
nop
RET3757:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3758
nop

TARGET3642:
ba RET3642
nop


P3758: !_MEMBAR (FP)
membar #StoreLoad

P3759: !_PREFETCH [14] (Int) (Branch target of P3685)
prefetch [%i3 + 64], 1
ba P3760
nop

TARGET3685:
ba RET3685
nop


P3760: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3760
nop
RET3760:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3761: !_BST [4] (maybe <- 0x4300001b) (FP) (CBR)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3761
nop
RET3761:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3762: !_MEMBAR (FP)
membar #StoreLoad

P3763: !_REPLACEMENT [22] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P3764: !_MEMBAR (FP)
membar #StoreLoad

P3765: !_BLD [3] (FP) (CBR)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f0
membar #Sync
! 5 addresses covered
fmovs %f4, %f3
fmovd %f8, %f4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3765
nop
RET3765:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3766: !_MEMBAR (FP)

P3767: !_ST [11] (maybe <- 0x3800005) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
stwa   %l4, [%i3 + 0] %asi
add   %l4, 1, %l4

P3768: !_MEMBAR (FP)

P3769: !_BSTC [20] (maybe <- 0x43000020) (FP) (Branch target of P3693)
wr %g0, 0xe0, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 256 ] %asi
ba P3770
nop

TARGET3693:
ba RET3693
nop


P3770: !_MEMBAR (FP)
membar #StoreLoad

P3771: !_BLD [17] (FP) (CBR) (Secondary ctx)
wr %g0, 0xf1, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 64] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3771
nop
RET3771:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3772: !_MEMBAR (FP) (Secondary ctx) (Branch target of P3831)
ba P3773
nop

TARGET3831:
ba RET3831
nop


P3773: !_REPLACEMENT [22] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P3774: !_REPLACEMENT [27] (Int)
sethi %hi(0x2000), %l6
ld [%i3+160], %o5
st %o5, [%i3+160]
add %i3, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]
add %l7, %l6, %l7
ld [%l7+160], %o5
st %o5, [%l7+160]

P3775: !_ST [28] (maybe <- 0x43000021) (FP)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]

P3776: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3776
nop
RET3776:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3777: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f32
membar #Sync
! 2 addresses covered
fmovd %f32, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P3778: !_MEMBAR (FP)

P3779: !_BST [29] (maybe <- 0x43000022) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P3780: !_MEMBAR (FP)

P3781: !_BST [9] (maybe <- 0x43000023) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i1 + 0 ] %asi

P3782: !_MEMBAR (FP)
membar #StoreLoad

P3783: !_LD [32] (FP)
ld [%i2 + 256], %f8
! 1 addresses covered

P3784: !_LD [16] (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 16], %f9
! 1 addresses covered

P3785: !_MEMBAR (FP) (Secondary ctx)

P3786: !_BSTC [24] (maybe <- 0x43000025) (FP) (Secondary ctx)
wr %g0, 0xe1, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P3787: !_MEMBAR (FP) (CBR) (Secondary ctx)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3787
nop
RET3787:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3788: !_BST [16] (maybe <- 0x43000027) (FP) (Branch target of P3703)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f36 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync
stda %f32, [%i3 + 0 ] %asi
ba P3789
nop

TARGET3703:
ba RET3703
nop


P3789: !_MEMBAR (FP)
membar #StoreLoad

P3790: !_ST [12] (maybe <- 0x3800006) (Int) (CBR) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stwa   %l4, [%i3 + 4] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3790
nop
RET3790:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3791: !_ST [19] (maybe <- 0x43000028) (FP) (Branch target of P3663)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]
ba P3792
nop

TARGET3663:
ba RET3663
nop


P3792: !_REPLACEMENT [27] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l3
ld [%i3+160], %l7
st %l7, [%i3+160]
add %i3, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]
add %l6, %l3, %l6
ld [%l6+160], %l7
st %l7, [%l6+160]

P3793: !_LD [28] (FP) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lda    [%i2 + 0] %asi, %f10
! 1 addresses covered

P3794: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3794
nop
RET3794:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3795: !_BSTC [7] (maybe <- 0x43000029) (FP) (Branch target of P3699)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i0 + 128 ] %asi
ba P3796
nop

TARGET3699:
ba RET3699
nop


P3796: !_MEMBAR (FP) (Branch target of P3734)
membar #StoreLoad
ba P3797
nop

TARGET3734:
ba RET3734
nop


P3797: !_BLD [16] (FP) (Branch target of P3728)
wr %g0, 0xf0, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldda [%i3 + 0] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f36, %f18
fmovs %f18, %f11
ba P3798
nop

TARGET3728:
ba RET3728
nop


P3798: !_MEMBAR (FP)

P3799: !_ST [24] (maybe <- 0x3800007) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stwa   %l4, [%i2 + 64] %asi
add   %l4, 1, %l4

P3800: !_REPLACEMENT [13] (Int) (Secondary ctx)
wr %g0, 0x81, %asi
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x2000), %l7
ld [%i3+32], %l3
st %l3, [%i3+32]
add %i3, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]
add %o5, %l7, %o5
ld [%o5+32], %l3
st %l3, [%o5+32]

P3801: !_ST [5] (maybe <- 0x4300002a) (FP) (CBR)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3801
nop
RET3801:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3802: !_MEMBAR (FP)
membar #StoreLoad

P3803: !_BLD [7] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 128] %asi, %f32
membar #Sync
! 1 addresses covered
fmovd %f32, %f12

P3804: !_MEMBAR (FP)

P3805: !_BLD [23] (FP)
wr %g0, 0xf0, %asi
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P3806: !_MEMBAR (FP)

P3807: !_LD [17] (Int) (Nucleus ctx)
wr %g0, 0x4, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 96] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3808: !_REPLACEMENT [19] (Int) (Branch target of P3715)
sethi %hi(0x2000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
ba P3809
nop

TARGET3715:
ba RET3715
nop


P3809: !_LD [22] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P3810: !_IDC_FLIP [15] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
IDC_FLIP(3810, 15317, 7, 0x44000080, 0x80, %i2, 0x80, %l6, %l7, %o5, %l3)

P3811: !_ST [24] (maybe <- 0x3800008) (Int) (Secondary ctx)
wr %g0, 0x81, %asi
stwa   %l4, [%i3 + 64] %asi
add   %l4, 1, %l4

P3812: !_MEMBAR (FP) (Secondary ctx)

P3813: !_BSTC [28] (maybe <- 0x4300002b) (FP) (CBR) (Secondary ctx) (Branch target of P3815)
wr %g0, 0xe1, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i3 + 0 ] %asi

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3813
nop
RET3813:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3814
nop

TARGET3815:
ba RET3815
nop


P3814: !_MEMBAR (FP) (Secondary ctx) (Branch target of P3742)
membar #StoreLoad
ba P3815
nop

TARGET3742:
ba RET3742
nop


P3815: !_REPLACEMENT [16] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l3
ld [%i2+16], %l7
st %l7, [%i2+16]
add %i2, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]
add %l6, %l3, %l6
ld [%l6+16], %l7
st %l7, [%l6+16]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3815
nop
RET3815:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3816: !_IDC_FLIP [2] (Int)
IDC_FLIP(3816, 29419, 7, 0x43000008, 0x8, %i0, 0x8, %l6, %l7, %o5, %l3)

P3817: !_MEMBAR (FP)

P3818: !_BST [4] (maybe <- 0x4300002c) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P3819: !_MEMBAR (FP)
membar #StoreLoad

P3820: !_PREFETCH [20] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 256], 1

P3821: !_MEMBAR (FP)
membar #StoreLoad

P3822: !_BLD [5] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 64] %asi, %f0
membar #Sync
! 2 addresses covered
fmovs %f8, %f1

P3823: !_MEMBAR (FP)

P3824: !_LD [9] (Int)
lduw [%i1 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3825: !_MEMBAR (FP)

P3826: !_BSTC [29] (maybe <- 0x43000031) (FP)
wr %g0, 0xe0, %asi
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync
stda %f32, [%i2 + 64 ] %asi

P3827: !_MEMBAR (FP)
membar #StoreLoad

P3828: !_BLD [4] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f2
fmovd %f34, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovd %f40, %f6

P3829: !_MEMBAR (FP)

P3830: !_BST [1] (maybe <- 0x43000032) (FP)
wr %g0, 0xf0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P3831: !_MEMBAR (FP) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3831
nop
RET3831:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3832: !_PREFETCH [11] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 1

P3833: !_MEMBAR (FP)
membar #StoreLoad

P3834: !_BLD [23] (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldda [%i2 + 0] %asi, %f32
membar #Sync
! 3 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3835: !_MEMBAR (FP) (CBR)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3835
nop
RET3835:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3836: !_BSTC [4] (maybe <- 0x43000037) (FP)
wr %g0, 0xe0, %asi
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f34 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #3, next val will be in f36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #4, next val will be in f40 
fmovd %f20, %f36
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i0 + 0 ] %asi

P3837: !_MEMBAR (FP) (Branch target of P3701)
membar #StoreLoad
ba P3838
nop

TARGET3701:
ba RET3701
nop


P3838: !_BLD [3] (FP)
wr %g0, 0xf0, %asi
ldda [%i0 + 0] %asi, %f32
membar #Sync
! 5 addresses covered
fmovd %f32, %f10
fmovd %f34, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovd %f40, %f14

P3839: !_MEMBAR (FP) (Branch target of P3790)
ba P3840
nop

TARGET3790:
ba RET3790
nop


P3840: !_LD [17] (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 96], %f15
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
!--

P3841: !_REPLACEMENT [21] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x2000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3841
nop
RET3841:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3842: !_IDC_FLIP [17] (Int)
IDC_FLIP(3842, 27331, 7, 0x44800060, 0x60, %i3, 0x60, %l6, %l7, %o5, %l3)

P3843: !_MEMBAR (FP)

P3844: !_BST [21] (maybe <- 0x4300003c) (FP)
wr %g0, 0xf0, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f40 
fmovd %f20, %f32
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync
stda %f32, [%i3 + 0 ] %asi

P3845: !_MEMBAR (FP)
membar #StoreLoad

P3846: !_LD [3] (Int) (Loop exit)
lduw [%i0 + 16], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_7_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_7_0
nop

P3847: !_MEMBAR (Int)
membar #StoreLoad

END_NODES7: ! Test instruction sequence for CPU 7 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
stw %o5, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
tsotool_text_end:


!#0 N1 P1 REPLACEMENT 8 Int BE Pri Loop_entry
!#0 N2 P2 LD 33 -1 Int BE Pri
!#0 N3 P3 ST 17 0x1 Int BE Pri
!#0 N4 P4 MEMBAR
!#0 N5 P5 BLD 21 -1 FP BE Pri
!#0 N6 P5 BLD 22 -1 FP BE Pri
!#A N5 N6
!#0 N7 P5 BLD 23 -1 FP BE Pri
!#0 N8 P6 MEMBAR
!#0 N9 P7 LD 2 -1 Int BE Pri
!#0 N10 P8 MEMBAR
!#0 N11 P9 BLD 21 -1 FP BE Pri
!#0 N12 P9 BLD 22 -1 FP BE Pri
!#A N11 N12
!#0 N13 P9 BLD 23 -1 FP BE Pri
!#0 N14 P10 MEMBAR
!#0 N15 P11 BST 21 0x3f800001 FP BE Pri
!#0 N16 P11 BST 22 0x3f800002 FP BE Pri
!#A N15 N16
!#0 N17 P11 BST 23 0x3f800003 FP BE Pri
!#0 N18 P12 MEMBAR
!#0 N19 P13 BST 0 0x3f800004 FP BE Sec
!#0 N20 P13 BST 1 0x3f800005 FP BE Sec
!#A N19 N20
!#0 N21 P13 BST 2 0x3f800006 FP BE Sec
!#0 N22 P13 BST 3 0x3f800007 FP BE Sec
!#0 N23 P13 BST 4 0x3f800008 FP BE Sec
!#0 N24 P14 MEMBAR
!#0 N25 P15 BSTC 31 0x3f800009 FP BE Pri
!#0 N26 P16 MEMBAR
!#0 N27 P17 BSTC 5 0x3f80000a FP BE Pri
!#0 N28 P17 BSTC 6 0x3f80000b FP BE Pri
!#0 N29 P18 MEMBAR
!#0 N30 P19 REPLACEMENT 29 Int BE Pri
!#0 N31 P20 REPLACEMENT 16 Int BE Pri
!#0 N32 P21 MEMBAR
!#0 N33 P22 BST 30 0x3f80000c FP BE Pri
!#0 N34 P23 MEMBAR
!#0 N35 P24 REPLACEMENT 25 Int BE Pri
!#0 N36 P25 IDC_FLIP 33 Int BE Pri
!#0 N37 P26 LD 22 -1 FP BE Pri
!#0 N38 P27 ST 17 0x3f80000d FP BE Pri
!#0 N39 P28 MEMBAR
!#0 N40 P29 BLD 0 -1 FP BE Pri
!#0 N41 P29 BLD 1 -1 FP BE Pri
!#A N40 N41
!#0 N42 P29 BLD 2 -1 FP BE Pri
!#0 N43 P29 BLD 3 -1 FP BE Pri
!#0 N44 P29 BLD 4 -1 FP BE Pri
!#0 N45 P30 MEMBAR
!#0 N46 P31 REPLACEMENT 2 Int BE Pri
!#0 N47 P32 MEMBAR
!#0 N48 P33 BST 18 0x3f80000e FP BE Pri
!#0 N49 P34 MEMBAR
!#0 N50 P35 BST 7 0x3f80000f FP BE Pri
!#0 N51 P36 MEMBAR
!#0 N52 P37 BLD 20 -1 FP BE Pri
!#0 N53 P38 MEMBAR
!#0 N54 P39 ST 23 0x2 Int BE Pri
!#0 N55 P40 IDC_FLIP 8 Int BE Pri
!#0 N56 P41 MEMBAR
!#0 N57 P42 BSTC 0 0x3f800010 FP BE Pri
!#0 N58 P42 BSTC 1 0x3f800011 FP BE Pri
!#A N57 N58
!#0 N59 P42 BSTC 2 0x3f800012 FP BE Pri
!#0 N60 P42 BSTC 3 0x3f800013 FP BE Pri
!#0 N61 P42 BSTC 4 0x3f800014 FP BE Pri
!#0 N62 P43 MEMBAR
!#0 N63 P44 BLD 29 -1 FP BE Pri
!#0 N64 P45 MEMBAR
!#0 N65 P46 BLD 26 -1 FP BE Pri
!#0 N66 P46 BLD 27 -1 FP BE Pri
!#0 N67 P47 MEMBAR
!#0 N68 P48 REPLACEMENT 30 Int BE Pri
!#0 N69 P49 MEMBAR
!#0 N70 P50 BST 24 0x3f800015 FP BE Pri
!#0 N71 P50 BST 25 0x3f800016 FP BE Pri
!#0 N72 P51 MEMBAR
!#0 N73 P52 BSTC 0 0x3f800017 FP BE Pri
!#0 N74 P52 BSTC 1 0x3f800018 FP BE Pri
!#A N73 N74
!#0 N75 P52 BSTC 2 0x3f800019 FP BE Pri
!#0 N76 P52 BSTC 3 0x3f80001a FP BE Pri
!#0 N77 P52 BSTC 4 0x3f80001b FP BE Pri
!#0 N78 P53 MEMBAR
!#0 N79 P54 LD 24 -1 FP BE Pri
!#0 N80 P55 MEMBAR
!#0 N81 P56 BLD 26 -1 FP BE Pri
!#0 N82 P56 BLD 27 -1 FP BE Pri
!#0 N83 P57 MEMBAR
!#0 N84 P58 REPLACEMENT 28 Int BE Pri
!#0 N85 P59 MEMBAR
!#0 N86 P60 BLD 21 -1 FP BE Sec
!#0 N87 P60 BLD 22 -1 FP BE Sec
!#A N86 N87
!#0 N88 P60 BLD 23 -1 FP BE Sec
!#0 N89 P61 MEMBAR
!#0 N90 P62 BST 0 0x3f80001c FP BE Pri
!#0 N91 P62 BST 1 0x3f80001d FP BE Pri
!#A N90 N91
!#0 N92 P62 BST 2 0x3f80001e FP BE Pri
!#0 N93 P62 BST 3 0x3f80001f FP BE Pri
!#0 N94 P62 BST 4 0x3f800020 FP BE Pri
!#0 N95 P63 MEMBAR
!#0 N96 P64 LD 31 -1 Int BE Pri
!#0 N97 P65 MEMBAR
!#0 N98 P66 BLD 0 -1 FP BE Pri
!#0 N99 P66 BLD 1 -1 FP BE Pri
!#A N98 N99
!#0 N100 P66 BLD 2 -1 FP BE Pri
!#0 N101 P66 BLD 3 -1 FP BE Pri
!#0 N102 P66 BLD 4 -1 FP BE Pri
!#0 N103 P67 MEMBAR
!#0 N104 P68 LD 27 -1 Int BE Pri
!#0 N105 P69 MEMBAR
!#0 N106 P70 BST 11 0x3f800021 FP BE Pri
!#0 N107 P70 BST 12 0x3f800022 FP BE Pri
!#A N106 N107
!#0 N108 P70 BST 13 0x3f800023 FP BE Pri
!#0 N109 P71 MEMBAR
!#0 N110 P72 BST 8 0x3f800024 FP BE Pri
!#0 N111 P72 BST 9 0x3f800025 FP BE Pri
!#0 N112 P73 MEMBAR
!#0 N113 P74 BLD 10 -1 FP BE Pri
!#0 N114 P75 MEMBAR
!#0 N115 P76 REPLACEMENT 15 Int BE Pri
!#0 N116 P77 MEMBAR
!#0 N117 P78 BLD 30 -1 FP BE Pri
!#0 N118 P79 MEMBAR
!#0 N119 P80 LD 32 -1 Int BE Pri
!#0 N120 P81 MEMBAR
!#0 N121 P82 BLD 0 -1 FP BE Pri
!#0 N122 P82 BLD 1 -1 FP BE Pri
!#A N121 N122
!#0 N123 P82 BLD 2 -1 FP BE Pri
!#0 N124 P82 BLD 3 -1 FP BE Pri
!#0 N125 P82 BLD 4 -1 FP BE Pri
!#0 N126 P83 MEMBAR
!#0 N127 P84 BLD 7 -1 FP BE Pri
!#0 N128 P85 MEMBAR
!#0 N129 P86 REPLACEMENT 18 Int BE Pri
!#0 N130 P87 LD 6 -1 FP BE Pri
!#0 N131 P88 MEMBAR
!#0 N132 P89 BLD 21 -1 FP BE Pri
!#0 N133 P89 BLD 22 -1 FP BE Pri
!#A N132 N133
!#0 N134 P89 BLD 23 -1 FP BE Pri
!#0 N135 P90 MEMBAR
!#0 N136 P91 BSTC 0 0x3f800026 FP BE Pri
!#0 N137 P91 BSTC 1 0x3f800027 FP BE Pri
!#A N136 N137
!#0 N138 P91 BSTC 2 0x3f800028 FP BE Pri
!#0 N139 P91 BSTC 3 0x3f800029 FP BE Pri
!#0 N140 P91 BSTC 4 0x3f80002a FP BE Pri
!#0 N141 P92 MEMBAR
!#0 N142 P93 BSTC 0 0x3f80002b FP BE Sec
!#0 N143 P93 BSTC 1 0x3f80002c FP BE Sec
!#A N142 N143
!#0 N144 P93 BSTC 2 0x3f80002d FP BE Sec
!#0 N145 P93 BSTC 3 0x3f80002e FP BE Sec
!#0 N146 P93 BSTC 4 0x3f80002f FP BE Sec
!#0 N147 P94 MEMBAR
!#0 N148 P95 PREFETCH 14 Int LE Pri
!#0 N149 P96 LD 18 -1 FP BE Pri
!#0 N150 P97 LD 27 -1 FP BE Pri
!#0 N151 P98 ST 32 0x3 Int BE Pri
!#0 N152 P99 IDC_FLIP 31 Int BE Pri
!#0 N153 P100 MEMBAR
!#0 N154 P101 BLD 26 -1 FP BE Pri
!#0 N155 P101 BLD 27 -1 FP BE Pri
!#0 N156 P102 MEMBAR
!#0 N157 P103 IDC_FLIP 7 Int BE Pri
!#0 N158 P104 IDC_FLIP 17 Int BE Pri
!#0 N159 P105 MEMBAR
!#0 N160 P106 BSTC 29 0x3f800030 FP BE Sec
!#0 N161 P107 MEMBAR
!#0 N162 P108 REPLACEMENT 29 Int BE Pri
!#0 N163 P109 PREFETCH 33 Int BE Pri
!#0 N164 P110 REPLACEMENT 29 Int BE Pri
!#0 N165 P111 MEMBAR
!#0 N166 P112 BST 21 0x3f800031 FP BE Pri
!#0 N167 P112 BST 22 0x3f800032 FP BE Pri
!#A N166 N167
!#0 N168 P112 BST 23 0x3f800033 FP BE Pri
!#0 N169 P113 MEMBAR
!#0 N170 P114 REPLACEMENT 12 Int BE Pri
!#0 N171 P115 MEMBAR
!#0 N172 P116 BST 0 0x3f800034 FP BE Pri
!#0 N173 P116 BST 1 0x3f800035 FP BE Pri
!#A N172 N173
!#0 N174 P116 BST 2 0x3f800036 FP BE Pri
!#0 N175 P116 BST 3 0x3f800037 FP BE Pri
!#0 N176 P116 BST 4 0x3f800038 FP BE Pri
!#0 N177 P117 MEMBAR
!#0 N178 P118 REPLACEMENT 9 Int BE Pri
!#0 N179 P119 ST 8 0x3f800039 FP BE Sec
!#0 N180 P120 PREFETCH 12 Int BE Pri
!#0 N181 P121 MEMBAR
!#0 N182 P122 BLD 32 -1 FP BE Pri
!#0 N183 P123 MEMBAR
!#0 N184 P124 IDC_FLIP 11 Int BE Pri
!#0 N185 P125 LD 2 -1 FP BE Pri
!#0 N186 P126 ST 24 0x4 Int BE Pri
!#0 N187 P127 LD 27 -1 Int BE Pri
!#0 N188 P128 MEMBAR
!#0 N189 P129 BLD 24 -1 FP BE Pri
!#0 N190 P129 BLD 25 -1 FP BE Pri
!#0 N191 P130 MEMBAR
!#0 N192 P131 BST 11 0x3f80003a FP BE Pri
!#0 N193 P131 BST 12 0x3f80003b FP BE Pri
!#A N192 N193
!#0 N194 P131 BST 13 0x3f80003c FP BE Pri
!#0 N195 P132 MEMBAR
!#0 N196 P133 REPLACEMENT 11 Int BE Pri
!#0 N197 P134 ST 12 0x5 Int BE Pri
!#0 N198 P135 PREFETCH 4 Int LE Pri
!#0 N199 P136 MEMBAR
!#0 N200 P137 BSTC 20 0x3f80003d FP BE Pri
!#0 N201 P138 MEMBAR
!#0 N202 P139 LD 20 -1 Int BE Nuc
!#0 N203 P140 MEMBAR
!#0 N204 P141 BSTC 7 0x3f80003e FP BE Pri
!#0 N205 P142 MEMBAR
!#0 N206 P143 BSTC 19 0x3f80003f FP BE Pri
!#0 N207 P144 MEMBAR
!#0 N208 P145 BLD 8 -1 FP BE Pri
!#0 N209 P145 BLD 9 -1 FP BE Pri
!#0 N210 P146 MEMBAR
!#0 N211 P147 BSTC 11 0x3f800040 FP BE Pri
!#0 N212 P147 BSTC 12 0x3f800041 FP BE Pri
!#A N211 N212
!#0 N213 P147 BSTC 13 0x3f800042 FP BE Pri
!#0 N214 P148 MEMBAR
!#0 N215 P149 PREFETCH 26 Int BE Pri
!#0 N216 P150 MEMBAR
!#0 N217 P151 BLD 16 -1 FP BE Pri
!#0 N218 P152 MEMBAR
!#0 N219 P153 REPLACEMENT 17 Int BE Sec
!#0 N220 P154 LD 12 -1 FP BE Sec
!#0 N221 P155 MEMBAR
!#0 N222 P156 BST 8 0x3f800043 FP BE Sec
!#0 N223 P156 BST 9 0x3f800044 FP BE Sec
!#0 N224 P157 MEMBAR
!#0 N225 P158 BST 29 0x3f800045 FP BE Pri
!#0 N226 P159 MEMBAR
!#0 N227 P160 BSTC 0 0x3f800046 FP BE Pri
!#0 N228 P160 BSTC 1 0x3f800047 FP BE Pri
!#A N227 N228
!#0 N229 P160 BSTC 2 0x3f800048 FP BE Pri
!#0 N230 P160 BSTC 3 0x3f800049 FP BE Pri
!#0 N231 P160 BSTC 4 0x3f80004a FP BE Pri
!#0 N232 P161 MEMBAR
!#0 N233 P162 PREFETCH 7 Int BE Pri
!#0 N234 P163 MEMBAR
!#0 N235 P164 BLD 15 -1 FP BE Sec
!#0 N236 P165 MEMBAR
!#0 N237 P166 BLD 33 -1 FP BE Pri
!#0 N238 P167 MEMBAR
!#0 N239 P168 ST 27 0x6 Int BE Pri
!#0 N240 P169 PREFETCH 21 Int BE Pri
!#0 N241 P170 LD 14 -1 Int BE Pri
!#0 N242 P171 MEMBAR
!#0 N243 P172 BST 5 0x3f80004b FP BE Pri
!#0 N244 P172 BST 6 0x3f80004c FP BE Pri
!#0 N245 P173 MEMBAR
!#0 N246 P174 ST 33 0x7 Int LE Nuc
!#0 N247 P175 MEMBAR
!#0 N248 P176 BLD 21 -1 FP BE Pri
!#0 N249 P176 BLD 22 -1 FP BE Pri
!#A N248 N249
!#0 N250 P176 BLD 23 -1 FP BE Pri
!#0 N251 P177 MEMBAR
!#0 N252 P178 BLD 0 -1 FP BE Pri
!#0 N253 P178 BLD 1 -1 FP BE Pri
!#A N252 N253
!#0 N254 P178 BLD 2 -1 FP BE Pri
!#0 N255 P178 BLD 3 -1 FP BE Pri
!#0 N256 P178 BLD 4 -1 FP BE Pri
!#0 N257 P179 MEMBAR
!#0 N258 P180 BLD 21 -1 FP BE Sec
!#0 N259 P180 BLD 22 -1 FP BE Sec
!#A N258 N259
!#0 N260 P180 BLD 23 -1 FP BE Sec
!#0 N261 P181 MEMBAR
!#0 N262 P182 LD 17 -1 FP BE Pri
!#0 N263 P183 LD 18 -1 FP BE Nuc
!#0 N264 P184 MEMBAR
!#0 N265 P185 BLD 20 -1 FP BE Pri
!#0 N266 P186 MEMBAR
!#0 N267 P187 REPLACEMENT 5 Int BE Pri
!#0 N268 P188 MEMBAR
!#0 N269 P189 BLD 11 -1 FP BE Pri
!#0 N270 P189 BLD 12 -1 FP BE Pri
!#A N269 N270
!#0 N271 P189 BLD 13 -1 FP BE Pri
!#0 N272 P190 MEMBAR
!#0 N273 P191 REPLACEMENT 28 Int BE Sec
!#0 N274 P192 PREFETCH 4 Int BE Nuc
!#0 N275 P193 PREFETCH 21 Int BE Sec
!#0 N276 P194 ST 24 0x3f80004d FP BE Pri
!#0 N277 P195 ST 5 0x8 Int LE Pri
!#0 N278 P196 FLUSHI 0 Int BE Pri
!#0 N279 P197 ST 4 0x9 Int BE Pri
!#0 N280 P198 REPLACEMENT 32 Int BE Pri
!#0 N281 P199 MEMBAR
!#0 N282 P200 BSTC 21 0x3f80004e FP BE Pri
!#0 N283 P200 BSTC 22 0x3f80004f FP BE Pri
!#A N282 N283
!#0 N284 P200 BSTC 23 0x3f800050 FP BE Pri
!#0 N285 P201 MEMBAR
!#0 N286 P202 BST 10 0x3f800051 FP BE Pri
!#0 N287 P203 MEMBAR
!#0 N288 P204 ST 28 0x3f800052 FP BE Pri
!#0 N289 P205 MEMBAR
!#0 N290 P206 BLD 0 -1 FP BE Pri
!#0 N291 P206 BLD 1 -1 FP BE Pri
!#A N290 N291
!#0 N292 P206 BLD 2 -1 FP BE Pri
!#0 N293 P206 BLD 3 -1 FP BE Pri
!#0 N294 P206 BLD 4 -1 FP BE Pri
!#0 N295 P207 MEMBAR
!#0 N296 P208 ST 7 0xa Int BE Pri
!#0 N297 P209 MEMBAR
!#0 N298 P210 BST 15 0x3f800053 FP BE Pri
!#0 N299 P211 MEMBAR
!#0 N300 P212 REPLACEMENT 1 Int BE Pri
!#0 N301 P213 MEMBAR
!#0 N302 P214 BLD 14 -1 FP BE Pri
!#0 N303 P215 MEMBAR
!#0 N304 P216 BSTC 33 0x3f800054 FP BE Pri
!#0 N305 P217 MEMBAR
!#0 N306 P218 BSTC 0 0x3f800055 FP BE Pri
!#0 N307 P218 BSTC 1 0x3f800056 FP BE Pri
!#A N306 N307
!#0 N308 P218 BSTC 2 0x3f800057 FP BE Pri
!#0 N309 P218 BSTC 3 0x3f800058 FP BE Pri
!#0 N310 P218 BSTC 4 0x3f800059 FP BE Pri
!#0 N311 P219 MEMBAR
!#0 N312 P220 ST 19 0x3f80005a FP BE Pri
!#0 N313 P221 MEMBAR
!#0 N314 P222 BST 10 0x3f80005b FP BE Pri
!#0 N315 P223 MEMBAR
!#0 N316 P224 REPLACEMENT 21 Int BE Pri
!#0 N317 P225 MEMBAR
!#0 N318 P226 BLD 5 -1 FP BE Pri
!#0 N319 P226 BLD 6 -1 FP BE Pri
!#0 N320 P227 MEMBAR
!#0 N321 P228 BLD 26 -1 FP BE Pri
!#0 N322 P228 BLD 27 -1 FP BE Pri
!#0 N323 P229 MEMBAR
!#0 N324 P230 LD 22 -1 Int BE Sec
!#0 N325 P231 MEMBAR
!#0 N326 P232 BLD 33 -1 FP BE Pri
!#0 N327 P233 MEMBAR
!#0 N328 P234 BST 7 0x3f80005c FP BE Pri
!#0 N329 P235 MEMBAR
!#0 N330 P236 LD 28 -1 Int BE Pri Loop_exit
!#0 N331 P1 REPLACEMENT 8 Int BE Pri Loop_entry
!#0 N332 P2 LD 33 -1 Int BE Pri
!#0 N333 P3 ST 17 0xb Int BE Pri
!#0 N334 P4 MEMBAR
!#0 N335 P5 BLD 21 -1 FP BE Pri
!#0 N336 P5 BLD 22 -1 FP BE Pri
!#A N335 N336
!#0 N337 P5 BLD 23 -1 FP BE Pri
!#0 N338 P6 MEMBAR
!#0 N339 P7 LD 2 -1 Int BE Pri
!#0 N340 P8 MEMBAR
!#0 N341 P9 BLD 21 -1 FP BE Pri
!#0 N342 P9 BLD 22 -1 FP BE Pri
!#A N341 N342
!#0 N343 P9 BLD 23 -1 FP BE Pri
!#0 N344 P10 MEMBAR
!#0 N345 P11 BST 21 0x3f80005d FP BE Pri
!#0 N346 P11 BST 22 0x3f80005e FP BE Pri
!#A N345 N346
!#0 N347 P11 BST 23 0x3f80005f FP BE Pri
!#0 N348 P12 MEMBAR
!#0 N349 P13 BST 0 0x3f800060 FP BE Sec
!#0 N350 P13 BST 1 0x3f800061 FP BE Sec
!#A N349 N350
!#0 N351 P13 BST 2 0x3f800062 FP BE Sec
!#0 N352 P13 BST 3 0x3f800063 FP BE Sec
!#0 N353 P13 BST 4 0x3f800064 FP BE Sec
!#0 N354 P14 MEMBAR
!#0 N355 P15 BSTC 31 0x3f800065 FP BE Pri
!#0 N356 P16 MEMBAR
!#0 N357 P17 BSTC 5 0x3f800066 FP BE Pri
!#0 N358 P17 BSTC 6 0x3f800067 FP BE Pri
!#0 N359 P18 MEMBAR
!#0 N360 P19 REPLACEMENT 29 Int BE Pri
!#0 N361 P20 REPLACEMENT 16 Int BE Pri
!#0 N362 P21 MEMBAR
!#0 N363 P22 BST 30 0x3f800068 FP BE Pri
!#0 N364 P23 MEMBAR
!#0 N365 P24 REPLACEMENT 25 Int BE Pri
!#0 N366 P25 IDC_FLIP 33 Int BE Pri
!#0 N367 P26 LD 22 -1 FP BE Pri
!#0 N368 P27 ST 17 0x3f800069 FP BE Pri
!#0 N369 P28 MEMBAR
!#0 N370 P29 BLD 0 -1 FP BE Pri
!#0 N371 P29 BLD 1 -1 FP BE Pri
!#A N370 N371
!#0 N372 P29 BLD 2 -1 FP BE Pri
!#0 N373 P29 BLD 3 -1 FP BE Pri
!#0 N374 P29 BLD 4 -1 FP BE Pri
!#0 N375 P30 MEMBAR
!#0 N376 P31 REPLACEMENT 2 Int BE Pri
!#0 N377 P32 MEMBAR
!#0 N378 P33 BST 18 0x3f80006a FP BE Pri
!#0 N379 P34 MEMBAR
!#0 N380 P35 BST 7 0x3f80006b FP BE Pri
!#0 N381 P36 MEMBAR
!#0 N382 P37 BLD 20 -1 FP BE Pri
!#0 N383 P38 MEMBAR
!#0 N384 P39 ST 23 0xc Int BE Pri
!#0 N385 P40 IDC_FLIP 8 Int BE Pri
!#0 N386 P41 MEMBAR
!#0 N387 P42 BSTC 0 0x3f80006c FP BE Pri
!#0 N388 P42 BSTC 1 0x3f80006d FP BE Pri
!#A N387 N388
!#0 N389 P42 BSTC 2 0x3f80006e FP BE Pri
!#0 N390 P42 BSTC 3 0x3f80006f FP BE Pri
!#0 N391 P42 BSTC 4 0x3f800070 FP BE Pri
!#0 N392 P43 MEMBAR
!#0 N393 P44 BLD 29 -1 FP BE Pri
!#0 N394 P45 MEMBAR
!#0 N395 P46 BLD 26 -1 FP BE Pri
!#0 N396 P46 BLD 27 -1 FP BE Pri
!#0 N397 P47 MEMBAR
!#0 N398 P48 REPLACEMENT 30 Int BE Pri
!#0 N399 P49 MEMBAR
!#0 N400 P50 BST 24 0x3f800071 FP BE Pri
!#0 N401 P50 BST 25 0x3f800072 FP BE Pri
!#0 N402 P51 MEMBAR
!#0 N403 P52 BSTC 0 0x3f800073 FP BE Pri
!#0 N404 P52 BSTC 1 0x3f800074 FP BE Pri
!#A N403 N404
!#0 N405 P52 BSTC 2 0x3f800075 FP BE Pri
!#0 N406 P52 BSTC 3 0x3f800076 FP BE Pri
!#0 N407 P52 BSTC 4 0x3f800077 FP BE Pri
!#0 N408 P53 MEMBAR
!#0 N409 P54 LD 24 -1 FP BE Pri
!#0 N410 P55 MEMBAR
!#0 N411 P56 BLD 26 -1 FP BE Pri
!#0 N412 P56 BLD 27 -1 FP BE Pri
!#0 N413 P57 MEMBAR
!#0 N414 P58 REPLACEMENT 28 Int BE Pri
!#0 N415 P59 MEMBAR
!#0 N416 P60 BLD 21 -1 FP BE Sec
!#0 N417 P60 BLD 22 -1 FP BE Sec
!#A N416 N417
!#0 N418 P60 BLD 23 -1 FP BE Sec
!#0 N419 P61 MEMBAR
!#0 N420 P62 BST 0 0x3f800078 FP BE Pri
!#0 N421 P62 BST 1 0x3f800079 FP BE Pri
!#A N420 N421
!#0 N422 P62 BST 2 0x3f80007a FP BE Pri
!#0 N423 P62 BST 3 0x3f80007b FP BE Pri
!#0 N424 P62 BST 4 0x3f80007c FP BE Pri
!#0 N425 P63 MEMBAR
!#0 N426 P64 LD 31 -1 Int BE Pri
!#0 N427 P65 MEMBAR
!#0 N428 P66 BLD 0 -1 FP BE Pri
!#0 N429 P66 BLD 1 -1 FP BE Pri
!#A N428 N429
!#0 N430 P66 BLD 2 -1 FP BE Pri
!#0 N431 P66 BLD 3 -1 FP BE Pri
!#0 N432 P66 BLD 4 -1 FP BE Pri
!#0 N433 P67 MEMBAR
!#0 N434 P68 LD 27 -1 Int BE Pri
!#0 N435 P69 MEMBAR
!#0 N436 P70 BST 11 0x3f80007d FP BE Pri
!#0 N437 P70 BST 12 0x3f80007e FP BE Pri
!#A N436 N437
!#0 N438 P70 BST 13 0x3f80007f FP BE Pri
!#0 N439 P71 MEMBAR
!#0 N440 P72 BST 8 0x3f800080 FP BE Pri
!#0 N441 P72 BST 9 0x3f800081 FP BE Pri
!#0 N442 P73 MEMBAR
!#0 N443 P74 BLD 10 -1 FP BE Pri
!#0 N444 P75 MEMBAR
!#0 N445 P76 REPLACEMENT 15 Int BE Pri
!#0 N446 P77 MEMBAR
!#0 N447 P78 BLD 30 -1 FP BE Pri
!#0 N448 P79 MEMBAR
!#0 N449 P80 LD 32 -1 Int BE Pri
!#0 N450 P81 MEMBAR
!#0 N451 P82 BLD 0 -1 FP BE Pri
!#0 N452 P82 BLD 1 -1 FP BE Pri
!#A N451 N452
!#0 N453 P82 BLD 2 -1 FP BE Pri
!#0 N454 P82 BLD 3 -1 FP BE Pri
!#0 N455 P82 BLD 4 -1 FP BE Pri
!#0 N456 P83 MEMBAR
!#0 N457 P84 BLD 7 -1 FP BE Pri
!#0 N458 P85 MEMBAR
!#0 N459 P86 REPLACEMENT 18 Int BE Pri
!#0 N460 P87 LD 6 -1 FP BE Pri
!#0 N461 P88 MEMBAR
!#0 N462 P89 BLD 21 -1 FP BE Pri
!#0 N463 P89 BLD 22 -1 FP BE Pri
!#A N462 N463
!#0 N464 P89 BLD 23 -1 FP BE Pri
!#0 N465 P90 MEMBAR
!#0 N466 P91 BSTC 0 0x3f800082 FP BE Pri
!#0 N467 P91 BSTC 1 0x3f800083 FP BE Pri
!#A N466 N467
!#0 N468 P91 BSTC 2 0x3f800084 FP BE Pri
!#0 N469 P91 BSTC 3 0x3f800085 FP BE Pri
!#0 N470 P91 BSTC 4 0x3f800086 FP BE Pri
!#0 N471 P92 MEMBAR
!#0 N472 P93 BSTC 0 0x3f800087 FP BE Sec
!#0 N473 P93 BSTC 1 0x3f800088 FP BE Sec
!#A N472 N473
!#0 N474 P93 BSTC 2 0x3f800089 FP BE Sec
!#0 N475 P93 BSTC 3 0x3f80008a FP BE Sec
!#0 N476 P93 BSTC 4 0x3f80008b FP BE Sec
!#0 N477 P94 MEMBAR
!#0 N478 P95 PREFETCH 14 Int LE Pri
!#0 N479 P96 LD 18 -1 FP BE Pri
!#0 N480 P97 LD 27 -1 FP BE Pri
!#0 N481 P98 ST 32 0xd Int BE Pri
!#0 N482 P99 IDC_FLIP 31 Int BE Pri
!#0 N483 P100 MEMBAR
!#0 N484 P101 BLD 26 -1 FP BE Pri
!#0 N485 P101 BLD 27 -1 FP BE Pri
!#0 N486 P102 MEMBAR
!#0 N487 P103 IDC_FLIP 7 Int BE Pri
!#0 N488 P104 IDC_FLIP 17 Int BE Pri
!#0 N489 P105 MEMBAR
!#0 N490 P106 BSTC 29 0x3f80008c FP BE Sec
!#0 N491 P107 MEMBAR
!#0 N492 P108 REPLACEMENT 29 Int BE Pri
!#0 N493 P109 PREFETCH 33 Int BE Pri
!#0 N494 P110 REPLACEMENT 29 Int BE Pri
!#0 N495 P111 MEMBAR
!#0 N496 P112 BST 21 0x3f80008d FP BE Pri
!#0 N497 P112 BST 22 0x3f80008e FP BE Pri
!#A N496 N497
!#0 N498 P112 BST 23 0x3f80008f FP BE Pri
!#0 N499 P113 MEMBAR
!#0 N500 P114 REPLACEMENT 12 Int BE Pri
!#0 N501 P115 MEMBAR
!#0 N502 P116 BST 0 0x3f800090 FP BE Pri
!#0 N503 P116 BST 1 0x3f800091 FP BE Pri
!#A N502 N503
!#0 N504 P116 BST 2 0x3f800092 FP BE Pri
!#0 N505 P116 BST 3 0x3f800093 FP BE Pri
!#0 N506 P116 BST 4 0x3f800094 FP BE Pri
!#0 N507 P117 MEMBAR
!#0 N508 P118 REPLACEMENT 9 Int BE Pri
!#0 N509 P119 ST 8 0x3f800095 FP BE Sec
!#0 N510 P120 PREFETCH 12 Int BE Pri
!#0 N511 P121 MEMBAR
!#0 N512 P122 BLD 32 -1 FP BE Pri
!#0 N513 P123 MEMBAR
!#0 N514 P124 IDC_FLIP 11 Int BE Pri
!#0 N515 P125 LD 2 -1 FP BE Pri
!#0 N516 P126 ST 24 0xe Int BE Pri
!#0 N517 P127 LD 27 -1 Int BE Pri
!#0 N518 P128 MEMBAR
!#0 N519 P129 BLD 24 -1 FP BE Pri
!#0 N520 P129 BLD 25 -1 FP BE Pri
!#0 N521 P130 MEMBAR
!#0 N522 P131 BST 11 0x3f800096 FP BE Pri
!#0 N523 P131 BST 12 0x3f800097 FP BE Pri
!#A N522 N523
!#0 N524 P131 BST 13 0x3f800098 FP BE Pri
!#0 N525 P132 MEMBAR
!#0 N526 P133 REPLACEMENT 11 Int BE Pri
!#0 N527 P134 ST 12 0xf Int BE Pri
!#0 N528 P135 PREFETCH 4 Int LE Pri
!#0 N529 P136 MEMBAR
!#0 N530 P137 BSTC 20 0x3f800099 FP BE Pri
!#0 N531 P138 MEMBAR
!#0 N532 P139 LD 20 -1 Int BE Nuc
!#0 N533 P140 MEMBAR
!#0 N534 P141 BSTC 7 0x3f80009a FP BE Pri
!#0 N535 P142 MEMBAR
!#0 N536 P143 BSTC 19 0x3f80009b FP BE Pri
!#0 N537 P144 MEMBAR
!#0 N538 P145 BLD 8 -1 FP BE Pri
!#0 N539 P145 BLD 9 -1 FP BE Pri
!#0 N540 P146 MEMBAR
!#0 N541 P147 BSTC 11 0x3f80009c FP BE Pri
!#0 N542 P147 BSTC 12 0x3f80009d FP BE Pri
!#A N541 N542
!#0 N543 P147 BSTC 13 0x3f80009e FP BE Pri
!#0 N544 P148 MEMBAR
!#0 N545 P149 PREFETCH 26 Int BE Pri
!#0 N546 P150 MEMBAR
!#0 N547 P151 BLD 16 -1 FP BE Pri
!#0 N548 P152 MEMBAR
!#0 N549 P153 REPLACEMENT 17 Int BE Sec
!#0 N550 P154 LD 12 -1 FP BE Sec
!#0 N551 P155 MEMBAR
!#0 N552 P156 BST 8 0x3f80009f FP BE Sec
!#0 N553 P156 BST 9 0x3f8000a0 FP BE Sec
!#0 N554 P157 MEMBAR
!#0 N555 P158 BST 29 0x3f8000a1 FP BE Pri
!#0 N556 P159 MEMBAR
!#0 N557 P160 BSTC 0 0x3f8000a2 FP BE Pri
!#0 N558 P160 BSTC 1 0x3f8000a3 FP BE Pri
!#A N557 N558
!#0 N559 P160 BSTC 2 0x3f8000a4 FP BE Pri
!#0 N560 P160 BSTC 3 0x3f8000a5 FP BE Pri
!#0 N561 P160 BSTC 4 0x3f8000a6 FP BE Pri
!#0 N562 P161 MEMBAR
!#0 N563 P162 PREFETCH 7 Int BE Pri
!#0 N564 P163 MEMBAR
!#0 N565 P164 BLD 15 -1 FP BE Sec
!#0 N566 P165 MEMBAR
!#0 N567 P166 BLD 33 -1 FP BE Pri
!#0 N568 P167 MEMBAR
!#0 N569 P168 ST 27 0x10 Int BE Pri
!#0 N570 P169 PREFETCH 21 Int BE Pri
!#0 N571 P170 LD 14 -1 Int BE Pri
!#0 N572 P171 MEMBAR
!#0 N573 P172 BST 5 0x3f8000a7 FP BE Pri
!#0 N574 P172 BST 6 0x3f8000a8 FP BE Pri
!#0 N575 P173 MEMBAR
!#0 N576 P174 ST 33 0x11 Int LE Nuc
!#0 N577 P175 MEMBAR
!#0 N578 P176 BLD 21 -1 FP BE Pri
!#0 N579 P176 BLD 22 -1 FP BE Pri
!#A N578 N579
!#0 N580 P176 BLD 23 -1 FP BE Pri
!#0 N581 P177 MEMBAR
!#0 N582 P178 BLD 0 -1 FP BE Pri
!#0 N583 P178 BLD 1 -1 FP BE Pri
!#A N582 N583
!#0 N584 P178 BLD 2 -1 FP BE Pri
!#0 N585 P178 BLD 3 -1 FP BE Pri
!#0 N586 P178 BLD 4 -1 FP BE Pri
!#0 N587 P179 MEMBAR
!#0 N588 P180 BLD 21 -1 FP BE Sec
!#0 N589 P180 BLD 22 -1 FP BE Sec
!#A N588 N589
!#0 N590 P180 BLD 23 -1 FP BE Sec
!#0 N591 P181 MEMBAR
!#0 N592 P182 LD 17 -1 FP BE Pri
!#0 N593 P183 LD 18 -1 FP BE Nuc
!#0 N594 P184 MEMBAR
!#0 N595 P185 BLD 20 -1 FP BE Pri
!#0 N596 P186 MEMBAR
!#0 N597 P187 REPLACEMENT 5 Int BE Pri
!#0 N598 P188 MEMBAR
!#0 N599 P189 BLD 11 -1 FP BE Pri
!#0 N600 P189 BLD 12 -1 FP BE Pri
!#A N599 N600
!#0 N601 P189 BLD 13 -1 FP BE Pri
!#0 N602 P190 MEMBAR
!#0 N603 P191 REPLACEMENT 28 Int BE Sec
!#0 N604 P192 PREFETCH 4 Int BE Nuc
!#0 N605 P193 PREFETCH 21 Int BE Sec
!#0 N606 P194 ST 24 0x3f8000a9 FP BE Pri
!#0 N607 P195 ST 5 0x12 Int LE Pri
!#0 N608 P196 FLUSHI 0 Int BE Pri
!#0 N609 P197 ST 4 0x13 Int BE Pri
!#0 N610 P198 REPLACEMENT 32 Int BE Pri
!#0 N611 P199 MEMBAR
!#0 N612 P200 BSTC 21 0x3f8000aa FP BE Pri
!#0 N613 P200 BSTC 22 0x3f8000ab FP BE Pri
!#A N612 N613
!#0 N614 P200 BSTC 23 0x3f8000ac FP BE Pri
!#0 N615 P201 MEMBAR
!#0 N616 P202 BST 10 0x3f8000ad FP BE Pri
!#0 N617 P203 MEMBAR
!#0 N618 P204 ST 28 0x3f8000ae FP BE Pri
!#0 N619 P205 MEMBAR
!#0 N620 P206 BLD 0 -1 FP BE Pri
!#0 N621 P206 BLD 1 -1 FP BE Pri
!#A N620 N621
!#0 N622 P206 BLD 2 -1 FP BE Pri
!#0 N623 P206 BLD 3 -1 FP BE Pri
!#0 N624 P206 BLD 4 -1 FP BE Pri
!#0 N625 P207 MEMBAR
!#0 N626 P208 ST 7 0x14 Int BE Pri
!#0 N627 P209 MEMBAR
!#0 N628 P210 BST 15 0x3f8000af FP BE Pri
!#0 N629 P211 MEMBAR
!#0 N630 P212 REPLACEMENT 1 Int BE Pri
!#0 N631 P213 MEMBAR
!#0 N632 P214 BLD 14 -1 FP BE Pri
!#0 N633 P215 MEMBAR
!#0 N634 P216 BSTC 33 0x3f8000b0 FP BE Pri
!#0 N635 P217 MEMBAR
!#0 N636 P218 BSTC 0 0x3f8000b1 FP BE Pri
!#0 N637 P218 BSTC 1 0x3f8000b2 FP BE Pri
!#A N636 N637
!#0 N638 P218 BSTC 2 0x3f8000b3 FP BE Pri
!#0 N639 P218 BSTC 3 0x3f8000b4 FP BE Pri
!#0 N640 P218 BSTC 4 0x3f8000b5 FP BE Pri
!#0 N641 P219 MEMBAR
!#0 N642 P220 ST 19 0x3f8000b6 FP BE Pri
!#0 N643 P221 MEMBAR
!#0 N644 P222 BST 10 0x3f8000b7 FP BE Pri
!#0 N645 P223 MEMBAR
!#0 N646 P224 REPLACEMENT 21 Int BE Pri
!#0 N647 P225 MEMBAR
!#0 N648 P226 BLD 5 -1 FP BE Pri
!#0 N649 P226 BLD 6 -1 FP BE Pri
!#0 N650 P227 MEMBAR
!#0 N651 P228 BLD 26 -1 FP BE Pri
!#0 N652 P228 BLD 27 -1 FP BE Pri
!#0 N653 P229 MEMBAR
!#0 N654 P230 LD 22 -1 Int BE Sec
!#0 N655 P231 MEMBAR
!#0 N656 P232 BLD 33 -1 FP BE Pri
!#0 N657 P233 MEMBAR
!#0 N658 P234 BST 7 0x3f8000b8 FP BE Pri
!#0 N659 P235 MEMBAR
!#0 N660 P236 LD 28 -1 Int BE Pri Loop_exit
!#0 N661 P1 REPLACEMENT 8 Int BE Pri Loop_entry
!#0 N662 P2 LD 33 -1 Int BE Pri
!#0 N663 P3 ST 17 0x15 Int BE Pri
!#0 N664 P4 MEMBAR
!#0 N665 P5 BLD 21 -1 FP BE Pri
!#0 N666 P5 BLD 22 -1 FP BE Pri
!#A N665 N666
!#0 N667 P5 BLD 23 -1 FP BE Pri
!#0 N668 P6 MEMBAR
!#0 N669 P7 LD 2 -1 Int BE Pri
!#0 N670 P8 MEMBAR
!#0 N671 P9 BLD 21 -1 FP BE Pri
!#0 N672 P9 BLD 22 -1 FP BE Pri
!#A N671 N672
!#0 N673 P9 BLD 23 -1 FP BE Pri
!#0 N674 P10 MEMBAR
!#0 N675 P11 BST 21 0x3f8000b9 FP BE Pri
!#0 N676 P11 BST 22 0x3f8000ba FP BE Pri
!#A N675 N676
!#0 N677 P11 BST 23 0x3f8000bb FP BE Pri
!#0 N678 P12 MEMBAR
!#0 N679 P13 BST 0 0x3f8000bc FP BE Sec
!#0 N680 P13 BST 1 0x3f8000bd FP BE Sec
!#A N679 N680
!#0 N681 P13 BST 2 0x3f8000be FP BE Sec
!#0 N682 P13 BST 3 0x3f8000bf FP BE Sec
!#0 N683 P13 BST 4 0x3f8000c0 FP BE Sec
!#0 N684 P14 MEMBAR
!#0 N685 P15 BSTC 31 0x3f8000c1 FP BE Pri
!#0 N686 P16 MEMBAR
!#0 N687 P17 BSTC 5 0x3f8000c2 FP BE Pri
!#0 N688 P17 BSTC 6 0x3f8000c3 FP BE Pri
!#0 N689 P18 MEMBAR
!#0 N690 P19 REPLACEMENT 29 Int BE Pri
!#0 N691 P20 REPLACEMENT 16 Int BE Pri
!#0 N692 P21 MEMBAR
!#0 N693 P22 BST 30 0x3f8000c4 FP BE Pri
!#0 N694 P23 MEMBAR
!#0 N695 P24 REPLACEMENT 25 Int BE Pri
!#0 N696 P25 IDC_FLIP 33 Int BE Pri
!#0 N697 P26 LD 22 -1 FP BE Pri
!#0 N698 P27 ST 17 0x3f8000c5 FP BE Pri
!#0 N699 P28 MEMBAR
!#0 N700 P29 BLD 0 -1 FP BE Pri
!#0 N701 P29 BLD 1 -1 FP BE Pri
!#A N700 N701
!#0 N702 P29 BLD 2 -1 FP BE Pri
!#0 N703 P29 BLD 3 -1 FP BE Pri
!#0 N704 P29 BLD 4 -1 FP BE Pri
!#0 N705 P30 MEMBAR
!#0 N706 P31 REPLACEMENT 2 Int BE Pri
!#0 N707 P32 MEMBAR
!#0 N708 P33 BST 18 0x3f8000c6 FP BE Pri
!#0 N709 P34 MEMBAR
!#0 N710 P35 BST 7 0x3f8000c7 FP BE Pri
!#0 N711 P36 MEMBAR
!#0 N712 P37 BLD 20 -1 FP BE Pri
!#0 N713 P38 MEMBAR
!#0 N714 P39 ST 23 0x16 Int BE Pri
!#0 N715 P40 IDC_FLIP 8 Int BE Pri
!#0 N716 P41 MEMBAR
!#0 N717 P42 BSTC 0 0x3f8000c8 FP BE Pri
!#0 N718 P42 BSTC 1 0x3f8000c9 FP BE Pri
!#A N717 N718
!#0 N719 P42 BSTC 2 0x3f8000ca FP BE Pri
!#0 N720 P42 BSTC 3 0x3f8000cb FP BE Pri
!#0 N721 P42 BSTC 4 0x3f8000cc FP BE Pri
!#0 N722 P43 MEMBAR
!#0 N723 P44 BLD 29 -1 FP BE Pri
!#0 N724 P45 MEMBAR
!#0 N725 P46 BLD 26 -1 FP BE Pri
!#0 N726 P46 BLD 27 -1 FP BE Pri
!#0 N727 P47 MEMBAR
!#0 N728 P48 REPLACEMENT 30 Int BE Pri
!#0 N729 P49 MEMBAR
!#0 N730 P50 BST 24 0x3f8000cd FP BE Pri
!#0 N731 P50 BST 25 0x3f8000ce FP BE Pri
!#0 N732 P51 MEMBAR
!#0 N733 P52 BSTC 0 0x3f8000cf FP BE Pri
!#0 N734 P52 BSTC 1 0x3f8000d0 FP BE Pri
!#A N733 N734
!#0 N735 P52 BSTC 2 0x3f8000d1 FP BE Pri
!#0 N736 P52 BSTC 3 0x3f8000d2 FP BE Pri
!#0 N737 P52 BSTC 4 0x3f8000d3 FP BE Pri
!#0 N738 P53 MEMBAR
!#0 N739 P54 LD 24 -1 FP BE Pri
!#0 N740 P55 MEMBAR
!#0 N741 P56 BLD 26 -1 FP BE Pri
!#0 N742 P56 BLD 27 -1 FP BE Pri
!#0 N743 P57 MEMBAR
!#0 N744 P58 REPLACEMENT 28 Int BE Pri
!#0 N745 P59 MEMBAR
!#0 N746 P60 BLD 21 -1 FP BE Sec
!#0 N747 P60 BLD 22 -1 FP BE Sec
!#A N746 N747
!#0 N748 P60 BLD 23 -1 FP BE Sec
!#0 N749 P61 MEMBAR
!#0 N750 P62 BST 0 0x3f8000d4 FP BE Pri
!#0 N751 P62 BST 1 0x3f8000d5 FP BE Pri
!#A N750 N751
!#0 N752 P62 BST 2 0x3f8000d6 FP BE Pri
!#0 N753 P62 BST 3 0x3f8000d7 FP BE Pri
!#0 N754 P62 BST 4 0x3f8000d8 FP BE Pri
!#0 N755 P63 MEMBAR
!#0 N756 P64 LD 31 -1 Int BE Pri
!#0 N757 P65 MEMBAR
!#0 N758 P66 BLD 0 -1 FP BE Pri
!#0 N759 P66 BLD 1 -1 FP BE Pri
!#A N758 N759
!#0 N760 P66 BLD 2 -1 FP BE Pri
!#0 N761 P66 BLD 3 -1 FP BE Pri
!#0 N762 P66 BLD 4 -1 FP BE Pri
!#0 N763 P67 MEMBAR
!#0 N764 P68 LD 27 -1 Int BE Pri
!#0 N765 P69 MEMBAR
!#0 N766 P70 BST 11 0x3f8000d9 FP BE Pri
!#0 N767 P70 BST 12 0x3f8000da FP BE Pri
!#A N766 N767
!#0 N768 P70 BST 13 0x3f8000db FP BE Pri
!#0 N769 P71 MEMBAR
!#0 N770 P72 BST 8 0x3f8000dc FP BE Pri
!#0 N771 P72 BST 9 0x3f8000dd FP BE Pri
!#0 N772 P73 MEMBAR
!#0 N773 P74 BLD 10 -1 FP BE Pri
!#0 N774 P75 MEMBAR
!#0 N775 P76 REPLACEMENT 15 Int BE Pri
!#0 N776 P77 MEMBAR
!#0 N777 P78 BLD 30 -1 FP BE Pri
!#0 N778 P79 MEMBAR
!#0 N779 P80 LD 32 -1 Int BE Pri
!#0 N780 P81 MEMBAR
!#0 N781 P82 BLD 0 -1 FP BE Pri
!#0 N782 P82 BLD 1 -1 FP BE Pri
!#A N781 N782
!#0 N783 P82 BLD 2 -1 FP BE Pri
!#0 N784 P82 BLD 3 -1 FP BE Pri
!#0 N785 P82 BLD 4 -1 FP BE Pri
!#0 N786 P83 MEMBAR
!#0 N787 P84 BLD 7 -1 FP BE Pri
!#0 N788 P85 MEMBAR
!#0 N789 P86 REPLACEMENT 18 Int BE Pri
!#0 N790 P87 LD 6 -1 FP BE Pri
!#0 N791 P88 MEMBAR
!#0 N792 P89 BLD 21 -1 FP BE Pri
!#0 N793 P89 BLD 22 -1 FP BE Pri
!#A N792 N793
!#0 N794 P89 BLD 23 -1 FP BE Pri
!#0 N795 P90 MEMBAR
!#0 N796 P91 BSTC 0 0x3f8000de FP BE Pri
!#0 N797 P91 BSTC 1 0x3f8000df FP BE Pri
!#A N796 N797
!#0 N798 P91 BSTC 2 0x3f8000e0 FP BE Pri
!#0 N799 P91 BSTC 3 0x3f8000e1 FP BE Pri
!#0 N800 P91 BSTC 4 0x3f8000e2 FP BE Pri
!#0 N801 P92 MEMBAR
!#0 N802 P93 BSTC 0 0x3f8000e3 FP BE Sec
!#0 N803 P93 BSTC 1 0x3f8000e4 FP BE Sec
!#A N802 N803
!#0 N804 P93 BSTC 2 0x3f8000e5 FP BE Sec
!#0 N805 P93 BSTC 3 0x3f8000e6 FP BE Sec
!#0 N806 P93 BSTC 4 0x3f8000e7 FP BE Sec
!#0 N807 P94 MEMBAR
!#0 N808 P95 PREFETCH 14 Int LE Pri
!#0 N809 P96 LD 18 -1 FP BE Pri
!#0 N810 P97 LD 27 -1 FP BE Pri
!#0 N811 P98 ST 32 0x17 Int BE Pri
!#0 N812 P99 IDC_FLIP 31 Int BE Pri
!#0 N813 P100 MEMBAR
!#0 N814 P101 BLD 26 -1 FP BE Pri
!#0 N815 P101 BLD 27 -1 FP BE Pri
!#0 N816 P102 MEMBAR
!#0 N817 P103 IDC_FLIP 7 Int BE Pri
!#0 N818 P104 IDC_FLIP 17 Int BE Pri
!#0 N819 P105 MEMBAR
!#0 N820 P106 BSTC 29 0x3f8000e8 FP BE Sec
!#0 N821 P107 MEMBAR
!#0 N822 P108 REPLACEMENT 29 Int BE Pri
!#0 N823 P109 PREFETCH 33 Int BE Pri
!#0 N824 P110 REPLACEMENT 29 Int BE Pri
!#0 N825 P111 MEMBAR
!#0 N826 P112 BST 21 0x3f8000e9 FP BE Pri
!#0 N827 P112 BST 22 0x3f8000ea FP BE Pri
!#A N826 N827
!#0 N828 P112 BST 23 0x3f8000eb FP BE Pri
!#0 N829 P113 MEMBAR
!#0 N830 P114 REPLACEMENT 12 Int BE Pri
!#0 N831 P115 MEMBAR
!#0 N832 P116 BST 0 0x3f8000ec FP BE Pri
!#0 N833 P116 BST 1 0x3f8000ed FP BE Pri
!#A N832 N833
!#0 N834 P116 BST 2 0x3f8000ee FP BE Pri
!#0 N835 P116 BST 3 0x3f8000ef FP BE Pri
!#0 N836 P116 BST 4 0x3f8000f0 FP BE Pri
!#0 N837 P117 MEMBAR
!#0 N838 P118 REPLACEMENT 9 Int BE Pri
!#0 N839 P119 ST 8 0x3f8000f1 FP BE Sec
!#0 N840 P120 PREFETCH 12 Int BE Pri
!#0 N841 P121 MEMBAR
!#0 N842 P122 BLD 32 -1 FP BE Pri
!#0 N843 P123 MEMBAR
!#0 N844 P124 IDC_FLIP 11 Int BE Pri
!#0 N845 P125 LD 2 -1 FP BE Pri
!#0 N846 P126 ST 24 0x18 Int BE Pri
!#0 N847 P127 LD 27 -1 Int BE Pri
!#0 N848 P128 MEMBAR
!#0 N849 P129 BLD 24 -1 FP BE Pri
!#0 N850 P129 BLD 25 -1 FP BE Pri
!#0 N851 P130 MEMBAR
!#0 N852 P131 BST 11 0x3f8000f2 FP BE Pri
!#0 N853 P131 BST 12 0x3f8000f3 FP BE Pri
!#A N852 N853
!#0 N854 P131 BST 13 0x3f8000f4 FP BE Pri
!#0 N855 P132 MEMBAR
!#0 N856 P133 REPLACEMENT 11 Int BE Pri
!#0 N857 P134 ST 12 0x19 Int BE Pri
!#0 N858 P135 PREFETCH 4 Int LE Pri
!#0 N859 P136 MEMBAR
!#0 N860 P137 BSTC 20 0x3f8000f5 FP BE Pri
!#0 N861 P138 MEMBAR
!#0 N862 P139 LD 20 -1 Int BE Nuc
!#0 N863 P140 MEMBAR
!#0 N864 P141 BSTC 7 0x3f8000f6 FP BE Pri
!#0 N865 P142 MEMBAR
!#0 N866 P143 BSTC 19 0x3f8000f7 FP BE Pri
!#0 N867 P144 MEMBAR
!#0 N868 P145 BLD 8 -1 FP BE Pri
!#0 N869 P145 BLD 9 -1 FP BE Pri
!#0 N870 P146 MEMBAR
!#0 N871 P147 BSTC 11 0x3f8000f8 FP BE Pri
!#0 N872 P147 BSTC 12 0x3f8000f9 FP BE Pri
!#A N871 N872
!#0 N873 P147 BSTC 13 0x3f8000fa FP BE Pri
!#0 N874 P148 MEMBAR
!#0 N875 P149 PREFETCH 26 Int BE Pri
!#0 N876 P150 MEMBAR
!#0 N877 P151 BLD 16 -1 FP BE Pri
!#0 N878 P152 MEMBAR
!#0 N879 P153 REPLACEMENT 17 Int BE Sec
!#0 N880 P154 LD 12 -1 FP BE Sec
!#0 N881 P155 MEMBAR
!#0 N882 P156 BST 8 0x3f8000fb FP BE Sec
!#0 N883 P156 BST 9 0x3f8000fc FP BE Sec
!#0 N884 P157 MEMBAR
!#0 N885 P158 BST 29 0x3f8000fd FP BE Pri
!#0 N886 P159 MEMBAR
!#0 N887 P160 BSTC 0 0x3f8000fe FP BE Pri
!#0 N888 P160 BSTC 1 0x3f8000ff FP BE Pri
!#A N887 N888
!#0 N889 P160 BSTC 2 0x3f800100 FP BE Pri
!#0 N890 P160 BSTC 3 0x3f800101 FP BE Pri
!#0 N891 P160 BSTC 4 0x3f800102 FP BE Pri
!#0 N892 P161 MEMBAR
!#0 N893 P162 PREFETCH 7 Int BE Pri
!#0 N894 P163 MEMBAR
!#0 N895 P164 BLD 15 -1 FP BE Sec
!#0 N896 P165 MEMBAR
!#0 N897 P166 BLD 33 -1 FP BE Pri
!#0 N898 P167 MEMBAR
!#0 N899 P168 ST 27 0x1a Int BE Pri
!#0 N900 P169 PREFETCH 21 Int BE Pri
!#0 N901 P170 LD 14 -1 Int BE Pri
!#0 N902 P171 MEMBAR
!#0 N903 P172 BST 5 0x3f800103 FP BE Pri
!#0 N904 P172 BST 6 0x3f800104 FP BE Pri
!#0 N905 P173 MEMBAR
!#0 N906 P174 ST 33 0x1b Int LE Nuc
!#0 N907 P175 MEMBAR
!#0 N908 P176 BLD 21 -1 FP BE Pri
!#0 N909 P176 BLD 22 -1 FP BE Pri
!#A N908 N909
!#0 N910 P176 BLD 23 -1 FP BE Pri
!#0 N911 P177 MEMBAR
!#0 N912 P178 BLD 0 -1 FP BE Pri
!#0 N913 P178 BLD 1 -1 FP BE Pri
!#A N912 N913
!#0 N914 P178 BLD 2 -1 FP BE Pri
!#0 N915 P178 BLD 3 -1 FP BE Pri
!#0 N916 P178 BLD 4 -1 FP BE Pri
!#0 N917 P179 MEMBAR
!#0 N918 P180 BLD 21 -1 FP BE Sec
!#0 N919 P180 BLD 22 -1 FP BE Sec
!#A N918 N919
!#0 N920 P180 BLD 23 -1 FP BE Sec
!#0 N921 P181 MEMBAR
!#0 N922 P182 LD 17 -1 FP BE Pri
!#0 N923 P183 LD 18 -1 FP BE Nuc
!#0 N924 P184 MEMBAR
!#0 N925 P185 BLD 20 -1 FP BE Pri
!#0 N926 P186 MEMBAR
!#0 N927 P187 REPLACEMENT 5 Int BE Pri
!#0 N928 P188 MEMBAR
!#0 N929 P189 BLD 11 -1 FP BE Pri
!#0 N930 P189 BLD 12 -1 FP BE Pri
!#A N929 N930
!#0 N931 P189 BLD 13 -1 FP BE Pri
!#0 N932 P190 MEMBAR
!#0 N933 P191 REPLACEMENT 28 Int BE Sec
!#0 N934 P192 PREFETCH 4 Int BE Nuc
!#0 N935 P193 PREFETCH 21 Int BE Sec
!#0 N936 P194 ST 24 0x3f800105 FP BE Pri
!#0 N937 P195 ST 5 0x1c Int LE Pri
!#0 N938 P196 FLUSHI 0 Int BE Pri
!#0 N939 P197 ST 4 0x1d Int BE Pri
!#0 N940 P198 REPLACEMENT 32 Int BE Pri
!#0 N941 P199 MEMBAR
!#0 N942 P200 BSTC 21 0x3f800106 FP BE Pri
!#0 N943 P200 BSTC 22 0x3f800107 FP BE Pri
!#A N942 N943
!#0 N944 P200 BSTC 23 0x3f800108 FP BE Pri
!#0 N945 P201 MEMBAR
!#0 N946 P202 BST 10 0x3f800109 FP BE Pri
!#0 N947 P203 MEMBAR
!#0 N948 P204 ST 28 0x3f80010a FP BE Pri
!#0 N949 P205 MEMBAR
!#0 N950 P206 BLD 0 -1 FP BE Pri
!#0 N951 P206 BLD 1 -1 FP BE Pri
!#A N950 N951
!#0 N952 P206 BLD 2 -1 FP BE Pri
!#0 N953 P206 BLD 3 -1 FP BE Pri
!#0 N954 P206 BLD 4 -1 FP BE Pri
!#0 N955 P207 MEMBAR
!#0 N956 P208 ST 7 0x1e Int BE Pri
!#0 N957 P209 MEMBAR
!#0 N958 P210 BST 15 0x3f80010b FP BE Pri
!#0 N959 P211 MEMBAR
!#0 N960 P212 REPLACEMENT 1 Int BE Pri
!#0 N961 P213 MEMBAR
!#0 N962 P214 BLD 14 -1 FP BE Pri
!#0 N963 P215 MEMBAR
!#0 N964 P216 BSTC 33 0x3f80010c FP BE Pri
!#0 N965 P217 MEMBAR
!#0 N966 P218 BSTC 0 0x3f80010d FP BE Pri
!#0 N967 P218 BSTC 1 0x3f80010e FP BE Pri
!#A N966 N967
!#0 N968 P218 BSTC 2 0x3f80010f FP BE Pri
!#0 N969 P218 BSTC 3 0x3f800110 FP BE Pri
!#0 N970 P218 BSTC 4 0x3f800111 FP BE Pri
!#0 N971 P219 MEMBAR
!#0 N972 P220 ST 19 0x3f800112 FP BE Pri
!#0 N973 P221 MEMBAR
!#0 N974 P222 BST 10 0x3f800113 FP BE Pri
!#0 N975 P223 MEMBAR
!#0 N976 P224 REPLACEMENT 21 Int BE Pri
!#0 N977 P225 MEMBAR
!#0 N978 P226 BLD 5 -1 FP BE Pri
!#0 N979 P226 BLD 6 -1 FP BE Pri
!#0 N980 P227 MEMBAR
!#0 N981 P228 BLD 26 -1 FP BE Pri
!#0 N982 P228 BLD 27 -1 FP BE Pri
!#0 N983 P229 MEMBAR
!#0 N984 P230 LD 22 -1 Int BE Sec
!#0 N985 P231 MEMBAR
!#0 N986 P232 BLD 33 -1 FP BE Pri
!#0 N987 P233 MEMBAR
!#0 N988 P234 BST 7 0x3f800114 FP BE Pri
!#0 N989 P235 MEMBAR
!#0 N990 P236 LD 28 -1 Int BE Pri Loop_exit
!#0 N991 P1 REPLACEMENT 8 Int BE Pri Loop_entry
!#0 N992 P2 LD 33 -1 Int BE Pri
!#0 N993 P3 ST 17 0x1f Int BE Pri
!#0 N994 P4 MEMBAR
!#0 N995 P5 BLD 21 -1 FP BE Pri
!#0 N996 P5 BLD 22 -1 FP BE Pri
!#A N995 N996
!#0 N997 P5 BLD 23 -1 FP BE Pri
!#0 N998 P6 MEMBAR
!#0 N999 P7 LD 2 -1 Int BE Pri
!#0 N1000 P8 MEMBAR
!#0 N1001 P9 BLD 21 -1 FP BE Pri
!#0 N1002 P9 BLD 22 -1 FP BE Pri
!#A N1001 N1002
!#0 N1003 P9 BLD 23 -1 FP BE Pri
!#0 N1004 P10 MEMBAR
!#0 N1005 P11 BST 21 0x3f800115 FP BE Pri
!#0 N1006 P11 BST 22 0x3f800116 FP BE Pri
!#A N1005 N1006
!#0 N1007 P11 BST 23 0x3f800117 FP BE Pri
!#0 N1008 P12 MEMBAR
!#0 N1009 P13 BST 0 0x3f800118 FP BE Sec
!#0 N1010 P13 BST 1 0x3f800119 FP BE Sec
!#A N1009 N1010
!#0 N1011 P13 BST 2 0x3f80011a FP BE Sec
!#0 N1012 P13 BST 3 0x3f80011b FP BE Sec
!#0 N1013 P13 BST 4 0x3f80011c FP BE Sec
!#0 N1014 P14 MEMBAR
!#0 N1015 P15 BSTC 31 0x3f80011d FP BE Pri
!#0 N1016 P16 MEMBAR
!#0 N1017 P17 BSTC 5 0x3f80011e FP BE Pri
!#0 N1018 P17 BSTC 6 0x3f80011f FP BE Pri
!#0 N1019 P18 MEMBAR
!#0 N1020 P19 REPLACEMENT 29 Int BE Pri
!#0 N1021 P20 REPLACEMENT 16 Int BE Pri
!#0 N1022 P21 MEMBAR
!#0 N1023 P22 BST 30 0x3f800120 FP BE Pri
!#0 N1024 P23 MEMBAR
!#0 N1025 P24 REPLACEMENT 25 Int BE Pri
!#0 N1026 P25 IDC_FLIP 33 Int BE Pri
!#0 N1027 P26 LD 22 -1 FP BE Pri
!#0 N1028 P27 ST 17 0x3f800121 FP BE Pri
!#0 N1029 P28 MEMBAR
!#0 N1030 P29 BLD 0 -1 FP BE Pri
!#0 N1031 P29 BLD 1 -1 FP BE Pri
!#A N1030 N1031
!#0 N1032 P29 BLD 2 -1 FP BE Pri
!#0 N1033 P29 BLD 3 -1 FP BE Pri
!#0 N1034 P29 BLD 4 -1 FP BE Pri
!#0 N1035 P30 MEMBAR
!#0 N1036 P31 REPLACEMENT 2 Int BE Pri
!#0 N1037 P32 MEMBAR
!#0 N1038 P33 BST 18 0x3f800122 FP BE Pri
!#0 N1039 P34 MEMBAR
!#0 N1040 P35 BST 7 0x3f800123 FP BE Pri
!#0 N1041 P36 MEMBAR
!#0 N1042 P37 BLD 20 -1 FP BE Pri
!#0 N1043 P38 MEMBAR
!#0 N1044 P39 ST 23 0x20 Int BE Pri
!#0 N1045 P40 IDC_FLIP 8 Int BE Pri
!#0 N1046 P41 MEMBAR
!#0 N1047 P42 BSTC 0 0x3f800124 FP BE Pri
!#0 N1048 P42 BSTC 1 0x3f800125 FP BE Pri
!#A N1047 N1048
!#0 N1049 P42 BSTC 2 0x3f800126 FP BE Pri
!#0 N1050 P42 BSTC 3 0x3f800127 FP BE Pri
!#0 N1051 P42 BSTC 4 0x3f800128 FP BE Pri
!#0 N1052 P43 MEMBAR
!#0 N1053 P44 BLD 29 -1 FP BE Pri
!#0 N1054 P45 MEMBAR
!#0 N1055 P46 BLD 26 -1 FP BE Pri
!#0 N1056 P46 BLD 27 -1 FP BE Pri
!#0 N1057 P47 MEMBAR
!#0 N1058 P48 REPLACEMENT 30 Int BE Pri
!#0 N1059 P49 MEMBAR
!#0 N1060 P50 BST 24 0x3f800129 FP BE Pri
!#0 N1061 P50 BST 25 0x3f80012a FP BE Pri
!#0 N1062 P51 MEMBAR
!#0 N1063 P52 BSTC 0 0x3f80012b FP BE Pri
!#0 N1064 P52 BSTC 1 0x3f80012c FP BE Pri
!#A N1063 N1064
!#0 N1065 P52 BSTC 2 0x3f80012d FP BE Pri
!#0 N1066 P52 BSTC 3 0x3f80012e FP BE Pri
!#0 N1067 P52 BSTC 4 0x3f80012f FP BE Pri
!#0 N1068 P53 MEMBAR
!#0 N1069 P54 LD 24 -1 FP BE Pri
!#0 N1070 P55 MEMBAR
!#0 N1071 P56 BLD 26 -1 FP BE Pri
!#0 N1072 P56 BLD 27 -1 FP BE Pri
!#0 N1073 P57 MEMBAR
!#0 N1074 P58 REPLACEMENT 28 Int BE Pri
!#0 N1075 P59 MEMBAR
!#0 N1076 P60 BLD 21 -1 FP BE Sec
!#0 N1077 P60 BLD 22 -1 FP BE Sec
!#A N1076 N1077
!#0 N1078 P60 BLD 23 -1 FP BE Sec
!#0 N1079 P61 MEMBAR
!#0 N1080 P62 BST 0 0x3f800130 FP BE Pri
!#0 N1081 P62 BST 1 0x3f800131 FP BE Pri
!#A N1080 N1081
!#0 N1082 P62 BST 2 0x3f800132 FP BE Pri
!#0 N1083 P62 BST 3 0x3f800133 FP BE Pri
!#0 N1084 P62 BST 4 0x3f800134 FP BE Pri
!#0 N1085 P63 MEMBAR
!#0 N1086 P64 LD 31 -1 Int BE Pri
!#0 N1087 P65 MEMBAR
!#0 N1088 P66 BLD 0 -1 FP BE Pri
!#0 N1089 P66 BLD 1 -1 FP BE Pri
!#A N1088 N1089
!#0 N1090 P66 BLD 2 -1 FP BE Pri
!#0 N1091 P66 BLD 3 -1 FP BE Pri
!#0 N1092 P66 BLD 4 -1 FP BE Pri
!#0 N1093 P67 MEMBAR
!#0 N1094 P68 LD 27 -1 Int BE Pri
!#0 N1095 P69 MEMBAR
!#0 N1096 P70 BST 11 0x3f800135 FP BE Pri
!#0 N1097 P70 BST 12 0x3f800136 FP BE Pri
!#A N1096 N1097
!#0 N1098 P70 BST 13 0x3f800137 FP BE Pri
!#0 N1099 P71 MEMBAR
!#0 N1100 P72 BST 8 0x3f800138 FP BE Pri
!#0 N1101 P72 BST 9 0x3f800139 FP BE Pri
!#0 N1102 P73 MEMBAR
!#0 N1103 P74 BLD 10 -1 FP BE Pri
!#0 N1104 P75 MEMBAR
!#0 N1105 P76 REPLACEMENT 15 Int BE Pri
!#0 N1106 P77 MEMBAR
!#0 N1107 P78 BLD 30 -1 FP BE Pri
!#0 N1108 P79 MEMBAR
!#0 N1109 P80 LD 32 -1 Int BE Pri
!#0 N1110 P81 MEMBAR
!#0 N1111 P82 BLD 0 -1 FP BE Pri
!#0 N1112 P82 BLD 1 -1 FP BE Pri
!#A N1111 N1112
!#0 N1113 P82 BLD 2 -1 FP BE Pri
!#0 N1114 P82 BLD 3 -1 FP BE Pri
!#0 N1115 P82 BLD 4 -1 FP BE Pri
!#0 N1116 P83 MEMBAR
!#0 N1117 P84 BLD 7 -1 FP BE Pri
!#0 N1118 P85 MEMBAR
!#0 N1119 P86 REPLACEMENT 18 Int BE Pri
!#0 N1120 P87 LD 6 -1 FP BE Pri
!#0 N1121 P88 MEMBAR
!#0 N1122 P89 BLD 21 -1 FP BE Pri
!#0 N1123 P89 BLD 22 -1 FP BE Pri
!#A N1122 N1123
!#0 N1124 P89 BLD 23 -1 FP BE Pri
!#0 N1125 P90 MEMBAR
!#0 N1126 P91 BSTC 0 0x3f80013a FP BE Pri
!#0 N1127 P91 BSTC 1 0x3f80013b FP BE Pri
!#A N1126 N1127
!#0 N1128 P91 BSTC 2 0x3f80013c FP BE Pri
!#0 N1129 P91 BSTC 3 0x3f80013d FP BE Pri
!#0 N1130 P91 BSTC 4 0x3f80013e FP BE Pri
!#0 N1131 P92 MEMBAR
!#0 N1132 P93 BSTC 0 0x3f80013f FP BE Sec
!#0 N1133 P93 BSTC 1 0x3f800140 FP BE Sec
!#A N1132 N1133
!#0 N1134 P93 BSTC 2 0x3f800141 FP BE Sec
!#0 N1135 P93 BSTC 3 0x3f800142 FP BE Sec
!#0 N1136 P93 BSTC 4 0x3f800143 FP BE Sec
!#0 N1137 P94 MEMBAR
!#0 N1138 P95 PREFETCH 14 Int LE Pri
!#0 N1139 P96 LD 18 -1 FP BE Pri
!#0 N1140 P97 LD 27 -1 FP BE Pri
!#0 N1141 P98 ST 32 0x21 Int BE Pri
!#0 N1142 P99 IDC_FLIP 31 Int BE Pri
!#0 N1143 P100 MEMBAR
!#0 N1144 P101 BLD 26 -1 FP BE Pri
!#0 N1145 P101 BLD 27 -1 FP BE Pri
!#0 N1146 P102 MEMBAR
!#0 N1147 P103 IDC_FLIP 7 Int BE Pri
!#0 N1148 P104 IDC_FLIP 17 Int BE Pri
!#0 N1149 P105 MEMBAR
!#0 N1150 P106 BSTC 29 0x3f800144 FP BE Sec
!#0 N1151 P107 MEMBAR
!#0 N1152 P108 REPLACEMENT 29 Int BE Pri
!#0 N1153 P109 PREFETCH 33 Int BE Pri
!#0 N1154 P110 REPLACEMENT 29 Int BE Pri
!#0 N1155 P111 MEMBAR
!#0 N1156 P112 BST 21 0x3f800145 FP BE Pri
!#0 N1157 P112 BST 22 0x3f800146 FP BE Pri
!#A N1156 N1157
!#0 N1158 P112 BST 23 0x3f800147 FP BE Pri
!#0 N1159 P113 MEMBAR
!#0 N1160 P114 REPLACEMENT 12 Int BE Pri
!#0 N1161 P115 MEMBAR
!#0 N1162 P116 BST 0 0x3f800148 FP BE Pri
!#0 N1163 P116 BST 1 0x3f800149 FP BE Pri
!#A N1162 N1163
!#0 N1164 P116 BST 2 0x3f80014a FP BE Pri
!#0 N1165 P116 BST 3 0x3f80014b FP BE Pri
!#0 N1166 P116 BST 4 0x3f80014c FP BE Pri
!#0 N1167 P117 MEMBAR
!#0 N1168 P118 REPLACEMENT 9 Int BE Pri
!#0 N1169 P119 ST 8 0x3f80014d FP BE Sec
!#0 N1170 P120 PREFETCH 12 Int BE Pri
!#0 N1171 P121 MEMBAR
!#0 N1172 P122 BLD 32 -1 FP BE Pri
!#0 N1173 P123 MEMBAR
!#0 N1174 P124 IDC_FLIP 11 Int BE Pri
!#0 N1175 P125 LD 2 -1 FP BE Pri
!#0 N1176 P126 ST 24 0x22 Int BE Pri
!#0 N1177 P127 LD 27 -1 Int BE Pri
!#0 N1178 P128 MEMBAR
!#0 N1179 P129 BLD 24 -1 FP BE Pri
!#0 N1180 P129 BLD 25 -1 FP BE Pri
!#0 N1181 P130 MEMBAR
!#0 N1182 P131 BST 11 0x3f80014e FP BE Pri
!#0 N1183 P131 BST 12 0x3f80014f FP BE Pri
!#A N1182 N1183
!#0 N1184 P131 BST 13 0x3f800150 FP BE Pri
!#0 N1185 P132 MEMBAR
!#0 N1186 P133 REPLACEMENT 11 Int BE Pri
!#0 N1187 P134 ST 12 0x23 Int BE Pri
!#0 N1188 P135 PREFETCH 4 Int LE Pri
!#0 N1189 P136 MEMBAR
!#0 N1190 P137 BSTC 20 0x3f800151 FP BE Pri
!#0 N1191 P138 MEMBAR
!#0 N1192 P139 LD 20 -1 Int BE Nuc
!#0 N1193 P140 MEMBAR
!#0 N1194 P141 BSTC 7 0x3f800152 FP BE Pri
!#0 N1195 P142 MEMBAR
!#0 N1196 P143 BSTC 19 0x3f800153 FP BE Pri
!#0 N1197 P144 MEMBAR
!#0 N1198 P145 BLD 8 -1 FP BE Pri
!#0 N1199 P145 BLD 9 -1 FP BE Pri
!#0 N1200 P146 MEMBAR
!#0 N1201 P147 BSTC 11 0x3f800154 FP BE Pri
!#0 N1202 P147 BSTC 12 0x3f800155 FP BE Pri
!#A N1201 N1202
!#0 N1203 P147 BSTC 13 0x3f800156 FP BE Pri
!#0 N1204 P148 MEMBAR
!#0 N1205 P149 PREFETCH 26 Int BE Pri
!#0 N1206 P150 MEMBAR
!#0 N1207 P151 BLD 16 -1 FP BE Pri
!#0 N1208 P152 MEMBAR
!#0 N1209 P153 REPLACEMENT 17 Int BE Sec
!#0 N1210 P154 LD 12 -1 FP BE Sec
!#0 N1211 P155 MEMBAR
!#0 N1212 P156 BST 8 0x3f800157 FP BE Sec
!#0 N1213 P156 BST 9 0x3f800158 FP BE Sec
!#0 N1214 P157 MEMBAR
!#0 N1215 P158 BST 29 0x3f800159 FP BE Pri
!#0 N1216 P159 MEMBAR
!#0 N1217 P160 BSTC 0 0x3f80015a FP BE Pri
!#0 N1218 P160 BSTC 1 0x3f80015b FP BE Pri
!#A N1217 N1218
!#0 N1219 P160 BSTC 2 0x3f80015c FP BE Pri
!#0 N1220 P160 BSTC 3 0x3f80015d FP BE Pri
!#0 N1221 P160 BSTC 4 0x3f80015e FP BE Pri
!#0 N1222 P161 MEMBAR
!#0 N1223 P162 PREFETCH 7 Int BE Pri
!#0 N1224 P163 MEMBAR
!#0 N1225 P164 BLD 15 -1 FP BE Sec
!#0 N1226 P165 MEMBAR
!#0 N1227 P166 BLD 33 -1 FP BE Pri
!#0 N1228 P167 MEMBAR
!#0 N1229 P168 ST 27 0x24 Int BE Pri
!#0 N1230 P169 PREFETCH 21 Int BE Pri
!#0 N1231 P170 LD 14 -1 Int BE Pri
!#0 N1232 P171 MEMBAR
!#0 N1233 P172 BST 5 0x3f80015f FP BE Pri
!#0 N1234 P172 BST 6 0x3f800160 FP BE Pri
!#0 N1235 P173 MEMBAR
!#0 N1236 P174 ST 33 0x25 Int LE Nuc
!#0 N1237 P175 MEMBAR
!#0 N1238 P176 BLD 21 -1 FP BE Pri
!#0 N1239 P176 BLD 22 -1 FP BE Pri
!#A N1238 N1239
!#0 N1240 P176 BLD 23 -1 FP BE Pri
!#0 N1241 P177 MEMBAR
!#0 N1242 P178 BLD 0 -1 FP BE Pri
!#0 N1243 P178 BLD 1 -1 FP BE Pri
!#A N1242 N1243
!#0 N1244 P178 BLD 2 -1 FP BE Pri
!#0 N1245 P178 BLD 3 -1 FP BE Pri
!#0 N1246 P178 BLD 4 -1 FP BE Pri
!#0 N1247 P179 MEMBAR
!#0 N1248 P180 BLD 21 -1 FP BE Sec
!#0 N1249 P180 BLD 22 -1 FP BE Sec