#!/usr/bin/python3
#A Python script to set the theme for GTK+ 2 and GTK+ 3 applications in minimal environments
#By Charles Bos

from tkinter import *
from tkinter import messagebox
import os

def findThemes(themeType) :
    homeDir = os.path.expanduser('~')
    a = os.listdir("/usr/share/themes")
    for x in a : a[a.index(x)] = "/usr/share/themes/" + x
    if os.path.exists("/usr/local/share/themes") :
        b = os.listdir("/usr/local/share/themes")
        for x in b : b[b.index(x)] = "/usr/local/share/themes/" + x
    else : b = []
    if os.path.exists(homeDir + "/.themes") :
        c = os.listdir(homeDir + "/.themes")
        for x in c : c[c.index(x)] = homeDir + "/.themes/" + x
    else : c = []
    allThemes = a + b + c
    final = []
    
    for x in allThemes :
        try : dirs = os.listdir(x)
        except NotADirectoryError : continue
        y = x.split("/")
        if themeType == "gtk2" :
            if "gtk-2.0" in (dirs) :
                gDir = os.listdir(x + "/gtk-2.0")
                if "gtkrc" in gDir :
                    if y[-1] not in final : final.append(y[-1])
        else :
            if "gtk-3.0" in (dirs) :
                gDir = os.listdir(x + "/gtk-3.0")
                if "gtk.css" in gDir :
                    if y[-1] not in final : final.append(y[-1])
    #We mustn't return an empty list so add a fallback value in this case
    if final == [] : final.append("None found")

    return sorted(final)

def findIcons(themeType) :
    homeDir = os.path.expanduser('~')
    a = os.listdir("/usr/share/icons")
    for x in a : a[a.index(x)] = "/usr/share/icons/" + x
    if os.path.exists("/usr/local/share/icons") :
        b = os.listdir("/usr/local/share/icons")
        for x in b : b[b.index(x)] = "/usr/local/share/icons/" + x
    else : b = []
    if os.path.exists(homeDir + "/.icons") :
        c = os.listdir(homeDir + "/.icons")
        for x in c : c[c.index(x)] = homeDir + "/.icons/" + x
    else : c = []
    allIcons = a + b + c
    final = []
    
    for x in allIcons :
        try : dirs = os.listdir(x)
        except NotADirectoryError : continue
        y = x.split("/")
        #Dir needs to contain index.theme and might well contain cursors dir. Therefore, the
        #number of items within dir needs to be greater than 2 for it to contain a viable icon
        #theme. For cursor theme, we only need the cursor dir.
        if "index.theme" in dirs :
            if themeType == "cursors" :
                if "cursors" in dirs : final.append(y[-1])
            else :
                if len(dirs) > 2 : final.append(y[-1])
    #Remove hicolor as this is a fallback icon theme that will be used anyway
    if "hicolor" in final : final.remove("hicolor")
    #We mustn't return an empty list so add a fallback value in this case
    if final == [] : final.append("None found")

    return sorted(final)

def getResource(sFile, resource) :
    if resource == "gtk-button-images" or resource == "gtk-menu-images" \
       or resource == "gtk-application-prefer-dark-theme" : default = 0
    else : default = "None set"
    homeDir = os.path.expanduser('~')
    try :
        if sFile == "gtk2" : file = open(homeDir + "/.gtkrc-2.0", "r")
        elif sFile == "gtk3" : file = open(homeDir + "/.config/gtk-3.0/settings.ini", "r")
        elif sFile == "xdg_cursor" : file = open(homeDir + "/.icons/default/index.theme", "r")
        contents = file.read()
        file.close()
        contents = contents.split("\n")
        for x in contents :
            y = x.split("=")
            if y[0].strip() == resource : return y[-1].strip().strip('"')
        return default
    except IOError :
        return default

def setResource(sFile, resource, var) :
    homeDir = os.path.expanduser('~')
    if sFile == "gtk2" : path = homeDir + "/.gtkrc-2.0"
    elif sFile == "gtk3" : path = homeDir + "/.config/gtk-3.0/settings.ini"
    elif sFile == "xdg_cursor" : path = homeDir + "/.icons/default/index.theme"
    if os.path.exists(path) :
        #If file exists, read it and try to get find resource name line
        #If found, update it
        found = False
        file = open(path, "r")
        contents = file.read()
        file.close()
        contents = contents.split("\n")
        if contents[-1] == '' : del contents[-1]
        for x in contents :
            y = x.split("=")
            if y[0].strip() == resource :
                if y[0][-1] == " " :
                    if sFile == "gtk2" and var.get() != "1" and var.get() != "0" : z = str(resource + " = " + '"' + var.get() + '"')
                    else : z = str(resource + " = " + var.get())
                else :
                    if sFile == "gtk2" and var.get() != "1" and var.get() != "0" : z = str(resource + "=" + '"' + var.get() + '"')
                    else : z = str(resource + "=" + var.get())
                contents[contents.index(x)] = z
                found = True
                break

        if found :
            #If file exists and resource is present, update it
            file = open(path, "w")
            for x in contents :
                if contents.index(x) == len(contents) -1 : file.write(x)
                else : file.write(x + "\n")
        elif not found and contents != [] :
            #If file exists and is full but resource is not present, append it
            file = open(path, "w")
            for x in contents :
                if contents.index(x) == len(contents) -1 : file.write(x)
                else : file.write(x + "\n")
            if sFile == "gtk2" :
                if var.get() == "1" or var.get() == "0" : file.write("\n" + resource + " = " + var.get())
                else : file.write("\n" + resource + " = " + '"' + var.get() + '"')
            elif sFile == "gtk3" : file.write("\n" + resource + " = " + var.get())
            elif sFile == "xdg_cursor" : file.write("\n" + resource + "=" + var.get())
        else :
            #If file exists but is empty, overwrite it
            file = open(path, "w")
            if sFile == "gtk2" :
                if var.get() == "1" or var.get() == "0" : file.write(resource + " = " + var.get())
                else : file.write(resource + " = " + '"' + var.get() + '"')
            elif sFile == "gtk3" : file.write("[Settings]\n" + resource + " = " + var.get())
            elif sFile == "xdg_cursor" : file.write("[Icon Theme]\n" + resource + "=" + var.get())
        file.close()
    else :
        #If file does not exist, create it
        if sFile == "gtk3" :
            try : os.makedirs(homeDir + "/.config/gtk-3.0/")
            except FileExistsError : pass
        elif sFile == "xdg_cursor" :
            try : os.makedirs(homeDir + "/.icons/default/")
            except FileExistsError : pass
        file = open(path, "w")
        if sFile == "gtk2" :
            if var.get() == "1" or var.get() == "0" : file.write(resource + " = " + var.get())
            else : file.write(resource + " = " + '"' + var.get() + '"')
        elif sFile == "gtk3" : file.write("[Settings]\n" + resource + " = " + var.get())
        elif sFile == "xdg_cursor" : file.write("[Icon Theme]\n" + resource + "=" + var.get())
        file.close()

def endOnNewline(filePath) :
    if os.path.exists(filePath) :
        file = open(filePath, "r")
        contents = file.read()
        file.close()
        if len(contents) > 0 :
            if contents[-1] != '\n' :
                file = open(filePath, "a")
                file.write('\n')
                file.close()

def update() :
    changes = False

    #Update GTK+ 2 theme
    if  ui.varOpG2.get() != getResource("gtk2", "gtk-theme-name") and ui.varOpG2.get() != "None found" :
        setResource("gtk2", "gtk-theme-name", ui.varOpG2)
        changes = True

    #Update GTK+ 3 theme
    if  ui.varOpG3.get() != getResource("gtk3", "gtk-theme-name") and ui.varOpG3.get() != "None found" :
        setResource("gtk3", "gtk-theme-name", ui.varOpG3)
        changes = True

    #Update GTK+ 2 and GTK+ 3 font
    if  ui.varOpFont.get() != getResource("gtk2", "gtk-font-name") :
        setResource("gtk2", "gtk-font-name", ui.varOpFont)
        changes = True
    if  ui.varOpFont.get() != getResource("gtk3", "gtk-font-name") :
        setResource("gtk3", "gtk-font-name", ui.varOpFont)
        changes = True

    #Update GTK+ 2 and GTK+ 3 icons
    if  ui.varOpIcons.get() != getResource("gtk2", "gtk-icon-theme-name") and ui.varOpIcons.get() != "None found" :
        setResource("gtk2", "gtk-icon-theme-name", ui.varOpIcons)
        changes = True
    if  ui.varOpIcons.get() != getResource("gtk3", "gtk-icon-theme-name") and ui.varOpIcons.get() != "None found" :
        setResource("gtk3", "gtk-icon-theme-name", ui.varOpIcons)
        changes = True

    #Update GTK+ 2, GTK+ 3 and XDG cursor theme
    if  ui.varOpCursors.get() != getResource("xdg_cursor", "Inherits") and ui.varOpCursors.get() != "None found" :
        setResource("xdg_cursor", "Inherits", ui.varOpCursors)
        changes = True
    if  ui.varOpCursors.get() != getResource("gtk2", "gtk-cursor-theme-name") and ui.varOpCursors.get() != "None found" :
        setResource("gtk2", "gtk-cursor-theme-name", ui.varOpCursors)
        changes = True
    if  ui.varOpCursors.get() != getResource("gtk3", "gtk-cursor-theme-name") and ui.varOpCursors.get() != "None found" :
        setResource("gtk3", "gtk-cursor-theme-name", ui.varOpCursors)
        changes = True

    #Update images in GTK+ menus and buttons
    if  ui.varOpButtonImages.get() != bool(int(getResource("gtk2", "gtk-button-images"))) :
        temp = StringVar()
        temp.set(str(int(ui.varOpButtonImages.get())))
        setResource("gtk2", "gtk-button-images", temp)
        setResource("gtk3", "gtk-button-images", temp)
        changes = True
    if  ui.varOpMenuImages.get() != bool(int(getResource("gtk2", "gtk-menu-images"))) :
        temp = StringVar()
        temp.set(str(int(ui.varOpMenuImages.get())))
        setResource("gtk2", "gtk-menu-images", temp)
        setResource("gtk3", "gtk-menu-images", temp)
        changes = True

    #Update dark theme
    if ui.varOpDarkTheme.get() != bool(int(getResource("gtk3", "gtk-application-prefer-dark-theme"))) :
        temp = StringVar()
        temp.set(str(int(ui.varOpDarkTheme.get())))
        setResource("gtk3", "gtk-application-prefer-dark-theme", temp)
        changes = True

    #Ensure that the last char in all files is a newline
    homeDir = os.path.expanduser('~')
    endOnNewline(homeDir + "/.gtkrc-2.0")
    endOnNewline(homeDir + "/.config/gtk-3.0/settings.ini")
    endOnNewline(homeDir + "/.icons/default/index.theme")

    #Show completion message
    if changes : messagebox.showinfo(title = "Complete!", message = "Restart your applications for the settings to take effect.")
    else : messagebox.showinfo(title = "Complete!", message = "Settings files were already up to date. No changes were made.")

def darkThemeNote() :
    if ui.varOpDarkTheme.get() :
        messagebox.showinfo(title = "Note", message = "A dark theme variant is available only for some GTK+ 3 themes such as Adwaita.")

def reset() :
    rmFilesFailed = False
    question = "The following files will be deleted:\n\n    ~/.gtkrc-2.0\n    ~/.config/gtk-3.0/settings.ini\n    ~/.icons/default/index.theme\n\nDo you want to continue?"
    choice = messagebox.askyesno(title = "Reset", message = question)
    if choice :
        homeDir = os.path.expanduser('~')
        try : os.remove(homeDir + "/.gtkrc-2.0")
        except FileNotFoundError : pass
        except IOError : rmFilesFailed = True
        try : os.remove(homeDir + "/.config/gtk-3.0/settings.ini")
        except FileNotFoundError : pass
        except IOError : rmFilesFailed = True
        try : os.remove(homeDir + "/.icons/default/index.theme")
        except FileNotFoundError : pass
        except IOError : rmFilesFailed = True
        if rmFilesFailed : messagebox.showerror(title = "Error", message = "Errors occured whilst removing the settings files.")
        ui.varOpG2.set(getResource("gtk2", "gtk-theme-name"))
        ui.varOpG3.set(getResource("gtk3", "gtk-theme-name"))
        ui.varOpFont.delete(0, len(ui.varOpFont.get()))
        ui.varOpFont.insert(0, getResource("gtk2", "gtk-font-name"))
        ui.varOpIcons.set(getResource("gtk2", "gtk-icon-theme-name"))
        ui.varOpCursors.set(getResource("xdg_cursor", "Inherits"))
        ui.varOpButtonImages.set(getResource("gtk2", "gtk-button-images"))
        ui.varOpMenuImages.set(getResource("gtk2", "gtk-menu-images"))
        ui.varOpDarkTheme.set(getResource("gtk3", "gtk-application-prefer-dark-theme"))
        
class UI() :
    def __init__(self, parent) :
        parent.title("Set GTK+ theme")
        l1 = Label(parent, text = "Set the theme for GTK+ 2 and 3 applications", pady = 5, padx = 15, relief = RAISED)
        l1.grid(row = 1, column = 1, columnspan = 2)

        #GTK+ 2 section
        l2 = Label(parent, text = "GTK+ 2 theme:", pady = 7, padx = 5).grid(row = 2, column = 1, sticky = W)
        self.varOpG2 = StringVar(parent)
        self.varOpG2.set(getResource("gtk2", "gtk-theme-name"))
        themesG2 = findThemes("gtk2")
        m1 = OptionMenu(parent, self.varOpG2, *themesG2)
        m1.configure(width = 12)
        m1.grid(row = 2, column = 2, sticky = W)

        #GTK+ 3 section
        l3 = Label(parent, text = "GTK+ 3 theme:", pady = 7, padx = 5).grid(row = 3, column = 1, sticky = W)
        self.varOpG3 = StringVar(parent)
        self.varOpG3.set(getResource("gtk3", "gtk-theme-name"))
        themesG3 = findThemes("gtk3")
        m2 = OptionMenu(parent, self.varOpG3, *themesG3)
        m2.configure(width = 12)
        m2.grid(row = 3, column = 2, sticky = W)

        #Hereafter, we're not supporting seperate settings for GTK+ 2 and GTK+ 3.
        
        #Font section
        l4 = Label(parent, text = "GTK+ font:", pady = 7, padx = 5).grid(row = 4, column = 1, sticky = W)
        self.varOpFont = Entry(parent)
        self.varOpFont.configure(width = 17)
        self.varOpFont.grid(row = 4, column = 2, sticky = W)
        self.varOpFont.insert(0, getResource("gtk2", "gtk-font-name"))

        #Icons section
        l5 = Label(parent, text = "GTK+ icons:", pady = 7, padx = 5).grid(row = 5, column = 1, sticky = W)
        self.varOpIcons = StringVar(parent)
        self.varOpIcons.set(getResource("gtk2", "gtk-icon-theme-name"))
        icons = findIcons("icons")
        m3 = OptionMenu(parent, self.varOpIcons, *icons)
        m3.configure(width = 12)
        m3.grid(row = 5, column = 2, sticky = W)

        #Cursors section
        l6 = Label(parent, text = "GTK+ cursors:", pady = 7, padx = 5).grid(row = 6, column = 1, sticky = W)
        self.varOpCursors = StringVar(parent)
        self.varOpCursors.set(getResource("xdg_cursor", "Inherits"))
        cursors = findIcons("cursors")
        m4 = OptionMenu(parent, self.varOpCursors, *cursors)
        m4.configure(width = 12)
        m4.grid(row = 6, column = 2, sticky = W)

        #Button and menu images section
        self.varOpButtonImages = BooleanVar(parent)
        self.varOpMenuImages = BooleanVar(parent)
        self.varOpButtonImages.set(getResource("gtk2", "gtk-button-images"))
        self.varOpMenuImages.set(getResource("gtk2", "gtk-menu-images"))
        imgButtonCheckbox = Checkbutton(parent, variable = self.varOpButtonImages, text = "Images in buttons", pady = 3).grid(row = 7, column = 1, sticky = W)
        imgMenuCheckbox = Checkbutton(parent, variable = self.varOpMenuImages, text = "Images in menus", pady = 3).grid(row = 7, column = 2, sticky = W)

        #Dark theme section
        self.varOpDarkTheme = BooleanVar(parent)
        self.varOpDarkTheme.set(getResource("gtk3", "gtk-application-prefer-dark-theme"))
        darkThemeCheckbox = Checkbutton(parent, variable = self.varOpDarkTheme, text = "Use dark theme", command = darkThemeNote, pady = 3).grid(row = 8, column = 1, sticky = W)

        #Buttons
        b1 = Button(parent, text = "Close", padx = 5, pady = 5, bd = 3, command = parent.destroy)
        b1.configure(width = 5)
        b1.grid(row = 9, column = 1, sticky = W)
        b2 = Button(parent, text = "Update", padx = 5, pady = 5, bd = 3, command = update)
        b2.configure(width = 5)
        b2.grid(row = 9, column = 2, sticky = E)
        b3 = Button(parent, text = "Reset", padx = 5, pady = 5, bd= 3, command = reset)
        b3.configure(width = 5)
        b3.grid(row = 9, column = 1, columnspan = 2)
        
top = Tk()  
ui = UI(top)
top.mainloop()

