## Follow this guide to add your device to the official list

-----
**Folder Structure Overview:**
```
repo/sources/
├── banner.png
├── device_list.json
├── devices/
│   ├── <codename>.json
└── docs/
    ├── <codename>.md
```
-----

**Explanation:**
- **banner.png:** This is the banner image
- **device_list.json:** Main file that lists the devices
- **devices:** This directory contains all device-specific JSON files
- **docs:** This directory contains installation guides for each device
-----

### Make sure you are the official maintainer of the device or part of the [euclidTeam](https://github.com/euclidTeam)
-----

**Step 1. Add Your Device Entry:** Open sources/device_list.json and add your device object under "devices":

- **Example:**
```
{
      "codename": "e3q",
      "vendor": "Samsung",
      "model": "Samsung Galaxy S24 Ultra",
      "active": true
}
```
-----

**Step 2. Create Device Info JSON:** Create a new JSON file inside sources/devices/ named codename.json like:

- **Regular format:**
```
{
  "data": [
    {
      "codename": "e3q",
      "vendor": "Samsung",
      "model": "Samsung Galaxy S24 Ultra",
      "tg_uname": "tanvirr007",
      "support_group": "https://t.me/TanvirBuildsSupport"
    }
  ]
}
```

<details>
<br>
<summary><b>If your device has more than one maintainer, click here:</b> </summary>
- In the exceptional case of multiple maintainers, you must use an array. The example is provided below:

```
{
  "data": [
    {
      "codename": "spes",
      "vendor": "Xiaomi",
      "model": "Redmi Note 11/NFC",
      "tg_uname": ["tanvirr007", "sanjivns"],
      "support_group": "https://t.me/TanvirBuildsSupport"
    }
  ]
}
```
</details>

-----
**Automate JSON Generation:** If you want to auto-generate the JSON files, run the **build.sh** script from the **bin** folder:
- **Using:**
```bash
bash bin/build.sh
```
-----

**Step 3. Add Installation Guide:** Create a Markdown file under sources/docs/ dir named codename.md and write your flashing steps there

- **Example:** sources/docs/spes.md

-----

**Step 4. Commit Message Guidelines:** To keep the repository organized and commit history clean, follow these rules for all commits:

1. **Adding a new device:** Use the prefix official: and capitalize the first letter of the first word. No full stop at the end, like:

- **Example:**
```
official: Add OnePlus 15 to the official list
```

2. **Modifying an existing device:** Use the device codename as the prefix and describe **(if applicable)** the change clearly

- **Example:**
```
spes: Set active status as false
```

**Notes:**
- First letter of the first word must be capitalized
- Avoid ending with a period (.)
- Keep it concise but informative

- **Example:**
```
spes: Update support_group url
```
-----

**Step 5. Final Checks Before pull request:**
- Make sure you have pulled latest changes from the [main](https://github.com/tanvirr007/vendor_euclid.JSON/tree/main) branch
- Check [this](https://github.com/tanvirr007/vendor_euclid.JSON/commit/8c58530ecb50985d4386dc527477a8cbe0faacf2) commit for reference
- Confirm your support link and usernames are correct
- Make sure all filenames match the device codename exactly
- You can use this [json formatter tool](https://jsonformatter.curiousconcept.com) to validate your JSON
- To update the banner, just replace the old banner.png with a new file named banner.png . This is needed for banner updates
- Please recheck that your commit message follows the correct structure
-----

### Author
- The author of this repository is [tanvir007](https://github.com/tanvirr007)
-----
