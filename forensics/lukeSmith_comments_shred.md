# VIDEO https://youtu.be/0WcrgvhO_mw


# COMMENTS

Wouldn&#39;t it make more sense to use dd to write /dev/urandom straight to the drive itself, rather than a file, to actively destroy your data at the sector level?[]

Shred is good, but i still gonna take care my ssd life expectancy[]

To properly wipe a drive, you&#39;ll want to make at least three passes of random data so that even the most sophisticated hardware analysis and data recovery labs in the world can&#39;t recover what you deleted.[]

This is the content i like to watch dude. bless u[]

so the &quot;schizos&quot; were right all along?[]

Is this Arch or Parabola ?[]

<a href="https://www.youtube.com/watch?v=0WcrgvhO_mw&amp;t=2m50s">2:50</a> hard same[]

How the heck you move the cursor without touching the mouse 🤨🤨[]

Now I&#39;ll make sure to fill up the drive after deleting the homework folder.[]

luke shredding his own disk for us &lt;3[]

Linux Bro<br>&quot;Just Shave your head and grow a beard&quot; bro<br>Crypto bro<br>Orthodox bro<br>Dropship bro<br>Comprehensible Inpoot bro<br><br>This channel is for losers[]

You&#39;ll eff up your ssd with Shred tho...it will burn right thru them.[]

Getdataback works for recovery, but it costs money.[]

Hi Luke, do you have any videos on file recovery?[]

🫠[]

I sold a hard drive to a friend (spinning rust) and did a 35 pass alternating 0&#39;s and 1&#39;s followed by every 3rd pass being pseudo random data. I then stuck it in an high magnetic field for a few hours, followed by a complete low format. Old drives that work I do this before even storing them, and if I have to trash them I put them to a butane torch.  Probably paranoia but as they say just because you are paranoid doesn&#39;t mean they are not out to get you. :)['You&#39;re definitely paranoid and just wasting time by going so overkill']

WRT Apple computers? They provide an option called &#39;FileVault&#39; which encrypts your entire hard drive. A code is provided when you do this for which you are aggressively encouraged to write it down and keep it somewhere safe. An opsec method that I&#39;m partial to is to periodically perform a clean install of the OS. Before I do this? I ensure that I have a backup securely stored utilizing the 3-2-1 method (3 total backups; 2 separate media; 1 stored off-site). Once that is complete? I use FileVault to encrypt the contents of my hard drive and then intentionally ignore the code. Now I can confidently erase the contents of the partition and perform a clean install. The reason this is safe is that because the entirety of the hard drive was previously encrypted, the moment I lost the code? I&#39;ve effectively performed what&#39;s known as a &quot;cryptographic deletion&quot; of my data. Meaning even though the data may still be present, albeit, marked to be overwritten? Even the best forensic data analyst from any of the alphabet soup agencies will be unable to recover anything useful. That&#39;s the theory anyway. <br><br>Bear in mind? I am NOT a professional. So feel free to try this at home. 😉<br><br>Stay frosty, gents.[]

What are you talking about normies would just drag their files into the recycle bin and call it a day.[]

urandom takes in consideration the system entropy, it is a cryptographic secure random number generated, preferred to use compared to random,  which takes a starting seed.[]

Interesting thing about the linux kernels /dev/random, it will wait until there is enough entropy. However /dev/urandom will reliably give you random data in almost every scenario just not as cryptographically secure.<br><br>On most architecures they&#39;re basically the same thing as the kernel is able to initialize its entropy pool so early in boot, and so quickly it does not matter for 99% of use cases[]

Consider using hidden volume features of veracrypt. Plausible deniability needs to be known.[]

I love this series Luke! Please keep going![]

I&#39;ve had SSDs make the data unrecoverable the moment you delete it. They don&#39;t have nearly the memory HD have. Which is annoying as I&#39;ve so far only need to recover data not destroy it.[]

The real best way to delete files on your computer is to go the nuclear route. USB Killer[]

One of the reasons I started using Linux is the basic tools like vi and grep. Also Linux has always had a super power only Linux could do and Windows was a total failure. That is viewing or loading large files. You can view grep or load a 1.2 GB text file in Linux. Windows XP wouldn&#39;t even load it in notepad. This could be a file system type problem, program issue, or operating system problem. But on the same computer, Linux didn&#39;t have a problem loading large files. <br><br>Later I found out that many text editors have a problem loading large text files. Sublime Text is a good one that does load large files. It is one of my most used tools for a long time, even in Windows. I tried what everybody else was using at the time like Atom programmers text editor and it loaded slow like a java app or slow webpage, total failure. A lot of apps that are popular are pure garbage. So what happens to this pos Atom editor, it finally died off. Probably because people discovered there are much better alternatives than free open source, even if it&#39;s commercial or shareware! Not all free software is good.[]

HDDs store data by electro magnetizing individual magnetic domains (also refferd as sectors)<br>with either a north or a south magnetic polarity to represent either a binary of 0 or 1.<br>To read it back, the head detects the magnetic polarities of the magnetic domains (sectors)<br>which are physical (few nanometers) structures that are already present on the disk.<br>The binary data is then sent to the CPU where it is translated into ASCII code using<br>predefined algorithms and protocol.<br><br>The best way to destroy data would be :<br>Degaussing :<br>Exposing the disk to a strong magnetic field, which will erase the magnetic polarities and destroy the data stored on the disk.<br><br>You&#39;re welcome[]

<a href="https://youtu.be/0WcrgvhO_mw?t=834">https://youtu.be/0WcrgvhO_mw?t=834</a> What about Veracrypt?[]

For at least a couple years now, there&#39;s literally no difference between /dev/random and /dev/urandom in Linux. The two names exist for compatibility. Old kernels used to use /dev/random in a blocking mode exclusively, where it&#39;d halt outputting data until some arbitrary threshold in Linux&#39;s PRNG was reached. It wasn&#39;t any &quot;more random&quot; or &quot;more secure&quot;, but it fooled people into thinking it was. So that behavior is gone now.<br><br>Many of your &quot;dd if=file of=outfile&quot; commands could just be simplified as &quot;cp file outfile&quot;; this works also for &quot;cp /dev/random random&quot;.<br><br>It&#39;s also well worth noting that shred is useless on CoW file systems (btrfs and ZFS, for example) and likewise useless on some journalling modes of ext4.[]

who else has ever gone back to recover their deleted pr0n collection?[]

Has Luke mention what laptop he decided to use moving forward after the laptop video[]

As much as I enjoy hearing your insights into life and society regardless of my agreement or otherwise with your outlooks, these practical videos of yours are my favorite.[]

shoutouts to ya boy terry davis. RIP king[]

Why not just psychically destroy the drive? Like set in on fire?[]

Reject storage, embrace ramdisk[]

The text in your videos is has lots of weird colour fringing artifacts. Have you considered disabling subpixel font hinting in freetype while recording videos? I&#39;m not sure if that would fix it but it looks like that&#39;s probably what is causing it.[]

If someone wants an analogy to help them understand this, imagine the data is a weight attached to a fishing line floating in a pool. When you delete the file you don&#39;t pull the weight out and destroy it. You just cut the line. Someone dedicated enough to recovering the data can go into the pool and pull out the weight if they go through every rock in the pool individually and examine it.[]

I thought he was going to talk about inodes[]

classic video[]

Bleach[]

default runescape character explains how to evade law enforcement[]

I didn&#39;t know shred. I only knew wipe and wipefs.[]

Thank you Luke I shall now commit crimes[]

small brain: rm -rf directory/<br>big brain: sudo dd if:/dev/zero of:/path/to/partition<br>galaxy brain: <b>Removes SSD, smashes with hammer</b>['@user-uq8dy1uh2y Oh no. That’s what I settled on lol. Best opsec is to become <b>O N E</b> with the silicon by <i>Coom Sum Ing</i> it. I can now have <i>random access memories</i> and I require significantly less <i>R A M</i> . But you are right, there has got to be a better way.', '@user-uq8dy1uh2y Probably because a high enough powered magnet can cause collateral damage. Obviously you can just take the drive out of the case and use a weaker magnet. But ssd does not store data magnetically, so that only works effectively on magnetic HDD drives.', '<b>DRINKS INDIVIDUAL PULVERIZED BITS</b> <i>BECOMES ONE WITH THE DATA, attains Free as in “Free beer” Freewill</i>', 'set fire to leftover bits']

TempleOS is chad only!!![]

The correct way would be to send device wipe command (usually named Sanitize). In a good device, the data stored in NAND is encrypted and Sanitize just destroys the key, leaving data inaccessible.<br>Another reason to not rely on overwriting the SSD: it might enter read-only mode when running out of spare blocks. In read only mode all writes get rejected.['Good point. We need GPL firmware for NAND controllers.']

<a href="https://www.youtube.com/watch?v=0WcrgvhO_mw&amp;t=14m20s">14:20</a> Luke channels Charles Manson&#39;s spirit[]

cat /dev/zero &gt; file works too.[]

Not just criminals need to worry about this. The Feds are evil, and they will come for you if they think they can use you.[]

When I format a drive I always saturate it with dumb files before .[]

Great video. Thank you![]

In case anyone is wondering, in OpenBSD, you can use &quot;rm -P file ...&quot;, to overwrite a file before deleting it. From the rm(1) manual page:<br><br>-P Attempt to overwrite regular writable files before deleting them. Files are overwritten once with a random pattern. Files with multiple links will be unlinked but not overwritten.[]

its not that easy. many years back ive accidentally deleted my porn folder and ran ccleaner without realizing it. ive tried everything to recover it, tried every program there was even the paid ones. it could not be recovered. so either the fbi has a super secret file recovery program they&#39;re not releasing or it cant be done.['@harbinger of love repent, the kingdom of heaven is at hand', '@Strider yep, and im convinced they have it but they dont want to waste it on pdf files. hear me out on this one, when ye is president in 2024 they will apprehend some hd and crack the encryption and recover all these deleted files with &quot;crimes&quot; using this &quot;new&quot; technology they just made and they will impeach him. lets just say that agent fox mulder solving crimes and helping people is a big fiction, the real agent mulder is working for the vampires against the people. TRUST NO ONE', 'because of your anecdotal story from many years back, this means the only two possibilities are that either the fbi has a super secret file recovery program they&#39;re not releasing or it cant be done.']

Even using shred or overwriting the specific file is not a guaranteed way to really overwrite those bits on the drive nowadays.<br><br>Trap #1: SSDs and maybe even some flash drives even out the wear by writing to different physical location every time. If the drive was unencrypted (or the attacker has the key), the data may still be recoverable directly from nand even after overwriting.<br> <br>Trap #2: Modern filesystems do not guarantee the overwrite will work. Especially copy on write filesystems. (for example fedora uses btrfs by default) Those filesystems do similiar thing as SSDs.<br><br>Mitigations: Always encrypt your drive. Use encrypted vaults for especially sensitive files you may want to delete later. This way after you delete your vault, attacker cannot recover the files if he doesn&#39;t have the key.[]

So many videos does that means he is neeting[]

thirtysix[]

In TempleOS, when you delete data it gets recalled back to God&#39;s Kingdom. Safe from all the glowies who are reddit-tier athiests.['cold', 'fr though, does it handle deletion in a special way?', 'Amen', 'rip king terry', 'based and TAD-pilled']

step one. acquire metallurgy furnace.<br><br>step two. use critical thinking to figure out the rest.[]

Whaaaaaaaaat? Sending files to the bin will NOT make me a invisible untrackable Super-Hacker? 😱😱😱[]

nice gaming setup[]

Actually you can also run `cat /bin/ls` to recover the terminal.[]

You dont have an EXT4 filesystem?[]

Most of this advice applies to HDD&#39;s.  DO NOT SCRUB SSD&#39;S or inexpensive flash drives with tools that overwrite multiple times. I suppose shred is fine for limited use on specific files but other wipe tools overwrite multiple times which is not necessary on SSDs. SSDs use a type of Flash Memory that has a limited number of writes. You&#39;ll wear out the SSD if you wipe it frequently.  The magnetic properties of HDD do not apply to Flash SSD chips. When using SSD&#39;s there&#39;s a TRIM feature in most operating systems that will zero out the sectors marked for deletion while at idle. Most SSD&#39;s also have firmware that will do the same. When sectors become worn as they approach their write limits they will be swapped with spare extra sectors (over-provisioning - enterprise SSDs have many more spare sectors) and depending on the firmware those removed sectors may or may not be zeroed.  It is very important to encrypt SSD&#39;s to better protect data.  If someone removes  the SSD flash chips they could recover data. But not if it is encrypted from day one of it&#39;s life. You can simply format SSD&#39;s that were encrypted and the data will be completely unrecoverable. Cheap thumb drive&#39;s use pretty crappy flash chips compared to SSDs, you should always encrypt them if you ever put anything sensitive on them. You can buy hardware encrypted thumb drives and external drives that also encase the chips in epoxy which will likely break the chips if someone tries to remove the epoxy. But these are not the ultra cheap thumb drives that are everywhere in the market.  You&#39;ll pay more but it&#39;s worth it for piece of mind. I am talking about the drives that have a numeric keypad on them or a fingerprint reader where they need to be unlocked before you can mount the disk. We use <a href="https://apricorn.com/">https://apricorn.com/</a> drives at work as they meet very strict standards.  Again, not cheap but trustworthy.  Yes, they do work on Linux, etc. you can format them with any disk format you like.  Not suitable as boot disks.['Do you work for apricorn?  69 to 1000 dollars.', 'Always go for key codes if you can.<br><br>From a legal level, biometric data like your iris, face scan, or finger print are not your own and are not conidered unreasonable search or seizure. Us and EU Law enforcement is known to legally force defendants to offer their face or fingers to unlock machines. But in the US key codes are different, they&#39;re covered as speech, so the government is restrained from compelling a defendant to &quot;testify&quot; against themselves by giving a code. If the government can crack the code in evidence it&#39;s back to fair game.']

I just do what Hillary Clinton does and wipe it with a cloth.[]

My problem is that people have direct access to my phone and I have no way of proving that. It seems to be the police yet total strangers, as Ive witnessed have been involved. At this point I just have to live with it and not be able to prove anything but it seems like there HAS to be someone else experiencing this shit.['schizo', '\u200b@Third Dimensional Being you&#39;re paranoid.  Nuance doesn&#39;t count.', '@Third Dimensional Being God damn man, sounds tough. I hope they don&#39;t get you. Privacy doesn&#39;t exist in the 21. century.', '@Zoran Dušić\xa0 dude it&#39;s a long, a long, arduous and nuanced story. I just can&#39;t explain in text. I just know that other people are experiencing this but it&#39;s very rare.<br><br>All I can say is like it&#39;s a stasi wet dream.', 'Based schizo. The gangstalkers are after you. All your electronics are compromised.']

Luke pulling the mental outlaw content strat to farm normies smart lol['That&#39;s exactly why I clicked']

Careful, you can reduce life-span of SSD if you overwrite it!['This is not something you do every time after you delete a delicate file; this is something you do when you wanna delete any evidence of that file ever existing along with all the other data on that data drive, so you wouldn&#39;t be doing this every day, only in special occasions. Also, couldn&#39;t you just encrypt the whole thing and forget about having to delete data?', 'sounds like the data can be transalated using the same software. unless original data is totally replaced somehow, where data is no longer usable', 'plus you&#39;re not actually overwriting the file, because it gets mapped to different areas internally. need to overwrite the whole device :/', 'Yeah if you overwrite it everyday']

Glowing friends[]

Rip Terry.[]

Thank you so much.  I learn so much from your videos.[]

A note about hard disk drives.  It&#39;s possible that if you overwrite with 0 that some of the original data can be recovered from the edges of the original track.  Programs exists that tell the HDD to overscan the magnetic area to try to recover the old data and Feds 100% use this.  That&#39;s why the industry standard is to wipe with 0, then fill with random data, then wipe to 0 again.['@Another Available Name I agree theyre probably out dated but it&#39;s a starting point to do more research. <br><br>I think for most stuff 5 wipes is enough unless you&#39;re doing really sketchy stuff and are paranoid.', '\u200b@Another Available Name military standard is blow it up and trash it', '\u200b@Ricardo Doing more than three passes on modern drives is a meme. If you want to be schizo about it, go full force and use the Gutmann method with 35 passes. Zeroing data as the final pass is less about security, and more about letting you know &quot;this drive/file was wiped&quot;. Zeroing data as the first pass only matters for time sensitive erasing. <br><br>Literally all you need is:<br>$ shred -uvn 3 FILE<br>or<br>$ shred -uvzn 2 FILE<br><br>No need to complicate things by chaining the same command repeatedly.', '@Another Available Name nowadays? it&#39;s always just been a marketing ploy', '&quot;That&#39;s why the industry standard is to wipe with 0, then fill with random data, then wipe to 0 again.&quot;... so in bash will be something like...<br>function deletehdd {<br>    command shred -zn $2 $1 &amp;&amp; shred -n $2 $1 &amp;&amp; shred -zun $2 $1<br>}<br>right?']

haven&#39;t watched video yet, but can i wipe a phone using same technique?[]

From the Arch wiki on JFS:<br>The effectiveness of deleting files by overwriting their corresponding file system blocks with random data (i.e. using utilities like shred) can not be assured [12]. Given the design of journaled file systems, maintenance issues, and performance liabilities; reliable shredding of files as a deletion method does not sit highly on the priority list for implementation on any journaled file system.['@Ricardo CIA/Federal agents (a Terry A. Davis reference).', '@TickTock Bam Sorry, I&#39;m not an english speaker, what Luke and you means with &#39;Glowies&#39; or &#39;Glowfriends&#39;?', 'Glowies editing the Arch wiki 😱', 'fujimoto reference']

luke smith posting actual tech videos? impossible['hey! i like his other videos!']

Another reinforcement of the adage &quot;physical access is total access&quot;[]

Not a word.[]

One note for SSDs, most have a firmware-level block selector to increase the lifespan of the drive, which means if you &quot;overwrite&quot; a file, you may not actually change the exact same bits the original file occupied. This also applies to certain types of filesystems, read shred&#39;s man page. That said, going nuclear by filling the entire drive (maybe even 8 times) should cover all contingencies.<br><br>When your terminal gets messed up by binary files, type &quot;reset&quot; and press enter (even if you can&#39;t see the letters you type)['@100th School backups are a real mind bender to you aren&#39;t they? 😆', '@RapiBurrito retard. one day you wont be able to decrypt your drive because decrypting writes data and if ssd runs out of write cycles. enjoy your brick', 'That’s why Apple uses effacable storage (no wear-leveling) to store certain ephemeral encryption keys.', '&gt; you may not actually change the exact same bits the original file occupied.<br>It is not just &quot;may&quot;, it basically never changes them. NAND blocks have to be erased first, so they are always written sequentially (even you write data randomly). There is a slight chance that overwriting can fill the super block and cause GC and then <i>maybe</i> the block will be erased.', '@RapiBurrito They do - to help with debugging. But this facility should be disabled or compiled out from firmware that goes into production device.']

Shred is great. At my last job we were charged with securely disposing of some old hard drives with a bunch of financial data on them. Ram a 4 pass shred zeroing the bits at the end and it worked like a dream. 1 TB drive took about 7 hours or so to finish.['@user unknown Yes.', '@This channel has been renamed How can you make such a far reaching statement (&quot;always&quot;)? Did you work in every big company? In every department?', '@This channel has been renamed Yeah, we weren’t that big. We just did this then took drills and hammers to the platters.', 'Big companies always shred SSDs before disposing of them. Physically shred. In a shredder.', 'That is very lucky for them you got it and not someone malicious.']

Oh my god I didn&#39;t know dd took status=progress as an argument... I&#39;ve been finding its pid and sending a USR1 signal using kill all these years like a chump :O['status=progress is non-standard to GNU dd.']

sneed['Nice']

TempleOS doesn&#39;t use files cause that&#39;s bloat[]

/dev/random and urandom were different but they are now pm the same thing and we only have two for backward compatibility.[]

Haha thought this was a Mental Outlaw vid from the thumbnail XD['It is, they&#39;re the same person as we all know']

Where did you buy that gaming chair?['@IndustriousImperialeagle20 he calls it credit card rotation lol 😂', 'With creditcard cash xD', 'From his grandfather, veteran hero', 'My best guess is it&#39;s second hand, possibly from an acquaintance']

Where I&#39;m from we don&#39;t call them friends we call them something else.['Glown1993rs', 'Glowggers', '@trav v GlowG', '@内倉半蔵 glowI', 'glow ninjas']

New luke smith video 😁👍[]
