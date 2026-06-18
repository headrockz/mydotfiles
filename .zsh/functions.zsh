# Video conversion for 480x272 (PSP/LowRes)
ffmpeg-lowres() {
    if [ -z "$1" ]; then
        echo "Usage: ffmpeg-lowres input_file.mkv [output_file.mp4]"
        return 1
    fi

    local input="$1"
    local output="${2:-${input%.*}_converted.mp4}"

    ffmpeg -i "$input" \
        -vf "scale=480:272:force_original_aspect_ratio=decrease,pad=480:272:(ow-iw)/2:(oh-ih)/2" \
        -c:v libx264 \
        -profile:v baseline \
        -level 3.0 \
        -pix_fmt yuv420p \
        -preset medium \
        -crf 23 \
        -r 30 \
        -c:a aac \
        -b:a 128k \
        -ac 2 \
        -ar 44100 \
        -movflags +faststart \
        "$output"
}

# Bulk video conversion for 480x272 (PSP/LowRes)
ffmpeg-lowres-all() {
    mkdir -p convertidos

    for f in *.{mp4,mkv,avi,mov}(N); do
        [ -e "$f" ] || continue
        echo "Converting: $f"
        
        ffmpeg -i "$f" \
            -vf "scale=480:272:force_original_aspect_ratio=decrease,pad=480:272:(ow-iw)/2:(oh-ih)/2" \
            -c:v libx264 \
            -profile:v baseline \
            -level 3.0 \
            -pix_fmt yuv420p \
            -preset medium \
            -crf 23 \
            -r 30 \
            -c:a aac \
            -b:a 128k \
            -ac 2 \
            -ar 44100 \
            -movflags +faststart \
            "convertidos/${f%.*}.mp4"
    done
    
    echo "Batch conversion complete. Files are in 'convertidos/' folder."
}

# Organize photos by extension (JPG and RAW)
organize-photos() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: organize-photos <destination_directory>"
        return 1
    fi

    local SRC_DIR="."
    local DEST_BASE="$1"

    # Create destination folders
    mkdir -p "$DEST_BASE/jpg"
    mkdir -p "$DEST_BASE/raw"

    echo "Organizing photos from current directory to '$DEST_BASE'..."

    # Move JPGs (using -n to avoid overwriting)
    find "$SRC_DIR" -maxdepth 1 -type f \
        \( -iname "*.jpg" -o -iname "*.jpeg" \) \
        -exec mv -n {} "$DEST_BASE/jpg/" \;

    # Move RAWs
    find "$SRC_DIR" -maxdepth 1 -type f \
        \( -iname "*.arw" -o -iname "*.cr2" -o -iname "*.nef" -o -iname "*.dng" -o -iname "*.orf" -o -iname "*.rw2" -o -iname "*.raw" -o -iname "*.raf" \) \
        -exec mv -n {} "$DEST_BASE/raw/" \;

    echo "Done!"
}
