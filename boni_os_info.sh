#!/bin/bash

show_menu() {
    clear
    cat << "EOF"
   _ ._  _ , _ ._
        (_ ' ( `  )_  .__)        Tool Name : Boni OS Info
      ( (  (    )   `)  ) _)     Author     : Boni Yeamin
     (__ (_   (_ . _) _) ,__)    Email      : boniyeamin.cse@gmail.com
         `~~`\ ' . /`~~`
              ;   ;
              /   \
_____________/_ __ \_____________

1. Operating System Show system information
2. Kernel version
3. Environmental variables, Distribution Name and Release Version
4. Applications & Services
5. What applications are installed? What version are they? Are they currently running?
6. Any of the service(s) settings misconfigured? Are any (vulnerable) plugins attached?
7. What jobs are scheduled?
8. Communications & Networking
9. Gather disk information
10. Show USB information
11. Display PCI information
12. Show RAM information
13. Display BIOS information
0. Exit
EOF
}

get_system_info() {
    echo "System Information:"
    uname -a
}

get_kernel_version() {
    echo "Kernel Version:"
    uname -r
}

get_env_and_distro() {
    echo "Environmental Variables and Distribution:"
    printenv
    echo "Distribution Name and Release Version:"
    cat /etc/os-release
}

list_apps_and_services() {
    echo "Applications & Services:"
    systemctl list-units --type=service
}

check_installed_apps() {
    echo "Installed Applications and Versions:"
    dpkg -l | less
}

check_service_configs() {
    echo "Checking Service Configurations:"
    echo "This requires manual checks for vulnerabilities and misconfigurations."
}

show_scheduled_jobs() {
    echo "Scheduled Jobs:"
    crontab -l
    echo "System-wide scheduled jobs:"
    cat /etc/crontab
}

show_network_info() {
    echo "Networking Information:"
    ip a
}

gather_disk_info() {
    echo "Disk Information:"
    df -h
}

show_usb_info() {
    echo "USB Information:"
    lsusb
}

display_pci_info() {
    echo "PCI Information:"
    lspci
}

show_ram_info() {
    echo "RAM Information:"
    free -h
}

display_bios_info() {
    echo "BIOS Information:"
    sudo dmidecode -t bios
}

while true; do
    show_menu
    read -p "Enter your choice: " choice
    case $choice in
        1) get_system_info ;;
        2) get_kernel_version ;;
        3) get_env_and_distro ;;
        4) list_apps_and_services ;;
        5) check_installed_apps ;;
        6) check_service_configs ;;
        7) show_scheduled_jobs ;;
        8) show_network_info ;;
        9) gather_disk_info ;;
        10) show_usb_info ;;
        11) display_pci_info ;;
        12) show_ram_info ;;
        13) display_bios_info ;;
        0) echo "Exiting..."; break ;;
        *) echo "Invalid option, please try again." ;;
    esac
    echo ""
    read -p "Press Enter to continue..."
done
