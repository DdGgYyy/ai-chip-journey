// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_and.h for the primary calling header

#include "Vtb_and__pch.h"
#include "Vtb_and__Syms.h"
#include "Vtb_and___024root.h"

VL_INLINE_OPT VlCoroutine Vtb_and___024root___eval_initial__TOP__Vtiming__0(Vtb_and___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtb_and__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_and___024root___eval_initial__TOP__Vtiming__0\n"); );
    // Body
    vlSymsp->_vm_contextp__->dumpfile(std::string{"tb.vcd"});
    vlSymsp->_traceDumpOpen();
    vlSelf->tb_and__DOT__a = 0U;
    vlSelf->tb_and__DOT__b = 0U;
    co_await vlSelf->__VdlySched.delay(0x2710ULL, nullptr, 
                                       "tb_and.v", 
                                       13);
    VL_WRITEF("a=%b b=%b y=%b\n",1,vlSelf->tb_and__DOT__a,
              1,(IData)(vlSelf->tb_and__DOT__b),1,vlSelf->tb_and__DOT__y);
    vlSelf->tb_and__DOT__a = 0U;
    vlSelf->tb_and__DOT__b = 1U;
    co_await vlSelf->__VdlySched.delay(0x2710ULL, nullptr, 
                                       "tb_and.v", 
                                       14);
    VL_WRITEF("a=%b b=%b y=%b\n",1,vlSelf->tb_and__DOT__a,
              1,(IData)(vlSelf->tb_and__DOT__b),1,vlSelf->tb_and__DOT__y);
    vlSelf->tb_and__DOT__a = 1U;
    vlSelf->tb_and__DOT__b = 0U;
    co_await vlSelf->__VdlySched.delay(0x2710ULL, nullptr, 
                                       "tb_and.v", 
                                       15);
    VL_WRITEF("a=%b b=%b y=%b\n",1,vlSelf->tb_and__DOT__a,
              1,(IData)(vlSelf->tb_and__DOT__b),1,vlSelf->tb_and__DOT__y);
    vlSelf->tb_and__DOT__a = 1U;
    vlSelf->tb_and__DOT__b = 1U;
    co_await vlSelf->__VdlySched.delay(0x2710ULL, nullptr, 
                                       "tb_and.v", 
                                       16);
    VL_WRITEF("a=%b b=%b y=%b\ndone at %0t\n",1,vlSelf->tb_and__DOT__a,
              1,(IData)(vlSelf->tb_and__DOT__b),1,vlSelf->tb_and__DOT__y,
              64,VL_TIME_UNITED_Q(1000),-9);
    VL_FINISH_MT("tb_and.v", 19, "");
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_and___024root___dump_triggers__act(Vtb_and___024root* vlSelf);
#endif  // VL_DEBUG

void Vtb_and___024root___eval_triggers__act(Vtb_and___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtb_and__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_and___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.set(0U, vlSelf->__VdlySched.awaitingCurrentTime());
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtb_and___024root___dump_triggers__act(vlSelf);
    }
#endif
}
