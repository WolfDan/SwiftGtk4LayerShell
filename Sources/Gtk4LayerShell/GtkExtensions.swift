import CGtk
import Gtk

@MainActor
open class Display: Gtk.GObject {
    static let shared = Display()

    // TODO listen to events for display monitors changes
    public static var display: OpaquePointer {
        // TODO GTKDisplay pointer
        shared.opaquePointer!
    }

    private convenience init() {
        self.init(gdk_display_get_default())
    }

    @GObjectProperty(named: "composited") public var composited: Bool
    @GObjectProperty(named: "model") public var model: String

    public static func getMonitors() -> [Monitor] {
        let list_model = get_g_list_monitors()
        var monitors: [Monitor] = []
        for i in 0..<list_model.count {
            let monitor = Monitor(list_model[i])
            monitors.append(monitor)
        }
        return monitors
    }

    public static func getMonitor(index: Int) -> Monitor {
        Monitor(get_g_list_monitors()[index])
    }

    static func get_g_list_monitors() -> GListModel {
        GListModel(gdk_display_get_monitors(display))
    }
}

open class Monitor: Gtk.GObject {
    @GObjectProperty(named: "valid") public var valid: Bool
}
