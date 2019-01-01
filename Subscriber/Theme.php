<?php

namespace SpLazyLoad\Subscriber;

use Enlight\Event\SubscriberInterface;
use Doctrine\Common\Collections\ArrayCollection;

class Theme implements SubscriberInterface
{
    /**
     * @var string
     */
    private $pluginDir;

    /**
     * Theme constructor.
     * @param $pluginDir
     */
    public function __construct($pluginDir)
    {
        $this->pluginDir = $pluginDir;
    }

    /**
     * {@inheritdoc}
     */
    public static function getSubscribedEvents()
    {
        return [
            'Theme_Inheritance_Template_Directories_Collected' => 'onTemplateDirectoriesCollect',
            'Theme_Compiler_Collect_Plugin_Javascript' => 'onAddJavascriptFiles'
        ];
    }

    /**
     * @param \Enlight_Event_EventArgs $args
     */
    public function onTemplateDirectoriesCollect(\Enlight_Event_EventArgs $args)
    {
        $dirs = $args->getReturn();
        $dirs[] = $this->pluginDir . '/Resources/views/';

        $args->setReturn($dirs);
    }

    /**
     * @return ArrayCollection
     */
    public function onAddJavascriptFiles()
    {
        $jsFiles = [
            $this->pluginDir . '/Resources/views/frontend/_public/vendor/lazysizes/lazysizes.min.js'
        ];

        return new ArrayCollection($jsFiles);
    }

}
