import CGtk
import Gtk

open class Display: Gtk.GObject {
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
        GListModel(gdk_display_get_monitors(gdk_display_get_default()))
    }
}

open class Monitor: Gtk.GObject {
    @GObjectProperty(named: "valid") public var valid: Bool
}
