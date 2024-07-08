# ExifTool
ExifTool is written in Perl and operates by parsing and interpreting the metadata structures within the supported file formats. The tool employs a comprehensive set of “tags” to represent the different metadata fields, which allows for easy access and manipulation of the data.

EXIF stands for "Exchangeable Image File Format". This type of information is formatted according to the TIFF specification, and may be found in JPG, TIFF, PNG, JP2, PGF, MIFF, HDP, PSP and XCF images, as well as many TIFF-based RAW images, and even some AVI and MOV videos.

The EXIF meta information is organized into different Image File Directories (IFD's) within an image. The names of these IFD's correspond to the ExifTool family 1 group names. When writing EXIF information, the default Group listed below is used unless another group is specified.






- <https://exiftool.org/>
- <https://www.reddit.com/r/photography/comments/gbks0c/guide_to_using_exiftool_to_correct_the_time/>

- Online tool: <https://exifmeta.com/>




## See / Extract information

```

exiftool [FILE]
exiftool -s [FILE] # Short output
exiftool -all:all [FILE]



exiftool -[TAG] [FILE]
exiftool -DateTimeOriginal [FILE]
exiftool.exe -FileModifyDate [FILE]
exiftool.exe -FileAccessDate [FILE]



# Print all meta information in an image, including duplicate and unknown tags, sorted by group (for family 1).
exiftool -a -u -g1 [FILE]



exiftool -s -ImageSize -Make -Model .\python_script.jpg > output.txt


# Print standard Canon information
exiftool -l -canon example.jpg


exiftool -b -ThumbnailImage filename.jpg > thumbnail.jpg
exiftool -b -PreviewImage filename.jpg > preview.jpg









# Recursively extract common meta information from files in C directory, writing text output into files with the same names but with a C<.txt> extension

exiftool -r -w .txt -common [DIRECTORY]


```






## Write metadata
```

exiftool -TAG="Value" filename.jpg



```










## Copy metadata from one file to another
```
exiftool -TagsFromFile srcfile.jpg dstfile.jpg


# Backup
exiftool -all= -tagsFromFile @ -all:all -unsafe -o backup_metadata.txt example.jpg

```





















## Delete metadata

Remove unreferenced PDF objects (like old metadata) with `qpdf`.

See:
- <https://cyberrunner.medium.com/removing-metadata-from-pdf-files-using-exiftool-and-qpdf-20090b75d7f0>

`qpdf --linearize --replace-input example.pdf `


```
exiftool -all= filename.jpg
exiftool -TAG= filename.jpg
# exceptuate certain tags
exiftool -all= -tagsFromFile @ -TAG filename.jpg


exiftool -all= [DIR]
exiftool -all= -r [DIR]

exiftool -r -overwrite_original -P -all= -copyright="My Name" *.jpg *.jpeg *.JPG



```











## Recover metadata

```

exiftool -pdf-update:all= [FILE]




```















## Rename

### Rename files to datestamp

*Filename looks like 2014-01-01 12:00:00.jpg and will append -NUM if DateTimeOriginal is the same for multiple files*

    exiftool '-FileName<DateTimeOriginal' -d "%Y-%m-%d %H.%M.%S%%-c.%%e" .  

### Rename Files to With Milliseconds

*Good for burst photos where the seconds are all the same. If milliseconds are only out to 2 digits, use `${SubSecCreateDate}` instead*






























## Searching for Files

### Find images in a directory that don't have a DateTimeOriginal ###

    exiftool -filename -filemodifydate -createdate -r -if '(not $datetimeoriginal) and $filetype eq "JPEG"' .

### Output photos that don't have datetimeoriginal to a CSV###
*Note this can take a long time if you have a lot of jpgs*

    # You'll need to set your Dropbox folder path. I have mine set as a global variable
    OLDFILE="$DROPBOX_PERSONAL/nodates.csv"

    FILECOUNT=$(mdfind -count -onlyin "$DROPBOX_PERSONAL" 'kMDItemKind =="JPEG image"')
    while IFS= read -r -d '' n; do
        FILECOUNT=$(( $FILECOUNT - 1 ))
        if grep -q "$n" "$OLDFILE"; then
            echo "Skipping $n"
            continue
        fi
    
        echo -ne "Remaining: $FILECOUNT\r"
        exiftool -q -if '(not $datetimeoriginal or ($datetimeoriginal eq "0000:00:00 00:00:00"))' -csv -common "$n" | sed 1d >> "$DROPBOX_PERSONAL/nodates.csv"
    done < <( mdfind -onlyin "$DROPBOX_PERSONAL" 'kMDItemKind =="JPEG image"' -0 )

### See files File Modify Date recursively in a directory who don't have datetimeoriginal set ###
    
    exiftool -filemodifydate -r -if '(not $datetimeoriginal or ($datetimeoriginal eq "0000:00:00 00:00:00")) and ($filetype eq "JPEG")' .




















## Modifying Files

### Create Captions From a Filename ###

The command alone will put the *full* filename in the comments. If you want to add the filename without the extension, add the example exiftool config file found [here][config]

	# This is the command if you have the config installed
	exiftool '-Comment<BaseName' '-UserComment<BaseName' .

	# Getting the filename without the config file, but with a for-loop
	for i in *; do 
		FileName="${i%%.*}"
		exiftool "-Comment=$FileName" "-UserComment=$FileName" "$i";
	done

###Change JPG to jpg and MOV to mov in filenames###

    for i in *.JPG; do mv "$i" "${i%%.JPG}.jpg"; done; !#:gs/JPG/MOV/:gs/jpg/mov/

Recursively

	find /path/to/directory -name *JPG -exec sh -c 'mv "$0" "${0%%.JPG}.jpg"; echo "Moved $0 to ${0%%.JPG}.jpg"' {} \;

###Change last created and modified for files in a directory###

*The date syntax has to be YYYY:MM:DD HH:MM:SS*

Option 1:

    find . -name "*.jpg" | while read filename;  
        exiftool "-AllDates=1986:11:05 12:00:00" "$filename";
    done

Option 2:

    exiftool "-AllDates=1986:11:05 12:00:00" -if '$filetype eq "JPEG"' .

### Timeshift Photos by One Year ###

Info at http://www.sno.phy.queensu.ca/~phil/exiftool/Shift.html

	exiftool "-AllDates+=1:0:0 0" .



Found at http://u88.n24.queensu.ca/exiftool/forum/index.php?topic=2736.0

	exiftool -v '-Filename<${datetimeoriginal}${subsectimeoriginal;$_.=0 x(3-length)}.%e' -d %Y%m%d_%H%M%S .

### Update any photo that doesn't have DateTimeOriginal to have it based on file modify date ###

    exiftool '-datetimeoriginal<filemodifydate' -if '(not $datetimeoriginal or ($datetimeoriginal eq "0000:00:00 00:00:00")) and ($filetype eq "JPEG")' .

### Set DateTimeOriginal to Any Arbitrary Timestamp ###

	exiftool '-datetimeoriginal=2015:01:18 12:00:00' .



























## Moving/Copying Files

###Copy directory recursively into organized folder###

	exiftool -o ~/dummy/ -if '$filesize# > 300000' '-Directory<CreateDate' -d ~/Desktop/old_photos2/%Y/%m\ %B -r ~/Desktop/iPhoto\ Library/

`-o ~/dummy` This flag is to copy, not move. The directory is a fallback if the flag isn't available on the given photo. Good if using something like DateTimeOriginal

`-if '$filesize# > 300000'` gets files that are over 300kB. I was parsing an iPhoto library where there were thumbnails. The `#` turns the value to a number. you can use the flag `-n` to turn all values to numbers

`'-Directory<CreateDate'` Create directories based on the CreateDate of the photos

`-d ~/Desktop/old_photos/%Y/%m\ %B` Create folders with the given date format.

`-r` Run recursively



















## Extras

###Create KML from geotagged photos###

	DESKTOP=$HOME/Desktop
	cat $DESKTOP/kml-start.fmt > out.kml
	exiftool -n -r -q -p $DESKTOP/kml-placemark.fmt . >> out.kml
	cat $DESKTOP/kml-end.fmt >> out.kml

### Create CSV of Geo Information ###

	exiftool -csv -filename -imagesize -gps:GPSLatitude -gps:GPSLongitude ./ > long.csv




