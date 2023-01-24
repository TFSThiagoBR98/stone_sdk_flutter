package br.com.stone.sdk_flutter.helpers

import android.content.Context
import android.content.pm.PackageManager
import stone.utils.Stone

/**
 * Based on https://github.com/EightSystems/react-native-stone-pos
 * Commit: 5108c3afb0a9095fff54c4e4248002eff49862b6
 */
class StoneTransactionHelpers {
    companion object {
        private const val PACKAGE_NAME = "br.com.stone.posandroid.acquirerapp"

        fun isRunningInPOS(context: Context): Boolean {
            return try {
                val packageManager: PackageManager = context.packageManager

                packageManager.getPackageInfo(
                        PACKAGE_NAME, 0
                )

                true
            } catch (e: PackageManager.NameNotFoundException) {
                false
            }
        }

        fun isSDKInitialized(): Boolean {
            return Stone.isInitialized()
        }
    }
}