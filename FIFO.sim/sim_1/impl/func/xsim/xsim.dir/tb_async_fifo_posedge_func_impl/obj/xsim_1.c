/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_650(char*, char *);
IKI_DLLESPEC extern void execute_651(char*, char *);
IKI_DLLESPEC extern void execute_652(char*, char *);
IKI_DLLESPEC extern void execute_653(char*, char *);
IKI_DLLESPEC extern void execute_1232(char*, char *);
IKI_DLLESPEC extern void execute_1233(char*, char *);
IKI_DLLESPEC extern void execute_1234(char*, char *);
IKI_DLLESPEC extern void execute_1235(char*, char *);
IKI_DLLESPEC extern void execute_1236(char*, char *);
IKI_DLLESPEC extern void execute_1237(char*, char *);
IKI_DLLESPEC extern void execute_1238(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_659(char*, char *);
IKI_DLLESPEC extern void execute_660(char*, char *);
IKI_DLLESPEC extern void execute_661(char*, char *);
IKI_DLLESPEC extern void execute_6(char*, char *);
IKI_DLLESPEC extern void execute_7(char*, char *);
IKI_DLLESPEC extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_15(char*, char *);
IKI_DLLESPEC extern void execute_16(char*, char *);
IKI_DLLESPEC extern void execute_18(char*, char *);
IKI_DLLESPEC extern void execute_19(char*, char *);
IKI_DLLESPEC extern void execute_20(char*, char *);
IKI_DLLESPEC extern void execute_665(char*, char *);
IKI_DLLESPEC extern void execute_666(char*, char *);
IKI_DLLESPEC extern void execute_667(char*, char *);
IKI_DLLESPEC extern void execute_668(char*, char *);
IKI_DLLESPEC extern void execute_36(char*, char *);
IKI_DLLESPEC extern void execute_37(char*, char *);
IKI_DLLESPEC extern void execute_38(char*, char *);
IKI_DLLESPEC extern void execute_675(char*, char *);
IKI_DLLESPEC extern void execute_676(char*, char *);
IKI_DLLESPEC extern void execute_677(char*, char *);
IKI_DLLESPEC extern void execute_678(char*, char *);
IKI_DLLESPEC extern void execute_72(char*, char *);
IKI_DLLESPEC extern void execute_73(char*, char *);
IKI_DLLESPEC extern void execute_74(char*, char *);
IKI_DLLESPEC extern void execute_687(char*, char *);
IKI_DLLESPEC extern void execute_688(char*, char *);
IKI_DLLESPEC extern void execute_689(char*, char *);
IKI_DLLESPEC extern void execute_879(char*, char *);
IKI_DLLESPEC extern void execute_880(char*, char *);
IKI_DLLESPEC extern void execute_388(char*, char *);
IKI_DLLESPEC extern void execute_897(char*, char *);
IKI_DLLESPEC extern void execute_898(char*, char *);
IKI_DLLESPEC extern void execute_899(char*, char *);
IKI_DLLESPEC extern void execute_900(char*, char *);
IKI_DLLESPEC extern void execute_896(char*, char *);
IKI_DLLESPEC extern void execute_410(char*, char *);
IKI_DLLESPEC extern void execute_455(char*, char *);
IKI_DLLESPEC extern void execute_968(char*, char *);
IKI_DLLESPEC extern void execute_969(char*, char *);
IKI_DLLESPEC extern void execute_970(char*, char *);
IKI_DLLESPEC extern void execute_971(char*, char *);
IKI_DLLESPEC extern void execute_972(char*, char *);
IKI_DLLESPEC extern void execute_973(char*, char *);
IKI_DLLESPEC extern void execute_974(char*, char *);
IKI_DLLESPEC extern void execute_975(char*, char *);
IKI_DLLESPEC extern void execute_967(char*, char *);
IKI_DLLESPEC extern void execute_458(char*, char *);
IKI_DLLESPEC extern void execute_459(char*, char *);
IKI_DLLESPEC extern void execute_500(char*, char *);
IKI_DLLESPEC extern void execute_999(char*, char *);
IKI_DLLESPEC extern void execute_1000(char*, char *);
IKI_DLLESPEC extern void execute_998(char*, char *);
IKI_DLLESPEC extern void execute_655(char*, char *);
IKI_DLLESPEC extern void execute_656(char*, char *);
IKI_DLLESPEC extern void execute_657(char*, char *);
IKI_DLLESPEC extern void execute_658(char*, char *);
IKI_DLLESPEC extern void execute_1239(char*, char *);
IKI_DLLESPEC extern void execute_1240(char*, char *);
IKI_DLLESPEC extern void execute_1241(char*, char *);
IKI_DLLESPEC extern void execute_1242(char*, char *);
IKI_DLLESPEC extern void execute_1243(char*, char *);
IKI_DLLESPEC extern void execute_1244(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_214(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_238(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_282(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_286(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_290(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_294(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_298(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_302(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_306(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_310(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_314(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_318(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_322(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_326(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_330(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_334(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_338(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_342(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_346(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_350(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_354(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_358(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_362(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_366(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_370(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_374(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_378(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_382(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_386(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_390(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_394(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_398(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_402(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_406(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_410(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_414(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_418(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_422(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_426(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_430(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_434(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_438(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_442(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_446(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_450(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_454(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_458(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_462(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_466(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_470(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_474(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_478(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_482(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_486(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_490(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_494(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_498(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_502(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_506(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_510(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_514(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_518(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_522(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_526(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_530(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_534(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_632(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_638(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_644(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_650(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_656(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_662(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_668(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_674(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_707(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_712(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_717(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_722(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_748(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_753(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_758(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_766(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_771(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_776(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_781(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_786(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_791(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_796(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_801(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_833(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_838(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_843(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_848(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_871(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_876(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_881(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_886(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_891(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_896(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_901(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_906(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_911(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_916(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_921(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[180] = {(funcp)execute_650, (funcp)execute_651, (funcp)execute_652, (funcp)execute_653, (funcp)execute_1232, (funcp)execute_1233, (funcp)execute_1234, (funcp)execute_1235, (funcp)execute_1236, (funcp)execute_1237, (funcp)execute_1238, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_659, (funcp)execute_660, (funcp)execute_661, (funcp)execute_6, (funcp)execute_7, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_15, (funcp)execute_16, (funcp)execute_18, (funcp)execute_19, (funcp)execute_20, (funcp)execute_665, (funcp)execute_666, (funcp)execute_667, (funcp)execute_668, (funcp)execute_36, (funcp)execute_37, (funcp)execute_38, (funcp)execute_675, (funcp)execute_676, (funcp)execute_677, (funcp)execute_678, (funcp)execute_72, (funcp)execute_73, (funcp)execute_74, (funcp)execute_687, (funcp)execute_688, (funcp)execute_689, (funcp)execute_879, (funcp)execute_880, (funcp)execute_388, (funcp)execute_897, (funcp)execute_898, (funcp)execute_899, (funcp)execute_900, (funcp)execute_896, (funcp)execute_410, (funcp)execute_455, (funcp)execute_968, (funcp)execute_969, (funcp)execute_970, (funcp)execute_971, (funcp)execute_972, (funcp)execute_973, (funcp)execute_974, (funcp)execute_975, (funcp)execute_967, (funcp)execute_458, (funcp)execute_459, (funcp)execute_500, (funcp)execute_999, (funcp)execute_1000, (funcp)execute_998, (funcp)execute_655, (funcp)execute_656, (funcp)execute_657, (funcp)execute_658, (funcp)execute_1239, (funcp)execute_1240, (funcp)execute_1241, (funcp)execute_1242, (funcp)execute_1243, (funcp)execute_1244, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_214, (funcp)transaction_238, (funcp)transaction_282, (funcp)transaction_286, (funcp)transaction_290, (funcp)transaction_294, (funcp)transaction_298, (funcp)transaction_302, (funcp)transaction_306, (funcp)transaction_310, (funcp)transaction_314, (funcp)transaction_318, (funcp)transaction_322, (funcp)transaction_326, (funcp)transaction_330, (funcp)transaction_334, (funcp)transaction_338, (funcp)transaction_342, (funcp)transaction_346, (funcp)transaction_350, (funcp)transaction_354, (funcp)transaction_358, (funcp)transaction_362, (funcp)transaction_366, (funcp)transaction_370, (funcp)transaction_374, (funcp)transaction_378, (funcp)transaction_382, (funcp)transaction_386, (funcp)transaction_390, (funcp)transaction_394, (funcp)transaction_398, (funcp)transaction_402, (funcp)transaction_406, (funcp)transaction_410, (funcp)transaction_414, (funcp)transaction_418, (funcp)transaction_422, (funcp)transaction_426, (funcp)transaction_430, (funcp)transaction_434, (funcp)transaction_438, (funcp)transaction_442, (funcp)transaction_446, (funcp)transaction_450, (funcp)transaction_454, (funcp)transaction_458, (funcp)transaction_462, (funcp)transaction_466, (funcp)transaction_470, (funcp)transaction_474, (funcp)transaction_478, (funcp)transaction_482, (funcp)transaction_486, (funcp)transaction_490, (funcp)transaction_494, (funcp)transaction_498, (funcp)transaction_502, (funcp)transaction_506, (funcp)transaction_510, (funcp)transaction_514, (funcp)transaction_518, (funcp)transaction_522, (funcp)transaction_526, (funcp)transaction_530, (funcp)transaction_534, (funcp)transaction_632, (funcp)transaction_638, (funcp)transaction_644, (funcp)transaction_650, (funcp)transaction_656, (funcp)transaction_662, (funcp)transaction_668, (funcp)transaction_674, (funcp)transaction_707, (funcp)transaction_712, (funcp)transaction_717, (funcp)transaction_722, (funcp)transaction_748, (funcp)transaction_753, (funcp)transaction_758, (funcp)transaction_766, (funcp)transaction_771, (funcp)transaction_776, (funcp)transaction_781, (funcp)transaction_786, (funcp)transaction_791, (funcp)transaction_796, (funcp)transaction_801, (funcp)transaction_833, (funcp)transaction_838, (funcp)transaction_843, (funcp)transaction_848, (funcp)transaction_871, (funcp)transaction_876, (funcp)transaction_881, (funcp)transaction_886, (funcp)transaction_891, (funcp)transaction_896, (funcp)transaction_901, (funcp)transaction_906, (funcp)transaction_911, (funcp)transaction_916, (funcp)transaction_921};
const int NumRelocateId= 180;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_async_fifo_posedge_func_impl/xsim.reloc",  (void **)funcTab, 180);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_async_fifo_posedge_func_impl/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_async_fifo_posedge_func_impl/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_async_fifo_posedge_func_impl/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_async_fifo_posedge_func_impl/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_async_fifo_posedge_func_impl/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
