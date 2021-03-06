/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.40
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public final class STATUS {
  public final static STATUS ERROR = new STATUS("ERROR");
  public final static STATUS OK = new STATUS("OK");

  public final int swigValue() {
    return swigValue;
  }

  public String toString() {
    return swigName;
  }

  public static STATUS swigToEnum(int swigValue) {
    if (swigValue < swigValues.length && swigValue >= 0 && swigValues[swigValue].swigValue == swigValue)
      return swigValues[swigValue];
    for (int i = 0; i < swigValues.length; i++)
      if (swigValues[i].swigValue == swigValue)
        return swigValues[i];
    throw new IllegalArgumentException("No enum " + STATUS.class + " with value " + swigValue);
  }

  private STATUS(String swigName) {
    this.swigName = swigName;
    this.swigValue = swigNext++;
  }

  private STATUS(String swigName, int swigValue) {
    this.swigName = swigName;
    this.swigValue = swigValue;
    swigNext = swigValue+1;
  }

  private STATUS(String swigName, STATUS swigEnum) {
    this.swigName = swigName;
    this.swigValue = swigEnum.swigValue;
    swigNext = this.swigValue+1;
  }

  private static STATUS[] swigValues = { ERROR, OK };
  private static int swigNext = 0;
  private final int swigValue;
  private final String swigName;
}

