#include <stdio.h>
#include "libdirana.h"



STATUS initDirana(void)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}

STATUS setSource(DR_AUDIO_SOURCES_TYPES p_source )
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}

STATUS getSource(DR_AUDIO_SOURCES_TYPES *p_source)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}

STATUS setVolume(int p_volume)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}

STATUS getVolume(int *p_volume)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}

STATUS setChannelGain(AMPLI_CHANNEL p_channel,AMPLI_GAINS p_gain)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}

STATUS getChannelGain(AMPLI_CHANNEL p_channel,AMPLI_GAINS *p_gain)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}

STATUS playSin(int p_volume)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
STATUS doMute(void)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
STATUS doDeMute(void)
{
//	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}

STATUS change_band(TYPE_BAND p_new_band)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
void get_band(TYPE_BAND p_band, TYPE_SUB_BAND p_subband)
{
	printf("function called: %s\n", __FUNCTION__ );
}
STATUS set_frequency(int p_frequency, TYPE_BAND p_band, TYPE_SUB_BAND p_subAM_band)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
int get_frequency()
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}

STATUS set_LeafDiceCfg(int p_freq, TYPE_BAND p_band, TYPE_SUB_BAND p_subAM_band)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
STATUS get_Freq_Band_fromTuner(int *p_freq, TYPE_BAND *p_band, TYPE_SUB_BAND *p_subband)
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}


STATUS setSourceAUX()
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
STATUS SetAuxOnPrimaryStereo()
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
STATUS SetTunerOnPrimaryStereo()
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
STATUS SetI2SOnPrimaryStereo()
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
STATUS SetCdcOnPrimaryStereo()
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
STATUS SetPhoneOnPrimaryStereo()
{
	printf("function called: %s\n", __FUNCTION__ );
	return OK;
}
