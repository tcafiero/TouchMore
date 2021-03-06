/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.40
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public final class DR_AUDIO_SOURCES_TYPES {
  public final static DR_AUDIO_SOURCES_TYPES SRC_NO_SOURCE = new DR_AUDIO_SOURCES_TYPES("SRC_NO_SOURCE");
  public final static DR_AUDIO_SOURCES_TYPES SRC_TUNER = new DR_AUDIO_SOURCES_TYPES("SRC_TUNER");
  public final static DR_AUDIO_SOURCES_TYPES SRC_CD = new DR_AUDIO_SOURCES_TYPES("SRC_CD");
  public final static DR_AUDIO_SOURCES_TYPES SRC_MP3 = new DR_AUDIO_SOURCES_TYPES("SRC_MP3");
  public final static DR_AUDIO_SOURCES_TYPES SRC_CDC = new DR_AUDIO_SOURCES_TYPES("SRC_CDC");
  public final static DR_AUDIO_SOURCES_TYPES SRC_AUX = new DR_AUDIO_SOURCES_TYPES("SRC_AUX");
  public final static DR_AUDIO_SOURCES_TYPES SRC_PHONE = new DR_AUDIO_SOURCES_TYPES("SRC_PHONE");
  public final static DR_AUDIO_SOURCES_TYPES SRC_TTS = new DR_AUDIO_SOURCES_TYPES("SRC_TTS");
  public final static DR_AUDIO_SOURCES_TYPES SRC_TA_PTY = new DR_AUDIO_SOURCES_TYPES("SRC_TA_PTY");
  public final static DR_AUDIO_SOURCES_TYPES SRC_TTS_ON_AUX = new DR_AUDIO_SOURCES_TYPES("SRC_TTS_ON_AUX");
  public final static DR_AUDIO_SOURCES_TYPES SRC_AUX_CONVERGENCE = new DR_AUDIO_SOURCES_TYPES("SRC_AUX_CONVERGENCE");
  public final static DR_AUDIO_SOURCES_TYPES SRC_MAX_AUDIO_SOURCES = new DR_AUDIO_SOURCES_TYPES("SRC_MAX_AUDIO_SOURCES");

  public final int swigValue() {
    return swigValue;
  }

  public String toString() {
    return swigName;
  }

  public static DR_AUDIO_SOURCES_TYPES swigToEnum(int swigValue) {
    if (swigValue < swigValues.length && swigValue >= 0 && swigValues[swigValue].swigValue == swigValue)
      return swigValues[swigValue];
    for (int i = 0; i < swigValues.length; i++)
      if (swigValues[i].swigValue == swigValue)
        return swigValues[i];
    throw new IllegalArgumentException("No enum " + DR_AUDIO_SOURCES_TYPES.class + " with value " + swigValue);
  }

  private DR_AUDIO_SOURCES_TYPES(String swigName) {
    this.swigName = swigName;
    this.swigValue = swigNext++;
  }

  private DR_AUDIO_SOURCES_TYPES(String swigName, int swigValue) {
    this.swigName = swigName;
    this.swigValue = swigValue;
    swigNext = swigValue+1;
  }

  private DR_AUDIO_SOURCES_TYPES(String swigName, DR_AUDIO_SOURCES_TYPES swigEnum) {
    this.swigName = swigName;
    this.swigValue = swigEnum.swigValue;
    swigNext = this.swigValue+1;
  }

  private static DR_AUDIO_SOURCES_TYPES[] swigValues = { SRC_NO_SOURCE, SRC_TUNER, SRC_CD, SRC_MP3, SRC_CDC, SRC_AUX, SRC_PHONE, SRC_TTS, SRC_TA_PTY, SRC_TTS_ON_AUX, SRC_AUX_CONVERGENCE, SRC_MAX_AUDIO_SOURCES };
  private static int swigNext = 0;
  private final int swigValue;
  private final String swigName;
}

