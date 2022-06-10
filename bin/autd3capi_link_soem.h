// This file was automatically generated from header file
#ifdef __cplusplus
#include <cstdint>
#else
#include <stdbool.h>
#include <stdint.h>
#endif

int32_t AUTDGetAdapterPointer(void** out);
void AUTDGetAdapter(void* p_adapter, int32_t index, int8_t* desc, int8_t* name);
void AUTDFreeAdapterPointer(void* p_adapter);
void AUTDLinkSOEM(void** out, char* ifname, int32_t device_num, uint16_t cycle_ticks, void* on_lost, bool high_precision);
