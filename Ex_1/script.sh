#!/bin/bash

# Functie pentru a afisa mesaj de eroare si a iesi cu codul de eroare 1
error_exit() {
    echo "$1" >&2
    exit 1
}

# Functie pentru a verifica daca scriptul este executat cu privilegii adecvate
check_privileges() {
    if [ "$(id -u)" != "0" ]; then
        error_exit "This script must be run with root privileges."
    fi
}

# Functie pentru a verifica daca numele fisierului este "passwd"
check_filename() {
    if [ "$(basename $1)" != "passwd" ]; then
        error_exit "File is not passwd."
    fi
}

# 1. Afiseaza directorul home
print_home_directory() {
    echo "Home directory:"
    awk -F':' '{print $6}' $1
}

# 2. Listeaza toti utilizatorii din fisierul passwd
list_all_usernames() {
    echo -e "\nAll usernames:"
    awk -F':' '{print $1}' $1
}

# 3. Afiseaza numarul de utilizatori
count_users() {
    echo -e "\nNumber of users:"
    awk -F':' 'END{print NR}' $1
}

# 4. Cauta si afiseaza directorul home pentru un anumit utilizator
find_home_directory() {
    read -p "Enter username to find home directory: " username
    echo -e "\nHome directory of $username:"
    awk -F':' -v user="$username" '$1 == user {print $6}' $1
}

# 5. Afiseaza utilizatorii cu un UID range specific
list_users_by_uid_range() {
    read -p "Enter UID range (e.g. 1000-1010): " uid_range
    echo -e "\nUsers with UID range $uid_range:"
    awk -F':' -v uid_range="$uid_range" '{split(uid_range, a, "-"); if ($3 >= a[1] && $3 <= a[2]) print $1}' $1
}

# 6. Cauta utilizatorii cu shell-uri standard precum /bin/bash sau /bin/sh
find_standard_shells() {
    echo -e "\nUsers with standard shells (/bin/bash or /bin/sh):"
    awk -F':' '$NF ~ /(\/bin\/bash|\/bin\/sh)$/ {print $1}' $1
}

# 7. inlocuieste caracterul "/" cu caracterul "\" in intregul fisier /etc/passwd si redirectioneaza continutul intr-un alt fisier
replace_characters_in_passwd() {
    echo -e "\nReplacing / character with \ character and redirecting to new file"
    sed 's/\//\\/g' /etc/passwd > passwdnew
}

# 8. Afiseaza IP-ul privat
print_private_ip() {
    echo -e "\nPrivate IP:"
    hostname -I
}

# 9. Afiseaza IP-ul public
print_public_ip() {
    echo -e "\nPublic IP:"
    curl ifconfig.me
}

# 10. Schimba utilizatorul in john
switch_to_john_user() {
    echo -e "\nSwitching to john user:"
    su - john
}

# 11. Afiseaza directorul home
print_john_home_directory() {
    echo -e "\nHome directory of john:"
    echo $HOME
}

# Verifica privilegiile de root
check_privileges

# Verifica numele fisierului
check_filename $1

# Apelarea functiilor pentru fiecare cerinta
print_home_directory $1
list_all_usernames $1
count_users $1
find_home_directory $1
list_users_by_uid_range $1
find_standard_shells $1
replace_characters_in_passwd $1
print_private_ip
print_public_ip
switch_to_john_user
print_john_home_directory
