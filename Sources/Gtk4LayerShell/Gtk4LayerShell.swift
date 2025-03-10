// originally generated with gir2swift

import CGtk4LayerShell
import Gtk

public typealias Edge = GtkLayerShellEdge

extension Edge {
    /// Cast constructor, converting any binary integer to a
    /// `Edge`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable public init!<I: BinaryInteger>(_ raw: I) {
        func castToEdgeInt<J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToEdgeInt(raw))
    }
    /// The left edge of the screen.
    public static let `left` = GTK_LAYER_SHELL_EDGE_LEFT  // 0

    /// The right edge of the screen.
    public static let `right` = GTK_LAYER_SHELL_EDGE_RIGHT  // 1

    /// The top edge of the screen.
    public static let top = GTK_LAYER_SHELL_EDGE_TOP  // 2

    /// The bottom edge of the screen.
    public static let bottom = GTK_LAYER_SHELL_EDGE_BOTTOM  // 3

    /// Should not be used except to get the number of entries. (NOTE: may change in
    /// future releases as more entries are added)
    public static let entryNumber = GTK_LAYER_SHELL_EDGE_ENTRY_NUMBER  // 4

}

public typealias KeyboardMode = GtkLayerShellKeyboardMode

extension KeyboardMode {
    /// Cast constructor, converting any binary integer to a
    /// `KeyboardMode`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable public init!<I: BinaryInteger>(_ raw: I) {
        func castToKeyboardModeInt<J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToKeyboardModeInt(raw))
    }
    /// This window should not receive keyboard events.
    public static let `none` = GTK_LAYER_SHELL_KEYBOARD_MODE_NONE  // 0

    /// This window should have exclusive focus if it is on the top or overlay layer.
    public static let exclusive = GTK_LAYER_SHELL_KEYBOARD_MODE_EXCLUSIVE  // 1

    /// The user should be able to focus and unfocues this window in an implementation
    /// defined way. Not supported for protocol version &lt; 4.
    public static let onDemand = GTK_LAYER_SHELL_KEYBOARD_MODE_ON_DEMAND  // 2

    /// Should not be used except to get the number of entries. (NOTE: may change in
    /// future releases as more entries are added)
    public static let entryNumber = GTK_LAYER_SHELL_KEYBOARD_MODE_ENTRY_NUMBER  // 3

}

public typealias Layer = GtkLayerShellLayer

extension Layer {
    /// Cast constructor, converting any binary integer to a
    /// `Layer`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable public init!<I: BinaryInteger>(_ raw: I) {
        func castToLayerInt<J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToLayerInt(raw))
    }
    /// The background layer.
    public static let background = GTK_LAYER_SHELL_LAYER_BACKGROUND  // 0

    /// The bottom layer.
    public static let bottom = GTK_LAYER_SHELL_LAYER_BOTTOM  // 1

    /// The top layer.
    public static let top = GTK_LAYER_SHELL_LAYER_TOP  // 2

    /// The overlay layer.
    public static let overlay = GTK_LAYER_SHELL_LAYER_OVERLAY  // 3

    /// Should not be used except to get the number of entries. (NOTE: may change in
    /// future releases as more entries are added)
    public static let entryNumber = GTK_LAYER_SHELL_LAYER_ENTRY_NUMBER  // 4

}

extension Window {
    // duplicating castedPointer since its an internal class
    public func windowPtr<T>() -> UnsafeMutablePointer<T> {
        let pointer = UnsafeRawPointer(widgetPointer).bindMemory(to: T.self, capacity: 1)
        return UnsafeMutablePointer<T>(mutating: pointer)
    }
}

/// When auto exclusive zone is enabled, exclusive zone is automatically set to the
/// size of the `window` + relevant margin. To disable auto exclusive zone, just set the
/// exclusive zone to 0 or any other fixed value.
///
/// NOTE: you can control the auto exclusive zone by changing the margin on the non-anchored
/// edge. This behavior is specific to gtk4-layer-shell and not part of the underlying protocol
@inlinable public func autoExclusiveZoneEnable<GtkWindowT: Gtk.Window>(window: GtkWindowT) {

    gtk_layer_auto_exclusive_zone_enable(window.windowPtr())

}

@inlinable public func autoExclusiveZoneIsEnabled<GtkWindowT: Gtk.Window>(
    window: GtkWindowT
) -> Bool {
    let result = gtk_layer_auto_exclusive_zone_is_enabled(window.windowPtr())
    let rv = ((result) != 0)
    return rv
}

@inlinable public func getAnchor<GtkWindowT: Gtk.Window>(
    window: GtkWindowT, edge: GtkLayerShellEdge
) -> Bool {
    let result = gtk_layer_get_anchor(window.windowPtr(), edge)
    let rv = ((result) != 0)
    return rv
}

@inlinable public func getExclusiveZone<GtkWindowT: Gtk.Window>(window: GtkWindowT) -> Int {
    let result = gtk_layer_get_exclusive_zone(window.windowPtr())
    let rv = Int(result)
    return rv
}

@inlinable public func getKeyboardMode<GtkWindowT: Gtk.Window>(window: GtkWindowT)
    -> GtkLayerShellKeyboardMode
{
    let result = gtk_layer_get_keyboard_mode(window.windowPtr())
    let rv = result
    return rv
}

@inlinable public func getLayer<GtkWindowT: Gtk.Window>(window: GtkWindowT)
    -> GtkLayerShellLayer
{
    let result = gtk_layer_get_layer(window.windowPtr())
    let rv = result
    return rv
}

@inlinable public func getMargin<GtkWindowT: Gtk.Window>(
    window: GtkWindowT, edge: GtkLayerShellEdge
) -> Int {
    let result = gtk_layer_get_margin(window.windowPtr(), edge)
    let rv = Int(result)
    return rv
}

/// NOTE: To get which monitor the surface is actually on, use
/// `gdk_display_get_monitor_at_window()`.
@inlinable public func getMonitor<GtkWindowT: Gtk.Window>(window: GtkWindowT) -> OpaquePointer! {
    // let result = gtk_layer_get_monitor(window.windowPtr())
    // guard let rv = Gdk.MonitorRef(gconstpointer: gconstpointer(result)) else { return nil }
    // return rv

    return gtk_layer_get_monitor(window.windowPtr())
}

/// NOTE: this function does not return ownership of the string. Do not free the returned string.
/// Future calls into the library may invalidate the returned string.
@inlinable public func getNamespace<GtkWindowT: Gtk.Window>(window: GtkWindowT) -> String! {
    let result = gtk_layer_get_namespace(window.windowPtr())
    guard let rv = result.map({ String(cString: $0) }) else { return nil }
    return rv
}

/// May block for a Wayland roundtrip the first time it's called.
@inlinable public func getProtocolVersion() -> Int {
    let result = gtk_layer_get_protocol_version()
    let rv = Int(result)
    return rv
}

// *** getZwlrLayerSurfaceV1() causes a syntax error and is therefore not available!

/// Set the `window` up to be a layer surface once it is mapped. this must be called before
/// the `window` is realized.
@inlinable public func initFor<GtkWindowT: Gtk.Window>(window: GtkWindowT) {

    gtk_layer_init_for_window(window.windowPtr())

}

@inlinable public func isLayer<GtkWindowT: Gtk.Window>(window: GtkWindowT) -> Bool {
    let result = gtk_layer_is_layer_window(window.windowPtr())
    let rv = ((result) != 0)
    return rv
}

/// May block for a Wayland roundtrip the first time it's called.
@inlinable public func isSupported() -> Bool {
    let result = gtk_layer_is_supported()
    let rv = ((result) != 0)
    return rv
}

/// Set whether `window` should be anchored to `edge`.
/// - If two perpendicular edges are anchored, the surface with be anchored to that corner
/// - If two opposite edges are anchored, the window will be stretched across the screen in that direction
///
/// Default is `false` for each `GtkLayerShellEdge`
@inlinable public func setAnchor<GtkWindowT: Gtk.Window>(
    window: GtkWindowT, edge: GtkLayerShellEdge, anchorToEdge: Bool
) {

    gtk_layer_set_anchor(window.windowPtr(), edge, gboolean((anchorToEdge) ? 1 : 0))

}

/// Has no effect unless the surface is anchored to an edge. Requests that the compositor
/// does not place other surfaces within the given exclusive zone of the anchored edge.
/// For example, a panel can request to not be covered by maximized windows. See
/// wlr-layer-shell-unstable-v1.xml for details.
///
/// Default is 0
@inlinable public func setExclusiveZone<GtkWindowT: Gtk.Window>(
    window: GtkWindowT, exclusiveZone: Int
) {

    gtk_layer_set_exclusive_zone(window.windowPtr(), gint(exclusiveZone))

}

/// Sets if/when `window` should receive keyboard events from the compositor, see
/// GtkLayerShellKeyboardMode for details.
///
/// Default is `GTK_LAYER_SHELL_KEYBOARD_MODE_NONE`
@inlinable public func setKeyboardMode<GtkWindowT: Gtk.Window>(
    window: GtkWindowT, mode: GtkLayerShellKeyboardMode
) {

    gtk_layer_set_keyboard_mode(window.windowPtr(), mode)

}

/// Set the "layer" on which the surface appears (controls if it is over top of or below other surfaces). The layer may
/// be changed on-the-fly in the current version of the layer shell protocol, but on compositors that only support an
/// older version the `window` is remapped so the change can take effect.
///
/// Default is `GTK_LAYER_SHELL_LAYER_TOP`
@inlinable public func setLayer<GtkWindowT: Gtk.Window>(
    window: GtkWindowT, layer: GtkLayerShellLayer
) {

    gtk_layer_set_layer(window.windowPtr(), layer)

}

/// Set the margin for a specific `edge` of a `window`. Effects both surface's distance from
/// the edge and its exclusive zone size (if auto exclusive zone enabled).
///
/// Default is 0 for each `GtkLayerShellEdge`
@inlinable public func setMargin<GtkWindowT: Gtk.Window>(
    window: GtkWindowT, edge: GtkLayerShellEdge, marginSize: Int
) {

    gtk_layer_set_margin(window.windowPtr(), edge, gint(marginSize))

}

/// Set the output for the window to be placed on, or `nil` to let the compositor choose.
/// If the window is currently mapped, it will get remapped so the change can take effect.
///
/// Default is `nil`
@inlinable public func setMonitor<GtkWindowT: Gtk.Window>(
    window: GtkWindowT, monitor: OpaquePointer
) {

    gtk_layer_set_monitor(window.windowPtr(), monitor)

}

/// Set the "namespace" of the surface.
///
/// No one is quite sure what this is for, but it probably should be something generic
/// ("panel", "osk", etc). The `name_space` string is copied, and caller maintains
/// ownership of original. If the window is currently mapped, it will get remapped so
/// the change can take effect.
///
/// Default is "gtk4-layer-shell" (which will be used if set to `nil`)
@inlinable public func setNamespace<GtkWindowT: Gtk.Window>(
    window: GtkWindowT, nameSpace: UnsafePointer<CChar>!
) {

    gtk_layer_set_namespace(window.windowPtr(), nameSpace)

}
