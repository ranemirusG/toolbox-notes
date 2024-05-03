import os
import sys
import site
import datetime

def get_package_installation_date(package_name):
    site_packages = site.getsitepackages()
    for site_package in site_packages:
        package_dir = os.path.join(site_package, package_name)
        if os.path.exists(package_dir):
            modification_time = os.path.getmtime(package_dir)
            install_date = datetime.datetime.fromtimestamp(modification_time)
            return install_date
    return None

if __name__ == "__main__":
    package_name = input("Enter the name of the package: ")
    install_date = get_package_installation_date(package_name)
    if install_date:
        print(f"The package '{package_name}' was installed on: {install_date}")
    else:
        print(f"The package '{package_name}' does not seem to be installed.")

