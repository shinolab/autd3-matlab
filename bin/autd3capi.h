// This file was automatically generated from header file
#ifdef __cplusplus
#include <cstdint>
#else
#include <stdbool.h>
#include <stdint.h>
#endif

int32_t AUTDGetLastError(int8_t* error);
void AUTDCreateController(void** out);
bool AUTDOpenController(void* handle, void* link);
int32_t AUTDAddDevice(void* handle, double x, double y, double z, double rz1, double ry, double rz2);
int32_t AUTDAddDeviceQuaternion(void* handle, double x, double y, double z, double qw, double qx, double qy, double qz);
int32_t AUTDClose(void* handle);
int32_t AUTDClear(void* handle);
int32_t AUTDSynchronize(void* handle);
void AUTDFreeController(void* handle);
bool AUTDIsOpen(void* handle);
bool AUTDGetForceFan(void* handle);
bool AUTDGetReadsFPGAInfo(void* handle);
bool AUTDGetCheckAck(void* handle);
void AUTDSetReadsFPGAInfo(void* handle, bool reads_fpga_info);
void AUTDSetCheckAck(void* handle, bool check_ack);
void AUTDSetForceFan(void* handle, bool force);
double AUTDGetSoundSpeed(void* handle);
void AUTDSetSoundSpeed(void* handle, double sound_speed);
double AUTDGetTransFrequency(void* handle, int32_t device_idx, int32_t local_trans_idx);
void AUTDSetTransFrequency(void* handle, int32_t device_idx, int32_t local_trans_idx, double frequency);
uint16_t AUTDGetTransCycle(void* handle, int32_t device_idx, int32_t local_trans_idx);
void AUTDSetTransCycle(void* handle, int32_t device_idx, int32_t local_trans_idx, uint16_t cycle);
double AUTDGetWavelength(void* handle, int32_t device_idx, int32_t local_trans_idx, double sound_speed);
double AUTDGetAttenuation(void* handle);
void AUTDSetAttenuation(void* handle, double attenuation);
bool AUTDGetFPGAInfo(void* handle, uint8_t* out);
int32_t AUTDUpdateFlags(void* handle);
int32_t AUTDNumDevices(void* handle);
void AUTDTransPosition(void* handle, int32_t device_idx, int32_t local_trans_idx, double* x, double* y, double* z);
void AUTDTransXDirection(void* handle, int32_t device_idx, int32_t local_trans_idx, double* x, double* y, double* z);
void AUTDTransYDirection(void* handle, int32_t device_idx, int32_t local_trans_idx, double* x, double* y, double* z);
void AUTDTransZDirection(void* handle, int32_t device_idx, int32_t local_trans_idx, double* x, double* y, double* z);
int32_t AUTDGetFirmwareInfoListPointer(void* handle, void** out);
void AUTDGetFirmwareInfo(void* p_firm_info_list, int32_t index, int8_t* info);
void AUTDFreeFirmwareInfoListPointer(void* p_firm_info_list);
void AUTDGainNull(void** gain);
void AUTDGainGrouped(void** gain, void* handle);
void AUTDGainGroupedAdd(void* grouped_gain, int32_t device_id, void* gain);
void AUTDGainFocus(void** gain, double x, double y, double z, double amp);
void AUTDGainBesselBeam(void** gain, double x, double y, double z, double n_x, double n_y, double n_z, double theta_z, double amp);
void AUTDGainPlaneWave(void** gain, double n_x, double n_y, double n_z, double amp);
void AUTDGainCustom(void** gain, double* amp, double* phase, uint64_t size);
void AUTDDeleteGain(void* gain);
void AUTDModulationStatic(void** mod, double amp);
void AUTDModulationSine(void** mod, int32_t freq, double amp, double offset);
void AUTDModulationSineSquared(void** mod, int32_t freq, double amp, double offset);
void AUTDModulationSineLegacy(void** mod, double freq, double amp, double offset);
void AUTDModulationSquare(void** mod, int32_t freq, double low, double high, double duty);
void AUTDModulationCustom(void** mod, uint8_t* buffer, uint64_t size, uint32_t freq_div);
uint32_t AUTDModulationSamplingFrequencyDivision(void* mod);
void AUTDModulationSetSamplingFrequencyDivision(void* mod, uint32_t freq_div);
double AUTDModulationSamplingFrequency(void* mod);
void AUTDDeleteModulation(void* mod);
void AUTDPointSTM(void** out);
void AUTDGainSTM(void** out, void* handle);
bool AUTDPointSTMAdd(void* stm, double x, double y, double z, uint8_t shift);
bool AUTDGainSTMAdd(void* stm, void* gain);
uint16_t AUTDGetGainSTMMode(void* stm);
void AUTDSetGainSTMMode(void* stm, uint16_t mode);
double AUTDSTMSetFrequency(void* stm, double freq);
double AUTDSTMFrequency(void* stm);
double AUTDSTMSamplingFrequency(void* stm);
uint32_t AUTDSTMSamplingFrequencyDivision(void* stm);
void AUTDSTMSetSamplingFrequencyDivision(void* stm, uint32_t freq_div);
void AUTDDeleteSTM(void* stm);
int32_t AUTDStop(void* handle);
void AUTDCreateSilencer(void** out, uint16_t step, uint16_t cycle);
void AUTDDeleteSilencer(void* config);
int32_t AUTDSend(void* handle, void* header, void* body);
void AUTDSetModDelay(void* handle, int32_t device_idx, int32_t local_trans_idx, uint16_t delay);
void AUTDCreateModDelayConfig(void** out);
void AUTDDeleteModDelayConfig(void* config);
void AUTDCreateAmplitudes(void** out, void* handle, double amp);
void AUTDDeleteAmplitudes(void* amplitudes);
void AUTDSetMode(uint8_t mode);
