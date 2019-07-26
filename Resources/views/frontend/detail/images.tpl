{extends file="parent:frontend/detail/images.tpl"}

{block name='frontend_detail_image_thumbs_main_img'}
    <picture>
        {if isset($sArticle.image.thumbnails[0].webp)}
            <source data-srcset="{$sArticle.image.thumbnails[0].webp.sourceSet}" type="image/webp">
        {/if}
        <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
             data-srcset="{$sArticle.image.thumbnails[0].sourceSet}"
             alt="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt}"
             title="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt|truncate:160}"
             class="lazyload thumbnail--image"
             loading="lazy" />
    </picture>
{/block}

{block name='frontend_detail_image_thumbs_images_img'}
    <picture>
        {if isset($image.thumbnails[0].webp)}
            <source data-asrcset="{$image.thumbnails[0].webp.sourceSet}" type="image/webp">
        {/if}
        <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
             data-srcset="{$image.thumbnails[0].sourceSet}"
             alt="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt}"
             title="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt|truncate:160}"
             class="lazyload thumbnail--image"
             loading="lazy" />
    </picture>
{/block}
