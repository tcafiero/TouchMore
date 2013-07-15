/* File : glue.i */
%module TouchMore

%{
#include "libdirana.h"

%}

/* Force the generated Java code to use the C enum values rather than making a JNI call */
%javaconst(1);

/* Let's just grab the original header file here */

typedef enum {
   SRC_NO_SOURCE,
   SRC_TUNER,
   SRC_CD,
   SRC_MP3,
   SRC_CDC,
   SRC_AUX,
   SRC_PHONE,//12s4
   SRC_TTS,
   SRC_TA_PTY,
   SRC_TTS_ON_AUX,
   SRC_AUX_CONVERGENCE,
   SRC_MAX_AUDIO_SOURCES

}  DR_AUDIO_SOURCES_TYPES;

typedef enum {

   ERROR,
   OK
}  STATUS;

typedef enum {

   AMP_NO_CHANNEL,
   AMP_FRONT_CHANNEL,
   AMP_REAR_CHANNEL,
   AMP_END_CHANNEL

} AMPLI_CHANNEL;


typedef enum {
   NO_GAIN,
   LOW_GAIN12,
   HIGH_GAIN26,
   END_GAIN

} AMPLI_GAINS;


typedef enum
{
	FM_BAND,
	AM_BAND
}TYPE_BAND;

typedef enum
{
	AM_MW_BAND,
	AM_KW_BAND
}TYPE_SUB_BAND;

/* library APIs  declarations */
extern STATUS initDirana(void);
STATUS setSource(DR_AUDIO_SOURCES_TYPES p_source );
STATUS getSource(DR_AUDIO_SOURCES_TYPES *p_source);
extern STATUS setVolume(int p_volume);
STATUS getVolume(int *p_volume);
STATUS setChannelGain(AMPLI_CHANNEL p_channel,
                      AMPLI_GAINS p_gain);
STATUS getChannelGain(AMPLI_CHANNEL p_channel,
                      AMPLI_GAINS *p_gain);
STATUS playSin(int p_volume);
STATUS doMute(void);
STATUS doDeMute(void);

STATUS change_band(TYPE_BAND p_new_band);
void get_band(TYPE_BAND TYPE_SUB_BAND, char p_subband);
STATUS set_frequency(int p_frequency, TYPE_BAND p_band, TYPE_SUB_BAND p_subAM_band);
int get_frequency();

STATUS set_LeafDiceCfg(int p_freq, TYPE_BAND p_band, TYPE_SUB_BAND p_subAM_band);
STATUS get_Freq_Band_fromTuner(int *p_freq, TYPE_BAND *p_band, TYPE_SUB_BAND *p_subband);

STATUS setSourceAUX();
STATUS SetAuxOnPrimaryStereo();
STATUS SetTunerOnPrimaryStereo();
STATUS SetI2SOnPrimaryStereo();
STATUS SetCdcOnPrimaryStereo();
STATUS SetPhoneOnPrimaryStereo();
///******************************///
