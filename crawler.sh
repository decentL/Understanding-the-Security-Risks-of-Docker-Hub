cat /dev/null > image_list.txt

if [ ! -d "webinfo" ];then
        mkdir webinfo
fi
for i in {1..2}
do
	while true
	do
		curl "https://hub.docker.com/api/content/v1/products/search?page=$i&page_size=100&source=community&q=*" > webinfo/search_result_$i.txt
		jq -r .summaries[].name webinfo/search_result_$i.txt > webinfo/image_list_$i.txt
		if [ -s "webinfo/image_list_$i.txt" ];then 
			break
		fi
	done
	while read line 
	do 
		echo $line
		if [[ $line =~ '/' ]];then
			KEY_USER=${line%/*}
			KEY_IMG=${line#*/}
			while true
			do 
				curl "https://hub.docker.com/v2/repositories/$line/" > webinfo/image_${KEY_USER}_${KEY_IMG}.txt
				if [ -s "webinfo/image_${KEY_USER}_${KEY_IMG}.txt" ];then 
					break
				fi
			done

			while true
			do
				curl "https://hub.docker.com/v2/repositories/$line/tags/" -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' -H 'Search-Version: v3' -H 'Accept: application/json' -H 'Referer: https://hub.docker.com/_/elasticsearch' -H 'Cookie: FLAG_CONSOLIDATION=true; ajs_user_id=null; ajs_group_id=null; ajs_anonymous_id=%225e95d719-5b49-4248-be8a-3d0bc16acc85%22' > webinfo/tags_${KEY_USER}_${KEY_IMG}.txt
				if [ -s "webinfo/tags_${KEY_USER}_${KEY_IMG}.txt" ];then 
					break
				fi
			done
		else
			while true
			do
				curl "https://hub.docker.com/v2/repositories/library/$line/" -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' -H 'Search-Version: v3' -H 'Accept: application/json' -H 'Referer: https://hub.docker.com/api/content/v1/products/search?page=$i&page_size=10&q=$KEYWORD&type=image' -H 'Cookie: FLAG_CONSOLIDATION=true; ajs_user_id=null; ajs_group_id=null; ajs_anonymous_id=%225e95d719-5b49-4248-be8a-3d0bc16acc85%22' > webinfo/image_${line}.txt
				if [ -s "webinfo/image_${line}.txt" ];then 
					break
				fi
			done

			while true
			do 
				curl "https://hub.docker.com/v2/repositories/library/$line/tags/" -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' -H 'Search-Version: v3' -H 'Accept: application/json' -H 'Referer: https://hub.docker.com/_/elasticsearch' -H 'Cookie: FLAG_CONSOLIDATION=true; ajs_user_id=null; ajs_group_id=null; ajs_anonymous_id=%225e95d719-5b49-4248-be8a-3d0bc16acc85%22' > webinfo/tags_${line}.txt
				if [ -s "webinfo/tags_${line}.txt" ];then 
					break
				fi
			done
		fi
		echo $line >> image_list.txt
	done < webinfo/image_list_$i.txt
done
