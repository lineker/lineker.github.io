---
title: Building .Net projects with msbuild
author: Lineker Tomazeli
layout: post
permalink: building-net-projects-with-msbuild
comments: true
published: true
date: "2015-04-14 14:02"
categories:
  - .NET
  - 'C#'
tags:
  - .NET
  - 'C#'
---

How do you build you visual studio project without visual studio? **Msbuild**


>MSBuild, also called Microsoft Build Engine, is a build tool for managed code and was part of .NET Framework. Visual Studio depends on MSBuild, but MSBuild does not depend on Visual Studio. [wikipedia][99fc3c58]

To find out where is msbuild located in your system take a look at the following key:

`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSBuild\ToolsVersions\4.0`

Now you can fire up the command line tools and run msbuild to build your solution and project

Simple usage:

`msbuild MySolution.sln`

msbuild have many switches, see the full list [here][bfc014a6].

The most important ones for us are:

/p: let you pass parameters to the build process

/t: let you specify which project and steps to target

How do I specify which configuration I want to use to build?

How do I specify which platform I want to build for?

`msbuild MySolution.sln /p:Configuration=Release;Platform="Any CPU"`

How do I specify which project I want to build?

`msbuild MySolution.sln /t:ProjectFolder\MyProject:Clean;Rebuild`

In this example we specify that we want to build only MyProject from our solution (this will build dependencies also) and we want to "Clean" the project and "Rebuild"

You can omit the "ProjectFolder" if you project file is in the same folder as the solution

**Attention** : If you you folders, solution or project files have "." (dots) in their names they should be replaced by "_" underlines. It would look like this if all files and folders started with "MyCompany."

`msbuild MyCompany_MySolution.sln /t:MyCompany_ProjectFolder\MyCompany_MyProject:Clean;Rebuild`

I hope this will help you

Next time we will see how to build a msbuild script :)


[99fc3c58]: http://en.wikipedia.org/wiki/MSBuild "wikipedia"
[bfc014a6]: https://msdn.microsoft.com/en-us/library/ms164311.aspx "msbuild commandline reference"
