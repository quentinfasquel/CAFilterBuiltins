//
//  CAFilterType.swift
//  CAFilterBuiltins
//
//  Created by Quentin Fasquel on 31/08/2025.
//

///
///
///
public enum CAFilterType: String, CaseIterable {
    case alphaThreshold
    case alphaSmoothThreshold
    case multiplyColor
    case colorAdd
    case colorSubtract
    case colorMonochrome
    case colorMatrix
    case colorHueRotate
    case colorSaturate
    case colorBrightness
    case colorContrast
    case colorInvert
    case colorInvertDisplayAware
    case compressLuminance
    case opacityPair
    case meteor
    case srl
    case edrGain
    case edrGainMultiply
    case luminanceToAlpha
    case bias
    case distanceField
    case gaussianBlur
    case variableBlur
    case glassBackground
    case glassForeground
    case chromaticAberration
    case chromaticAberrationMap
    case displacementMap
    case luminanceMap
    case luminanceCurveMap
    case curves
    case averageColor
    case lanczosResize
    case pageCurl
    case sdrNormalize
    case vibrantDark
    case vibrantLight
    case vibrantColorMatrix
    case limitAveragePixelLuminance
    case lut
    case vibrantColorMatrixSourceOver
}
