package br.com.stone.sdk_flutter.printers

import android.content.Context
import android.graphics.Bitmap
import android.os.Build
import com.sunmi.peripheral.printer.InnerPrinterCallback
import com.sunmi.peripheral.printer.InnerPrinterException
import com.sunmi.peripheral.printer.InnerPrinterManager
import com.sunmi.peripheral.printer.SunmiPrinterService

internal class SunmiPrinter(private val applicationContext: Context) {
    private var sunmiPrinterService: SunmiPrinterService? = null

    fun initSunmiPrinterService(context: Context?) {
        try {
            val ret = InnerPrinterManager.getInstance().bindService(
                context,
                innerPrinterCallback
            )
            if (!ret) {
                sunmiPrinter = NoSunmiPrinter
            }
        } catch (e: InnerPrinterException) {
            e.printStackTrace()
        }
    }

    private fun checkSunmiPrinterService(service: SunmiPrinterService) {
        var ret = false
        try {
            ret = InnerPrinterManager.getInstance().hasPrinter(service)
        } catch (e: InnerPrinterException) {
            e.printStackTrace()
        }
        sunmiPrinter = if (ret) FoundSunmiPrinter else NoSunmiPrinter
    }

    fun initPrinter() {
        if (sunmiPrinterService == null) {
            return
        }

        sunmiPrinterService!!.printerInit(null)
    }

    fun printBitmap(bitmap: Bitmap?) {
        if (sunmiPrinterService == null) {
            return
        }

        sunmiPrinterService!!.printBitmap(bitmap, null)
    }


    private val innerPrinterCallback: InnerPrinterCallback = object : InnerPrinterCallback() {
        override fun onConnected(service: SunmiPrinterService) {
            sunmiPrinterService = service
            checkSunmiPrinterService(service)
        }

        override fun onDisconnected() {
            sunmiPrinterService = null
            sunmiPrinter = LostSunmiPrinter
        }
    }

    companion object {
        var NoSunmiPrinter = 0x00000000
        var CheckSunmiPrinter = 0x00000001
        var FoundSunmiPrinter = 0x00000002
        var LostSunmiPrinter = 0x00000003

        var sunmiPrinter = CheckSunmiPrinter

        fun isSunmi(): Boolean {
            return Build.MANUFACTURER == "Sunmi"
        }

        private const val TAG: String = "SunmiPrinter"
    }
}