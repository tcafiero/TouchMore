/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.40
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


class TouchMoreJNI {
  public final static native int initDirana();
  public final static native int setSource(int jarg1);
  public final static native int getSource(long jarg1);
  public final static native int setVolume(int jarg1);
  public final static native int getVolume(long jarg1);
  public final static native int setChannelGain(int jarg1, int jarg2);
  public final static native int getChannelGain(int jarg1, long jarg2);
  public final static native int playSin(int jarg1);
  public final static native int doMute();
  public final static native int doDeMute();
  public final static native int change_band(int jarg1);
  public final static native void get_band(int jarg1, char jarg2);
  public final static native int set_frequency(int jarg1, int jarg2, int jarg3);
  public final static native int get_frequency();
  public final static native int set_LeafDiceCfg(int jarg1, int jarg2, int jarg3);
  public final static native int get_Freq_Band_fromTuner(long jarg1, long jarg2, long jarg3);
  public final static native int setSourceAUX();
  public final static native int SetAuxOnPrimaryStereo();
  public final static native int SetTunerOnPrimaryStereo();
  public final static native int SetI2SOnPrimaryStereo();
  public final static native int SetCdcOnPrimaryStereo();
  public final static native int SetPhoneOnPrimaryStereo();
}