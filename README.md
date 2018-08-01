# `archive-branch`
Archives `git` Branches as Tags

## Usage
`archive-branch.sh [branch_name]`, where `[branch_name]` is the name of the
branch you want to archive. The branch will be deleted, and a tag marking the
location of the old branch will be created with the name `archive/[branch_name]`.

To restore an archived branch, simply check it out:
`git checkout -b [branch_name] archive/[branch_name]`.

## How It Works
`archive-branch` first verifies that the branch exists and that no tag with the
name `archive/[branch_name]` exists. Then, it creates the tag using
`git tag archive/[branch_name] [branch_name]` and deletes the branch using
`git branch -d [branch_name]`.

## License and Copyright
Copyright (C) 2018 U8N WXD <cs.temporary@icloud.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
