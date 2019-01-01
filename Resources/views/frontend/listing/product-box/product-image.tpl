{extends file="parent:frontend/listing/product-box/product-image.tpl"}

{block name='frontend_listing_box_article_image_element'}
    <span class="image--element">
        {block name='frontend_listing_box_article_image_media'}
            <span class="image--media">

                {$desc = $sArticle.articleName|escape}

                {if isset($sArticle.image.thumbnails)}

                    {if $sArticle.image.description}
                        {$desc = $sArticle.image.description|escape}
                    {/if}

                    {block name='frontend_listing_box_article_image_picture_element'}
                        <img data-srcset="{$sArticle.image.thumbnails[0].sourceSet}"
                             alt="{$desc}"
                             title="{$desc|truncate:160}"
                             class="lazyload" />
                    {/block}
                {else}
                    <img data-src="{link file='frontend/_public/src/img/no-picture.jpg'}"
                         alt="{$desc}"
                         title="{$desc|truncate:160}"
                         class="lazyload" />
                {/if}
            </span>
        {/block}
    </span>
{/block}