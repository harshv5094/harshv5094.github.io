---
title: 'My First Open Source Contribution'
date: 2026-06-05
draft: false
description: So as my first blog post, I'm talking about my first Open Source Contribution I've ever did.
tocOpen: false
toc: true
isStarred: false
---

Never thought, I'm really gonna write a blog post this soon. Actually, I was busy with contributing some changes to this website template, you can see them [here](https://github.com/hugo-sid/hugo-blog-awesome/pulls?q=is%3Apr+author%3Aharshv5094). The feeling of contributing to new projects makes me feel good about myself and also I love the thank you messages I get from the maintainer/owner.

So as I was thinking about what should I write about my first blog site, I thought, why don't I share my journey as to how I started contributing to open source projects. So, today on this blog post, I'm gonna talk about my first open source contribution I've done.

## Some long but quick backstory

So after my college graduation, I was job hunting from my home. So I had a lot of free time to tweak, learn new stuff. That's when I started daily driving Linux (Well, my primary reason was my fucking windows just don't keep my setting to my preferences and resets it after every update). My first ever distro to install in my computer was [debian](https://debian.org). Debian was a good and stable distro, but it's multiple package management, just to get latest updated packages annoyed me, so I shifted to [fedora](https://fedoraproject.org).

While it gets a lot of hate from toxic linux enthusiasts, from my personal experience, fedora is a very good project which is necessary (that's why Linus Torvalds use it). It provides a perfect middle ground between [debian](https://debian.org) and [archlinux](https://archlinux.org).

It just has one problem, `nvidia`. Since my laptop has `Nvidia GTX 1050 Mobile` dedicated `gpu`. I had to jump so much hoops, just enable this drive, and whenever I update my laptop, I had to manually uninstall and reinstall `nvidia` drivers, so that it doesn't stuck on boot kernal infinite loop (I remember, how many times I forgot to do that, that I had to reinstall whole fedora setup multiple times, luckily I had a `1 TB` seagate hard drive as secondary storage, I always kept my important data here if by any chance this situation arises).

So I wrote my first bash script to tackle this exact same problem. That helped me a lot I say.

## Enter `linutil` (Creating my first Pull request)

I used to watch [christitus](https://christitus.com) videos and twitch stream. I also saw him building [linutil](https://github.com/ChrisTitusTech/linutil) on his twitch streams. Linutil is basically a utility toolbox contains various scripts to make your life easier. I saw and loved this, I thought, instead of keeping my script to myself, I can share it to this utility.

So I created my first pull request (which you can view it [here](https://github.com/ChrisTitusTech/linutil/pull/319)). Let me be brutally honest, my script was a complete mess, I remember how many times I stopped myself submitting this PR, because I was just scared that my PR will be rejected because of how shitty the code was, but I gathered the courage and created the pull request.

To my surprise, the collaborators and contributors were very kind and guided me what I need to fix, how I can improve it, I was very grateful to them that they guided me so much.

After, a while my Pull Request got accepted. Let me tell you, the feeling of getting your work accepted in a project that hundreds not thousands people are gonna use daily is very satisfying.

I thank all the contributors at that time for guiding me and that somehow helped me gained confidence, that I was desperately searching for.

I'm still working on linutil on my free time. Now, I'm their [aur](https://aur.archlinux.org/) package maintainer. A big shoutout to [june (aka koibtw)](https://github.com/koibtw) for trusting me with this responsibility, I'd also like to thank [chris](https://github.com/ChrisTitusTech) for creating this tool.

## Lessons I've learned

The biggest lesson I want you to take from my story is that, sometimes, you need to just start, no matter how messy is your code/life is, it will automatically correct your path and guide you to your destination.

It also made me appreciate the works of maintainers, who voluntarily handles both the projects and their life simultaneously. It made me very considerate, that I should only make meaningful changes, which takes less time of them.

So, we've reached the conclusion of this blog, thanks for taking your time reading my yapping, and you can mail me to give me some feedbacks, I'd love to hear it.

~ Harsh Vyapari ✌️
