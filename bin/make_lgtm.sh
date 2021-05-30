#!/usr/bin/env bash
# create a link page of LGTM images

PATH_DIR_REPO="$(dirname "$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)")"
BASE_URL="https://github.com/yoshi389111/yoshi389111/raw/main/LGTM"

(
    cat <<EOD
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>LGTM.</title>
<script>
function copyLink(file_name) {
    const textarea = document.getElementById("work");
    textarea.value = "![LGTM]($BASE_URL/" + file_name + ")";
    textarea.select();
    document.execCommand("copy");
    alert("copied!");
}
</script>
</head>
<body>
<h1>Links of LGTM</h1>
EOD

    for FILE_NAME in "$PATH_DIR_REPO"/LGTM/* ; do
        IMAGE_NAME=$(basename "$FILE_NAME")
        echo "<h2>$IMAGE_NAME</h2>"
        echo "<img alt=\"LGTM\" src=\"$BASE_URL/$IMAGE_NAME\" onclick=\"copyLink('$IMAGE_NAME')\"   />"
    done

    cat <<EOD
<h2>copy area</h2>
<textarea id="work"></textarea>
</body>
</html>
EOD

) > "$PATH_DIR_REPO"/docs/lgtm.html


