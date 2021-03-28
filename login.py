import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk

class Login(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title = "Login Window")
        self.set_size_request(500, 500)
        
        self.box = Gtk.Box(spacing = 6, orientation = Gtk.Orientation.VERTICAL)
        self.add(self.box)

        self.entry_container = Gtk.Box(spacing = 6, orientation = Gtk.Orientation.VERTICAL)
        self.box.pack_start(self.entry_container, True, True, 0)

        # username and password entry
        self.username_entry = Gtk.Entry()
        self.password_entry = Gtk.Entry()
        self.password_entry.set_visibility(False)
        self.entry_container.pack_start(self.username_entry, True, True, 0)
        self.entry_container.pack_start(self.password_entry, True, True, 0)

        # login button
        self.login_button = Gtk.Button(label = "Login")
        self.login_button.connect("clicked", self.get_information)
        self.entry_container.pack_start(self.login_button, True, True, 1)

    def get_information(self, widget):
        self.username = self.username_entry.get_text()
        self.password = self.password_entry.get_text()
        self.username_entry.set_text("")
        self.password_entry.set_text("")
        print("username = ", self.username)
        print("password = ", self.password)


login = Login()
#  login.set_size_request(500, 500)
login.connect("destroy", Gtk.main_quit)
login.show_all()
Gtk.main()
