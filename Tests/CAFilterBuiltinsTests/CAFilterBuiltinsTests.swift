import CoreGraphics
import CoreImage
import Testing
@testable import CAFilterBuiltins

@Test func variableBlur() throws {
    let imageRect = CGRect(origin: .zero, size: .init(width: 100, height: 100))
    let image = CIImage(color: .red).cropped(to: imageRect)
    let cgImage = CIContext().createCGImage(image, from: imageRect)!

    let filter = _CAFilter.variableBlur()
    filter.inputMaskImage = cgImage
    filter.inputNormalizeEdges = true
    filter.inputRadius = 10.34

    let CAFitler: AnyClass = try #require(NSClassFromString("CAFilter"))
    #expect(filter.isKind(of: CAFitler))
    #expect(filter.inputMaskImage == cgImage)
    #expect(filter.inputNormalizeEdges == true)
    #expect(filter.inputRadius == 10.34)
}

extension String {
    var firstUppercased: String {
        prefix(1).uppercased().appending(dropFirst())
    }

    init(_ unsafePointer: UnsafePointer<CChar>?) {
        if let unsafePointer {
            self = String(cString: unsafePointer)
        } else {
            self = "?"
        }
    }
}
