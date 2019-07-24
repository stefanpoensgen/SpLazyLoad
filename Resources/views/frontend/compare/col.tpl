{extends file="parent:frontend/compare/col.tpl"}

{block name="frontend_compare_article_picture"}
    <li class="list--entry entry--picture">
        {* Product image - uses the picturefill polyfill for the HTML5 "picture" element *}
        <a href="{$sArticle.linkDetails}" title="{$sArticle.articleName|escape}" class="box--image">
            <span class="image--element">
                <span class="image--media">

                    {$desc = $sArticle.articleName|escape}

                    {if isset($sArticle.image.thumbnails)}

                        {if $sArticle.image.description}
                            {$desc = $sArticle.image.description|escape}
                        {/if}

                        <img data-srcset="{$sArticle.image.thumbnails[0].sourceSet}"
                             class="lazyload"
                             loading="lazy"
                             alt="{$desc}"
                             title="{$desc|truncate:160}" />
                    {else}

                        <img data-src="{link file='frontend/_public/src/img/no-picture.jpg'}"
                             class="lazyload"
                             loading="lazy"
                             alt="{$desc}"
                             title="{$desc|truncate:160}" />
                    {/if}
                </span>
            </span>
        </a>
    </li>
{/block}
