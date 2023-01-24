package br.com.stone.sdk_flutter.printers

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.graphics.Bitmap
import android.os.Build
import android.os.IBinder
import android.os.RemoteException
import android.util.Log
import com.xcheng.printerservice.IPrinterCallback
import com.xcheng.printerservice.IPrinterService

internal class PositivoL3Printer(private val context: Context) {
    var totalLen = 0L
    var currentLen = 0L
    var realTotalLen = 0.0
    var realCurrentLen = 0.0
    private val mListener: PrinterManagerListener? = null
    private var mCallback: IPrinterCallback? = null
    private var mPrinterService: IPrinterService? = null

    interface PrinterManagerListener {
        fun onServiceConnected()
        fun onServiceDisconnected()
    }

    private val mConnectionService: ServiceConnection = object : ServiceConnection {
        override fun onServiceDisconnected(name: ComponentName) {
            this@PositivoL3Printer.mPrinterService = null
            this@PositivoL3Printer.mListener?.onServiceDisconnected()
        }

        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            this@PositivoL3Printer.mPrinterService = IPrinterService.Stub.asInterface(service)
            this@PositivoL3Printer.mListener?.onServiceConnected()
        }
    }

    fun startPrinterService() {
        this.mCallback = object : IPrinterCallback.Stub() {
            @Throws(RemoteException::class)
            override fun onException(code: Int, msg: String) {
                Log.w(TAG, "onException($code,$msg)")
            }

            @Throws(RemoteException::class)
            override fun onLength(current: Long, total: Long) {
                Log.w(TAG, "onLength: start")
                this@PositivoL3Printer.currentLen = current
                this@PositivoL3Printer.totalLen = total
                Log.w(TAG, "onLength: end")
            }

            override fun onComplete() {
                Log.i(TAG, "onComplete: start")
            }

            @Throws(RemoteException::class)
            override fun onRealLength(realCurrent: Double, realTotal: Double) {
                Log.i(TAG, "onReal Length: start")
                this@PositivoL3Printer.realCurrentLen = realCurrent
                this@PositivoL3Printer.realTotalLen = realTotal
                Log.i(TAG, "realCurrent=$realCurrent, realTotal=$realTotal")
                Log.i(TAG, "onReal Length: end")
            }
        }
        val intent = Intent()
        intent.setPackage("com.xcheng.printerservice")
        intent.action = "com.xcheng.printerservice.IPrinterService"
        this.context.startService(intent)
        this.context.bindService(intent, mConnectionService, Context.BIND_AUTO_CREATE)
    }

    fun printText(text: String?) {
        try {
            mPrinterService!!.printText(text, mCallback)
        } catch (var3: java.lang.Exception) {
            Log.d(TAG, "Caiu no exception do MANAGER printText: " + var3.message)
        }
    }

    fun printBitmap(bitmap: Bitmap?) {
        try {
            mPrinterService!!.printBitmap(bitmap, mCallback)
        } catch (var3: java.lang.Exception) {
            var3.printStackTrace()
        }
    }

    fun printWrapPaper(n: Int) {
        try {
            mPrinterService!!.printWrapPaper(n, mCallback)
        } catch (var3: java.lang.Exception) {
            var3.printStackTrace()
        }
    }

    fun printerInit() {
        try {
            mPrinterService!!.printerInit(mCallback)
        } catch (var2: java.lang.Exception) {
            var2.printStackTrace()
        }
    }

    companion object {
        fun isPositivoL3(): Boolean {
            return Build.MANUFACTURER == "Positivo" && Build.MODEL == "L3"
        }

        private const val TAG: String = "PositivoL3Printer"
    }
}