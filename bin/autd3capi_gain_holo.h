// This file was automatically generated from header file
#ifdef __cplusplus
#include <cstdint>
#else
#include <stdbool.h>
#include <stdint.h>
#endif

void AUTDEigenBackend(void** out);
void AUTDDeleteBackend(void* backend);
void AUTDGainHoloSDP(void** gain, void* backend, double alpha, double lambda, uint64_t repeat);
void AUTDGainHoloEVD(void** gain, void* backend, double gamma);
void AUTDGainHoloNaive(void** gain, void* backend);
void AUTDGainHoloGS(void** gain, void* backend, uint64_t repeat);
void AUTDGainHoloGSPAT(void** gain, void* backend, uint64_t repeat);
void AUTDGainHoloLM(void** gain, void* backend, double eps_1, double eps_2, double tau, uint64_t k_max, double* initial, int32_t initial_size);
void AUTDGainHoloGaussNewton(void** gain, void* backend, double eps_1, double eps_2, uint64_t k_max, double* initial, int32_t initial_size);
void AUTDGainHoloGradientDescent(void** gain, void* backend, double eps, double step, uint64_t k_max, double* initial, int32_t initial_size);
void AUTDGainHoloGreedy(void** gain, void* backend, int32_t phase_div);
void AUTDGainHoloAdd(void* gain, double x, double y, double z, double amp);
void AUTDSetConstraint(void* gain, int32_t type, void* param);
void AUTDSetModeHolo(uint8_t mode);

