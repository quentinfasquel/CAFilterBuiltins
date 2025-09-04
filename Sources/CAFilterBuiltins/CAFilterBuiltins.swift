//
//  CAFilterBuiltins.swift
//  CAFilterBuiltins
//
//  Created by Quentin Fasquel on 31/08/2025.
//

@_exported import CAFilter
import CAFilterBuiltinsMacros
import QuartzCore
import CoreImage

public typealias CMatrix = CIVector

///
///
///
public protocol CAAlphaThreshold: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
    var inputColor: CGColor? { get set }
}

///
///
///
public protocol CAAlphaSmoothThreshold: CAFilterProtocol {
    var inputStart: CGFloat? { get set }
    var inputEnd: CGFloat? { get set }
    var inputAmount: CGFloat? { get set }
    var inputColor: CGColor? { get set }
}

///
///
///
public protocol CAMultiplyColor: CAFilterProtocol {
    var inputColor: CGColor? { get set }
}

///
///
///
public protocol CAColorAdd: CAFilterProtocol {
    var inputColor: CGColor? { get set }
}

///
///
///
public protocol CAColorSubtract: CAFilterProtocol {
    var inputColor: CGColor? { get set }
}

///
///
///
public protocol CAColorMonochrome: CAFilterProtocol {
    var inputBias: CGFloat? { get set }
    var inputAmount: CGFloat? { get set }
    var inputColor: CGColor? { get set }
}

///
///
///
public protocol CAColorMatrix: CAFilterProtocol {
    var inputColorMatrix: CMatrix? { get set }
    var inputPremultipliedValues: Bool? { get set }
}

///
///
///
public protocol CAColorHueRotate: CAFilterProtocol {
    var inputAngle: CGFloat? { get set }
    var inputHSVSpace: Bool? { get set }
}

///
///
///
public protocol CAColorSaturate: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
}

///
///
///
public protocol CAColorBrightness: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
}

///
///
///
public protocol CAColorContrast: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
}

///
///
///
public protocol CAColorInvert: CAFilterProtocol {
    
}

///
///
///
public protocol CAColorInvertDisplayAware: CAFilterProtocol {
    
}

///
///
///
public protocol CACompressLuminance: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
}

///
///
///
public protocol CAOpacityPair: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
}

///
///
///
public protocol CAMeteor: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
    var inputScale: CGFloat? { get set }
}

///
///
///
public protocol CASrl: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
}

///
///
///
public protocol CAEdrGain: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
    var inputScale: CGFloat? { get set }
}

///
///
///
public protocol CAEdrGainMultiply: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
    var inputScale: CGFloat? { get set }
    var inputAllowsGroup: Bool? { get set }
    var inputAdaptive: Bool? { get set }
    var inputStart: CGFloat? { get set }
    var inputEnd: CGFloat? { get set }
}

///
///
///
public protocol CALuminanceToAlpha: CAFilterProtocol {
    var inputPremultipliedValues: Bool? { get set }
}

///
///
///
public protocol CABias: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
}

///
///
///
public protocol CADistanceField: CAFilterProtocol {
    var renderMode: Any? { get set }
    var invertsShape: Bool? { get set }
    var foregroundColor: CGColor? { get set }
    var offset: CGFloat? { get set }
    var sharpness: CGFloat? { get set }
    var lineWidth: CGFloat? { get set }
}

///
///
///
public protocol CAGaussianBlur: CAFilterProtocol {
    var inputQuality: Any? { get set }
    var inputRadius: CGFloat? { get set }
    var inputBounds: CGRect? { get set }
    var inputHardEdges: Bool? { get set }
    var inputNormalizeEdges: Bool? { get set }
    var inputNormalizeEdgesTransparent: Bool? { get set }
    var inputDither: Bool? { get set }
    var inputLinear: Bool? { get set }
    var inputIntermediateBitDepth: Any? { get set }
}

///
///
///
public protocol CAVariableBlur: CAFilterProtocol {
    var inputMaskImage: CGImage? { get set }
    var inputRadius: CGFloat? { get set }
    var inputNormalizeEdges: Bool? { get set }
    var inputNormalizeEdgesTransparent: Bool? { get set }
    var inputFade: Bool? { get set }
    var inputDither: Bool? { get set }
    var inputSourceSublayerName: Any? { get set }
}

///
///
///
public protocol CAGlassBackground: CAFilterProtocol {
    var inputSourceSublayerName: Any? { get set }
    var inputInnerRefractionAmount: CGFloat? { get set }
    var inputInnerRefractionHeight: CGFloat? { get set }
    var inputOuterRefractionAmount: CGFloat? { get set }
    var inputOuterRefractionHeight: CGFloat? { get set }
    var inputRefractionDistance0: CGFloat? { get set }
    var inputRefractionDistance1: CGFloat? { get set }
    var inputRefractionOpacity: CGFloat? { get set }
    var inputBlurRadius: CGFloat? { get set }
    var inputBlurOpacity0: CGFloat? { get set }
    var inputBlurOpacity1: CGFloat? { get set }
    var inputBlurOpacity2: CGFloat? { get set }
    var inputBlurOpacity3: CGFloat? { get set }
    var inputBlurOpacity4: CGFloat? { get set }
    var inputBlurDistance0: CGFloat? { get set }
    var inputBlurDistance1: CGFloat? { get set }
    var inputBlurDistance2: CGFloat? { get set }
    var inputBlurDistance3: CGFloat? { get set }
    var inputBlurDistance4: CGFloat? { get set }
    var inputFaceOpacity: CGFloat? { get set }
    var inputFaceColorMatrixWhite: CGFloat? { get set }
    var inputFaceColorMatrixBlack: CGFloat? { get set }
    var inputFaceColorMatrixSaturation: CGFloat? { get set }
    var inputFaceColorMatrixFillColor: CGColor? { get set }
    var inputBleedAmount: CGFloat? { get set }
    var inputBleedHeight: CGFloat? { get set }
    var inputBleedBlurRadius: CGFloat? { get set }
    var inputBleedDistance0: CGFloat? { get set }
    var inputBleedDistance1: CGFloat? { get set }
    var inputBleedOpacity: CGFloat? { get set }
    var inputBleedDarkenBlend: Bool? { get set }
    var inputBleedColorMatrixWhite: CGFloat? { get set }
    var inputBleedColorMatrixBlack: CGFloat? { get set }
    var inputBleedColorMatrixSaturation: CGFloat? { get set }
    var inputBleedColorMatrixFillColor: CGColor? { get set }
    var inputShadowOffset: CGPoint? { get set }
    var inputShadowAmount: CGFloat? { get set }
    var inputShadowHeight: CGFloat? { get set }
    var inputShadowOpacity: CGFloat? { get set }
    var inputShadowColorMatrixWhite: CGFloat? { get set }
    var inputShadowColorMatrixBlack: CGFloat? { get set }
    var inputShadowColorMatrixSaturation: CGFloat? { get set }
    var inputShadowColorMatrixFillColor: CGColor? { get set }
    var inputShadowDistanceOffset: CGFloat? { get set }
    var inputShadowBlurRadius: CGFloat? { get set }
    var inputShadowRadius: CGFloat? { get set }
    var inputSDRHoldingToneEnabled: Bool? { get set }
    var inputSDRHoldingToneWhite: CGFloat? { get set }
    var inputSDRGradientDistance0: CGFloat? { get set }
    var inputSDRGradientDistance1: CGFloat? { get set }
    var inputSDRShadowOpacity: CGFloat? { get set }
    var inputMaxHeadroom: CGFloat? { get set }
    var inputShadowVibrancyContribution: CGFloat? { get set }
    var inputClamp: CGFloat? { get set }
    var inputClampPreserveHue: Bool? { get set }
}

///
///
///
public protocol CAGlassForeground: CAFilterProtocol {
    var inputSourceSublayerName: Any? { get set }
    var inputRefractionAmount: CGFloat? { get set }
    var inputRefractionHeight: CGFloat? { get set }
    var inputRefractionOffset: CGFloat? { get set }
    var inputAberrationAmount: CGFloat? { get set }
    var inputAberrationHeight: CGFloat? { get set }
    var inputAberrationOffset: CGFloat? { get set }
    var inputAberrationAngle: CGFloat? { get set }
    var inputEdgeStart: CGFloat? { get set }
    var inputEdgeEnd: CGFloat? { get set }
    var inputEdgeOpacityStart: CGFloat? { get set }
    var inputEdgeOpacityEnd: CGFloat? { get set }
}

///
///
///
public protocol CAChromaticAberration: CAFilterProtocol {
    var inputRedOffset: CGPoint? { get set }
    var inputBlueOffset: CGPoint? { get set }
    var inputGreenOffset: CGPoint? { get set }
    var inputExtendEdges: Bool? { get set }
}

///
///
///
public protocol CAChromaticAberrationMap: CAFilterProtocol {
    var inputMaskImage: CGImage? { get set }
    var inputOffset: CGPoint? { get set }
    var inputAmount: CGFloat? { get set }
    var inputSourceSublayerName: Any? { get set }
}

///
///
///
public protocol CADisplacementMap: CAFilterProtocol {
    var inputMaskImage: CGImage? { get set }
    var inputOffset: CGPoint? { get set }
    var inputAmount: CGFloat? { get set }
    var inputSourceSublayerName: Any? { get set }
}

///
///
///
public protocol CALuminanceMap: CAFilterProtocol {
    var inputColorMap: CGImage? { get set }
    var inputAmount: CGFloat? { get set }
}

///
///
///
public protocol CALuminanceCurveMap: CAFilterProtocol {
    var inputValues: Any? { get set }
    var inputAmount: CGFloat? { get set }
}

///
///
///
public protocol CACurves: CAFilterProtocol {
    var inputRedValues: Any? { get set }
    var inputGreenValues: Any? { get set }
    var inputBlueValues: Any? { get set }
    var inputAlphaValues: Any? { get set }
}

///
///
///
public protocol CAAverageColor: CAFilterProtocol {
    
}

///
///
///
public protocol CALanczosResize: CAFilterProtocol {
    var inputScale: CGFloat? { get set }
    var inputAspectRatio: CGFloat? { get set }
}

///
///
///
public protocol CAPageCurl: CAFilterProtocol {
    var inputAngle: CGFloat? { get set }
    var inputRadius: CGFloat? { get set }
    var inputTime: CGFloat? { get set }
    var inputStartAngle: CGFloat? { get set }
    var inputEndAngle: CGFloat? { get set }
    var inputBackEnabled: Bool? { get set }
    var inputBackColor0: CGColor? { get set }
    var inputBackColor1: CGColor? { get set }
    var inputFrontEnabled: Bool? { get set }
    var inputFrontColor: CGColor? { get set }
    var inputShadowColor: CGColor? { get set }
    var inputShadowBounds: CGRect? { get set }
}

///
///
///
public protocol CASdrNormalize: CAFilterProtocol {
    var inputClamp: CGFloat? { get set }
    var inputClampPreserveHue: Bool? { get set }
}

///
///
///
public protocol CAVibrantDark: CAFilterProtocol {
    var inputColor0: CGColor? { get set }
    var inputColor1: CGColor? { get set }
    var inputReversed: Bool? { get set }
}

///
///
///
public protocol CAVibrantLight: CAFilterProtocol {
    var inputColor0: CGColor? { get set }
    var inputColor1: CGColor? { get set }
    var inputReversed: Bool? { get set }
}

///
///
///
public protocol CAVibrantColorMatrix: CAFilterProtocol {
    var inputColorMatrix: CMatrix? { get set }
    var inputBackdropAware: Bool? { get set }
    var inputClamp: CGFloat? { get set }
    var inputClampPreserveHue: Bool? { get set }
}

///
///
///
public protocol CALimitAveragePixelLuminance: CAFilterProtocol {
    var inputAmount: CGFloat? { get set }
    var inputScale: CGFloat? { get set }
    var inputValues: Any? { get set }
    var inputUseP3Space: Bool? { get set }
    var inputDisplayInvertAware: Bool? { get set }
}

///
///
///
public protocol CALut: CAFilterProtocol {
    var inputValues: Any? { get set }
    var inputColorMap: CGImage? { get set }
    var inputScale: CGFloat? { get set }
}

///
///
///
public protocol CAVibrantColorMatrixSourceOver: CAFilterProtocol {
    var inputColorMatrix: CMatrix? { get set }
    var inputBackdropAware: Bool? { get set }
    var inputClamp: CGFloat? { get set }
    var inputClampPreserveHue: Bool? { get set }
}

// MARK: - Dynamic Property Lookup

extension CAAlphaThreshold where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
    @DynamicLookup public var inputColor: CGColor?
}

extension CAAlphaSmoothThreshold where Self: _CAFilter {
    @DynamicLookup public var inputStart: CGFloat?
    @DynamicLookup public var inputEnd: CGFloat?
    @DynamicLookup public var inputAmount: CGFloat?
    @DynamicLookup public var inputColor: CGColor?
}

extension CAMultiplyColor where Self: _CAFilter {
    @DynamicLookup public var inputColor: CGColor?
}

extension CAColorAdd where Self: _CAFilter {
    @DynamicLookup public var inputColor: CGColor?
}

extension CAColorSubtract where Self: _CAFilter {
    @DynamicLookup public var inputColor: CGColor?
}

extension CAColorMonochrome where Self: _CAFilter {
    @DynamicLookup public var inputBias: CGFloat?
    @DynamicLookup public var inputAmount: CGFloat?
    @DynamicLookup public var inputColor: CGColor?
}

extension CAColorMatrix where Self: _CAFilter {
    @DynamicLookup public var inputColorMatrix: CMatrix?
    @DynamicLookup public var inputPremultipliedValues: Bool?
}

extension CAColorHueRotate where Self: _CAFilter {
    @DynamicLookup public var inputAngle: CGFloat?
    @DynamicLookup public var inputHSVSpace: Bool?
}

extension CAColorSaturate where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
}

extension CAColorBrightness where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
}

extension CAColorContrast where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
}

extension CAColorInvert where Self: _CAFilter {
    
}

extension CAColorInvertDisplayAware where Self: _CAFilter {
    
}

extension CACompressLuminance where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
}

extension CAOpacityPair where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
}

extension CAMeteor where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
    @DynamicLookup public var inputScale: CGFloat?
}

extension CASrl where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
}

extension CAEdrGain where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
    @DynamicLookup public var inputScale: CGFloat?
}

extension CAEdrGainMultiply where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
    @DynamicLookup public var inputScale: CGFloat?
    @DynamicLookup public var inputAllowsGroup: Bool?
    @DynamicLookup public var inputAdaptive: Bool?
    @DynamicLookup public var inputStart: CGFloat?
    @DynamicLookup public var inputEnd: CGFloat?
}

extension CALuminanceToAlpha where Self: _CAFilter {
    @DynamicLookup public var inputPremultipliedValues: Bool?
}

extension CABias where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
}

extension CADistanceField where Self: _CAFilter {
    @DynamicLookup public var renderMode: Any?
    @DynamicLookup public var invertsShape: Bool?
    @DynamicLookup public var foregroundColor: CGColor?
    @DynamicLookup public var offset: CGFloat?
    @DynamicLookup public var sharpness: CGFloat?
    @DynamicLookup public var lineWidth: CGFloat?
}

extension CAGaussianBlur where Self: _CAFilter {
    @DynamicLookup public var inputQuality: Any?
    @DynamicLookup public var inputRadius: CGFloat?
    @DynamicLookup public var inputBounds: CGRect?
    @DynamicLookup public var inputHardEdges: Bool?
    @DynamicLookup public var inputNormalizeEdges: Bool?
    @DynamicLookup public var inputNormalizeEdgesTransparent: Bool?
    @DynamicLookup public var inputDither: Bool?
    @DynamicLookup public var inputLinear: Bool?
    @DynamicLookup public var inputIntermediateBitDepth: Any?
}

extension CAVariableBlur where Self: _CAFilter {
    @DynamicLookup public var inputMaskImage: CGImage?
    @DynamicLookup public var inputRadius: CGFloat?
    @DynamicLookup public var inputNormalizeEdges: Bool?
    @DynamicLookup public var inputNormalizeEdgesTransparent: Bool?
    @DynamicLookup public var inputFade: Bool?
    @DynamicLookup public var inputDither: Bool?
    @DynamicLookup public var inputSourceSublayerName: Any?
}

extension CAGlassBackground where Self: _CAFilter {
    @DynamicLookup public var inputSourceSublayerName: Any?
    @DynamicLookup public var inputInnerRefractionAmount: CGFloat?
    @DynamicLookup public var inputInnerRefractionHeight: CGFloat?
    @DynamicLookup public var inputOuterRefractionAmount: CGFloat?
    @DynamicLookup public var inputOuterRefractionHeight: CGFloat?
    @DynamicLookup public var inputRefractionDistance0: CGFloat?
    @DynamicLookup public var inputRefractionDistance1: CGFloat?
    @DynamicLookup public var inputRefractionOpacity: CGFloat?
    @DynamicLookup public var inputBlurRadius: CGFloat?
    @DynamicLookup public var inputBlurOpacity0: CGFloat?
    @DynamicLookup public var inputBlurOpacity1: CGFloat?
    @DynamicLookup public var inputBlurOpacity2: CGFloat?
    @DynamicLookup public var inputBlurOpacity3: CGFloat?
    @DynamicLookup public var inputBlurOpacity4: CGFloat?
    @DynamicLookup public var inputBlurDistance0: CGFloat?
    @DynamicLookup public var inputBlurDistance1: CGFloat?
    @DynamicLookup public var inputBlurDistance2: CGFloat?
    @DynamicLookup public var inputBlurDistance3: CGFloat?
    @DynamicLookup public var inputBlurDistance4: CGFloat?
    @DynamicLookup public var inputFaceOpacity: CGFloat?
    @DynamicLookup public var inputFaceColorMatrixWhite: CGFloat?
    @DynamicLookup public var inputFaceColorMatrixBlack: CGFloat?
    @DynamicLookup public var inputFaceColorMatrixSaturation: CGFloat?
    @DynamicLookup public var inputFaceColorMatrixFillColor: CGColor?
    @DynamicLookup public var inputBleedAmount: CGFloat?
    @DynamicLookup public var inputBleedHeight: CGFloat?
    @DynamicLookup public var inputBleedBlurRadius: CGFloat?
    @DynamicLookup public var inputBleedDistance0: CGFloat?
    @DynamicLookup public var inputBleedDistance1: CGFloat?
    @DynamicLookup public var inputBleedOpacity: CGFloat?
    @DynamicLookup public var inputBleedDarkenBlend: Bool?
    @DynamicLookup public var inputBleedColorMatrixWhite: CGFloat?
    @DynamicLookup public var inputBleedColorMatrixBlack: CGFloat?
    @DynamicLookup public var inputBleedColorMatrixSaturation: CGFloat?
    @DynamicLookup public var inputBleedColorMatrixFillColor: CGColor?
    @DynamicLookup public var inputShadowOffset: CGPoint?
    @DynamicLookup public var inputShadowAmount: CGFloat?
    @DynamicLookup public var inputShadowHeight: CGFloat?
    @DynamicLookup public var inputShadowOpacity: CGFloat?
    @DynamicLookup public var inputShadowColorMatrixWhite: CGFloat?
    @DynamicLookup public var inputShadowColorMatrixBlack: CGFloat?
    @DynamicLookup public var inputShadowColorMatrixSaturation: CGFloat?
    @DynamicLookup public var inputShadowColorMatrixFillColor: CGColor?
    @DynamicLookup public var inputShadowDistanceOffset: CGFloat?
    @DynamicLookup public var inputShadowBlurRadius: CGFloat?
    @DynamicLookup public var inputShadowRadius: CGFloat?
    @DynamicLookup public var inputSDRHoldingToneEnabled: Bool?
    @DynamicLookup public var inputSDRHoldingToneWhite: CGFloat?
    @DynamicLookup public var inputSDRGradientDistance0: CGFloat?
    @DynamicLookup public var inputSDRGradientDistance1: CGFloat?
    @DynamicLookup public var inputSDRShadowOpacity: CGFloat?
    @DynamicLookup public var inputMaxHeadroom: CGFloat?
    @DynamicLookup public var inputShadowVibrancyContribution: CGFloat?
    @DynamicLookup public var inputClamp: CGFloat?
    @DynamicLookup public var inputClampPreserveHue: Bool?
}

extension CAGlassForeground where Self: _CAFilter {
    @DynamicLookup public var inputSourceSublayerName: Any?
    @DynamicLookup public var inputRefractionAmount: CGFloat?
    @DynamicLookup public var inputRefractionHeight: CGFloat?
    @DynamicLookup public var inputRefractionOffset: CGFloat?
    @DynamicLookup public var inputAberrationAmount: CGFloat?
    @DynamicLookup public var inputAberrationHeight: CGFloat?
    @DynamicLookup public var inputAberrationOffset: CGFloat?
    @DynamicLookup public var inputAberrationAngle: CGFloat?
    @DynamicLookup public var inputEdgeStart: CGFloat?
    @DynamicLookup public var inputEdgeEnd: CGFloat?
    @DynamicLookup public var inputEdgeOpacityStart: CGFloat?
    @DynamicLookup public var inputEdgeOpacityEnd: CGFloat?
}

extension CAChromaticAberration where Self: _CAFilter {
    @DynamicLookup public var inputRedOffset: CGPoint?
    @DynamicLookup public var inputBlueOffset: CGPoint?
    @DynamicLookup public var inputGreenOffset: CGPoint?
    @DynamicLookup public var inputExtendEdges: Bool?
}

extension CAChromaticAberrationMap where Self: _CAFilter {
    @DynamicLookup public var inputMaskImage: CGImage?
    @DynamicLookup public var inputOffset: CGPoint?
    @DynamicLookup public var inputAmount: CGFloat?
    @DynamicLookup public var inputSourceSublayerName: Any?
}

extension CADisplacementMap where Self: _CAFilter {
    @DynamicLookup public var inputMaskImage: CGImage?
    @DynamicLookup public var inputOffset: CGPoint?
    @DynamicLookup public var inputAmount: CGFloat?
    @DynamicLookup public var inputSourceSublayerName: Any?
}

extension CALuminanceMap where Self: _CAFilter {
    @DynamicLookup public var inputColorMap: CGImage?
    @DynamicLookup public var inputAmount: CGFloat?
}

extension CALuminanceCurveMap where Self: _CAFilter {
    @DynamicLookup public var inputValues: Any?
    @DynamicLookup public var inputAmount: CGFloat?
}

extension CACurves where Self: _CAFilter {
    @DynamicLookup public var inputRedValues: Any?
    @DynamicLookup public var inputGreenValues: Any?
    @DynamicLookup public var inputBlueValues: Any?
    @DynamicLookup public var inputAlphaValues: Any?
}

extension CAAverageColor where Self: _CAFilter {
    
}

extension CALanczosResize where Self: _CAFilter {
    @DynamicLookup public var inputScale: CGFloat?
    @DynamicLookup public var inputAspectRatio: CGFloat?
}

extension CAPageCurl where Self: _CAFilter {
    @DynamicLookup public var inputAngle: CGFloat?
    @DynamicLookup public var inputRadius: CGFloat?
    @DynamicLookup public var inputTime: CGFloat?
    @DynamicLookup public var inputStartAngle: CGFloat?
    @DynamicLookup public var inputEndAngle: CGFloat?
    @DynamicLookup public var inputBackEnabled: Bool?
    @DynamicLookup public var inputBackColor0: CGColor?
    @DynamicLookup public var inputBackColor1: CGColor?
    @DynamicLookup public var inputFrontEnabled: Bool?
    @DynamicLookup public var inputFrontColor: CGColor?
    @DynamicLookup public var inputShadowColor: CGColor?
    @DynamicLookup public var inputShadowBounds: CGRect?
}

extension CASdrNormalize where Self: _CAFilter {
    @DynamicLookup public var inputClamp: CGFloat?
    @DynamicLookup public var inputClampPreserveHue: Bool?
}

extension CAVibrantDark where Self: _CAFilter {
    @DynamicLookup public var inputColor0: CGColor?
    @DynamicLookup public var inputColor1: CGColor?
    @DynamicLookup public var inputReversed: Bool?
}

extension CAVibrantLight where Self: _CAFilter {
    @DynamicLookup public var inputColor0: CGColor?
    @DynamicLookup public var inputColor1: CGColor?
    @DynamicLookup public var inputReversed: Bool?
}

extension CAVibrantColorMatrix where Self: _CAFilter {
    @DynamicLookup public var inputColorMatrix: CMatrix?
    @DynamicLookup public var inputBackdropAware: Bool?
    @DynamicLookup public var inputClamp: CGFloat?
    @DynamicLookup public var inputClampPreserveHue: Bool?
}

extension CALimitAveragePixelLuminance where Self: _CAFilter {
    @DynamicLookup public var inputAmount: CGFloat?
    @DynamicLookup public var inputScale: CGFloat?
    @DynamicLookup public var inputValues: Any?
    @DynamicLookup public var inputUseP3Space: Bool?
    @DynamicLookup public var inputDisplayInvertAware: Bool?
}

extension CALut where Self: _CAFilter {
    @DynamicLookup public var inputValues: Any?
    @DynamicLookup public var inputColorMap: CGImage?
    @DynamicLookup public var inputScale: CGFloat?
}

extension CAVibrantColorMatrixSourceOver where Self: _CAFilter {
    @DynamicLookup public var inputColorMatrix: CMatrix?
    @DynamicLookup public var inputBackdropAware: Bool?
    @DynamicLookup public var inputClamp: CGFloat?
    @DynamicLookup public var inputClampPreserveHue: Bool?
}

// MARK: - Static Methods

@CAFilter(type: .alphaThreshold, protocol: CAAlphaThreshold.self)
@CAFilter(type: .alphaSmoothThreshold, protocol: CAMultiplyColor.self)
@CAFilter(type: .multiplyColor, protocol: CAMultiplyColor.self)
@CAFilter(type: .colorAdd, protocol: CAColorAdd.self)
@CAFilter(type: .colorSubtract, protocol: CAColorSubtract.self)
@CAFilter(type: .colorMonochrome, protocol: CAColorMonochrome.self)
@CAFilter(type: .colorMatrix, protocol: CAColorMatrix.self)
@CAFilter(type: .colorHueRotate, protocol: CAColorHueRotate.self)
@CAFilter(type: .colorSaturate, protocol: CAColorSaturate.self)
@CAFilter(type: .colorBrightness, protocol: CAColorBrightness.self)
@CAFilter(type: .colorContrast, protocol: CAColorContrast.self)
@CAFilter(type: .colorInvert, protocol: CAColorInvert.self)
@CAFilter(type: .colorInvertDisplayAware, protocol: CAColorInvertDisplayAware.self)
@CAFilter(type: .compressLuminance, protocol: CACompressLuminance.self)
@CAFilter(type: .opacityPair, protocol: CAOpacityPair.self)
@CAFilter(type: .meteor, protocol: CAMeteor.self)
@CAFilter(type: .srl, protocol: CASrl.self)
@CAFilter(type: .edrGain, protocol: CAEdrGain.self)
@CAFilter(type: .edrGainMultiply, protocol: CAEdrGainMultiply.self)
@CAFilter(type: .luminanceToAlpha, protocol: CALuminanceToAlpha.self)
@CAFilter(type: .bias, protocol: CABias.self)
@CAFilter(type: .distanceField, protocol: CADistanceField.self)
@CAFilter(type: .gaussianBlur, protocol: CAGaussianBlur.self)
@CAFilter(type: .variableBlur, protocol: CAVariableBlur.self)
@CAFilter(type: .glassBackground, protocol: CAGlassBackground.self)
@CAFilter(type: .glassForeground, protocol: CAGlassForeground.self)
@CAFilter(type: .chromaticAberration, protocol: CAChromaticAberration.self)
@CAFilter(type: .chromaticAberrationMap, protocol: CAChromaticAberrationMap.self)
@CAFilter(type: .displacementMap, protocol: CADisplacementMap.self)
@CAFilter(type: .luminanceMap, protocol: CALuminanceMap.self)
@CAFilter(type: .luminanceCurveMap, protocol: CALuminanceCurveMap.self)
@CAFilter(type: .curves, protocol: CACurves.self)
@CAFilter(type: .averageColor, protocol: CAAverageColor.self)
@CAFilter(type: .lanczosResize, protocol: CALanczosResize.self)
@CAFilter(type: .pageCurl, protocol: CAPageCurl.self)
@CAFilter(type: .sdrNormalize, protocol: CASdrNormalize.self)
@CAFilter(type: .vibrantDark, protocol: CAVibrantDark.self)
@CAFilter(type: .vibrantLight, protocol: CAVibrantLight.self)
@CAFilter(type: .vibrantColorMatrix, protocol: CAVibrantColorMatrix.self)
@CAFilter(type: .limitAveragePixelLuminance, protocol: CALimitAveragePixelLuminance.self)
@CAFilter(type: .lut, protocol: CALut.self)
@CAFilter(type: .vibrantColorMatrixSourceOver, protocol: CAVibrantColorMatrixSourceOver.self)
extension _CAFilter {}
