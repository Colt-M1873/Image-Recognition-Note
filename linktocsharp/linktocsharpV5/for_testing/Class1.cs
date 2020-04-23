/*
* MATLAB Compiler: 6.4 (R2017a)
* Date: Tue Mar 24 11:30:43 2020
* Arguments:
* "-B""macro_default""-W""dotnet:linktocsharpV5,Class1,4.0,private""-T""link:lib""-d""C:\U
* sers\lenovo\Desktop\linktocsharpV5\for_testing""-v""class{Class1:C:\Users\lenovo\Desktop
* \linktocsharpV5.m}"
*/
using System;
using System.Reflection;
using System.IO;
using MathWorks.MATLAB.NET.Arrays;
using MathWorks.MATLAB.NET.Utility;

#if SHARED
[assembly: System.Reflection.AssemblyKeyFile(@"")]
#endif

namespace linktocsharpV5
{

  /// <summary>
  /// The Class1 class provides a CLS compliant, MWArray interface to the MATLAB
  /// functions contained in the files:
  /// <newpara></newpara>
  /// C:\Users\lenovo\Desktop\linktocsharpV5.m
  /// </summary>
  /// <remarks>
  /// @Version 4.0
  /// </remarks>
  public class Class1 : IDisposable
  {
    #region Constructors

    /// <summary internal= "true">
    /// The static constructor instantiates and initializes the MATLAB Runtime instance.
    /// </summary>
    static Class1()
    {
      if (MWMCR.MCRAppInitialized)
      {
        try
        {
          Assembly assembly= Assembly.GetExecutingAssembly();

          string ctfFilePath= assembly.Location;

          int lastDelimiter= ctfFilePath.LastIndexOf(@"\");

          ctfFilePath= ctfFilePath.Remove(lastDelimiter, (ctfFilePath.Length - lastDelimiter));

          string ctfFileName = "linktocsharpV5.ctf";

          Stream embeddedCtfStream = null;

          String[] resourceStrings = assembly.GetManifestResourceNames();

          foreach (String name in resourceStrings)
          {
            if (name.Contains(ctfFileName))
            {
              embeddedCtfStream = assembly.GetManifestResourceStream(name);
              break;
            }
          }
          mcr= new MWMCR("",
                         ctfFilePath, embeddedCtfStream, true);
        }
        catch(Exception ex)
        {
          ex_ = new Exception("MWArray assembly failed to be initialized", ex);
        }
      }
      else
      {
        ex_ = new ApplicationException("MWArray assembly could not be initialized");
      }
    }


    /// <summary>
    /// Constructs a new instance of the Class1 class.
    /// </summary>
    public Class1()
    {
      if(ex_ != null)
      {
        throw ex_;
      }
    }


    #endregion Constructors

    #region Finalize

    /// <summary internal= "true">
    /// Class destructor called by the CLR garbage collector.
    /// </summary>
    ~Class1()
    {
      Dispose(false);
    }


    /// <summary>
    /// Frees the native resources associated with this object
    /// </summary>
    public void Dispose()
    {
      Dispose(true);

      GC.SuppressFinalize(this);
    }


    /// <summary internal= "true">
    /// Internal dispose function
    /// </summary>
    protected virtual void Dispose(bool disposing)
    {
      if (!disposed)
      {
        disposed= true;

        if (disposing)
        {
          // Free managed resources;
        }

        // Free native resources
      }
    }


    #endregion Finalize

    #region Methods

    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the linktocsharpV5 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// origImg=imread('D:\MVS_Data(’’∆¨)\…≥≥æÕºœÒ\–°ø≈¡£\1.bmp');
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray linktocsharpV5()
    {
      return mcr.EvaluateFunction("linktocsharpV5", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the linktocsharpV5 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// origImg=imread('D:\MVS_Data(’’∆¨)\…≥≥æÕºœÒ\–°ø≈¡£\1.bmp');
    /// </remarks>
    /// <param name="path">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray linktocsharpV5(MWArray path)
    {
      return mcr.EvaluateFunction("linktocsharpV5", path);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the linktocsharpV5 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// origImg=imread('D:\MVS_Data(’’∆¨)\…≥≥æÕºœÒ\–°ø≈¡£\1.bmp');
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] linktocsharpV5(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "linktocsharpV5", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the linktocsharpV5 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// origImg=imread('D:\MVS_Data(’’∆¨)\…≥≥æÕºœÒ\–°ø≈¡£\1.bmp');
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="path">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] linktocsharpV5(int numArgsOut, MWArray path)
    {
      return mcr.EvaluateFunction(numArgsOut, "linktocsharpV5", path);
    }


    /// <summary>
    /// Provides an interface for the linktocsharpV5 function in which the input and
    /// output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// origImg=imread('D:\MVS_Data(’’∆¨)\…≥≥æÕºœÒ\–°ø≈¡£\1.bmp');
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void linktocsharpV5(int numArgsOut, ref MWArray[] argsOut, MWArray[] argsIn)
    {
      mcr.EvaluateFunction("linktocsharpV5", numArgsOut, ref argsOut, argsIn);
    }



    /// <summary>
    /// This method will cause a MATLAB figure window to behave as a modal dialog box.
    /// The method will not return until all the figure windows associated with this
    /// component have been closed.
    /// </summary>
    /// <remarks>
    /// An application should only call this method when required to keep the
    /// MATLAB figure window from disappearing.  Other techniques, such as calling
    /// Console.ReadLine() from the application should be considered where
    /// possible.</remarks>
    ///
    public void WaitForFiguresToDie()
    {
      mcr.WaitForFiguresToDie();
    }



    #endregion Methods

    #region Class Members

    private static MWMCR mcr= null;

    private static Exception ex_= null;

    private bool disposed= false;

    #endregion Class Members
  }
}
