<?php

namespace SpLazyLoad\Subscriber;

use Doctrine\Common\Collections\ArrayCollection;
use Enlight\Event\SubscriberInterface;
use Shopware\Bundle\PluginInstallerBundle\Service\InstallerService;

class TemplateRegistration implements SubscriberInterface
{
    /**
     * @var string
     */
    private $pluginDir;

    /**
     * @var array
     */
    private $pluginConfig;

    /**
     * @var InstallerService
     */
    private $pluginManager;

    /**
     * TemplateRegistration constructor.
     *
     * @param string           $pluginDir
     * @param array            $pluginConfig
     * @param InstallerService $pluginManager
     */
    public function __construct($pluginDir, array $pluginConfig, InstallerService $pluginManager)
    {
        $this->pluginDir = $pluginDir;
        $this->pluginConfig = $pluginConfig;
        $this->pluginManager = $pluginManager;
    }

    /**
     * {@inheritdoc}
     */
    public static function getSubscribedEvents()
    {
        return [
            'Theme_Inheritance_Template_Directories_Collected' => 'onTemplateDirectoriesCollect',
            'Theme_Compiler_Collect_Plugin_Javascript' => 'onAddJavascriptFiles',
        ];
    }

    /**
     * @param \Enlight_Event_EventArgs $args
     */
    public function onTemplateDirectoriesCollect(\Enlight_Event_EventArgs $args)
    {
        $dirs = $args->getReturn();

        try {
            $plugin = $this->pluginManager->getPluginByName('FroshWebP');
            if ($plugin->getActive()) {
                $dirs[] = $this->pluginDir . '/Resources/FroshWebP/views/';
            } else {
                $dirs[] = $this->pluginDir . '/Resources/views/';
            }
        } catch (\Exception $e) {
            $dirs[] = $this->pluginDir . '/Resources/views/';
        }

        $args->setReturn($dirs);
    }

    /**
     * @return ArrayCollection
     */
    public function onAddJavascriptFiles()
    {
        $jsFiles = [
            $this->prepareJavaScript(),
        ];

        return new ArrayCollection($jsFiles);
    }

    /**
     * @return string
     */
    public function prepareJavaScript()
    {
        $filename = $this->pluginDir . '/Resources/frontend/js/lazySizesConfig.js';

        file_put_contents($filename, $this->pluginConfig['lazySizesConfig']);

        return $filename;
    }
}
