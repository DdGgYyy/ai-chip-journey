// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_and.h for the primary calling header

#ifndef VERILATED_VTB_AND___024ROOT_H_
#define VERILATED_VTB_AND___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vtb_and__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtb_and___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ tb_and__DOT__a;
    CData/*0:0*/ tb_and__DOT__b;
    CData/*0:0*/ tb_and__DOT__y;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vtb_and__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtb_and___024root(Vtb_and__Syms* symsp, const char* v__name);
    ~Vtb_and___024root();
    VL_UNCOPYABLE(Vtb_and___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
