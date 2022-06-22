// This file was automatically generated from header file

typedef char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
#ifdef WIN32
typedef long long int64_t;
typedef unsigned long long uint64_t;
#else
typedef long int64_t;
typedef unsigned long uint64_t;
#endif

void AUTDEigenBackend(void** out);
void AUTDDeleteBackend(void* backend);
void AUTDGainHoloSDP(void** gain, void* backend, double alpha, double lambda, uint64_t repeat);
void AUTDGainHoloEVD(void** gain, void* backend, double gamma);
void AUTDGainHoloNaive(void** gain, void* backend);
void AUTDGainHoloGS(void** gain, void* backend, uint64_t repeat);
void AUTDGainHoloGSPAT(void** gain, void* backend, uint64_t repeat);
void AUTDGainHoloLM(void** gain, void* backend, double eps_1, double eps_2, double tau, uint64_t k_max, double* initial, int32_t initial_size);
void AUTDGainHoloGreedy(void** gain, void* backend, int32_t phase_div);
void AUTDGainHoloAdd(void* gain, double x, double y, double z, double amp);
void AUTDSetConstraint(void* gain, int32_t type, void* param);
void AUTDSetModeHolo(uint8_t mode);
