import CGtk
import Gtk

open class Display {
    public static func getMonitors() -> [OpaquePointer] {
        let list_model = get_g_list_monitors()
        var monitors: [OpaquePointer] = []
        for i in 0..<list_model.count {
            let monitor = list_model[i]
            monitors.append(monitor)
        }
        return monitors
    }

    public static func getMonitor(index: Int) -> OpaquePointer {
        let list_model = get_g_list_monitors()
        if list_model.opaquePointer == nil {
            fatalError("ListModel pointer is nil")
        }

        print("list_model setup")

        let monitor: OpaquePointer? = list_model[index]

        if monitor == nil {
            fatalError("Monitor pointer is nil")
        }

        print("monitor setup")

        return monitor!
    }

    static func get_g_list_monitors() -> GListModel {
        let displayPointer = get_default()
        if displayPointer == nil {
            fatalError("Display not found! Ensure you are running a Wayland compositor")
        }

        print("Display setup!")

        let monitors = gdk_display_get_monitors(displayPointer)
        if monitors == nil {
            fatalError("Monitors not found!")
        }

        print("monitors setup!")

        return GListModel(monitors!)
    }

    static func get_default() -> OpaquePointer? {
        gdk_display_get_default()
    }
}
