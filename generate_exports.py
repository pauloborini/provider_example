import os

def find_dart_files(root_dir):
    dart_files = []
    for subdir, _, files in os.walk(root_dir):
        for file in files:
            if file.endswith('.dart') and file != 'app_exports.dart':
                relative_path = os.path.relpath(os.path.join(subdir, file), root_dir)
                normalized_path = relative_path.replace(os.path.sep, '/')
                dart_files.append(normalized_path)
    return dart_files

def write_exports(dart_files, output_file):
    with open(output_file, 'w') as f:
        f.write('// GENERATED FILE - DO NOT MODIFY\n')
        f.write('// This file centralizes all exports for easy importing.\n\n')
        f.write("export 'package:flutter/foundation.dart';\n\n")
        for dart_file in sorted(dart_files):
            f.write(f"export '{dart_file}';\n")

if __name__ == '__main__':
    root_dir = 'lib'
    output_file = 'lib/app_exports.dart'
    dart_files = find_dart_files(root_dir)
    write_exports(dart_files, output_file)
    print(f"Exports written to {output_file}")
